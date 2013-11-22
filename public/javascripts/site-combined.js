/* Modernizr 2.6.2 (Custom Build) | MIT & BSD
 * Build: http://modernizr.com/download/#-csstransforms3d-shiv-cssclasses-teststyles-testprop-testallprops-prefixes-domprefixes-load
 */
;window.Modernizr=function(a,b,c){function z(a){j.cssText=a}function A(a,b){return z(m.join(a+";")+(b||""))}function B(a,b){return typeof a===b}function C(a,b){return!!~(""+a).indexOf(b)}function D(a,b){for(var d in a){var e=a[d];if(!C(e,"-")&&j[e]!==c)return b=="pfx"?e:!0}return!1}function E(a,b,d){for(var e in a){var f=b[a[e]];if(f!==c)return d===!1?a[e]:B(f,"function")?f.bind(d||b):f}return!1}function F(a,b,c){var d=a.charAt(0).toUpperCase()+a.slice(1),e=(a+" "+o.join(d+" ")+d).split(" ");return B(b,"string")||B(b,"undefined")?D(e,b):(e=(a+" "+p.join(d+" ")+d).split(" "),E(e,b,c))}var d="2.6.2",e={},f=!0,g=b.documentElement,h="modernizr",i=b.createElement(h),j=i.style,k,l={}.toString,m=" -webkit- -moz- -o- -ms- ".split(" "),n="Webkit Moz O ms",o=n.split(" "),p=n.toLowerCase().split(" "),q={},r={},s={},t=[],u=t.slice,v,w=function(a,c,d,e){var f,i,j,k,l=b.createElement("div"),m=b.body,n=m||b.createElement("body");if(parseInt(d,10))while(d--)j=b.createElement("div"),j.id=e?e[d]:h+(d+1),l.appendChild(j);return f=["&#173;",'<style id="s',h,'">',a,"</style>"].join(""),l.id=h,(m?l:n).innerHTML+=f,n.appendChild(l),m||(n.style.background="",n.style.overflow="hidden",k=g.style.overflow,g.style.overflow="hidden",g.appendChild(n)),i=c(l,a),m?l.parentNode.removeChild(l):(n.parentNode.removeChild(n),g.style.overflow=k),!!i},x={}.hasOwnProperty,y;!B(x,"undefined")&&!B(x.call,"undefined")?y=function(a,b){return x.call(a,b)}:y=function(a,b){return b in a&&B(a.constructor.prototype[b],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(b){var c=this;if(typeof c!="function")throw new TypeError;var d=u.call(arguments,1),e=function(){if(this instanceof e){var a=function(){};a.prototype=c.prototype;var f=new a,g=c.apply(f,d.concat(u.call(arguments)));return Object(g)===g?g:f}return c.apply(b,d.concat(u.call(arguments)))};return e}),q.csstransforms3d=function(){var a=!!F("perspective");return a&&"webkitPerspective"in g.style&&w("@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}",function(b,c){a=b.offsetLeft===9&&b.offsetHeight===3}),a};for(var G in q)y(q,G)&&(v=G.toLowerCase(),e[v]=q[G](),t.push((e[v]?"":"no-")+v));return e.addTest=function(a,b){if(typeof a=="object")for(var d in a)y(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return e;b=typeof b=="function"?b():b,typeof f!="undefined"&&f&&(g.className+=" "+(b?"":"no-")+a),e[a]=b}return e},z(""),i=k=null,function(a,b){function k(a,b){var c=a.createElement("p"),d=a.getElementsByTagName("head")[0]||a.documentElement;return c.innerHTML="x<style>"+b+"</style>",d.insertBefore(c.lastChild,d.firstChild)}function l(){var a=r.elements;return typeof a=="string"?a.split(" "):a}function m(a){var b=i[a[g]];return b||(b={},h++,a[g]=h,i[h]=b),b}function n(a,c,f){c||(c=b);if(j)return c.createElement(a);f||(f=m(c));var g;return f.cache[a]?g=f.cache[a].cloneNode():e.test(a)?g=(f.cache[a]=f.createElem(a)).cloneNode():g=f.createElem(a),g.canHaveChildren&&!d.test(a)?f.frag.appendChild(g):g}function o(a,c){a||(a=b);if(j)return a.createDocumentFragment();c=c||m(a);var d=c.frag.cloneNode(),e=0,f=l(),g=f.length;for(;e<g;e++)d.createElement(f[e]);return d}function p(a,b){b.cache||(b.cache={},b.createElem=a.createElement,b.createFrag=a.createDocumentFragment,b.frag=b.createFrag()),a.createElement=function(c){return r.shivMethods?n(c,a,b):b.createElem(c)},a.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+l().join().replace(/\w+/g,function(a){return b.createElem(a),b.frag.createElement(a),'c("'+a+'")'})+");return n}")(r,b.frag)}function q(a){a||(a=b);var c=m(a);return r.shivCSS&&!f&&!c.hasCSS&&(c.hasCSS=!!k(a,"article,aside,figcaption,figure,footer,header,hgroup,nav,section{display:block}mark{background:#FF0;color:#000}")),j||p(a,c),a}var c=a.html5||{},d=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,e=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,f,g="_html5shiv",h=0,i={},j;(function(){try{var a=b.createElement("a");a.innerHTML="<xyz></xyz>",f="hidden"in a,j=a.childNodes.length==1||function(){b.createElement("a");var a=b.createDocumentFragment();return typeof a.cloneNode=="undefined"||typeof a.createDocumentFragment=="undefined"||typeof a.createElement=="undefined"}()}catch(c){f=!0,j=!0}})();var r={elements:c.elements||"abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video",shivCSS:c.shivCSS!==!1,supportsUnknownElements:j,shivMethods:c.shivMethods!==!1,type:"default",shivDocument:q,createElement:n,createDocumentFragment:o};a.html5=r,q(b)}(this,b),e._version=d,e._prefixes=m,e._domPrefixes=p,e._cssomPrefixes=o,e.testProp=function(a){return D([a])},e.testAllProps=F,e.testStyles=w,g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(f?" js "+t.join(" "):""),e}(this,this.document),function(a,b,c){function d(a){return"[object Function]"==o.call(a)}function e(a){return"string"==typeof a}function f(){}function g(a){return!a||"loaded"==a||"complete"==a||"uninitialized"==a}function h(){var a=p.shift();q=1,a?a.t?m(function(){("c"==a.t?B.injectCss:B.injectJs)(a.s,0,a.a,a.x,a.e,1)},0):(a(),h()):q=0}function i(a,c,d,e,f,i,j){function k(b){if(!o&&g(l.readyState)&&(u.r=o=1,!q&&h(),l.onload=l.onreadystatechange=null,b)){"img"!=a&&m(function(){t.removeChild(l)},50);for(var d in y[c])y[c].hasOwnProperty(d)&&y[c][d].onload()}}var j=j||B.errorTimeout,l=b.createElement(a),o=0,r=0,u={t:d,s:c,e:f,a:i,x:j};1===y[c]&&(r=1,y[c]=[]),"object"==a?l.data=c:(l.src=c,l.type=a),l.width=l.height="0",l.onerror=l.onload=l.onreadystatechange=function(){k.call(this,r)},p.splice(e,0,u),"img"!=a&&(r||2===y[c]?(t.insertBefore(l,s?null:n),m(k,j)):y[c].push(l))}function j(a,b,c,d,f){return q=0,b=b||"j",e(a)?i("c"==b?v:u,a,b,this.i++,c,d,f):(p.splice(this.i++,0,a),1==p.length&&h()),this}function k(){var a=B;return a.loader={load:j,i:0},a}var l=b.documentElement,m=a.setTimeout,n=b.getElementsByTagName("script")[0],o={}.toString,p=[],q=0,r="MozAppearance"in l.style,s=r&&!!b.createRange().compareNode,t=s?l:n.parentNode,l=a.opera&&"[object Opera]"==o.call(a.opera),l=!!b.attachEvent&&!l,u=r?"object":l?"script":"img",v=l?"script":u,w=Array.isArray||function(a){return"[object Array]"==o.call(a)},x=[],y={},z={timeout:function(a,b){return b.length&&(a.timeout=b[0]),a}},A,B;B=function(a){function b(a){var a=a.split("!"),b=x.length,c=a.pop(),d=a.length,c={url:c,origUrl:c,prefixes:a},e,f,g;for(f=0;f<d;f++)g=a[f].split("="),(e=z[g.shift()])&&(c=e(c,g));for(f=0;f<b;f++)c=x[f](c);return c}function g(a,e,f,g,h){var i=b(a),j=i.autoCallback;i.url.split(".").pop().split("?").shift(),i.bypass||(e&&(e=d(e)?e:e[a]||e[g]||e[a.split("/").pop().split("?")[0]]),i.instead?i.instead(a,e,f,g,h):(y[i.url]?i.noexec=!0:y[i.url]=1,f.load(i.url,i.forceCSS||!i.forceJS&&"css"==i.url.split(".").pop().split("?").shift()?"c":c,i.noexec,i.attrs,i.timeout),(d(e)||d(j))&&f.load(function(){k(),e&&e(i.origUrl,h,g),j&&j(i.origUrl,h,g),y[i.url]=2})))}function h(a,b){function c(a,c){if(a){if(e(a))c||(j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}),g(a,j,b,0,h);else if(Object(a)===a)for(n in m=function(){var b=0,c;for(c in a)a.hasOwnProperty(c)&&b++;return b}(),a)a.hasOwnProperty(n)&&(!c&&!--m&&(d(j)?j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}:j[n]=function(a){return function(){var b=[].slice.call(arguments);a&&a.apply(this,b),l()}}(k[n])),g(a[n],j,b,n,h))}else!c&&l()}var h=!!a.test,i=a.load||a.both,j=a.callback||f,k=j,l=a.complete||f,m,n;c(h?a.yep:a.nope,!!i),i&&c(i)}var i,j,l=this.yepnope.loader;if(e(a))g(a,0,l,0);else if(w(a))for(i=0;i<a.length;i++)j=a[i],e(j)?g(j,0,l,0):w(j)?B(j):Object(j)===j&&h(j,l);else Object(a)===a&&h(a,l)},B.addPrefix=function(a,b){z[a]=b},B.addFilter=function(a){x.push(a)},B.errorTimeout=1e4,null==b.readyState&&b.addEventListener&&(b.readyState="loading",b.addEventListener("DOMContentLoaded",A=function(){b.removeEventListener("DOMContentLoaded",A,0),b.readyState="complete"},0)),a.yepnope=k(),a.yepnope.executeStack=h,a.yepnope.injectJs=function(a,c,d,e,i,j){var k=b.createElement("script"),l,o,e=e||B.errorTimeout;k.src=a;for(o in d)k.setAttribute(o,d[o]);c=j?h:c||f,k.onreadystatechange=k.onload=function(){!l&&g(k.readyState)&&(l=1,c(),k.onload=k.onreadystatechange=null)},m(function(){l||(l=1,c(1))},e),i?k.onload():n.parentNode.insertBefore(k,n)},a.yepnope.injectCss=function(a,c,d,e,g,i){var e=b.createElement("link"),j,c=i?h:c||f;e.href=a,e.rel="stylesheet",e.type="text/css";for(j in d)e.setAttribute(j,d[j]);g||(n.parentNode.insertBefore(e,n),m(c,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};

/*

Tooltipster 2.1.4 | 6/1/13
A rockin' custom tooltip jQuery plugin

Developed by: Caleb Jacob - calebjacob.com
Copyright (C) 2013 Caleb Jacob

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

;(function ($, window, document, undefined) {

    var pluginName = "tooltipster",
        defaults = {
            animation: 'fade',
            arrow: true,
            arrowColor: '',
            content: '',
            delay: 200,
            fixedWidth: 0,
            maxWidth: 0,
            functionBefore: function(origin, continueTooltip) {
                continueTooltip();
            },
            functionReady: function(origin, tooltip) {},
            functionAfter: function(origin) {},
            icon: '(?)',
            iconDesktop: false,
            iconTouch: false,
            iconTheme: '.tooltipster-icon',
            interactive: false,
            interactiveTolerance: 350,
            offsetX: 0,
            offsetY: 0,
            onlyOne: true,
            position: 'top',
            speed: 350,
            timer: 0,
            theme: '.tooltipster-default',
            touchDevices: true,
            trigger: 'hover',
            updateAnimation: true
        };
    
    function Plugin(element, options) {
        this.element = element;
        
        this.options = $.extend( {}, defaults, options );
        
        this._defaults = defaults;
        this._name = pluginName;
        
        this.init();
    }
    
    // we'll use this to detect for mobile devices
    function is_touch_device() {
        return !!('ontouchstart' in window);
    }
    
    // detecting support for CSS transitions
    function supportsTransitions() {
        var b = document.body || document.documentElement;
        var s = b.style;
        var p = 'transition';
        if(typeof s[p] == 'string') {return true; }
    
        v = ['Moz', 'Webkit', 'Khtml', 'O', 'ms'],
        p = p.charAt(0).toUpperCase() + p.substr(1);
        for(var i=0; i<v.length; i++) {
          if(typeof s[v[i] + p] == 'string') { return true; }
        }
        return false;
    }
    var transitionSupport = true;
    if (!supportsTransitions()) {
        transitionSupport = false;
    }
    
    // detect if this device is mouse driven over purely touch
    var touchDevice = is_touch_device();
    
    // on mousemove, double confirm that this is a desktop - not a touch device
    $(window).on('mousemove.tooltipster', function() {
        touchDevice = false;        
        $(window).off('mousemove.tooltipster');
    });
    
    
    
        
    Plugin.prototype = {
        
        init: function() {      
            var $this = $(this.element);
            var object = this;
            var run = true;
            
            // if this is a touch device and touch devices are disabled, disable the plugin
            if ((object.options.touchDevices == false) && (touchDevice)) {
                run = false;
            }
            
            // if IE7 or lower, disable the plugin
            if (document.all && !document.querySelector) {
                run = false;
            }
                        
            if (run == true) {
                
                // detect if we're changing the tooltip origin to an icon
                if ((this.options.iconDesktop == true) && (!touchDevice) || ((this.options.iconTouch == true) && (touchDevice))) {
                    var transferContent = $this.attr('title');                  
                    $this.removeAttr('title');
                    var theme = object.options.iconTheme;
                    var icon = $('<span class="'+ theme.replace('.', '') +'" title="'+ transferContent +'">'+ this.options.icon +'</span>');
                    icon.insertAfter($this);
                    $this.data('tooltipsterIcon', icon);
                    $this = icon;
                }
            
                // first, strip the title off of the element and set it as a data attribute to prevent the default tooltips from popping up
                var tooltipsterContent = $.trim(object.options.content).length > 0 ? object.options.content : $this.attr('title');
                $this.data('tooltipsterContent', tooltipsterContent);
                $this.removeAttr('title');
                
                // if this is a touch device, add some touch events to launch the tooltip
                if ((this.options.touchDevices == true) && (touchDevice) && ((this.options.trigger == 'click') || (this.options.trigger == 'hover'))) {
                    $this.bind('touchstart', function(element, options) {
                        object.showTooltip();
                    });
                }
                
                // if this is a desktop, deal with adding regular mouse events
                else {
                
                    // if hover events are set to show and hide the tooltip, attach those events respectively
                    if (this.options.trigger == 'hover') {
                        $this.on('mouseenter.tooltipster', function() {
                            object.showTooltip();
                        });
                        
                        // if this is an interactive tooltip, delay getting rid of the tooltip right away so you have a chance to hover on the tooltip
                        if (this.options.interactive == true) {
                            $this.on('mouseleave.tooltipster', function() {
                                var tooltipster = $this.data('tooltipster');
                                var keepAlive = false;
                                
                                if ((tooltipster !== undefined) && (tooltipster !== '')) {
                                    tooltipster.mouseenter(function() {
                                        keepAlive = true;
                                    });
                                    tooltipster.mouseleave(function() {
                                        keepAlive = false;
                                    });
                                    
                                    var tolerance = setTimeout(function() {
                                        if (keepAlive == true) {
                                            tooltipster.mouseleave(function() {
                                                object.hideTooltip();
                                            });
                                        }
                                        else {
                                            object.hideTooltip();
                                        }
                                    }, object.options.interactiveTolerance);
                                }
                                else {
                                    object.hideTooltip();
                                }
                            });
                        }
                        
                        // if this is a dumb tooltip, just get rid of it on mouseleave
                        else {
                            $this.on('mouseleave.tooltipster', function() {
                                object.hideTooltip();
                            });
                        }
                    }
                    
                    // if click events are set to show and hide the tooltip, attach those events respectively
                    if (this.options.trigger == 'click') {
                        $this.on('click.tooltipster', function() {
                            if (($this.data('tooltipster') == '') || ($this.data('tooltipster') == undefined)) {
                                object.showTooltip();
                            }
                            else {
                                object.hideTooltip();
                            }
                        });
                    }
                }
            }
        },
        
        showTooltip: function(options) {            
            var $this = $(this.element);
            var object = this;
                        
            // detect if we're actually dealing with an icon or the origin itself
            if ($this.data('tooltipsterIcon') !== undefined) {
                $this = $this.data('tooltipsterIcon');
            }
            
            // continue if this tooltip is enabled
            if (!$this.hasClass('tooltipster-disable')) {
            
                // if we only want one tooltip open at a time, close all tooltips currently open
                if (($('.tooltipster-base').not('.tooltipster-dying').length > 0) && (object.options.onlyOne == true)) {
                    $('.tooltipster-base').not('.tooltipster-dying').not($this.data('tooltipster')).each(function() {
                        $(this).addClass('tooltipster-kill');
                        var origin = $(this).data('origin');
                        origin.data('plugin_tooltipster').hideTooltip();
                    });
                }
                        
                // delay the showing of the tooltip according to the delay time
                $this.clearQueue().delay(object.options.delay).queue(function() {
                
                    // call our custom function before continuing
                    object.options.functionBefore($this, function() {
                        
                        // if this origin already has its tooltip open, keep it open and do nothing else
                        if (($this.data('tooltipster') !== undefined) && ($this.data('tooltipster') !== '')) {
                            var tooltipster = $this.data('tooltipster');
                            
                            if (!tooltipster.hasClass('tooltipster-kill')) {
    
                                var animation = 'tooltipster-'+ object.options.animation;
                                
                                tooltipster.removeClass('tooltipster-dying');
                                
                                if (transitionSupport == true) {
                                    tooltipster.clearQueue().addClass(animation +'-show');
                                }
                                
                                // if we have a timer set, we need to reset it
                                if (object.options.timer > 0) {
                                    var timer = tooltipster.data('tooltipsterTimer');
                                    clearTimeout(timer);
                                                        
                                    timer = setTimeout(function() {
                                        tooltipster.data('tooltipsterTimer', undefined);
                                        object.hideTooltip();
                                    }, object.options.timer);
                                    
                                    tooltipster.data('tooltipsterTimer', timer);
                                }
                                
                                // if this is a touch device, hide the tooltip on body touch
                                if ((object.options.touchDevices == true) && (touchDevice)) {
                                    $('body').bind('touchstart', function(event) {
                                        if (object.options.interactive == true) {
                                            var touchTarget = $(event.target);
                                            var closeTooltip = true;
                                            
                                            touchTarget.parents().each(function() {
                                                if ($(this).hasClass('tooltipster-base')) {
                                                    closeTooltip = false;
                                                }
                                            });
                                            
                                            if (closeTooltip == true) {
                                                object.hideTooltip();
                                                $('body').unbind('touchstart');
                                            }
                                        }
                                        else {
                                            object.hideTooltip();
                                            $('body').unbind('touchstart');
                                        }
                                    });
                                }
                            }
                        }
                        
                        // if the tooltip isn't already open, open that sucker up!
                        else {
                            // disable horizontal scrollbar to keep overflowing tooltips from jacking with it
                            $('body').css('overflow-x', 'hidden');
                            
                            // get the content for the tooltip
                            var content = $this.data('tooltipsterContent');
                            
                            // get some other settings related to building the tooltip
                            var theme = object.options.theme;
                            var themeClass = theme.replace('.', '');
                            var animation = 'tooltipster-'+object.options.animation;
                            var animationSpeed = '-webkit-transition-duration: '+ object.options.speed +'ms; -webkit-animation-duration: '+ object.options.speed +'ms; -moz-transition-duration: '+ object.options.speed +'ms; -moz-animation-duration: '+ object.options.speed +'ms; -o-transition-duration: '+ object.options.speed +'ms; -o-animation-duration: '+ object.options.speed +'ms; -ms-transition-duration: '+ object.options.speed +'ms; -ms-animation-duration: '+ object.options.speed +'ms; transition-duration: '+ object.options.speed +'ms; animation-duration: '+ object.options.speed +'ms;';
                            var fixedWidth = object.options.fixedWidth > 0 ? 'width:'+ Math.round(object.options.fixedWidth) +'px;' : '';
                            var maxWidth = object.options.maxWidth > 0 ? 'max-width:'+ Math.round(object.options.maxWidth) +'px;' : '';
                            var pointerEvents = object.options.interactive == true ? 'pointer-events: auto;' : '';
                                                
                            // build the base of our tooltip
                            var tooltipster = $('<div class="tooltipster-base '+ themeClass +' '+ animation +'" style="'+ fixedWidth +' '+ maxWidth +' '+ pointerEvents +' '+ animationSpeed +'"></div>');
                            var tooltipsterHTML = $('<div class="tooltipster-content"></div>');
                            tooltipsterHTML.html(content);
                            tooltipster.append(tooltipsterHTML);
                            
                            
                            tooltipster.appendTo('body');
                            
                            // attach the tooltip to its origin
                            $this.data('tooltipster', tooltipster);
                            tooltipster.data('origin', $this);
                            
                            // do all the crazy calculations and positioning
                            object.positionTooltip();
                            
                            // call our custom callback since the content of the tooltip is now part of the DOM
                            object.options.functionReady($this, tooltipster);
                            
                            // animate in the tooltip
                            if (transitionSupport == true) {
                                tooltipster.addClass(animation + '-show');
                            }
                            else {
                                tooltipster.css('display', 'none').removeClass(animation).fadeIn(object.options.speed);
                            }
                            
                            // check to see if our tooltip content changes or its origin is removed while the tooltip is alive
                            var currentTooltipContent = content;
                            var contentUpdateChecker = setInterval(function() {     
                                var newTooltipContent = $this.data('tooltipsterContent');
                                
                                // if this tooltip's origin is removed, remove the tooltip
                                if ($('body').find($this).length == 0) {
                                    tooltipster.addClass('tooltipster-dying');
                                    object.hideTooltip();
                                }
                                
                                // if the content changed for the tooltip, update it                                            
                                else if ((currentTooltipContent !== newTooltipContent) && (newTooltipContent !== '')) {
                                    currentTooltipContent = newTooltipContent;
                                    
                                    // set the new content in the tooltip
                                    tooltipster.find('.tooltipster-content').html(newTooltipContent);
                                    
                                    // if we want to play a little animation showing the content changed
                                    if (object.options.updateAnimation == true) {
                                        if (supportsTransitions()) {
                                            tooltipster.css({
                                                'width': '',
                                                '-webkit-transition': 'all ' + object.options.speed + 'ms, width 0ms, height 0ms, left 0ms, top 0ms',
                                                '-moz-transition': 'all ' + object.options.speed + 'ms, width 0ms, height 0ms, left 0ms, top 0ms',
                                                '-o-transition': 'all ' + object.options.speed + 'ms, width 0ms, height 0ms, left 0ms, top 0ms',
                                                '-ms-transition': 'all ' + object.options.speed + 'ms, width 0ms, height 0ms, left 0ms, top 0ms',
                                                'transition': 'all ' + object.options.speed + 'ms, width 0ms, height 0ms, left 0ms, top 0ms'
                                            }).addClass('tooltipster-content-changing');
                                            
                                            // reset the CSS transitions and finish the change animation
                                            setTimeout(function() {
                                                tooltipster.removeClass('tooltipster-content-changing');
                                                // after the changing animation has completed, reset the CSS transitions
                                                setTimeout(function() {
                                                    tooltipster.css({
                                                        '-webkit-transition': object.options.speed + 'ms',
                                                        '-moz-transition': object.options.speed + 'ms',
                                                        '-o-transition': object.options.speed + 'ms',
                                                        '-ms-transition': object.options.speed + 'ms',
                                                        'transition': object.options.speed + 'ms'
                                                    });
                                                }, object.options.speed);
                                            }, object.options.speed);
                                        }
                                        else {
                                            tooltipster.fadeTo(object.options.speed, 0.5, function() {
                                                tooltipster.fadeTo(object.options.speed, 1);
                                            });
                                        }
                                    }
                                    
                                    // reposition and resize the tooltip
                                    object.positionTooltip();
                                }
                                
                                // if the tooltip is closed or origin is removed, clear this interval
                                if (($('body').find(tooltipster).length == 0) || ($('body').find($this).length == 0)) {
                                    clearInterval(contentUpdateChecker);
                                }
                            }, 200);
                            
                            // if we have a timer set, let the countdown begin!
                            if (object.options.timer > 0) {                         
                                var timer = setTimeout(function() {
                                    tooltipster.data('tooltipsterTimer', undefined);
                                    object.hideTooltip();
                                }, object.options.timer + object.options.speed);
                                
                                tooltipster.data('tooltipsterTimer', timer);
                            }
                            
                            // if this is a touch device, hide the tooltip on body touch
                            if ((object.options.touchDevices == true) && (touchDevice)) {
                                $('body').bind('touchstart', function(event) {
                                    if (object.options.interactive == true) {
                                        
                                        var touchTarget = $(event.target);
                                        var closeTooltip = true;
                                                                            
                                        touchTarget.parents().each(function() {
                                            if ($(this).hasClass('tooltipster-base')) {
                                                closeTooltip = false;
                                            }
                                        });
                                        
                                        if (closeTooltip == true) {
                                            object.hideTooltip();
                                            $('body').unbind('touchstart');
                                        }
                                    }
                                    else {
                                        object.hideTooltip();
                                        $('body').unbind('touchstart');
                                    }
                                });
                            }
                            
                            // if this is an interactive tooltip activated by a click, close the tooltip when you hover off the tooltip
                            tooltipster.mouseleave(function() {
                                object.hideTooltip();
                            });
                        }
                    });
                    
                    $this.dequeue();
                });
            }
        },
        
        hideTooltip: function(options) {
                        
            var $this = $(this.element);
            var object = this;
            
            // detect if we're actually dealing with an icon or the origin itself
            if ($this.data('tooltipsterIcon') !== undefined) {
                $this = $this.data('tooltipsterIcon');
            }
            
            var tooltipster = $this.data('tooltipster');
            
            // if the origin has been removed, find all tooltips assigned to death
            if (tooltipster == undefined) {
                tooltipster = $('.tooltipster-dying');
            }
            
            // clear any possible queues handling delays and such
            $this.clearQueue();
            
            if ((tooltipster !== undefined) && (tooltipster !== '')) {
                
                // detect if we need to clear a timer
                var timer = tooltipster.data('tooltipsterTimer');
                if (timer !== undefined) {
                    clearTimeout(timer);
                }

                var animation = 'tooltipster-'+ object.options.animation;
                
                if (transitionSupport == true) {
                    tooltipster.clearQueue().removeClass(animation +'-show').addClass('tooltipster-dying').delay(object.options.speed).queue(function() {
                        tooltipster.remove();
                        $this.data('tooltipster', '');
                        $('body').css('verflow-x', '');
                        
                        // finally, call our custom callback function
                        object.options.functionAfter($this);
                    });
                }
                else {
                    tooltipster.clearQueue().addClass('tooltipster-dying').fadeOut(object.options.speed, function() {
                        tooltipster.remove();
                        $this.data('tooltipster', '');
                        $('body').css('verflow-x', '');
                        
                        // finally, call our custom callback function
                        object.options.functionAfter($this);
                    });
                }
            }
        },
        
        positionTooltip: function(options) {
                    
            var $this = $(this.element);
            var object = this;
                                    
            // detect if we're actually dealing with an icon or the origin itself
            if ($this.data('tooltipsterIcon') !== undefined) {
                $this = $this.data('tooltipsterIcon');
            }
            
            if (($this.data('tooltipster') !== undefined) && ($this.data('tooltipster') !== '')) {
                        
                // find tooltipster and reset its width
                var tooltipster = $this.data('tooltipster');
                tooltipster.css('width', '');
                
                // find variables to determine placement
                var windowWidth = $(window).width();
                var containerWidth = $this.outerWidth(false);
                var containerHeight = $this.outerHeight(false);
                var tooltipWidth = tooltipster.outerWidth(false);
                var tooltipInnerWidth = tooltipster.innerWidth() + 1; // this +1 stops FireFox from sometimes forcing an additional text line
                var tooltipHeight = tooltipster.outerHeight(false);
                var offset = $this.offset();
                var offsetTop = offset.top;
                var offsetLeft = offset.left;
                var resetPosition = undefined;
                
                // if this is an <area> tag inside a <map>, all hell breaks loose. Recaclulate all the measurements based on coordinates
                if ($this.is('area')) {
                    var areaShape = $this.attr('shape');
                    var mapName = $this.parent().attr('name');
                    var map = $('img[usemap="#'+ mapName +'"]');
                    var mapOffsetLeft = map.offset().left;
                    var mapOffsetTop = map.offset().top;
                    var areaMeasurements = $this.attr('coords') !== undefined ? $this.attr('coords').split(',') : undefined;
                    
                    if (areaShape == 'circle') {
                        var areaLeft = parseInt(areaMeasurements[0]);
                        var areaTop = parseInt(areaMeasurements[1]);
                        var areaWidth = parseInt(areaMeasurements[2]);
                        containerHeight = areaWidth * 2;
                        containerWidth = areaWidth * 2;
                        offsetTop = mapOffsetTop + areaTop - areaWidth;
                        offsetLeft = mapOffsetLeft + areaLeft - areaWidth;
                    }
                    else if (areaShape == 'rect') {
                        var areaLeft = parseInt(areaMeasurements[0]);
                        var areaTop = parseInt(areaMeasurements[1]);
                        var areaRight = parseInt(areaMeasurements[2]);
                        var areaBottom = parseInt(areaMeasurements[3]);
                        containerHeight = areaBottom - areaTop;
                        containerWidth = areaRight - areaLeft;
                        offsetTop = mapOffsetTop + areaTop;
                        offsetLeft = mapOffsetLeft + areaLeft;
                    }
                    else if (areaShape == 'poly') {
                        var areaXs = [];
                        var areaYs = [];
                        var areaSmallestX = 0,
                            areaSmallestY = 0,
                            areaGreatestX = 0,
                            areaGreatestY = 0;
                        var arrayAlternate = 'even';
                        
                        for (i = 0; i < areaMeasurements.length; i++) {
                            var areaNumber = parseInt(areaMeasurements[i]);
                            
                            if (arrayAlternate == 'even') {
                                if (areaNumber > areaGreatestX) {
                                    areaGreatestX = areaNumber;
                                    if (i == 0) {
                                        areaSmallestX = areaGreatestX;
                                    }
                                }
                                
                                if (areaNumber < areaSmallestX) {
                                    areaSmallestX = areaNumber;
                                }
                                
                                arrayAlternate = 'odd';
                            }
                            else {
                                if (areaNumber > areaGreatestY) {
                                    areaGreatestY = areaNumber;
                                    if (i == 1) {
                                        areaSmallestY = areaGreatestY;
                                    }
                                }
                                
                                if (areaNumber < areaSmallestY) {
                                    areaSmallestY = areaNumber;
                                }
                                
                                arrayAlternate = 'even';
                            }
                        }
                    
                        containerHeight = areaGreatestY - areaSmallestY;
                        containerWidth = areaGreatestX - areaSmallestX;
                        offsetTop = mapOffsetTop + areaSmallestY;
                        offsetLeft = mapOffsetLeft + areaSmallestX;
                    }
                    else {
                        containerHeight = map.outerHeight(false);
                        containerWidth = map.outerWidth(false);
                        offsetTop = mapOffsetTop;
                        offsetLeft = mapOffsetLeft;
                    }
                }
                                                                
                // hardcoding the width and removing the padding fixed an issue with the tooltip width collapsing when the window size is small
                if(object.options.fixedWidth == 0) {
                    tooltipster.css({
                        'width': Math.round(tooltipInnerWidth) + 'px',
                        'padding-left': '0px',
                        'padding-right': '0px'
                    });
                }
                
                // our function and global vars for positioning our tooltip
                var myLeft = 0,
                    myTop = 0;
                var offsetY = parseInt(object.options.offsetY);
                var offsetX = parseInt(object.options.offsetX);
                var arrowConstruct = '';
                
                // A function to detect if the tooltip is going off the screen horizontally. If so, reposition the crap out of it!
                function dontGoOffScreenX() {
                
                    var windowLeft = $(window).scrollLeft();
                    
                    // If the tooltip goes off the left side of the screen, line it up with the left side of the window
                    if((myLeft - windowLeft) < 0) {
                        var arrowReposition = myLeft - windowLeft;
                        myLeft = windowLeft;
                                                                                                
                        tooltipster.data('arrow-reposition', arrowReposition);
                    }
                    
                    // If the tooltip goes off the right of the screen, line it up with the right side of the window
                    if (((myLeft + tooltipWidth) - windowLeft) > windowWidth) {
                        var arrowReposition = myLeft - ((windowWidth + windowLeft) - tooltipWidth);
                        myLeft = (windowWidth + windowLeft) - tooltipWidth;
                                                                                                                
                        tooltipster.data('arrow-reposition', arrowReposition);
                    }
                }
                
                // A function to detect if the tooltip is going off the screen vertically. If so, switch to the opposite!
                function dontGoOffScreenY(switchTo, resetTo) {
                    // if it goes off the top off the page
                    if(((offsetTop - $(window).scrollTop() - tooltipHeight - offsetY - 12) < 0) && (resetTo.indexOf('top') > -1)) {
                        object.options.position = switchTo;
                        resetPosition = resetTo;
                    }
                    
                    // if it goes off the bottom of the page
                    if (((offsetTop + containerHeight + tooltipHeight + 12 + offsetY) > ($(window).scrollTop() + $(window).height())) && (resetTo.indexOf('bottom') > -1)) {
                        object.options.position = switchTo;
                        resetPosition = resetTo;
                        myTop = (offsetTop - tooltipHeight) - offsetY - 12;
                    }
                }
                            
                if(object.options.position == 'top') {
                    var leftDifference = (offsetLeft + tooltipWidth) - (offsetLeft + containerWidth);
                    myLeft =  (offsetLeft + offsetX) - (leftDifference / 2);
                    myTop = (offsetTop - tooltipHeight) - offsetY - 12;
                    dontGoOffScreenX();
                    dontGoOffScreenY('bottom', 'top');
                }
                
                if(object.options.position == 'top-left') {
                    myLeft = offsetLeft + offsetX;
                    myTop = (offsetTop - tooltipHeight) - offsetY - 12;
                    dontGoOffScreenX();
                    dontGoOffScreenY('bottom-left', 'top-left');
                }
                
                if(object.options.position == 'top-right') {
                    myLeft = (offsetLeft + containerWidth + offsetX) - tooltipWidth;
                    myTop = (offsetTop - tooltipHeight) - offsetY - 12;
                    dontGoOffScreenX();
                    dontGoOffScreenY('bottom-right', 'top-right');
                }
                
                if(object.options.position == 'bottom') {
                    var leftDifference = (offsetLeft + tooltipWidth) - (offsetLeft + containerWidth);
                    myLeft =  offsetLeft - (leftDifference / 2) + offsetX;
                    myTop = (offsetTop + containerHeight) + offsetY + 12;
                    dontGoOffScreenX();
                    dontGoOffScreenY('top', 'bottom');
                }
                
                if(object.options.position == 'bottom-left') {
                    myLeft = offsetLeft + offsetX;
                    myTop = (offsetTop + containerHeight) + offsetY + 12;
                    dontGoOffScreenX();
                    dontGoOffScreenY('top-left', 'bottom-left');
                }
                
                if(object.options.position == 'bottom-right') {
                    myLeft = (offsetLeft + containerWidth + offsetX) - tooltipWidth;
                    myTop = (offsetTop + containerHeight) + offsetY + 12;
                    dontGoOffScreenX();
                    dontGoOffScreenY('top-right', 'bottom-right');
                }
                
                if(object.options.position == 'left') {
                    myLeft = offsetLeft - offsetX - tooltipWidth - 12;
                    myLeftMirror = offsetLeft + offsetX + containerWidth + 12;
                    var topDifference = (offsetTop + tooltipHeight) - (offsetTop + $this.outerHeight(false));
                    myTop =  offsetTop - (topDifference / 2) - offsetY;
                                                
                    // If the tooltip goes off boths sides of the page
                    if((myLeft < 0) && ((myLeftMirror + tooltipWidth) > windowWidth)) {
                        var borderWidth = parseFloat(tooltipster.css('border-width')) * 2;
                        var newWidth = (tooltipWidth + myLeft) - borderWidth;
                        tooltipster.css('width', newWidth + 'px');
                        
                        tooltipHeight = tooltipster.outerHeight(false);
                        myLeft = offsetLeft - offsetX - newWidth - 12 - borderWidth;
                        topDifference = (offsetTop + tooltipHeight) - (offsetTop + $this.outerHeight(false));
                        myTop =  offsetTop - (topDifference / 2) - offsetY;
                    }
                    
                    // If it only goes off one side, flip it to the other side
                    else if(myLeft < 0) {
                        myLeft = offsetLeft + offsetX + containerWidth + 12;
                        tooltipster.data('arrow-reposition', 'left');
                    }
                }
                
                if(object.options.position == 'right') {
                    myLeft = offsetLeft + offsetX + containerWidth + 12;
                    myLeftMirror = offsetLeft - offsetX - tooltipWidth - 12;
                    var topDifference = (offsetTop + tooltipHeight) - (offsetTop + $this.outerHeight(false));
                    myTop =  offsetTop - (topDifference / 2) - offsetY;
                    
                    // If the tooltip goes off boths sides of the page
                    if(((myLeft + tooltipWidth) > windowWidth) && (myLeftMirror < 0)) {
                        var borderWidth = parseFloat(tooltipster.css('border-width')) * 2;
                        var newWidth = (windowWidth - myLeft) - borderWidth;
                        tooltipster.css('width', newWidth + 'px');
                        
                        tooltipHeight = tooltipster.outerHeight(false);
                        topDifference = (offsetTop + tooltipHeight) - (offsetTop + $this.outerHeight(false));
                        myTop =  offsetTop - (topDifference / 2) - offsetY;
    
                    }
                        
                    // If it only goes off one side, flip it to the other side
                    else if((myLeft + tooltipWidth) > windowWidth) {
                        myLeft = offsetLeft - offsetX - tooltipWidth - 12;
                        tooltipster.data('arrow-reposition', 'right');
                    }
                }
                
                // if arrow is set true, style it and append it
                if (object.options.arrow == true) {
    
                    var arrowClass = 'tooltipster-arrow-' + object.options.position;
                    
                    // set color of the arrow
                    if(object.options.arrowColor.length < 1) {
                        var arrowColor = tooltipster.css('background-color');
                    }
                    else {
                        var arrowColor = object.options.arrowColor;
                    }
                    
                    // if the tooltip was going off the page and had to re-adjust, we need to update the arrow's position
                    var arrowReposition = tooltipster.data('arrow-reposition');
                    if (!arrowReposition) {
                        arrowReposition = '';
                    }
                    else if (arrowReposition == 'left') {
                        arrowClass = 'tooltipster-arrow-right';
                        arrowReposition = '';
                    }
                    else if (arrowReposition == 'right') {
                        arrowClass = 'tooltipster-arrow-left';
                        arrowReposition = '';
                    }
                    else {
                        arrowReposition = 'left:'+ Math.round(arrowReposition) +'px;';
                    }
                                        
                    // building the logic to create the border around the arrow of the tooltip
                    if ((object.options.position == 'top') || (object.options.position == 'top-left') || (object.options.position == 'top-right')) {
                        var tooltipBorderWidth = parseFloat(tooltipster.css('border-bottom-width'));
                        var tooltipBorderColor = tooltipster.css('border-bottom-color');
                    }
                    else if ((object.options.position == 'bottom') || (object.options.position == 'bottom-left') || (object.options.position == 'bottom-right')) {
                        var tooltipBorderWidth = parseFloat(tooltipster.css('border-top-width'));
                        var tooltipBorderColor = tooltipster.css('border-top-color');
                    }
                    else if (object.options.position == 'left') {
                        var tooltipBorderWidth = parseFloat(tooltipster.css('border-right-width'));
                        var tooltipBorderColor = tooltipster.css('border-right-color');
                    }
                    else if (object.options.position == 'right') {
                        var tooltipBorderWidth = parseFloat(tooltipster.css('border-left-width'));
                        var tooltipBorderColor = tooltipster.css('border-left-color');
                    }
                    else {
                        var tooltipBorderWidth = parseFloat(tooltipster.css('border-bottom-width'));
                        var tooltipBorderColor = tooltipster.css('border-bottom-color');
                    }
                    
                    if (tooltipBorderWidth > 1) {
                        tooltipBorderWidth++;
                    }
                    
                    var arrowBorder = '';
                    if (tooltipBorderWidth !== 0) {
                        var arrowBorderSize = '';
                        var arrowBorderColor = 'border-color: '+ tooltipBorderColor +';';
                        if (arrowClass.indexOf('bottom') !== -1) {
                            arrowBorderSize = 'margin-top: -'+ Math.round(tooltipBorderWidth) +'px;';
                        }
                        else if (arrowClass.indexOf('top') !== -1) {
                            arrowBorderSize = 'margin-bottom: -'+ Math.round(tooltipBorderWidth) +'px;';
                        }
                        else if (arrowClass.indexOf('left') !== -1) {
                            arrowBorderSize = 'margin-right: -'+ Math.round(tooltipBorderWidth) +'px;';
                        }
                        else if (arrowClass.indexOf('right') !== -1) {
                            arrowBorderSize = 'margin-left: -'+ Math.round(tooltipBorderWidth) +'px;';
                        }
                        arrowBorder = '<span class="tooltipster-arrow-border" style="'+ arrowBorderSize +' '+ arrowBorderColor +';"></span>';
                    }
                    
                    // if the arrow already exists, remove and replace it
                    tooltipster.find('.tooltipster-arrow').remove();
                    
                    // build out the arrow and append it        
                    arrowConstruct = '<div class="'+ arrowClass +' tooltipster-arrow" style="'+ arrowReposition +'">'+ arrowBorder +'<span style="border-color:'+ arrowColor +';"></span></div>';
                    tooltipster.append(arrowConstruct);
                }
                
                // position the tooltip
                tooltipster.css({'top': Math.round(myTop) + 'px', 'left': Math.round(myLeft) + 'px'});
                
                // if we had to change the position of the tooltip so it wouldn't go off screen, reset it
                if (resetPosition !== undefined) {
                    object.options.position = resetPosition;
                }
            }
        }
    };
        
    $.fn[pluginName] = function (options) {
        // better API name spacing by glebtv
        if (typeof options === 'string') {
            var $t = this;
            var newContent = arguments[1];
            
            // if we're calling a container to interact with API's of tooltips inside it - select all those tooltip origins first
            if ($t.data('plugin_tooltipster') == undefined) {
                var query = $t.find('*');
                $t = $();
                query.each(function() {
                    if ($(this).data('plugin_tooltipster') !== undefined) {
                        $t.push($(this));
                    }
                });
            }
            
            $t.each(function() {
                switch (options.toLowerCase()) {
                    case 'show':
                        $(this).data('plugin_tooltipster').showTooltip();
                        break;
    
                    case 'hide':
                        $(this).data('plugin_tooltipster').hideTooltip();
                        break;
                    
                    case 'disable':
                        $(this).addClass('tooltipster-disable');
                        break;
                    
                    case 'enable':
                        $(this).removeClass('tooltipster-disable');
                        break;
    
                    case 'destroy':
                        $(this).data('plugin_tooltipster').hideTooltip();
                        $(this).data('plugin_tooltipster', '').attr('title', $t.data('tooltipsterContent')).data('tooltipsterContent', '').data('plugin_tooltipster', '').off('mouseenter.tooltipster mouseleave.tooltipster click.tooltipster').unbind('touchstart');
                        break;
    
                    case 'update':                      
                        if ($(this).data('tooltipsterIcon') == undefined) {
                            $(this).data('tooltipsterContent', newContent);
                        }
                        
                        else {
                            var $this = $(this).data('tooltipsterIcon');
                            $this.data('tooltipsterContent', newContent);
                        }
                        
                        break;
                        
                    case 'reposition':
                        $(this).data('plugin_tooltipster').positionTooltip();
                        break;
                }
            });
            
            return this;            
        }
        
        // attach a tooltipster object to each element if it doesn't already have one
        return this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new Plugin( this, options ));
            }
            
            var thisOptions = $(this).data('plugin_tooltipster').options;
                
            if ((thisOptions.iconDesktop == true) && (!touchDevice) || ((thisOptions.iconTouch == true) && (touchDevice))) {
                var transferObject = $(this).data('plugin_tooltipster');
                $(this).next().data('plugin_tooltipster', transferObject);
            }   
        });
    };
    
    // hide tooltips on orientation change
    if (touchDevice) {
        window.addEventListener("orientationchange", function() {
            if ($('.tooltipster-base').length > 0) {
                $('.tooltipster-base').each(function() {
                    var origin = $(this).data('origin');
                    origin.data('plugin_tooltipster').hideTooltip();
                });
            }
        }, false);
    }
    
    // on window resize, reposition and open tooltips
    $(window).on('resize.tooltipster', function() {
        var origin = $('.tooltipster-base').data('origin');
                
        if ((origin !== null) && (origin !== undefined)) {
            origin.tooltipster('reposition');
        }
    });
    

})( jQuery, window, document );

/*! Magnific Popup - v0.9.7 - 2013-10-10
* http://dimsemenov.com/plugins/magnific-popup/
* Copyright (c) 2013 Dmitry Semenov; */
;(function($) {

/*>>core*/
/**
 * 
 * Magnific Popup Core JS file
 * 
 */


/**
 * Private static constants
 */
var CLOSE_EVENT = 'Close',
    BEFORE_CLOSE_EVENT = 'BeforeClose',
    AFTER_CLOSE_EVENT = 'AfterClose',
    BEFORE_APPEND_EVENT = 'BeforeAppend',
    MARKUP_PARSE_EVENT = 'MarkupParse',
    OPEN_EVENT = 'Open',
    CHANGE_EVENT = 'Change',
    NS = 'mfp',
    EVENT_NS = '.' + NS,
    READY_CLASS = 'mfp-ready',
    REMOVING_CLASS = 'mfp-removing',
    PREVENT_CLOSE_CLASS = 'mfp-prevent-close';


/**
 * Private vars 
 */
var mfp, // As we have only one instance of MagnificPopup object, we define it locally to not to use 'this'
    MagnificPopup = function(){},
    _isJQ = !!(window.jQuery),
    _prevStatus,
    _window = $(window),
    _body,
    _document,
    _prevContentType,
    _wrapClasses,
    _currPopupType;


/**
 * Private functions
 */
var _mfpOn = function(name, f) {
        mfp.ev.on(NS + name + EVENT_NS, f);
    },
    _getEl = function(className, appendTo, html, raw) {
        var el = document.createElement('div');
        el.className = 'mfp-'+className;
        if(html) {
            el.innerHTML = html;
        }
        if(!raw) {
            el = $(el);
            if(appendTo) {
                el.appendTo(appendTo);
            }
        } else if(appendTo) {
            appendTo.appendChild(el);
        }
        return el;
    },
    _mfpTrigger = function(e, data) {
        mfp.ev.triggerHandler(NS + e, data);

        if(mfp.st.callbacks) {
            // converts "mfpEventName" to "eventName" callback and triggers it if it's present
            e = e.charAt(0).toLowerCase() + e.slice(1);
            if(mfp.st.callbacks[e]) {
                mfp.st.callbacks[e].apply(mfp, $.isArray(data) ? data : [data]);
            }
        }
    },
    _setFocus = function() {
        (mfp.st.focus ? mfp.content.find(mfp.st.focus).eq(0) : mfp.wrap).focus();
    },
    _getCloseBtn = function(type) {
        if(type !== _currPopupType || !mfp.currTemplate.closeBtn) {
            mfp.currTemplate.closeBtn = $( mfp.st.closeMarkup.replace('%title%', mfp.st.tClose ) );
            _currPopupType = type;
        }
        return mfp.currTemplate.closeBtn;
    },
    // Initialize Magnific Popup only when called at least once
    _checkInstance = function() {
        if(!$.magnificPopup.instance) {
            mfp = new MagnificPopup();
            mfp.init();
            $.magnificPopup.instance = mfp;
        }
    },
    // Check to close popup or not
    // "target" is an element that was clicked
    _checkIfClose = function(target) {

        if($(target).hasClass(PREVENT_CLOSE_CLASS)) {
            return;
        }

        var closeOnContent = mfp.st.closeOnContentClick;
        var closeOnBg = mfp.st.closeOnBgClick;

        if(closeOnContent && closeOnBg) {
            return true;
        } else {

            // We close the popup if click is on close button or on preloader. Or if there is no content.
            if(!mfp.content || $(target).hasClass('mfp-close') || (mfp.preloader && target === mfp.preloader[0]) ) {
                return true;
            }

            // if click is outside the content
            if(  (target !== mfp.content[0] && !$.contains(mfp.content[0], target))  ) {
                if(closeOnBg) {
                    // last check, if the clicked element is in DOM, (in case it's removed onclick)
                    if( $.contains(document, target) ) {
                        return true;
                    }
                }
            } else if(closeOnContent) {
                return true;
            }

        }
        return false;
    },
    // CSS transition detection, http://stackoverflow.com/questions/7264899/detect-css-transitions-using-javascript-and-without-modernizr
    supportsTransitions = function() {
        var s = document.createElement('p').style, // 's' for style. better to create an element if body yet to exist
            v = ['ms','O','Moz','Webkit']; // 'v' for vendor

        if( s['transition'] !== undefined ) {
            return true; 
        }
            
        while( v.length ) {
            if( v.pop() + 'Transition' in s ) {
                return true;
            }
        }
                
        return false;
    };



/**
 * Public functions
 */
MagnificPopup.prototype = {

    constructor: MagnificPopup,

    /**
     * Initializes Magnific Popup plugin. 
     * This function is triggered only once when $.fn.magnificPopup or $.magnificPopup is executed
     */
    init: function() {
        var appVersion = navigator.appVersion;
        mfp.isIE7 = appVersion.indexOf("MSIE 7.") !== -1; 
        mfp.isIE8 = appVersion.indexOf("MSIE 8.") !== -1;
        mfp.isLowIE = mfp.isIE7 || mfp.isIE8;
        mfp.isAndroid = (/android/gi).test(appVersion);
        mfp.isIOS = (/iphone|ipad|ipod/gi).test(appVersion);
        mfp.supportsTransition = supportsTransitions();

        // We disable fixed positioned lightbox on devices that don't handle it nicely.
        // If you know a better way of detecting this - let me know.
        mfp.probablyMobile = (mfp.isAndroid || mfp.isIOS || /(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(navigator.userAgent) );
        _body = $(document.body);
        _document = $(document);

        mfp.popupsCache = {};
    },

    /**
     * Opens popup
     * @param  data [description]
     */
    open: function(data) {

        var i;

        if(data.isObj === false) { 
            // convert jQuery collection to array to avoid conflicts later
            mfp.items = data.items.toArray();

            mfp.index = 0;
            var items = data.items,
                item;
            for(i = 0; i < items.length; i++) {
                item = items[i];
                if(item.parsed) {
                    item = item.el[0];
                }
                if(item === data.el[0]) {
                    mfp.index = i;
                    break;
                }
            }
        } else {
            mfp.items = $.isArray(data.items) ? data.items : [data.items];
            mfp.index = data.index || 0;
        }

        // if popup is already opened - we just update the content
        if(mfp.isOpen) {
            mfp.updateItemHTML();
            return;
        }
        
        mfp.types = []; 
        _wrapClasses = '';
        if(data.mainEl && data.mainEl.length) {
            mfp.ev = data.mainEl.eq(0);
        } else {
            mfp.ev = _document;
        }

        if(data.key) {
            if(!mfp.popupsCache[data.key]) {
                mfp.popupsCache[data.key] = {};
            }
            mfp.currTemplate = mfp.popupsCache[data.key];
        } else {
            mfp.currTemplate = {};
        }



        mfp.st = $.extend(true, {}, $.magnificPopup.defaults, data ); 
        mfp.fixedContentPos = mfp.st.fixedContentPos === 'auto' ? !mfp.probablyMobile : mfp.st.fixedContentPos;

        if(mfp.st.modal) {
            mfp.st.closeOnContentClick = false;
            mfp.st.closeOnBgClick = false;
            mfp.st.showCloseBtn = false;
            mfp.st.enableEscapeKey = false;
        }
        

        // Building markup
        // main containers are created only once
        if(!mfp.bgOverlay) {

            // Dark overlay
            mfp.bgOverlay = _getEl('bg').on('click'+EVENT_NS, function() {
                mfp.close();
            });

            mfp.wrap = _getEl('wrap').attr('tabindex', -1).on('click'+EVENT_NS, function(e) {
                if(_checkIfClose(e.target)) {
                    mfp.close();
                }
            });

            mfp.container = _getEl('container', mfp.wrap);
        }

        mfp.contentContainer = _getEl('content');
        if(mfp.st.preloader) {
            mfp.preloader = _getEl('preloader', mfp.container, mfp.st.tLoading);
        }


        // Initializing modules
        var modules = $.magnificPopup.modules;
        for(i = 0; i < modules.length; i++) {
            var n = modules[i];
            n = n.charAt(0).toUpperCase() + n.slice(1);
            mfp['init'+n].call(mfp);
        }
        _mfpTrigger('BeforeOpen');


        if(mfp.st.showCloseBtn) {
            // Close button
            if(!mfp.st.closeBtnInside) {
                mfp.wrap.append( _getCloseBtn() );
            } else {
                _mfpOn(MARKUP_PARSE_EVENT, function(e, template, values, item) {
                    values.close_replaceWith = _getCloseBtn(item.type);
                });
                _wrapClasses += ' mfp-close-btn-in';
            }
        }

        if(mfp.st.alignTop) {
            _wrapClasses += ' mfp-align-top';
        }

    

        if(mfp.fixedContentPos) {
            mfp.wrap.css({
                overflow: mfp.st.overflowY,
                overflowX: 'hidden',
                overflowY: mfp.st.overflowY
            });
        } else {
            mfp.wrap.css({ 
                top: _window.scrollTop(),
                position: 'absolute'
            });
        }
        if( mfp.st.fixedBgPos === false || (mfp.st.fixedBgPos === 'auto' && !mfp.fixedContentPos) ) {
            mfp.bgOverlay.css({
                height: _document.height(),
                position: 'absolute'
            });
        }

        

        if(mfp.st.enableEscapeKey) {
            // Close on ESC key
            _document.on('keyup' + EVENT_NS, function(e) {
                if(e.keyCode === 27) {
                    mfp.close();
                }
            });
        }

        _window.on('resize' + EVENT_NS, function() {
            mfp.updateSize();
        });


        if(!mfp.st.closeOnContentClick) {
            _wrapClasses += ' mfp-auto-cursor';
        }
        
        if(_wrapClasses)
            mfp.wrap.addClass(_wrapClasses);


        // this triggers recalculation of layout, so we get it once to not to trigger twice
        var windowHeight = mfp.wH = _window.height();

        
        var windowStyles = {};

        if( mfp.fixedContentPos ) {
            if(mfp._hasScrollBar(windowHeight)){
                var s = mfp._getScrollbarSize();
                if(s) {
                    windowStyles.paddingRight = s;
                }
            }
        }

        if(mfp.fixedContentPos) {
            if(!mfp.isIE7) {
                windowStyles.overflow = 'hidden';
            } else {
                // ie7 double-scroll bug
                $('body, html').css('overflow', 'hidden');
            }
        }

        
        
        var classesToadd = mfp.st.mainClass;
        if(mfp.isIE7) {
            classesToadd += ' mfp-ie7';
        }
        if(classesToadd) {
            mfp._addClassToMFP( classesToadd );
        }

        // add content
        mfp.updateItemHTML();

        _mfpTrigger('BuildControls');


        // remove scrollbar, add padding e.t.c
        $('html').css(windowStyles);
        
        // add everything to DOM
        mfp.bgOverlay.add(mfp.wrap).prependTo( document.body );



        // Save last focused element
        mfp._lastFocusedEl = document.activeElement;
        
        // Wait for next cycle to allow CSS transition
        setTimeout(function() {
            
            if(mfp.content) {
                mfp._addClassToMFP(READY_CLASS);
                _setFocus();
            } else {
                // if content is not defined (not loaded e.t.c) we add class only for BG
                mfp.bgOverlay.addClass(READY_CLASS);
            }
            
            // Trap the focus in popup
            _document.on('focusin' + EVENT_NS, function (e) {
                if( e.target !== mfp.wrap[0] && !$.contains(mfp.wrap[0], e.target) ) {
                    _setFocus();
                    return false;
                }
            });

        }, 16);

        mfp.isOpen = true;
        mfp.updateSize(windowHeight);
        _mfpTrigger(OPEN_EVENT);

        return data;
    },

    /**
     * Closes the popup
     */
    close: function() {
        if(!mfp.isOpen) return;
        _mfpTrigger(BEFORE_CLOSE_EVENT);

        mfp.isOpen = false;
        // for CSS3 animation
        if(mfp.st.removalDelay && !mfp.isLowIE && mfp.supportsTransition )  {
            mfp._addClassToMFP(REMOVING_CLASS);
            setTimeout(function() {
                mfp._close();
            }, mfp.st.removalDelay);
        } else {
            mfp._close();
        }
    },

    /**
     * Helper for close() function
     */
    _close: function() {
        _mfpTrigger(CLOSE_EVENT);

        var classesToRemove = REMOVING_CLASS + ' ' + READY_CLASS + ' ';

        mfp.bgOverlay.detach();
        mfp.wrap.detach();
        mfp.container.empty();

        if(mfp.st.mainClass) {
            classesToRemove += mfp.st.mainClass + ' ';
        }

        mfp._removeClassFromMFP(classesToRemove);

        if(mfp.fixedContentPos) {
            var windowStyles = {paddingRight: ''};
            if(mfp.isIE7) {
                $('body, html').css('overflow', '');
            } else {
                windowStyles.overflow = '';
            }
            $('html').css(windowStyles);
        }
        
        _document.off('keyup' + EVENT_NS + ' focusin' + EVENT_NS);
        mfp.ev.off(EVENT_NS);

        // clean up DOM elements that aren't removed
        mfp.wrap.attr('class', 'mfp-wrap').removeAttr('style');
        mfp.bgOverlay.attr('class', 'mfp-bg');
        mfp.container.attr('class', 'mfp-container');

        // remove close button from target element
        if(mfp.st.showCloseBtn &&
        (!mfp.st.closeBtnInside || mfp.currTemplate[mfp.currItem.type] === true)) {
            if(mfp.currTemplate.closeBtn)
                mfp.currTemplate.closeBtn.detach();
        }


        if(mfp._lastFocusedEl) {
            $(mfp._lastFocusedEl).focus(); // put tab focus back
        }
        mfp.currItem = null;    
        mfp.content = null;
        mfp.currTemplate = null;
        mfp.prevHeight = 0;

        _mfpTrigger(AFTER_CLOSE_EVENT);
    },
    
    updateSize: function(winHeight) {

        if(mfp.isIOS) {
            // fixes iOS nav bars https://github.com/dimsemenov/Magnific-Popup/issues/2
            var zoomLevel = document.documentElement.clientWidth / window.innerWidth;
            var height = window.innerHeight * zoomLevel;
            mfp.wrap.css('height', height);
            mfp.wH = height;
        } else {
            mfp.wH = winHeight || _window.height();
        }
        // Fixes #84: popup incorrectly positioned with position:relative on body
        if(!mfp.fixedContentPos) {
            mfp.wrap.css('height', mfp.wH);
        }

        _mfpTrigger('Resize');

    },

    /**
     * Set content of popup based on current index
     */
    updateItemHTML: function() {
        var item = mfp.items[mfp.index];

        // Detach and perform modifications
        mfp.contentContainer.detach();

        if(mfp.content)
            mfp.content.detach();

        if(!item.parsed) {
            item = mfp.parseEl( mfp.index );
        }

        var type = item.type;   

        _mfpTrigger('BeforeChange', [mfp.currItem ? mfp.currItem.type : '', type]);
        // BeforeChange event works like so:
        // _mfpOn('BeforeChange', function(e, prevType, newType) { });
        
        mfp.currItem = item;

        

        

        if(!mfp.currTemplate[type]) {
            var markup = mfp.st[type] ? mfp.st[type].markup : false;

            // allows to modify markup
            _mfpTrigger('FirstMarkupParse', markup);

            if(markup) {
                mfp.currTemplate[type] = $(markup);
            } else {
                // if there is no markup found we just define that template is parsed
                mfp.currTemplate[type] = true;
            }
        }

        if(_prevContentType && _prevContentType !== item.type) {
            mfp.container.removeClass('mfp-'+_prevContentType+'-holder');
        }
        
        var newContent = mfp['get' + type.charAt(0).toUpperCase() + type.slice(1)](item, mfp.currTemplate[type]);
        mfp.appendContent(newContent, type);

        item.preloaded = true;

        _mfpTrigger(CHANGE_EVENT, item);
        _prevContentType = item.type;
        
        // Append container back after its content changed
        mfp.container.prepend(mfp.contentContainer);

        _mfpTrigger('AfterChange');
    },


    /**
     * Set HTML content of popup
     */
    appendContent: function(newContent, type) {
        mfp.content = newContent;
        
        if(newContent) {
            if(mfp.st.showCloseBtn && mfp.st.closeBtnInside &&
                mfp.currTemplate[type] === true) {
                // if there is no markup, we just append close button element inside
                if(!mfp.content.find('.mfp-close').length) {
                    mfp.content.append(_getCloseBtn());
                }
            } else {
                mfp.content = newContent;
            }
        } else {
            mfp.content = '';
        }

        _mfpTrigger(BEFORE_APPEND_EVENT);
        mfp.container.addClass('mfp-'+type+'-holder');

        mfp.contentContainer.append(mfp.content);
    },



    
    /**
     * Creates Magnific Popup data object based on given data
     * @param  {int} index Index of item to parse
     */
    parseEl: function(index) {
        var item = mfp.items[index],
            type = item.type;

        if(item.tagName) {
            item = { el: $(item) };
        } else {
            item = { data: item, src: item.src };
        }

        if(item.el) {
            var types = mfp.types;

            // check for 'mfp-TYPE' class
            for(var i = 0; i < types.length; i++) {
                if( item.el.hasClass('mfp-'+types[i]) ) {
                    type = types[i];
                    break;
                }
            }

            item.src = item.el.attr('data-mfp-src');
            if(!item.src) {
                item.src = item.el.attr('href');
            }
        }

        item.type = type || mfp.st.type || 'inline';
        item.index = index;
        item.parsed = true;
        mfp.items[index] = item;
        _mfpTrigger('ElementParse', item);

        return mfp.items[index];
    },


    /**
     * Initializes single popup or a group of popups
     */
    addGroup: function(el, options) {
        var eHandler = function(e) {
            e.mfpEl = this;
            mfp._openClick(e, el, options);
        };

        if(!options) {
            options = {};
        } 

        var eName = 'click.magnificPopup';
        options.mainEl = el;
        
        if(options.items) {
            options.isObj = true;
            el.off(eName).on(eName, eHandler);
        } else {
            options.isObj = false;
            if(options.delegate) {
                el.off(eName).on(eName, options.delegate , eHandler);
            } else {
                options.items = el;
                el.off(eName).on(eName, eHandler);
            }
        }
    },
    _openClick: function(e, el, options) {
        var midClick = options.midClick !== undefined ? options.midClick : $.magnificPopup.defaults.midClick;


        if(!midClick && ( e.which === 2 || e.ctrlKey || e.metaKey ) ) {
            return;
        }

        var disableOn = options.disableOn !== undefined ? options.disableOn : $.magnificPopup.defaults.disableOn;

        if(disableOn) {
            if($.isFunction(disableOn)) {
                if( !disableOn.call(mfp) ) {
                    return true;
                }
            } else { // else it's number
                if( _window.width() < disableOn ) {
                    return true;
                }
            }
        }
        
        if(e.type) {
            e.preventDefault();

            // This will prevent popup from closing if element is inside and popup is already opened
            if(mfp.isOpen) {
                e.stopPropagation();
            }
        }
            

        options.el = $(e.mfpEl);
        if(options.delegate) {
            options.items = el.find(options.delegate);
        }
        mfp.open(options);
    },


    /**
     * Updates text on preloader
     */
    updateStatus: function(status, text) {

        if(mfp.preloader) {
            if(_prevStatus !== status) {
                mfp.container.removeClass('mfp-s-'+_prevStatus);
            }

            if(!text && status === 'loading') {
                text = mfp.st.tLoading;
            }

            var data = {
                status: status,
                text: text
            };
            // allows to modify status
            _mfpTrigger('UpdateStatus', data);

            status = data.status;
            text = data.text;

            mfp.preloader.html(text);

            mfp.preloader.find('a').on('click', function(e) {
                e.stopImmediatePropagation();
            });

            mfp.container.addClass('mfp-s-'+status);
            _prevStatus = status;
        }
    },


    /*
        "Private" helpers that aren't private at all
     */
    _addClassToMFP: function(cName) {
        mfp.bgOverlay.addClass(cName);
        mfp.wrap.addClass(cName);
    },
    _removeClassFromMFP: function(cName) {
        this.bgOverlay.removeClass(cName);
        mfp.wrap.removeClass(cName);
    },
    _hasScrollBar: function(winHeight) {
        return (  (mfp.isIE7 ? _document.height() : document.body.scrollHeight) > (winHeight || _window.height()) );
    },
    _parseMarkup: function(template, values, item) {
        var arr;
        if(item.data) {
            values = $.extend(item.data, values);
        }
        _mfpTrigger(MARKUP_PARSE_EVENT, [template, values, item] );

        $.each(values, function(key, value) {
            if(value === undefined || value === false) {
                return true;
            }
            arr = key.split('_');
            if(arr.length > 1) {
                var el = template.find(EVENT_NS + '-'+arr[0]);

                if(el.length > 0) {
                    var attr = arr[1];
                    if(attr === 'replaceWith') {
                        if(el[0] !== value[0]) {
                            el.replaceWith(value);
                        }
                    } else if(attr === 'img') {
                        if(el.is('img')) {
                            el.attr('src', value);
                        } else {
                            el.replaceWith( '<img src="'+value+'" class="' + el.attr('class') + '" />' );
                        }
                    } else {
                        el.attr(arr[1], value);
                    }
                }

            } else {
                template.find(EVENT_NS + '-'+key).html(value);
            }
        });
    },

    _getScrollbarSize: function() {
        // thx David
        if(mfp.scrollbarSize === undefined) {
            var scrollDiv = document.createElement("div");
            scrollDiv.id = "mfp-sbm";
            scrollDiv.style.cssText = 'width: 99px; height: 99px; overflow: scroll; position: absolute; top: -9999px;';
            document.body.appendChild(scrollDiv);
            mfp.scrollbarSize = scrollDiv.offsetWidth - scrollDiv.clientWidth;
            document.body.removeChild(scrollDiv);
        }
        return mfp.scrollbarSize;
    }

}; /* MagnificPopup core prototype end */




/**
 * Public static functions
 */
$.magnificPopup = {
    instance: null,
    proto: MagnificPopup.prototype,
    modules: [],

    open: function(options, index) {
        _checkInstance();   

        if(!options) {
            options = {};
        } else {
            options = $.extend(true, {}, options);
        }
            

        options.isObj = true;
        options.index = index || 0;
        return this.instance.open(options);
    },

    close: function() {
        return $.magnificPopup.instance && $.magnificPopup.instance.close();
    },

    registerModule: function(name, module) {
        if(module.options) {
            $.magnificPopup.defaults[name] = module.options;
        }
        $.extend(this.proto, module.proto);         
        this.modules.push(name);
    },

    defaults: {   

        // Info about options is in docs:
        // http://dimsemenov.com/plugins/magnific-popup/documentation.html#options
        
        disableOn: 0,   

        key: null,

        midClick: false,

        mainClass: '',

        preloader: true,

        focus: '', // CSS selector of input to focus after popup is opened
        
        closeOnContentClick: false,

        closeOnBgClick: true,

        closeBtnInside: true, 

        showCloseBtn: true,

        enableEscapeKey: true,

        modal: false,

        alignTop: false,
    
        removalDelay: 0,
        
        fixedContentPos: 'auto', 
    
        fixedBgPos: 'auto',

        overflowY: 'auto',

        closeMarkup: '<button title="%title%" type="button" class="mfp-close">&times;</button>',

        tClose: 'Close (Esc)',

        tLoading: 'Loading...'

    }
};



$.fn.magnificPopup = function(options) {
    _checkInstance();

    var jqEl = $(this);

    // We call some API method of first param is a string
    if (typeof options === "string" ) {

        if(options === 'open') {
            var items,
                itemOpts = _isJQ ? jqEl.data('magnificPopup') : jqEl[0].magnificPopup,
                index = parseInt(arguments[1], 10) || 0;

            if(itemOpts.items) {
                items = itemOpts.items[index];
            } else {
                items = jqEl;
                if(itemOpts.delegate) {
                    items = items.find(itemOpts.delegate);
                }
                items = items.eq( index );
            }
            mfp._openClick({mfpEl:items}, jqEl, itemOpts);
        } else {
            if(mfp.isOpen)
                mfp[options].apply(mfp, Array.prototype.slice.call(arguments, 1));
        }

    } else {
        // clone options obj
        options = $.extend(true, {}, options);
        
        /*
         * As Zepto doesn't support .data() method for objects 
         * and it works only in normal browsers
         * we assign "options" object directly to the DOM element. FTW!
         */
        if(_isJQ) {
            jqEl.data('magnificPopup', options);
        } else {
            jqEl[0].magnificPopup = options;
        }

        mfp.addGroup(jqEl, options);

    }
    return jqEl;
};


//Quick benchmark
/*
var start = performance.now(),
    i,
    rounds = 1000;

for(i = 0; i < rounds; i++) {

}
console.log('Test #1:', performance.now() - start);

start = performance.now();
for(i = 0; i < rounds; i++) {

}
console.log('Test #2:', performance.now() - start);
*/


/*>>core*/

/*>>inline*/

var INLINE_NS = 'inline',
    _hiddenClass,
    _inlinePlaceholder, 
    _lastInlineElement,
    _putInlineElementsBack = function() {
        if(_lastInlineElement) {
            _inlinePlaceholder.after( _lastInlineElement.addClass(_hiddenClass) ).detach();
            _lastInlineElement = null;
        }
    };

$.magnificPopup.registerModule(INLINE_NS, {
    options: {
        hiddenClass: 'hide', // will be appended with `mfp-` prefix
        markup: '',
        tNotFound: 'Content not found'
    },
    proto: {

        initInline: function() {
            mfp.types.push(INLINE_NS);

            _mfpOn(CLOSE_EVENT+'.'+INLINE_NS, function() {
                _putInlineElementsBack();
            });
        },

        getInline: function(item, template) {

            _putInlineElementsBack();

            if(item.src) {
                var inlineSt = mfp.st.inline,
                    el = $(item.src);

                if(el.length) {

                    // If target element has parent - we replace it with placeholder and put it back after popup is closed
                    var parent = el[0].parentNode;
                    if(parent && parent.tagName) {
                        if(!_inlinePlaceholder) {
                            _hiddenClass = inlineSt.hiddenClass;
                            _inlinePlaceholder = _getEl(_hiddenClass);
                            _hiddenClass = 'mfp-'+_hiddenClass;
                        }
                        // replace target inline element with placeholder
                        _lastInlineElement = el.after(_inlinePlaceholder).detach().removeClass(_hiddenClass);
                    }

                    mfp.updateStatus('ready');
                } else {
                    mfp.updateStatus('error', inlineSt.tNotFound);
                    el = $('<div>');
                }

                item.inlineElement = el;
                return el;
            }

            mfp.updateStatus('ready');
            mfp._parseMarkup(template, {}, item);
            return template;
        }
    }
});

/*>>inline*/

/*>>ajax*/
var AJAX_NS = 'ajax',
    _ajaxCur,
    _removeAjaxCursor = function() {
        if(_ajaxCur) {
            _body.removeClass(_ajaxCur);
        }
    },
    _destroyAjaxRequest = function() {
        _removeAjaxCursor();
        if(mfp.req) {
            mfp.req.abort();
        }
    };

$.magnificPopup.registerModule(AJAX_NS, {

    options: {
        settings: null,
        cursor: 'mfp-ajax-cur',
        tError: '<a href="%url%">The content</a> could not be loaded.'
    },

    proto: {
        initAjax: function() {
            mfp.types.push(AJAX_NS);
            _ajaxCur = mfp.st.ajax.cursor;

            _mfpOn(CLOSE_EVENT+'.'+AJAX_NS, _destroyAjaxRequest);
            _mfpOn('BeforeChange.' + AJAX_NS, _destroyAjaxRequest);
        },
        getAjax: function(item) {

            if(_ajaxCur)
                _body.addClass(_ajaxCur);

            mfp.updateStatus('loading');

            var opts = $.extend({
                url: item.src,
                success: function(data, textStatus, jqXHR) {
                    var temp = {
                        data:data,
                        xhr:jqXHR
                    };

                    _mfpTrigger('ParseAjax', temp);

                    mfp.appendContent( $(temp.data), AJAX_NS );

                    item.finished = true;

                    _removeAjaxCursor();

                    _setFocus();

                    setTimeout(function() {
                        mfp.wrap.addClass(READY_CLASS);
                    }, 16);

                    mfp.updateStatus('ready');

                    _mfpTrigger('AjaxContentAdded');
                },
                error: function() {
                    _removeAjaxCursor();
                    item.finished = item.loadError = true;
                    mfp.updateStatus('error', mfp.st.ajax.tError.replace('%url%', item.src));
                }
            }, mfp.st.ajax.settings);

            mfp.req = $.ajax(opts);

            return '';
        }
    }
});





    

/*>>ajax*/

/*>>image*/
var _imgInterval,
    _getTitle = function(item) {
        if(item.data && item.data.title !== undefined) 
            return item.data.title;

        var src = mfp.st.image.titleSrc;

        if(src) {
            if($.isFunction(src)) {
                return src.call(mfp, item);
            } else if(item.el) {
                return item.el.attr(src) || '';
            }
        }
        return '';
    };

$.magnificPopup.registerModule('image', {

    options: {
        markup: '<div class="mfp-figure">'+
                    '<div class="mfp-close"></div>'+
                    '<div class="mfp-img"></div>'+
                    '<div class="mfp-bottom-bar">'+
                        '<div class="mfp-title"></div>'+
                        '<div class="mfp-counter"></div>'+
                    '</div>'+
                '</div>',
        cursor: 'mfp-zoom-out-cur',
        titleSrc: 'title', 
        verticalFit: true,
        tError: '<a href="%url%">The image</a> could not be loaded.'
    },

    proto: {
        initImage: function() {
            var imgSt = mfp.st.image,
                ns = '.image';

            mfp.types.push('image');

            _mfpOn(OPEN_EVENT+ns, function() {
                if(mfp.currItem.type === 'image' && imgSt.cursor) {
                    _body.addClass(imgSt.cursor);
                }
            });

            _mfpOn(CLOSE_EVENT+ns, function() {
                if(imgSt.cursor) {
                    _body.removeClass(imgSt.cursor);
                }
                _window.off('resize' + EVENT_NS);
            });

            _mfpOn('Resize'+ns, mfp.resizeImage);
            if(mfp.isLowIE) {
                _mfpOn('AfterChange', mfp.resizeImage);
            }
        },
        resizeImage: function() {
            var item = mfp.currItem;
            if(!item || !item.img) return;

            if(mfp.st.image.verticalFit) {
                var decr = 0;
                // fix box-sizing in ie7/8
                if(mfp.isLowIE) {
                    decr = parseInt(item.img.css('padding-top'), 10) + parseInt(item.img.css('padding-bottom'),10);
                }
                item.img.css('max-height', mfp.wH-decr);
            }
        },
        _onImageHasSize: function(item) {
            if(item.img) {
                
                item.hasSize = true;

                if(_imgInterval) {
                    clearInterval(_imgInterval);
                }
                
                item.isCheckingImgSize = false;

                _mfpTrigger('ImageHasSize', item);

                if(item.imgHidden) {
                    if(mfp.content)
                        mfp.content.removeClass('mfp-loading');
                    
                    item.imgHidden = false;
                }

            }
        },

        /**
         * Function that loops until the image has size to display elements that rely on it asap
         */
        findImageSize: function(item) {

            var counter = 0,
                img = item.img[0],
                mfpSetInterval = function(delay) {

                    if(_imgInterval) {
                        clearInterval(_imgInterval);
                    }
                    // decelerating interval that checks for size of an image
                    _imgInterval = setInterval(function() {
                        if(img.naturalWidth > 0) {
                            mfp._onImageHasSize(item);
                            return;
                        }

                        if(counter > 200) {
                            clearInterval(_imgInterval);
                        }

                        counter++;
                        if(counter === 3) {
                            mfpSetInterval(10);
                        } else if(counter === 40) {
                            mfpSetInterval(50);
                        } else if(counter === 100) {
                            mfpSetInterval(500);
                        }
                    }, delay);
                };

            mfpSetInterval(1);
        },

        getImage: function(item, template) {

            var guard = 0,

                // image load complete handler
                onLoadComplete = function() {
                    if(item) {
                        if (item.img[0].complete) {
                            item.img.off('.mfploader');
                            
                            if(item === mfp.currItem){
                                mfp._onImageHasSize(item);

                                mfp.updateStatus('ready');
                            }

                            item.hasSize = true;
                            item.loaded = true;

                            _mfpTrigger('ImageLoadComplete');
                            
                        }
                        else {
                            // if image complete check fails 200 times (20 sec), we assume that there was an error.
                            guard++;
                            if(guard < 200) {
                                setTimeout(onLoadComplete,100);
                            } else {
                                onLoadError();
                            }
                        }
                    }
                },

                // image error handler
                onLoadError = function() {
                    if(item) {
                        item.img.off('.mfploader');
                        if(item === mfp.currItem){
                            mfp._onImageHasSize(item);
                            mfp.updateStatus('error', imgSt.tError.replace('%url%', item.src) );
                        }

                        item.hasSize = true;
                        item.loaded = true;
                        item.loadError = true;
                    }
                },
                imgSt = mfp.st.image;


            var el = template.find('.mfp-img');
            if(el.length) {
                var img = document.createElement('img');
                img.className = 'mfp-img';
                item.img = $(img).on('load.mfploader', onLoadComplete).on('error.mfploader', onLoadError);
                img.src = item.src;

                // without clone() "error" event is not firing when IMG is replaced by new IMG
                // TODO: find a way to avoid such cloning
                if(el.is('img')) {
                    item.img = item.img.clone();
                }
                if(item.img[0].naturalWidth > 0) {
                    item.hasSize = true;
                }
            }

            mfp._parseMarkup(template, {
                title: _getTitle(item),
                img_replaceWith: item.img
            }, item);

            mfp.resizeImage();

            if(item.hasSize) {
                if(_imgInterval) clearInterval(_imgInterval);

                if(item.loadError) {
                    template.addClass('mfp-loading');
                    mfp.updateStatus('error', imgSt.tError.replace('%url%', item.src) );
                } else {
                    template.removeClass('mfp-loading');
                    mfp.updateStatus('ready');
                }
                return template;
            }

            mfp.updateStatus('loading');
            item.loading = true;

            if(!item.hasSize) {
                item.imgHidden = true;
                template.addClass('mfp-loading');
                mfp.findImageSize(item);
            } 

            return template;
        }
    }
});



/*>>image*/

/*>>zoom*/
var hasMozTransform,
    getHasMozTransform = function() {
        if(hasMozTransform === undefined) {
            hasMozTransform = document.createElement('p').style.MozTransform !== undefined;
        }
        return hasMozTransform;     
    };

$.magnificPopup.registerModule('zoom', {

    options: {
        enabled: false,
        easing: 'ease-in-out',
        duration: 300,
        opener: function(element) {
            return element.is('img') ? element : element.find('img');
        }
    },

    proto: {

        initZoom: function() {
            var zoomSt = mfp.st.zoom,
                ns = '.zoom',
                image;
                
            if(!zoomSt.enabled || !mfp.supportsTransition) {
                return;
            }

            var duration = zoomSt.duration,
                getElToAnimate = function(image) {
                    var newImg = image.clone().removeAttr('style').removeAttr('class').addClass('mfp-animated-image'),
                        transition = 'all '+(zoomSt.duration/1000)+'s ' + zoomSt.easing,
                        cssObj = {
                            position: 'fixed',
                            zIndex: 9999,
                            left: 0,
                            top: 0,
                            '-webkit-backface-visibility': 'hidden'
                        },
                        t = 'transition';

                    cssObj['-webkit-'+t] = cssObj['-moz-'+t] = cssObj['-o-'+t] = cssObj[t] = transition;

                    newImg.css(cssObj);
                    return newImg;
                },
                showMainContent = function() {
                    mfp.content.css('visibility', 'visible');
                },
                openTimeout,
                animatedImg;

            _mfpOn('BuildControls'+ns, function() {
                if(mfp._allowZoom()) {

                    clearTimeout(openTimeout);
                    mfp.content.css('visibility', 'hidden');

                    // Basically, all code below does is clones existing image, puts in on top of the current one and animated it
                    
                    image = mfp._getItemToZoom();

                    if(!image) {
                        showMainContent();
                        return;
                    }

                    animatedImg = getElToAnimate(image); 
                    
                    animatedImg.css( mfp._getOffset() );

                    mfp.wrap.append(animatedImg);

                    openTimeout = setTimeout(function() {
                        animatedImg.css( mfp._getOffset( true ) );
                        openTimeout = setTimeout(function() {

                            showMainContent();

                            setTimeout(function() {
                                animatedImg.remove();
                                image = animatedImg = null;
                                _mfpTrigger('ZoomAnimationEnded');
                            }, 16); // avoid blink when switching images 

                        }, duration); // this timeout equals animation duration

                    }, 16); // by adding this timeout we avoid short glitch at the beginning of animation


                    // Lots of timeouts...
                }
            });
            _mfpOn(BEFORE_CLOSE_EVENT+ns, function() {
                if(mfp._allowZoom()) {

                    clearTimeout(openTimeout);

                    mfp.st.removalDelay = duration;

                    if(!image) {
                        image = mfp._getItemToZoom();
                        if(!image) {
                            return;
                        }
                        animatedImg = getElToAnimate(image);
                    }
                    
                    
                    animatedImg.css( mfp._getOffset(true) );
                    mfp.wrap.append(animatedImg);
                    mfp.content.css('visibility', 'hidden');
                    
                    setTimeout(function() {
                        animatedImg.css( mfp._getOffset() );
                    }, 16);
                }

            });

            _mfpOn(CLOSE_EVENT+ns, function() {
                if(mfp._allowZoom()) {
                    showMainContent();
                    if(animatedImg) {
                        animatedImg.remove();
                    }
                    image = null;
                }   
            });
        },

        _allowZoom: function() {
            return mfp.currItem.type === 'image';
        },

        _getItemToZoom: function() {
            if(mfp.currItem.hasSize) {
                return mfp.currItem.img;
            } else {
                return false;
            }
        },

        // Get element postion relative to viewport
        _getOffset: function(isLarge) {
            var el;
            if(isLarge) {
                el = mfp.currItem.img;
            } else {
                el = mfp.st.zoom.opener(mfp.currItem.el || mfp.currItem);
            }

            var offset = el.offset();
            var paddingTop = parseInt(el.css('padding-top'),10);
            var paddingBottom = parseInt(el.css('padding-bottom'),10);
            offset.top -= ( $(window).scrollTop() - paddingTop );


            /*
            
            Animating left + top + width/height looks glitchy in Firefox, but perfect in Chrome. And vice-versa.

             */
            var obj = {
                width: el.width(),
                // fix Zepto height+padding issue
                height: (_isJQ ? el.innerHeight() : el[0].offsetHeight) - paddingBottom - paddingTop
            };

            // I hate to do this, but there is no another option
            if( getHasMozTransform() ) {
                obj['-moz-transform'] = obj['transform'] = 'translate(' + offset.left + 'px,' + offset.top + 'px)';
            } else {
                obj.left = offset.left;
                obj.top = offset.top;
            }
            return obj;
        }

    }
});



/*>>zoom*/

/*>>iframe*/

var IFRAME_NS = 'iframe',
    _emptyPage = '//about:blank',
    
    _fixIframeBugs = function(isShowing) {
        if(mfp.currTemplate[IFRAME_NS]) {
            var el = mfp.currTemplate[IFRAME_NS].find('iframe');
            if(el.length) { 
                // reset src after the popup is closed to avoid "video keeps playing after popup is closed" bug
                if(!isShowing) {
                    el[0].src = _emptyPage;
                }

                // IE8 black screen bug fix
                if(mfp.isIE8) {
                    el.css('display', isShowing ? 'block' : 'none');
                }
            }
        }
    };

$.magnificPopup.registerModule(IFRAME_NS, {

    options: {
        markup: '<div class="mfp-iframe-scaler">'+
                    '<div class="mfp-close"></div>'+
                    '<iframe class="mfp-iframe" src="//about:blank" frameborder="0" allowfullscreen></iframe>'+
                '</div>',

        srcAction: 'iframe_src',

        // we don't care and support only one default type of URL by default
        patterns: {
            youtube: {
                index: 'youtube.com', 
                id: 'v=', 
                src: '//www.youtube.com/embed/%id%?autoplay=1'
            },
            vimeo: {
                index: 'vimeo.com/',
                id: '/',
                src: '//player.vimeo.com/video/%id%?autoplay=1'
            },
            gmaps: {
                index: '//maps.google.',
                src: '%id%&output=embed'
            }
        }
    },

    proto: {
        initIframe: function() {
            mfp.types.push(IFRAME_NS);

            _mfpOn('BeforeChange', function(e, prevType, newType) {
                if(prevType !== newType) {
                    if(prevType === IFRAME_NS) {
                        _fixIframeBugs(); // iframe if removed
                    } else if(newType === IFRAME_NS) {
                        _fixIframeBugs(true); // iframe is showing
                    } 
                }// else {
                    // iframe source is switched, don't do anything
                //}
            });

            _mfpOn(CLOSE_EVENT + '.' + IFRAME_NS, function() {
                _fixIframeBugs();
            });
        },

        getIframe: function(item, template) {
            var embedSrc = item.src;
            var iframeSt = mfp.st.iframe;
                
            $.each(iframeSt.patterns, function() {
                if(embedSrc.indexOf( this.index ) > -1) {
                    if(this.id) {
                        if(typeof this.id === 'string') {
                            embedSrc = embedSrc.substr(embedSrc.lastIndexOf(this.id)+this.id.length, embedSrc.length);
                        } else {
                            embedSrc = this.id.call( this, embedSrc );
                        }
                    }
                    embedSrc = this.src.replace('%id%', embedSrc );
                    return false; // break;
                }
            });
            
            var dataObj = {};
            if(iframeSt.srcAction) {
                dataObj[iframeSt.srcAction] = embedSrc;
            }
            mfp._parseMarkup(template, dataObj, item);

            mfp.updateStatus('ready');

            return template;
        }
    }
});



/*>>iframe*/

/*>>gallery*/
/**
 * Get looped index depending on number of slides
 */
var _getLoopedId = function(index) {
        var numSlides = mfp.items.length;
        if(index > numSlides - 1) {
            return index - numSlides;
        } else  if(index < 0) {
            return numSlides + index;
        }
        return index;
    },
    _replaceCurrTotal = function(text, curr, total) {
        return text.replace(/%curr%/gi, curr + 1).replace(/%total%/gi, total);
    };

$.magnificPopup.registerModule('gallery', {

    options: {
        enabled: false,
        arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
        preload: [0,2],
        navigateByImgClick: true,
        arrows: true,

        tPrev: 'Previous (Left arrow key)',
        tNext: 'Next (Right arrow key)',
        tCounter: '%curr% of %total%'
    },

    proto: {
        initGallery: function() {

            var gSt = mfp.st.gallery,
                ns = '.mfp-gallery',
                supportsFastClick = Boolean($.fn.mfpFastClick);

            mfp.direction = true; // true - next, false - prev
            
            if(!gSt || !gSt.enabled ) return false;

            _wrapClasses += ' mfp-gallery';

            _mfpOn(OPEN_EVENT+ns, function() {

                if(gSt.navigateByImgClick) {
                    mfp.wrap.on('click'+ns, '.mfp-img', function() {
                        if(mfp.items.length > 1) {
                            mfp.next();
                            return false;
                        }
                    });
                }

                _document.on('keydown'+ns, function(e) {
                    if (e.keyCode === 37) {
                        mfp.prev();
                    } else if (e.keyCode === 39) {
                        mfp.next();
                    }
                });
            });

            _mfpOn('UpdateStatus'+ns, function(e, data) {
                if(data.text) {
                    data.text = _replaceCurrTotal(data.text, mfp.currItem.index, mfp.items.length);
                }
            });

            _mfpOn(MARKUP_PARSE_EVENT+ns, function(e, element, values, item) {
                var l = mfp.items.length;
                values.counter = l > 1 ? _replaceCurrTotal(gSt.tCounter, item.index, l) : '';
            });

            _mfpOn('BuildControls' + ns, function() {
                if(mfp.items.length > 1 && gSt.arrows && !mfp.arrowLeft) {
                    var markup = gSt.arrowMarkup,
                        arrowLeft = mfp.arrowLeft = $( markup.replace(/%title%/gi, gSt.tPrev).replace(/%dir%/gi, 'left') ).addClass(PREVENT_CLOSE_CLASS),           
                        arrowRight = mfp.arrowRight = $( markup.replace(/%title%/gi, gSt.tNext).replace(/%dir%/gi, 'right') ).addClass(PREVENT_CLOSE_CLASS);

                    var eName = supportsFastClick ? 'mfpFastClick' : 'click';
                    arrowLeft[eName](function() {
                        mfp.prev();
                    });         
                    arrowRight[eName](function() {
                        mfp.next();
                    }); 

                    // Polyfill for :before and :after (adds elements with classes mfp-a and mfp-b)
                    if(mfp.isIE7) {
                        _getEl('b', arrowLeft[0], false, true);
                        _getEl('a', arrowLeft[0], false, true);
                        _getEl('b', arrowRight[0], false, true);
                        _getEl('a', arrowRight[0], false, true);
                    }

                    mfp.container.append(arrowLeft.add(arrowRight));
                }
            });

            _mfpOn(CHANGE_EVENT+ns, function() {
                if(mfp._preloadTimeout) clearTimeout(mfp._preloadTimeout);

                mfp._preloadTimeout = setTimeout(function() {
                    mfp.preloadNearbyImages();
                    mfp._preloadTimeout = null;
                }, 16);     
            });


            _mfpOn(CLOSE_EVENT+ns, function() {
                _document.off(ns);
                mfp.wrap.off('click'+ns);
            
                if(mfp.arrowLeft && supportsFastClick) {
                    mfp.arrowLeft.add(mfp.arrowRight).destroyMfpFastClick();
                }
                mfp.arrowRight = mfp.arrowLeft = null;
            });

        }, 
        next: function() {
            mfp.direction = true;
            mfp.index = _getLoopedId(mfp.index + 1);
            mfp.updateItemHTML();
        },
        prev: function() {
            mfp.direction = false;
            mfp.index = _getLoopedId(mfp.index - 1);
            mfp.updateItemHTML();
        },
        goTo: function(newIndex) {
            mfp.direction = (newIndex >= mfp.index);
            mfp.index = newIndex;
            mfp.updateItemHTML();
        },
        preloadNearbyImages: function() {
            var p = mfp.st.gallery.preload,
                preloadBefore = Math.min(p[0], mfp.items.length),
                preloadAfter = Math.min(p[1], mfp.items.length),
                i;

            for(i = 1; i <= (mfp.direction ? preloadAfter : preloadBefore); i++) {
                mfp._preloadItem(mfp.index+i);
            }
            for(i = 1; i <= (mfp.direction ? preloadBefore : preloadAfter); i++) {
                mfp._preloadItem(mfp.index-i);
            }
        },
        _preloadItem: function(index) {
            index = _getLoopedId(index);

            if(mfp.items[index].preloaded) {
                return;
            }

            var item = mfp.items[index];
            if(!item.parsed) {
                item = mfp.parseEl( index );
            }

            _mfpTrigger('LazyLoad', item);

            if(item.type === 'image') {
                item.img = $('<img class="mfp-img" />').on('load.mfploader', function() {
                    item.hasSize = true;
                }).on('error.mfploader', function() {
                    item.hasSize = true;
                    item.loadError = true;
                    _mfpTrigger('LazyLoadError', item);
                }).attr('src', item.src);
            }


            item.preloaded = true;
        }
    }
});

/*
Touch Support that might be implemented some day

addSwipeGesture: function() {
    var startX,
        moved,
        multipleTouches;

        return;

    var namespace = '.mfp',
        addEventNames = function(pref, down, move, up, cancel) {
            mfp._tStart = pref + down + namespace;
            mfp._tMove = pref + move + namespace;
            mfp._tEnd = pref + up + namespace;
            mfp._tCancel = pref + cancel + namespace;
        };

    if(window.navigator.msPointerEnabled) {
        addEventNames('MSPointer', 'Down', 'Move', 'Up', 'Cancel');
    } else if('ontouchstart' in window) {
        addEventNames('touch', 'start', 'move', 'end', 'cancel');
    } else {
        return;
    }
    _window.on(mfp._tStart, function(e) {
        var oE = e.originalEvent;
        multipleTouches = moved = false;
        startX = oE.pageX || oE.changedTouches[0].pageX;
    }).on(mfp._tMove, function(e) {
        if(e.originalEvent.touches.length > 1) {
            multipleTouches = e.originalEvent.touches.length;
        } else {
            //e.preventDefault();
            moved = true;
        }
    }).on(mfp._tEnd + ' ' + mfp._tCancel, function(e) {
        if(moved && !multipleTouches) {
            var oE = e.originalEvent,
                diff = startX - (oE.pageX || oE.changedTouches[0].pageX);

            if(diff > 20) {
                mfp.next();
            } else if(diff < -20) {
                mfp.prev();
            }
        }
    });
},
*/


/*>>gallery*/

/*>>retina*/

var RETINA_NS = 'retina';

$.magnificPopup.registerModule(RETINA_NS, {
    options: {
        replaceSrc: function(item) {
            return item.src.replace(/\.\w+$/, function(m) { return '@2x' + m; });
        },
        ratio: 1 // Function or number.  Set to 1 to disable.
    },
    proto: {
        initRetina: function() {
            if(window.devicePixelRatio > 1) {

                var st = mfp.st.retina,
                    ratio = st.ratio;

                ratio = !isNaN(ratio) ? ratio : ratio();

                if(ratio > 1) {
                    _mfpOn('ImageHasSize' + '.' + RETINA_NS, function(e, item) {
                        item.img.css({
                            'max-width': item.img[0].naturalWidth / ratio,
                            'width': '100%'
                        });
                    });
                    _mfpOn('ElementParse' + '.' + RETINA_NS, function(e, item) {
                        item.src = st.replaceSrc(item, ratio);
                    });
                }
            }

        }
    }
});

/*>>retina*/

/*>>fastclick*/
/**
 * FastClick event implementation. (removes 300ms delay on touch devices)
 * Based on https://developers.google.com/mobile/articles/fast_buttons
 *
 * You may use it outside the Magnific Popup by calling just:
 *
 * $('.your-el').mfpFastClick(function() {
 *     console.log('Clicked!');
 * });
 *
 * To unbind:
 * $('.your-el').destroyMfpFastClick();
 * 
 * 
 * Note that it's a very basic and simple implementation, it blocks ghost click on the same element where it was bound.
 * If you need something more advanced, use plugin by FT Labs https://github.com/ftlabs/fastclick
 * 
 */

(function() {
    var ghostClickDelay = 1000,
        supportsTouch = 'ontouchstart' in window,
        unbindTouchMove = function() {
            _window.off('touchmove'+ns+' touchend'+ns);
        },
        eName = 'mfpFastClick',
        ns = '.'+eName;


    // As Zepto.js doesn't have an easy way to add custom events (like jQuery), so we implement it in this way
    $.fn.mfpFastClick = function(callback) {

        return $(this).each(function() {

            var elem = $(this),
                lock;

            if( supportsTouch ) {

                var timeout,
                    startX,
                    startY,
                    pointerMoved,
                    point,
                    numPointers;

                elem.on('touchstart' + ns, function(e) {
                    pointerMoved = false;
                    numPointers = 1;

                    point = e.originalEvent ? e.originalEvent.touches[0] : e.touches[0];
                    startX = point.clientX;
                    startY = point.clientY;

                    _window.on('touchmove'+ns, function(e) {
                        point = e.originalEvent ? e.originalEvent.touches : e.touches;
                        numPointers = point.length;
                        point = point[0];
                        if (Math.abs(point.clientX - startX) > 10 ||
                            Math.abs(point.clientY - startY) > 10) {
                            pointerMoved = true;
                            unbindTouchMove();
                        }
                    }).on('touchend'+ns, function(e) {
                        unbindTouchMove();
                        if(pointerMoved || numPointers > 1) {
                            return;
                        }
                        lock = true;
                        e.preventDefault();
                        clearTimeout(timeout);
                        timeout = setTimeout(function() {
                            lock = false;
                        }, ghostClickDelay);
                        callback();
                    });
                });

            }

            elem.on('click' + ns, function() {
                if(!lock) {
                    callback();
                }
            });
        });
    };

    $.fn.destroyMfpFastClick = function() {
        $(this).off('touchstart' + ns + ' click' + ns);
        if(supportsTouch) _window.off('touchmove'+ns+' touchend'+ns);
    };
})();

/*>>fastclick*/
})(window.jQuery || window.Zepto);