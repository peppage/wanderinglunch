var trucks = {}
trucks.controller = function() {
    var ctrl = this;

    ctrl.list = new list.controller({
        visible: function(item) {
            return item.name.indexOf(ctrl.filter.searchTerm()) > -1;
        }
    });

    ctrl.filter = new filter.controller();
}

trucks.view = function(ctrl) {
    return m(".row", [
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
    return m.request({method: "GET", url: "/api/trucks?site=" + m.route.param("site")});
}

var list = {}
list.controller = function(options) {
    this.items = Truck.list();
    this.visible = options.visible;
}

list.view = function(ctrl) {
    return m("table", [
        ctrl.items().filter(ctrl.visible).map(function(item) {
            return m("tr", [
                m("td", item.id),
                m("td", item.name)
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

m.route.mode = "pathname";

m.route(document.body, "/", {
    "/:site": trucks,
});