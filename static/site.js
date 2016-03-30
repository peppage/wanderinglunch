/*var eightHours = 28800;

var trucks = {};
trucks.list = initialTrucks;

trucks.controller = function(options) {
    
}

trucks.view = function(ctrl) {
    return m('ul', trucks.list().map(function(truck) {
        if(truck.lastupdate < Date.now() - eightHours) {
            return [
                m('li', truck.name)
            ]
        }
    }));
}

trucks.update = function() {
    m.request({
        method: 'GET',
        url: index.updateUrl + m.route.param('site'),
    }).then(function(data) {
        trucks.list = function() {
            return data;
        }
        m.redraw();
    })
}

var index = {};

index.updateUrl = '/api/trucks?sort=lat&sort_dir=desc&site=';

index.controller = function() {
    this.searchTerm = m.prop('');
    
    this.update = function() {
        trucks.update();
    }
    
    this.list = function() {
        return trucks.list();
        return trucks.list().map(function(truck) {
           if(truck.name.indexOf(this.searchTerm) > -1 ) {
               return truck;
           }
        })
    }
}

index.view = function(ctrl) {
    console.log(ctrl.list())
    return [
        m('input', {oninput: m.withAttr('value', ctrl.searchTerm)}),
        m('ul', ctrl.list().map(function(truck) {
        if(truck.lastupdate < Date.now() - eightHours) {
            return [
                m('li', truck.name)
            ]
        }
    })),
        m('button', {onclick: ctrl.update }, 'UPDATE')
    ]
};

m.route.mode = 'pathname';

m.route(document.querySelector('.content'), '/', {
    '/:site': index,
})*/

var eightHours = 28800;

var index = {}
index.updateUrl = '/api/trucks?updated_since=8&sort=lat&sort_dir=desc&site=';

index.controller = function() {
    var ctrl = this;

    ctrl.list = new list.controller({
        visible: function(item) {
            return item.name.toLowerCase().indexOf(ctrl.filter.searchTerm()) > -1 ||
                item.location.toLowerCase().indexOf(ctrl.filter.searchTerm()) > -1;
        }
    });

    ctrl.filter = new filter.controller();

    ctrl.update = function() {
        m.request({
            method: 'GET',
            url: index.updateUrl + m.route.param('site'),
        }).then(function(data) {
            list.items = function() {
                return data;
            }
        })
    }

    window.setInterval(ctrl.update, 900000);

}


index.view = function(ctrl) {
    return m(".row", [
        m(".col-md-2", [
            m("button", {onclick: ctrl.update }, 'UPDATE')
        ]),
        m(".col-md-2", [
            filter.view(ctrl.filter)
        ]),
        m(".col-med-10", [
            list.view(ctrl.list)
        ])
    ]);
}

var Truck = {}
Truck.list = function() {
    return initialTrucks;
}

var list = {}
list.items = Truck.list();
list.controller = function(options) {
    this.visible = options.visible;
}

list.view = function(ctrl) {
    return m("table", [
        list.items().filter(ctrl.visible).map(function(item) {
            return m("tr", [
                m("td", m("a", {"href": "/truck/"+item.twitname}, [item.name])),
                m("td", item.location),
                m("td", [
                    m("img", {
                        "src": makeMenuLink(item.image),
                    })
                ])
            ])
        })
    ])
}

var filter = {}
filter.controller = function(options) {
    this.searchTerm = m.prop("");
}

filter.view = function(ctrl) {
    return m("input", {oninput: m.withAttr("value", ctrl.searchTerm)})
}

function makeMenuLink(suffix) {
    if(suffix !== "") {
        return "https://irs0.4sqi.net/img/general/width30" + suffix;
    }
    return "";
}

m.route.mode = "pathname";

m.route(document.querySelector(".content"), "/", {
    "/:site": index,
});