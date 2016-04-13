document.addEventListener("DOMContentLoaded", function() {
    var s = document.querySelector('.js-siteSwitch'); 
    if(s != null) {
        s.addEventListener('change', function(e) {
            var r = new XMLHttpRequest();
            r.open('GET', '/admin/setSite?site=' + s.value)
            r.onreadystatechange = function respHandler(data) {
                if (r.readyState != 4 || r.status != 200) return;
                location.reload();
            };
            r.send(null);
        });
    }
});