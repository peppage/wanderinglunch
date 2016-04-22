var sixtySeconds = 60000;

function checkForNewInfo(site, lastUpdate) {
    var r = new XMLHttpRequest();
    r.open('GET', '/'+site+'/lastupdate');
    r.onreadystatechange = function respHandler(data) {
        if (r.readyState != 4 || r.status != 200) return;
        if( r.responseText > lastUpdate ) {
            document.querySelector('.js-notification').classList.remove('hidden');
        }
    };
    r.send(null);
}

document.addEventListener("DOMContentLoaded", function() {
    if(document.querySelector('.js-refresh') != null) {
        document.querySelector('.js-refresh').addEventListener('click', function(e) {
            e.preventDefault();
            location.reload();
        });
    }
});