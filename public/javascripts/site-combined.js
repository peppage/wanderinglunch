(function(e,t,n,r){function u(t,n){this.element=t;this.options=e.extend({},o,n);this._defaults=o;this._name=s;this.init()}function a(){return!!("ontouchstart"in t)}function f(){var e=n.body||n.documentElement;var t=e.style;var r="transition";if(typeof t[r]=="string"){return true}v=["Moz","Webkit","Khtml","O","ms"],r=r.charAt(0).toUpperCase()+r.substr(1);for(var i=0;i<v.length;i++){if(typeof t[v[i]+r]=="string"){return true}}return false}var s="tooltipster",o={animation:"fade",arrow:true,arrowColor:"",content:"",delay:200,fixedWidth:0,maxWidth:0,functionBefore:function(e,t){t()},functionReady:function(e,t){},functionAfter:function(e){},icon:"(?)",iconDesktop:false,iconTouch:false,iconTheme:".tooltipster-icon",interactive:false,interactiveTolerance:350,offsetX:0,offsetY:0,onlyOne:true,position:"top",speed:350,timer:0,theme:".tooltipster-default",touchDevices:true,trigger:"hover",updateAnimation:true};var l=true;if(!f()){l=false}var c=a();e(t).on("mousemove.tooltipster",function(){c=false;e(t).off("mousemove.tooltipster")});u.prototype={init:function(){var t=e(this.element);var i=this;var s=true;if(i.options.touchDevices==false&&c){s=false}if(n.all&&!n.querySelector){s=false}if(s==true){if(this.options.iconDesktop==true&&!c||this.options.iconTouch==true&&c){var o=t.attr("title");t.removeAttr("title");var u=i.options.iconTheme;var a=e('<span class="'+u.replace(".","")+'" title="'+o+'">'+this.options.icon+"</span>");a.insertAfter(t);t.data("tooltipsterIcon",a);t=a}var f=e.trim(i.options.content).length>0?i.options.content:t.attr("title");t.data("tooltipsterContent",f);t.removeAttr("title");if(this.options.touchDevices==true&&c&&(this.options.trigger=="click"||this.options.trigger=="hover")){t.bind("touchstart",function(e,t){i.showTooltip()})}else{if(this.options.trigger=="hover"){t.on("mouseenter.tooltipster",function(){i.showTooltip()});if(this.options.interactive==true){t.on("mouseleave.tooltipster",function(){var e=t.data("tooltipster");var n=false;if(e!==r&&e!==""){e.mouseenter(function(){n=true});e.mouseleave(function(){n=false});var s=setTimeout(function(){if(n==true){e.mouseleave(function(){i.hideTooltip()})}else{i.hideTooltip()}},i.options.interactiveTolerance)}else{i.hideTooltip()}})}else{t.on("mouseleave.tooltipster",function(){i.hideTooltip()})}}if(this.options.trigger=="click"){t.on("click.tooltipster",function(){if(t.data("tooltipster")==""||t.data("tooltipster")==r){i.showTooltip()}else{i.hideTooltip()}})}}}},showTooltip:function(t){var n=e(this.element);var i=this;if(n.data("tooltipsterIcon")!==r){n=n.data("tooltipsterIcon")}if(!n.hasClass("tooltipster-disable")){if(e(".tooltipster-base").not(".tooltipster-dying").length>0&&i.options.onlyOne==true){e(".tooltipster-base").not(".tooltipster-dying").not(n.data("tooltipster")).each(function(){e(this).addClass("tooltipster-kill");var t=e(this).data("origin");t.data("plugin_tooltipster").hideTooltip()})}n.clearQueue().delay(i.options.delay).queue(function(){i.options.functionBefore(n,function(){if(n.data("tooltipster")!==r&&n.data("tooltipster")!==""){var t=n.data("tooltipster");if(!t.hasClass("tooltipster-kill")){var s="tooltipster-"+i.options.animation;t.removeClass("tooltipster-dying");if(l==true){t.clearQueue().addClass(s+"-show")}if(i.options.timer>0){var o=t.data("tooltipsterTimer");clearTimeout(o);o=setTimeout(function(){t.data("tooltipsterTimer",r);i.hideTooltip()},i.options.timer);t.data("tooltipsterTimer",o)}if(i.options.touchDevices==true&&c){e("body").bind("touchstart",function(t){if(i.options.interactive==true){var n=e(t.target);var r=true;n.parents().each(function(){if(e(this).hasClass("tooltipster-base")){r=false}});if(r==true){i.hideTooltip();e("body").unbind("touchstart")}}else{i.hideTooltip();e("body").unbind("touchstart")}})}}}else{e("body").css("overflow-x","hidden");var u=n.data("tooltipsterContent");var a=i.options.theme;var h=a.replace(".","");var s="tooltipster-"+i.options.animation;var p="-webkit-transition-duration: "+i.options.speed+"ms; -webkit-animation-duration: "+i.options.speed+"ms; -moz-transition-duration: "+i.options.speed+"ms; -moz-animation-duration: "+i.options.speed+"ms; -o-transition-duration: "+i.options.speed+"ms; -o-animation-duration: "+i.options.speed+"ms; -ms-transition-duration: "+i.options.speed+"ms; -ms-animation-duration: "+i.options.speed+"ms; transition-duration: "+i.options.speed+"ms; animation-duration: "+i.options.speed+"ms;";var d=i.options.fixedWidth>0?"width:"+Math.round(i.options.fixedWidth)+"px;":"";var v=i.options.maxWidth>0?"max-width:"+Math.round(i.options.maxWidth)+"px;":"";var m=i.options.interactive==true?"pointer-events: auto;":"";var t=e('<div class="tooltipster-base '+h+" "+s+'" style="'+d+" "+v+" "+m+" "+p+'"></div>');var g=e('<div class="tooltipster-content"></div>');g.html(u);t.append(g);t.appendTo("body");n.data("tooltipster",t);t.data("origin",n);i.positionTooltip();i.options.functionReady(n,t);if(l==true){t.addClass(s+"-show")}else{t.css("display","none").removeClass(s).fadeIn(i.options.speed)}var y=u;var b=setInterval(function(){var r=n.data("tooltipsterContent");if(e("body").find(n).length==0){t.addClass("tooltipster-dying");i.hideTooltip()}else if(y!==r&&r!==""){y=r;t.find(".tooltipster-content").html(r);if(i.options.updateAnimation==true){if(f()){t.css({width:"","-webkit-transition":"all "+i.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms","-moz-transition":"all "+i.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms","-o-transition":"all "+i.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms","-ms-transition":"all "+i.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms",transition:"all "+i.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms"}).addClass("tooltipster-content-changing");setTimeout(function(){t.removeClass("tooltipster-content-changing");setTimeout(function(){t.css({"-webkit-transition":i.options.speed+"ms","-moz-transition":i.options.speed+"ms","-o-transition":i.options.speed+"ms","-ms-transition":i.options.speed+"ms",transition:i.options.speed+"ms"})},i.options.speed)},i.options.speed)}else{t.fadeTo(i.options.speed,.5,function(){t.fadeTo(i.options.speed,1)})}}i.positionTooltip()}if(e("body").find(t).length==0||e("body").find(n).length==0){clearInterval(b)}},200);if(i.options.timer>0){var o=setTimeout(function(){t.data("tooltipsterTimer",r);i.hideTooltip()},i.options.timer+i.options.speed);t.data("tooltipsterTimer",o)}if(i.options.touchDevices==true&&c){e("body").bind("touchstart",function(t){if(i.options.interactive==true){var n=e(t.target);var r=true;n.parents().each(function(){if(e(this).hasClass("tooltipster-base")){r=false}});if(r==true){i.hideTooltip();e("body").unbind("touchstart")}}else{i.hideTooltip();e("body").unbind("touchstart")}})}t.mouseleave(function(){i.hideTooltip()})}});n.dequeue()})}},hideTooltip:function(t){var n=e(this.element);var i=this;if(n.data("tooltipsterIcon")!==r){n=n.data("tooltipsterIcon")}var s=n.data("tooltipster");if(s==r){s=e(".tooltipster-dying")}n.clearQueue();if(s!==r&&s!==""){var o=s.data("tooltipsterTimer");if(o!==r){clearTimeout(o)}var u="tooltipster-"+i.options.animation;if(l==true){s.clearQueue().removeClass(u+"-show").addClass("tooltipster-dying").delay(i.options.speed).queue(function(){s.remove();n.data("tooltipster","");e("body").css("verflow-x","");i.options.functionAfter(n)})}else{s.clearQueue().addClass("tooltipster-dying").fadeOut(i.options.speed,function(){s.remove();n.data("tooltipster","");e("body").css("verflow-x","");i.options.functionAfter(n)})}}},positionTooltip:function(n){var s=e(this.element);var o=this;if(s.data("tooltipsterIcon")!==r){s=s.data("tooltipsterIcon")}if(s.data("tooltipster")!==r&&s.data("tooltipster")!==""){var u=s.data("tooltipster");u.css("width","");var a=e(t).width();var f=s.outerWidth(false);var l=s.outerHeight(false);var c=u.outerWidth(false);var h=u.innerWidth()+1;var p=u.outerHeight(false);var d=s.offset();var v=d.top;var m=d.left;var g=r;if(s.is("area")){var y=s.attr("shape");var b=s.parent().attr("name");var w=e('img[usemap="#'+b+'"]');var E=w.offset().left;var S=w.offset().top;var x=s.attr("coords")!==r?s.attr("coords").split(","):r;if(y=="circle"){var T=parseInt(x[0]);var N=parseInt(x[1]);var C=parseInt(x[2]);l=C*2;f=C*2;v=S+N-C;m=E+T-C}else if(y=="rect"){var T=parseInt(x[0]);var N=parseInt(x[1]);var k=parseInt(x[2]);var L=parseInt(x[3]);l=L-N;f=k-T;v=S+N;m=E+T}else if(y=="poly"){var A=[];var O=[];var M=0,_=0,D=0,P=0;var H="even";for(i=0;i<x.length;i++){var B=parseInt(x[i]);if(H=="even"){if(B>D){D=B;if(i==0){M=D}}if(B<M){M=B}H="odd"}else{if(B>P){P=B;if(i==1){_=P}}if(B<_){_=B}H="even"}}l=P-_;f=D-M;v=S+_;m=E+M}else{l=w.outerHeight(false);f=w.outerWidth(false);v=S;m=E}}if(o.options.fixedWidth==0){u.css({width:Math.round(h)+"px","padding-left":"0px","padding-right":"0px"})}var j=0,F=0;var I=parseInt(o.options.offsetY);var q=parseInt(o.options.offsetX);var R="";function U(){var n=e(t).scrollLeft();if(j-n<0){var r=j-n;j=n;u.data("arrow-reposition",r)}if(j+c-n>a){var r=j-(a+n-c);j=a+n-c;u.data("arrow-reposition",r)}}function z(n,r){if(v-e(t).scrollTop()-p-I-12<0&&r.indexOf("top")>-1){o.options.position=n;g=r}if(v+l+p+12+I>e(t).scrollTop()+e(t).height()&&r.indexOf("bottom")>-1){o.options.position=n;g=r;F=v-p-I-12}}if(o.options.position=="top"){var W=m+c-(m+f);j=m+q-W/2;F=v-p-I-12;U();z("bottom","top")}if(o.options.position=="top-left"){j=m+q;F=v-p-I-12;U();z("bottom-left","top-left")}if(o.options.position=="top-right"){j=m+f+q-c;F=v-p-I-12;U();z("bottom-right","top-right")}if(o.options.position=="bottom"){var W=m+c-(m+f);j=m-W/2+q;F=v+l+I+12;U();z("top","bottom")}if(o.options.position=="bottom-left"){j=m+q;F=v+l+I+12;U();z("top-left","bottom-left")}if(o.options.position=="bottom-right"){j=m+f+q-c;F=v+l+I+12;U();z("top-right","bottom-right")}if(o.options.position=="left"){j=m-q-c-12;myLeftMirror=m+q+f+12;var X=v+p-(v+s.outerHeight(false));F=v-X/2-I;if(j<0&&myLeftMirror+c>a){var V=parseFloat(u.css("border-width"))*2;var J=c+j-V;u.css("width",J+"px");p=u.outerHeight(false);j=m-q-J-12-V;X=v+p-(v+s.outerHeight(false));F=v-X/2-I}else if(j<0){j=m+q+f+12;u.data("arrow-reposition","left")}}if(o.options.position=="right"){j=m+q+f+12;myLeftMirror=m-q-c-12;var X=v+p-(v+s.outerHeight(false));F=v-X/2-I;if(j+c>a&&myLeftMirror<0){var V=parseFloat(u.css("border-width"))*2;var J=a-j-V;u.css("width",J+"px");p=u.outerHeight(false);X=v+p-(v+s.outerHeight(false));F=v-X/2-I}else if(j+c>a){j=m-q-c-12;u.data("arrow-reposition","right")}}if(o.options.arrow==true){var K="tooltipster-arrow-"+o.options.position;if(o.options.arrowColor.length<1){var Q=u.css("background-color")}else{var Q=o.options.arrowColor}var G=u.data("arrow-reposition");if(!G){G=""}else if(G=="left"){K="tooltipster-arrow-right";G=""}else if(G=="right"){K="tooltipster-arrow-left";G=""}else{G="left:"+Math.round(G)+"px;"}if(o.options.position=="top"||o.options.position=="top-left"||o.options.position=="top-right"){var Y=parseFloat(u.css("border-bottom-width"));var Z=u.css("border-bottom-color")}else if(o.options.position=="bottom"||o.options.position=="bottom-left"||o.options.position=="bottom-right"){var Y=parseFloat(u.css("border-top-width"));var Z=u.css("border-top-color")}else if(o.options.position=="left"){var Y=parseFloat(u.css("border-right-width"));var Z=u.css("border-right-color")}else if(o.options.position=="right"){var Y=parseFloat(u.css("border-left-width"));var Z=u.css("border-left-color")}else{var Y=parseFloat(u.css("border-bottom-width"));var Z=u.css("border-bottom-color")}if(Y>1){Y++}var et="";if(Y!==0){var tt="";var nt="border-color: "+Z+";";if(K.indexOf("bottom")!==-1){tt="margin-top: -"+Math.round(Y)+"px;"}else if(K.indexOf("top")!==-1){tt="margin-bottom: -"+Math.round(Y)+"px;"}else if(K.indexOf("left")!==-1){tt="margin-right: -"+Math.round(Y)+"px;"}else if(K.indexOf("right")!==-1){tt="margin-left: -"+Math.round(Y)+"px;"}et='<span class="tooltipster-arrow-border" style="'+tt+" "+nt+';"></span>'}u.find(".tooltipster-arrow").remove();R='<div class="'+K+' tooltipster-arrow" style="'+G+'">'+et+'<span style="border-color:'+Q+';"></span></div>';u.append(R)}u.css({top:Math.round(F)+"px",left:Math.round(j)+"px"});if(g!==r){o.options.position=g}}}};e.fn[s]=function(t){if(typeof t==="string"){var n=this;var i=arguments[1];if(n.data("plugin_tooltipster")==r){var o=n.find("*");n=e();o.each(function(){if(e(this).data("plugin_tooltipster")!==r){n.push(e(this))}})}n.each(function(){switch(t.toLowerCase()){case"show":e(this).data("plugin_tooltipster").showTooltip();break;case"hide":e(this).data("plugin_tooltipster").hideTooltip();break;case"disable":e(this).addClass("tooltipster-disable");break;case"enable":e(this).removeClass("tooltipster-disable");break;case"destroy":e(this).data("plugin_tooltipster").hideTooltip();e(this).data("plugin_tooltipster","").attr("title",n.data("tooltipsterContent")).data("tooltipsterContent","").data("plugin_tooltipster","").off("mouseenter.tooltipster mouseleave.tooltipster click.tooltipster").unbind("touchstart");break;case"update":if(e(this).data("tooltipsterIcon")==r){e(this).data("tooltipsterContent",i)}else{var s=e(this).data("tooltipsterIcon");s.data("tooltipsterContent",i)}break;case"reposition":e(this).data("plugin_tooltipster").positionTooltip();break}});return this}return this.each(function(){if(!e.data(this,"plugin_"+s)){e.data(this,"plugin_"+s,new u(this,t))}var n=e(this).data("plugin_tooltipster").options;if(n.iconDesktop==true&&!c||n.iconTouch==true&&c){var r=e(this).data("plugin_tooltipster");e(this).next().data("plugin_tooltipster",r)}})};if(c){t.addEventListener("orientationchange",function(){if(e(".tooltipster-base").length>0){e(".tooltipster-base").each(function(){var t=e(this).data("origin");t.data("plugin_tooltipster").hideTooltip()})}},false)}e(t).on("resize.tooltipster",function(){var t=e(".tooltipster-base").data("origin");if(t!==null&&t!==r){t.tooltipster("reposition")}})})(jQuery,window,document);(function(e){var t="Close",n="BeforeClose",r="AfterClose",i="BeforeAppend",s="MarkupParse",o="Open",u="Change",a="mfp",f="."+a,l="mfp-ready",c="mfp-removing",h="mfp-prevent-close";var p,d=function(){},v=!!window.jQuery,m,g=e(window),y,b,w,E,S;var x=function(e,t){p.ev.on(a+e+f,t)},T=function(t,n,r,i){var s=document.createElement("div");s.className="mfp-"+t;if(r){s.innerHTML=r}if(!i){s=e(s);if(n){s.appendTo(n)}}else if(n){n.appendChild(s)}return s},N=function(t,n){p.ev.triggerHandler(a+t,n);if(p.st.callbacks){t=t.charAt(0).toLowerCase()+t.slice(1);if(p.st.callbacks[t]){p.st.callbacks[t].apply(p,e.isArray(n)?n:[n])}}},C=function(){(p.st.focus?p.content.find(p.st.focus).eq(0):p.wrap).focus()},k=function(t){if(t!==S||!p.currTemplate.closeBtn){p.currTemplate.closeBtn=e(p.st.closeMarkup.replace("%title%",p.st.tClose));S=t}return p.currTemplate.closeBtn},L=function(){if(!e.magnificPopup.instance){p=new d;p.init();e.magnificPopup.instance=p}},A=function(t){if(e(t).hasClass(h)){return}var n=p.st.closeOnContentClick;var r=p.st.closeOnBgClick;if(n&&r){return true}else{if(!p.content||e(t).hasClass("mfp-close")||p.preloader&&t===p.preloader[0]){return true}if(t!==p.content[0]&&!e.contains(p.content[0],t)){if(r){if(e.contains(document,t)){return true}}}else if(n){return true}}return false},O=function(){var e=document.createElement("p").style,t=["ms","O","Moz","Webkit"];if(e["transition"]!==undefined){return true}while(t.length){if(t.pop()+"Transition"in e){return true}}return false};d.prototype={constructor:d,init:function(){var t=navigator.appVersion;p.isIE7=t.indexOf("MSIE 7.")!==-1;p.isIE8=t.indexOf("MSIE 8.")!==-1;p.isLowIE=p.isIE7||p.isIE8;p.isAndroid=/android/gi.test(t);p.isIOS=/iphone|ipad|ipod/gi.test(t);p.supportsTransition=O();p.probablyMobile=p.isAndroid||p.isIOS||/(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(navigator.userAgent);y=e(document.body);b=e(document);p.popupsCache={}},open:function(t){var n;if(t.isObj===false){p.items=t.items.toArray();p.index=0;var r=t.items,i;for(n=0;n<r.length;n++){i=r[n];if(i.parsed){i=i.el[0]}if(i===t.el[0]){p.index=n;break}}}else{p.items=e.isArray(t.items)?t.items:[t.items];p.index=t.index||0}if(p.isOpen){p.updateItemHTML();return}p.types=[];E="";if(t.mainEl&&t.mainEl.length){p.ev=t.mainEl.eq(0)}else{p.ev=b}if(t.key){if(!p.popupsCache[t.key]){p.popupsCache[t.key]={}}p.currTemplate=p.popupsCache[t.key]}else{p.currTemplate={}}p.st=e.extend(true,{},e.magnificPopup.defaults,t);p.fixedContentPos=p.st.fixedContentPos==="auto"?!p.probablyMobile:p.st.fixedContentPos;if(p.st.modal){p.st.closeOnContentClick=false;p.st.closeOnBgClick=false;p.st.showCloseBtn=false;p.st.enableEscapeKey=false}if(!p.bgOverlay){p.bgOverlay=T("bg").on("click"+f,function(){p.close()});p.wrap=T("wrap").attr("tabindex",-1).on("click"+f,function(e){if(A(e.target)){p.close()}});p.container=T("container",p.wrap)}p.contentContainer=T("content");if(p.st.preloader){p.preloader=T("preloader",p.container,p.st.tLoading)}var u=e.magnificPopup.modules;for(n=0;n<u.length;n++){var a=u[n];a=a.charAt(0).toUpperCase()+a.slice(1);p["init"+a].call(p)}N("BeforeOpen");if(p.st.showCloseBtn){if(!p.st.closeBtnInside){p.wrap.append(k())}else{x(s,function(e,t,n,r){n.close_replaceWith=k(r.type)});E+=" mfp-close-btn-in"}}if(p.st.alignTop){E+=" mfp-align-top"}if(p.fixedContentPos){p.wrap.css({overflow:p.st.overflowY,overflowX:"hidden",overflowY:p.st.overflowY})}else{p.wrap.css({top:g.scrollTop(),position:"absolute"})}if(p.st.fixedBgPos===false||p.st.fixedBgPos==="auto"&&!p.fixedContentPos){p.bgOverlay.css({height:b.height(),position:"absolute"})}if(p.st.enableEscapeKey){b.on("keyup"+f,function(e){if(e.keyCode===27){p.close()}})}g.on("resize"+f,function(){p.updateSize()});if(!p.st.closeOnContentClick){E+=" mfp-auto-cursor"}if(E)p.wrap.addClass(E);var c=p.wH=g.height();var h={};if(p.fixedContentPos){if(p._hasScrollBar(c)){var d=p._getScrollbarSize();if(d){h.paddingRight=d}}}if(p.fixedContentPos){if(!p.isIE7){h.overflow="hidden"}else{e("body, html").css("overflow","hidden")}}var v=p.st.mainClass;if(p.isIE7){v+=" mfp-ie7"}if(v){p._addClassToMFP(v)}p.updateItemHTML();N("BuildControls");e("html").css(h);p.bgOverlay.add(p.wrap).prependTo(document.body);p._lastFocusedEl=document.activeElement;setTimeout(function(){if(p.content){p._addClassToMFP(l);C()}else{p.bgOverlay.addClass(l)}b.on("focusin"+f,function(t){if(t.target!==p.wrap[0]&&!e.contains(p.wrap[0],t.target)){C();return false}})},16);p.isOpen=true;p.updateSize(c);N(o);return t},close:function(){if(!p.isOpen)return;N(n);p.isOpen=false;if(p.st.removalDelay&&!p.isLowIE&&p.supportsTransition){p._addClassToMFP(c);setTimeout(function(){p._close()},p.st.removalDelay)}else{p._close()}},_close:function(){N(t);var n=c+" "+l+" ";p.bgOverlay.detach();p.wrap.detach();p.container.empty();if(p.st.mainClass){n+=p.st.mainClass+" "}p._removeClassFromMFP(n);if(p.fixedContentPos){var i={paddingRight:""};if(p.isIE7){e("body, html").css("overflow","")}else{i.overflow=""}e("html").css(i)}b.off("keyup"+f+" focusin"+f);p.ev.off(f);p.wrap.attr("class","mfp-wrap").removeAttr("style");p.bgOverlay.attr("class","mfp-bg");p.container.attr("class","mfp-container");if(p.st.showCloseBtn&&(!p.st.closeBtnInside||p.currTemplate[p.currItem.type]===true)){if(p.currTemplate.closeBtn)p.currTemplate.closeBtn.detach()}if(p._lastFocusedEl){e(p._lastFocusedEl).focus()}p.currItem=null;p.content=null;p.currTemplate=null;p.prevHeight=0;N(r)},updateSize:function(e){if(p.isIOS){var t=document.documentElement.clientWidth/window.innerWidth;var n=window.innerHeight*t;p.wrap.css("height",n);p.wH=n}else{p.wH=e||g.height()}if(!p.fixedContentPos){p.wrap.css("height",p.wH)}N("Resize")},updateItemHTML:function(){var t=p.items[p.index];p.contentContainer.detach();if(p.content)p.content.detach();if(!t.parsed){t=p.parseEl(p.index)}var n=t.type;N("BeforeChange",[p.currItem?p.currItem.type:"",n]);p.currItem=t;if(!p.currTemplate[n]){var r=p.st[n]?p.st[n].markup:false;N("FirstMarkupParse",r);if(r){p.currTemplate[n]=e(r)}else{p.currTemplate[n]=true}}if(w&&w!==t.type){p.container.removeClass("mfp-"+w+"-holder")}var i=p["get"+n.charAt(0).toUpperCase()+n.slice(1)](t,p.currTemplate[n]);p.appendContent(i,n);t.preloaded=true;N(u,t);w=t.type;p.container.prepend(p.contentContainer);N("AfterChange")},appendContent:function(e,t){p.content=e;if(e){if(p.st.showCloseBtn&&p.st.closeBtnInside&&p.currTemplate[t]===true){if(!p.content.find(".mfp-close").length){p.content.append(k())}}else{p.content=e}}else{p.content=""}N(i);p.container.addClass("mfp-"+t+"-holder");p.contentContainer.append(p.content)},parseEl:function(t){var n=p.items[t],r=n.type;if(n.tagName){n={el:e(n)}}else{n={data:n,src:n.src}}if(n.el){var i=p.types;for(var s=0;s<i.length;s++){if(n.el.hasClass("mfp-"+i[s])){r=i[s];break}}n.src=n.el.attr("data-mfp-src");if(!n.src){n.src=n.el.attr("href")}}n.type=r||p.st.type||"inline";n.index=t;n.parsed=true;p.items[t]=n;N("ElementParse",n);return p.items[t]},addGroup:function(e,t){var n=function(n){n.mfpEl=this;p._openClick(n,e,t)};if(!t){t={}}var r="click.magnificPopup";t.mainEl=e;if(t.items){t.isObj=true;e.off(r).on(r,n)}else{t.isObj=false;if(t.delegate){e.off(r).on(r,t.delegate,n)}else{t.items=e;e.off(r).on(r,n)}}},_openClick:function(t,n,r){var i=r.midClick!==undefined?r.midClick:e.magnificPopup.defaults.midClick;if(!i&&(t.which===2||t.ctrlKey||t.metaKey)){return}var s=r.disableOn!==undefined?r.disableOn:e.magnificPopup.defaults.disableOn;if(s){if(e.isFunction(s)){if(!s.call(p)){return true}}else{if(g.width()<s){return true}}}if(t.type){t.preventDefault();if(p.isOpen){t.stopPropagation()}}r.el=e(t.mfpEl);if(r.delegate){r.items=n.find(r.delegate)}p.open(r)},updateStatus:function(e,t){if(p.preloader){if(m!==e){p.container.removeClass("mfp-s-"+m)}if(!t&&e==="loading"){t=p.st.tLoading}var n={status:e,text:t};N("UpdateStatus",n);e=n.status;t=n.text;p.preloader.html(t);p.preloader.find("a").on("click",function(e){e.stopImmediatePropagation()});p.container.addClass("mfp-s-"+e);m=e}},_addClassToMFP:function(e){p.bgOverlay.addClass(e);p.wrap.addClass(e)},_removeClassFromMFP:function(e){this.bgOverlay.removeClass(e);p.wrap.removeClass(e)},_hasScrollBar:function(e){return(p.isIE7?b.height():document.body.scrollHeight)>(e||g.height())},_parseMarkup:function(t,n,r){var i;if(r.data){n=e.extend(r.data,n)}N(s,[t,n,r]);e.each(n,function(e,n){if(n===undefined||n===false){return true}i=e.split("_");if(i.length>1){var r=t.find(f+"-"+i[0]);if(r.length>0){var s=i[1];if(s==="replaceWith"){if(r[0]!==n[0]){r.replaceWith(n)}}else if(s==="img"){if(r.is("img")){r.attr("src",n)}else{r.replaceWith('<img src="'+n+'" class="'+r.attr("class")+'" />')}}else{r.attr(i[1],n)}}}else{t.find(f+"-"+e).html(n)}})},_getScrollbarSize:function(){if(p.scrollbarSize===undefined){var e=document.createElement("div");e.id="mfp-sbm";e.style.cssText="width: 99px; height: 99px; overflow: scroll; position: absolute; top: -9999px;";document.body.appendChild(e);p.scrollbarSize=e.offsetWidth-e.clientWidth;document.body.removeChild(e)}return p.scrollbarSize}};e.magnificPopup={instance:null,proto:d.prototype,modules:[],open:function(t,n){L();if(!t){t={}}else{t=e.extend(true,{},t)}t.isObj=true;t.index=n||0;return this.instance.open(t)},close:function(){return e.magnificPopup.instance&&e.magnificPopup.instance.close()},registerModule:function(t,n){if(n.options){e.magnificPopup.defaults[t]=n.options}e.extend(this.proto,n.proto);this.modules.push(t)},defaults:{disableOn:0,key:null,midClick:false,mainClass:"",preloader:true,focus:"",closeOnContentClick:false,closeOnBgClick:true,closeBtnInside:true,showCloseBtn:true,enableEscapeKey:true,modal:false,alignTop:false,removalDelay:0,fixedContentPos:"auto",fixedBgPos:"auto",overflowY:"auto",closeMarkup:'<button title="%title%" type="button" class="mfp-close">&times;</button>',tClose:"Close (Esc)",tLoading:"Loading..."}};e.fn.magnificPopup=function(t){L();var n=e(this);if(typeof t==="string"){if(t==="open"){var r,i=v?n.data("magnificPopup"):n[0].magnificPopup,s=parseInt(arguments[1],10)||0;if(i.items){r=i.items[s]}else{r=n;if(i.delegate){r=r.find(i.delegate)}r=r.eq(s)}p._openClick({mfpEl:r},n,i)}else{if(p.isOpen)p[t].apply(p,Array.prototype.slice.call(arguments,1))}}else{t=e.extend(true,{},t);if(v){n.data("magnificPopup",t)}else{n[0].magnificPopup=t}p.addGroup(n,t)}return n};var M="inline",_,D,P,H=function(){if(P){D.after(P.addClass(_)).detach();P=null}};e.magnificPopup.registerModule(M,{options:{hiddenClass:"hide",markup:"",tNotFound:"Content not found"},proto:{initInline:function(){p.types.push(M);x(t+"."+M,function(){H()})},getInline:function(t,n){H();if(t.src){var r=p.st.inline,i=e(t.src);if(i.length){var s=i[0].parentNode;if(s&&s.tagName){if(!D){_=r.hiddenClass;D=T(_);_="mfp-"+_}P=i.after(D).detach().removeClass(_)}p.updateStatus("ready")}else{p.updateStatus("error",r.tNotFound);i=e("<div>")}t.inlineElement=i;return i}p.updateStatus("ready");p._parseMarkup(n,{},t);return n}}});var B="ajax",j,F=function(){if(j){y.removeClass(j)}},I=function(){F();if(p.req){p.req.abort()}};e.magnificPopup.registerModule(B,{options:{settings:null,cursor:"mfp-ajax-cur",tError:'<a href="%url%">The content</a> could not be loaded.'},proto:{initAjax:function(){p.types.push(B);j=p.st.ajax.cursor;x(t+"."+B,I);x("BeforeChange."+B,I)},getAjax:function(t){if(j)y.addClass(j);p.updateStatus("loading");var n=e.extend({url:t.src,success:function(n,r,i){var s={data:n,xhr:i};N("ParseAjax",s);p.appendContent(e(s.data),B);t.finished=true;F();C();setTimeout(function(){p.wrap.addClass(l)},16);p.updateStatus("ready");N("AjaxContentAdded")},error:function(){F();t.finished=t.loadError=true;p.updateStatus("error",p.st.ajax.tError.replace("%url%",t.src))}},p.st.ajax.settings);p.req=e.ajax(n);return""}}});var q,R=function(t){if(t.data&&t.data.title!==undefined)return t.data.title;var n=p.st.image.titleSrc;if(n){if(e.isFunction(n)){return n.call(p,t)}else if(t.el){return t.el.attr(n)||""}}return""};e.magnificPopup.registerModule("image",{options:{markup:'<div class="mfp-figure">'+'<div class="mfp-close"></div>'+'<div class="mfp-img"></div>'+'<div class="mfp-bottom-bar">'+'<div class="mfp-title"></div>'+'<div class="mfp-counter"></div>'+"</div>"+"</div>",cursor:"mfp-zoom-out-cur",titleSrc:"title",verticalFit:true,tError:'<a href="%url%">The image</a> could not be loaded.'},proto:{initImage:function(){var e=p.st.image,n=".image";p.types.push("image");x(o+n,function(){if(p.currItem.type==="image"&&e.cursor){y.addClass(e.cursor)}});x(t+n,function(){if(e.cursor){y.removeClass(e.cursor)}g.off("resize"+f)});x("Resize"+n,p.resizeImage);if(p.isLowIE){x("AfterChange",p.resizeImage)}},resizeImage:function(){var e=p.currItem;if(!e||!e.img)return;if(p.st.image.verticalFit){var t=0;if(p.isLowIE){t=parseInt(e.img.css("padding-top"),10)+parseInt(e.img.css("padding-bottom"),10)}e.img.css("max-height",p.wH-t)}},_onImageHasSize:function(e){if(e.img){e.hasSize=true;if(q){clearInterval(q)}e.isCheckingImgSize=false;N("ImageHasSize",e);if(e.imgHidden){if(p.content)p.content.removeClass("mfp-loading");e.imgHidden=false}}},findImageSize:function(e){var t=0,n=e.img[0],r=function(i){if(q){clearInterval(q)}q=setInterval(function(){if(n.naturalWidth>0){p._onImageHasSize(e);return}if(t>200){clearInterval(q)}t++;if(t===3){r(10)}else if(t===40){r(50)}else if(t===100){r(500)}},i)};r(1)},getImage:function(t,n){var r=0,i=function(){if(t){if(t.img[0].complete){t.img.off(".mfploader");if(t===p.currItem){p._onImageHasSize(t);p.updateStatus("ready")}t.hasSize=true;t.loaded=true;N("ImageLoadComplete")}else{r++;if(r<200){setTimeout(i,100)}else{s()}}}},s=function(){if(t){t.img.off(".mfploader");if(t===p.currItem){p._onImageHasSize(t);p.updateStatus("error",o.tError.replace("%url%",t.src))}t.hasSize=true;t.loaded=true;t.loadError=true}},o=p.st.image;var u=n.find(".mfp-img");if(u.length){var a=document.createElement("img");a.className="mfp-img";t.img=e(a).on("load.mfploader",i).on("error.mfploader",s);a.src=t.src;if(u.is("img")){t.img=t.img.clone()}if(t.img[0].naturalWidth>0){t.hasSize=true}}p._parseMarkup(n,{title:R(t),img_replaceWith:t.img},t);p.resizeImage();if(t.hasSize){if(q)clearInterval(q);if(t.loadError){n.addClass("mfp-loading");p.updateStatus("error",o.tError.replace("%url%",t.src))}else{n.removeClass("mfp-loading");p.updateStatus("ready")}return n}p.updateStatus("loading");t.loading=true;if(!t.hasSize){t.imgHidden=true;n.addClass("mfp-loading");p.findImageSize(t)}return n}}});var U,z=function(){if(U===undefined){U=document.createElement("p").style.MozTransform!==undefined}return U};e.magnificPopup.registerModule("zoom",{options:{enabled:false,easing:"ease-in-out",duration:300,opener:function(e){return e.is("img")?e:e.find("img")}},proto:{initZoom:function(){var e=p.st.zoom,r=".zoom",i;if(!e.enabled||!p.supportsTransition){return}var s=e.duration,o=function(t){var n=t.clone().removeAttr("style").removeAttr("class").addClass("mfp-animated-image"),r="all "+e.duration/1e3+"s "+e.easing,i={position:"fixed",zIndex:9999,left:0,top:0,"-webkit-backface-visibility":"hidden"},s="transition";i["-webkit-"+s]=i["-moz-"+s]=i["-o-"+s]=i[s]=r;n.css(i);return n},u=function(){p.content.css("visibility","visible")},a,f;x("BuildControls"+r,function(){if(p._allowZoom()){clearTimeout(a);p.content.css("visibility","hidden");i=p._getItemToZoom();if(!i){u();return}f=o(i);f.css(p._getOffset());p.wrap.append(f);a=setTimeout(function(){f.css(p._getOffset(true));a=setTimeout(function(){u();setTimeout(function(){f.remove();i=f=null;N("ZoomAnimationEnded")},16)},s)},16)}});x(n+r,function(){if(p._allowZoom()){clearTimeout(a);p.st.removalDelay=s;if(!i){i=p._getItemToZoom();if(!i){return}f=o(i)}f.css(p._getOffset(true));p.wrap.append(f);p.content.css("visibility","hidden");setTimeout(function(){f.css(p._getOffset())},16)}});x(t+r,function(){if(p._allowZoom()){u();if(f){f.remove()}i=null}})},_allowZoom:function(){return p.currItem.type==="image"},_getItemToZoom:function(){if(p.currItem.hasSize){return p.currItem.img}else{return false}},_getOffset:function(t){var n;if(t){n=p.currItem.img}else{n=p.st.zoom.opener(p.currItem.el||p.currItem)}var r=n.offset();var i=parseInt(n.css("padding-top"),10);var s=parseInt(n.css("padding-bottom"),10);r.top-=e(window).scrollTop()-i;var o={width:n.width(),height:(v?n.innerHeight():n[0].offsetHeight)-s-i};if(z()){o["-moz-transform"]=o["transform"]="translate("+r.left+"px,"+r.top+"px)"}else{o.left=r.left;o.top=r.top}return o}}});var W="iframe",X="//about:blank",V=function(e){if(p.currTemplate[W]){var t=p.currTemplate[W].find("iframe");if(t.length){if(!e){t[0].src=X}if(p.isIE8){t.css("display",e?"block":"none")}}}};e.magnificPopup.registerModule(W,{options:{markup:'<div class="mfp-iframe-scaler">'+'<div class="mfp-close"></div>'+'<iframe class="mfp-iframe" src="//about:blank" frameborder="0" allowfullscreen></iframe>'+"</div>",srcAction:"iframe_src",patterns:{youtube:{index:"youtube.com",id:"v=",src:"//www.youtube.com/embed/%id%?autoplay=1"},vimeo:{index:"vimeo.com/",id:"/",src:"//player.vimeo.com/video/%id%?autoplay=1"},gmaps:{index:"//maps.google.",src:"%id%&output=embed"}}},proto:{initIframe:function(){p.types.push(W);x("BeforeChange",function(e,t,n){if(t!==n){if(t===W){V()}else if(n===W){V(true)}}});x(t+"."+W,function(){V()})},getIframe:function(t,n){var r=t.src;var i=p.st.iframe;e.each(i.patterns,function(){if(r.indexOf(this.index)>-1){if(this.id){if(typeof this.id==="string"){r=r.substr(r.lastIndexOf(this.id)+this.id.length,r.length)}else{r=this.id.call(this,r)}}r=this.src.replace("%id%",r);return false}});var s={};if(i.srcAction){s[i.srcAction]=r}p._parseMarkup(n,s,t);p.updateStatus("ready");return n}}});var $=function(e){var t=p.items.length;if(e>t-1){return e-t}else if(e<0){return t+e}return e},J=function(e,t,n){return e.replace(/%curr%/gi,t+1).replace(/%total%/gi,n)};e.magnificPopup.registerModule("gallery",{options:{enabled:false,arrowMarkup:'<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',preload:[0,2],navigateByImgClick:true,arrows:true,tPrev:"Previous (Left arrow key)",tNext:"Next (Right arrow key)",tCounter:"%curr% of %total%"},proto:{initGallery:function(){var n=p.st.gallery,r=".mfp-gallery",i=Boolean(e.fn.mfpFastClick);p.direction=true;if(!n||!n.enabled)return false;E+=" mfp-gallery";x(o+r,function(){if(n.navigateByImgClick){p.wrap.on("click"+r,".mfp-img",function(){if(p.items.length>1){p.next();return false}})}b.on("keydown"+r,function(e){if(e.keyCode===37){p.prev()}else if(e.keyCode===39){p.next()}})});x("UpdateStatus"+r,function(e,t){if(t.text){t.text=J(t.text,p.currItem.index,p.items.length)}});x(s+r,function(e,t,r,i){var s=p.items.length;r.counter=s>1?J(n.tCounter,i.index,s):""});x("BuildControls"+r,function(){if(p.items.length>1&&n.arrows&&!p.arrowLeft){var t=n.arrowMarkup,r=p.arrowLeft=e(t.replace(/%title%/gi,n.tPrev).replace(/%dir%/gi,"left")).addClass(h),s=p.arrowRight=e(t.replace(/%title%/gi,n.tNext).replace(/%dir%/gi,"right")).addClass(h);var o=i?"mfpFastClick":"click";r[o](function(){p.prev()});s[o](function(){p.next()});if(p.isIE7){T("b",r[0],false,true);T("a",r[0],false,true);T("b",s[0],false,true);T("a",s[0],false,true)}p.container.append(r.add(s))}});x(u+r,function(){if(p._preloadTimeout)clearTimeout(p._preloadTimeout);p._preloadTimeout=setTimeout(function(){p.preloadNearbyImages();p._preloadTimeout=null},16)});x(t+r,function(){b.off(r);p.wrap.off("click"+r);if(p.arrowLeft&&i){p.arrowLeft.add(p.arrowRight).destroyMfpFastClick()}p.arrowRight=p.arrowLeft=null})},next:function(){p.direction=true;p.index=$(p.index+1);p.updateItemHTML()},prev:function(){p.direction=false;p.index=$(p.index-1);p.updateItemHTML()},goTo:function(e){p.direction=e>=p.index;p.index=e;p.updateItemHTML()},preloadNearbyImages:function(){var e=p.st.gallery.preload,t=Math.min(e[0],p.items.length),n=Math.min(e[1],p.items.length),r;for(r=1;r<=(p.direction?n:t);r++){p._preloadItem(p.index+r)}for(r=1;r<=(p.direction?t:n);r++){p._preloadItem(p.index-r)}},_preloadItem:function(t){t=$(t);if(p.items[t].preloaded){return}var n=p.items[t];if(!n.parsed){n=p.parseEl(t)}N("LazyLoad",n);if(n.type==="image"){n.img=e('<img class="mfp-img" />').on("load.mfploader",function(){n.hasSize=true}).on("error.mfploader",function(){n.hasSize=true;n.loadError=true;N("LazyLoadError",n)}).attr("src",n.src)}n.preloaded=true}}});var K="retina";e.magnificPopup.registerModule(K,{options:{replaceSrc:function(e){return e.src.replace(/\.\w+$/,function(e){return"@2x"+e})},ratio:1},proto:{initRetina:function(){if(window.devicePixelRatio>1){var e=p.st.retina,t=e.ratio;t=!isNaN(t)?t:t();if(t>1){x("ImageHasSize"+"."+K,function(e,n){n.img.css({"max-width":n.img[0].naturalWidth/t,width:"100%"})});x("ElementParse"+"."+K,function(n,r){r.src=e.replaceSrc(r,t)})}}}}});(function(){var t=1e3,n="ontouchstart"in window,r=function(){g.off("touchmove"+s+" touchend"+s)},i="mfpFastClick",s="."+i;e.fn.mfpFastClick=function(i){return e(this).each(function(){var o=e(this),u;if(n){var a,f,l,c,h,p;o.on("touchstart"+s,function(e){c=false;p=1;h=e.originalEvent?e.originalEvent.touches[0]:e.touches[0];f=h.clientX;l=h.clientY;g.on("touchmove"+s,function(e){h=e.originalEvent?e.originalEvent.touches:e.touches;p=h.length;h=h[0];if(Math.abs(h.clientX-f)>10||Math.abs(h.clientY-l)>10){c=true;r()}}).on("touchend"+s,function(e){r();if(c||p>1){return}u=true;e.preventDefault();clearTimeout(a);a=setTimeout(function(){u=false},t);i()})})}o.on("click"+s,function(){if(!u){i()}})})};e.fn.destroyMfpFastClick=function(){e(this).off("touchstart"+s+" click"+s);if(n)g.off("touchmove"+s+" touchend"+s)}})()})(window.jQuery||window.Zepto)
