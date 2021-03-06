responsiveVoice.setDefaultVoice("Spanish Latin American Female");

$(document).ready(function(){

    let monexIndex = window.location.pathname;
    if(monexIndex == "/admin/index"){
        window.location.replace(origin + "/monex/index");
    }

    $('#goToMessages').click(function(){
        var origin = window.location.origin;
        window.location.replace(origin + "/admin/messages");
    });

    $('#goToResources').click(function(){
        var origin = window.location.origin;
        window.location.replace(origin + "/admin/resources");
    });

    $('#goToUserAction').click(function(){
        var origin = window.location.origin;
        window.location.replace(origin + "/admin/userlog");
    });

    $('#goToAdminAction').click(function(){
        var origin = window.location.origin;
        window.location.replace(origin + "/admin/adminlog");
    });

    $('#goToMonex').click(function(){
        var origin   = window.location.origin;
        window.location.replace(origin + "/monex/index");
        document.cookie = 'SID =; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        document.cookie= 'voiceBot =; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    });

    var myCookie = getCookie("voiceBot");
    if(myCookie == null){
        unmute();
        playVB();
    }
    else{
        mute();
    }
});

function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
            end = dc.length;
        }
    }
    // because unescape has been deprecated, replaced with decodeURI
    //return unescape(dc.substring(begin + prefix.length, end));
    return decodeURI(dc.substring(begin + prefix.length, end));
} 

function playSound(){
    playVB();
}

function mute(){
    $('#botMute').show();
    $('#botUnmute').hide();
    responsiveVoice.cancel();
    document.cookie="voiceBot = false";
}
  
function unmute(){
    $('#botMute').hide();
    $('#botUnmute').show();

    document.cookie= 'voiceBot =; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}