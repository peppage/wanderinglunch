var index = {}
index.updateUrl = "/api/trucks?updated_since=8&sort=lat&sort_dir=desc&site=";

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
            method: "GET",
            url: index.updateUrl + m.route.param("site"),
        }).then(function(data) {
            list.items = function() {
                return data;
            }
        })
    }

    window.setInterval(ctrl.update, 900000);
}

index.view = function(ctrl) {
    return m(".grid-1-center", [
         m(".col-5", [
            filter.view(ctrl.filter)
        ]),
        m(".col", []),
        m(".col-7", [
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
    console.log(list.items().length);
    if(list.items().length > 0) {
        return m("table.table", [
            list.thead(),
            m("tbody", [
                list.items().filter(ctrl.visible).map(function(item) {
                    return m("tr", [
                        m("td", m("a", {"href": "/truck/"+item.twitname}, [item.name])),
                        m("td", item.location),
                        m("td.noMobile", item.updated),
                        m("td.noMobile", [
                            m("img", {
                                "src": makeMenuLink(item.image),
                            })
                        ])
                    ])
                })
            ])
        ]);
    } else {
        return list.noTrucks();
    }
}

list.thead = function() {
    return m("thead", [
        m("tr", [
            m("th", "Truck"),
            m("th", "Location"),
            m("th.noMobile", "Time"),
            m("th.noMobile", "Menu")
        ])
    ]);
}

list.noTrucks = function() {
    return m("div", [
        m("h1", "Your hunger cannot be satisfied, no trucks are tweeting"),
        m("p", "If it's late, bookmark the site and come back around lunchtime!"),
        m("p", m.trust('There will be a list of trucks here, <a target="_blank" href="https://twitter.com/intent/tweet?text=Wandering Lunch&url=http://wanderinglunch.com">tweet</a> at yourself so you don\'t forget.')),
        m("p", m.trust('Check out <a href="/@site/alltrucks">a list of all the trucks</a> on the site while you wait.'))
    ]);
}

var filter = {}
filter.controller = function(options) {
    this.searchTerm = m.prop("");
}

filter.view = function(ctrl) {
    return m("input", {
        placeholder: "Search by name or location...",
        oninput: m.withAttr("value", ctrl.searchTerm)
    })
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