var eightHours = 28800;

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