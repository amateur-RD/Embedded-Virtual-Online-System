<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	 <!-- Icons (see Makefile for what the sizes are for) -->
    <link rel="icon" sizes="16x16" type="image/png" href="app/images/icons/novnc-16x16.png">
    <link rel="icon" sizes="24x24" type="image/png" href="app/images/icons/novnc-24x24.png">
    <link rel="icon" sizes="32x32" type="image/png" href="app/images/icons/novnc-32x32.png">
    <link rel="icon" sizes="48x48" type="image/png" href="app/images/icons/novnc-48x48.png">
    <link rel="icon" sizes="60x60" type="image/png" href="app/images/icons/novnc-60x60.png">
    <link rel="icon" sizes="64x64" type="image/png" href="app/images/icons/novnc-64x64.png">
    <link rel="icon" sizes="72x72" type="image/png" href="app/images/icons/novnc-72x72.png">
    <link rel="icon" sizes="76x76" type="image/png" href="app/images/icons/novnc-76x76.png">
    <link rel="icon" sizes="96x96" type="image/png" href="app/images/icons/novnc-96x96.png">
    <link rel="icon" sizes="120x120" type="image/png" href="app/images/icons/novnc-120x120.png">
    <link rel="icon" sizes="144x144" type="image/png" href="app/images/icons/novnc-144x144.png">
    <link rel="icon" sizes="152x152" type="image/png" href="app/images/icons/novnc-152x152.png">
    <link rel="icon" sizes="192x192" type="image/png" href="app/images/icons/novnc-192x192.png">
    <link rel="icon" sizes="any" type="image/svg+xml" href="app/images/icons/novnc-icon.svg">
    <!-- Repeated last so that legacy handling will pick this -->
    <link rel="icon" sizes="16x16" type="image/png" href="app/images/icons/novnc-16x16.png">

<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
   
    <script src="jquery/jquery-2.1.1.js" type="text/javascript" charset="utf-8"></script>
  
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <!-- Apple iOS Safari settings -->

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <!-- Home Screen Icons (favourites and bookmarks use the normal icons) -->
    <link rel="apple-touch-icon" sizes="60x60" type="image/png" href="app/images/icons/novnc-60x60.png">
    <link rel="apple-touch-icon" sizes="76x76" type="image/png" href="app/images/icons/novnc-76x76.png">
    <link rel="apple-touch-icon" sizes="120x120" type="image/png" href="app/images/icons/novnc-120x120.png">
    <link rel="apple-touch-icon" sizes="152x152" type="image/png" href="app/images/icons/novnc-152x152.png">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="app/styles/auto.css">

     <!--
    <script type='text/javascript'
        src='http://getfirebug.com/releases/lite/1.2/firebug-lite-compressed.js'></script>
    -->

    <!-- promise polyfills promises for IE11 -->
    <script src="vendor/promise.js"></script>
    <script src="vendor/browser-es-module-loader/dist/browser-es-module-loader.js"></script>
    <script>
$(function(){
    
    $.ajax({
        url:"doexpAction/getBt.action",
        type:"post",
        data:{},
        dataType:"json",
        success:function(data){
            $.each(data, function(i,val){      
                $('#'+i).val(val);
              })
        }
    }); 
})
/* $(window).unload(function(){
    $.ajax({
        url:"doexpAction/endExp.action",
        type:"post",
        data:{'tbMonitor.flag':'N'},
        dataType:"json",
        success:function(data){
        }
    }); 
        }); */
function endExp(){
$.ajax({
    url:"doexpAction/endExp.action",
    type:"post",
    data:{},
    dataType:"json",
    success:function(data){
        javascript :history.go(-1);
    }
}); 
console.log('返回');
}

function savenote(){
    var note=$("#tb").val();
    var userid=$("#userid").text();
    var data={'tbNote.userid':userid,'tbNote.note':note};
     $.ajax({
        url:"doexpAction/addnote.action",
        type:"post",
        data:data,
        dataType:"json",
        success:function(data){
        }
    });  
    
    
    $('#dlg').dialog('close');
}
$("div.dd a").click(function(){
    
    var data={'devID':$('#devid').val(),'key':$(this).val()};
    console.log(data);
    /* $.ajax({
    url:"",
    type:"post",
    data:data,
    dataType:"json",
    success:function(data){
    }
 }); */
});

</script>
    <script type="module">
        // Load supporting scripts
        import * as WebUtil from './app/webutil.js';
        import RFB from './core/rfb.js';

        var rfb;
        var resizeTimeout;
        var desktopName;

        function UIresize() {
            if (WebUtil.getConfigVar('resize', false)) {
                var innerW = window.innerWidth;
                var innerH = window.innerHeight;
                var controlbarH = document.getElementById('noVNC_status_bar').offsetHeight;
                if (innerW !== undefined && innerH !== undefined)
                    rfb.requestDesktopSize(innerW, innerH - controlbarH);
            }
        }
        function FBUComplete(rfb, fbu) {
            UIresize();
            rfb.set_onFBUComplete(function() { });
        }
        function updateDesktopName(rfb, name) {
            desktopName = name;
        }
        function passwordRequired(rfb, msg) {
            if (typeof msg === 'undefined') {
                msg = 'Password Required: ';
            }
            var html;
            
            var form = document.createElement('form');
            form.style = 'margin-bottom: 0px';
            form.innerHTML = '<label></label>'
            form.innerHTML += '<input type=password size=10 id="password_input" class="noVNC_status">';
            form.onsubmit = setPassword;

            // bypass status() because it sets text content
            document.getElementById('noVNC_status_bar').setAttribute("class", "noVNC_status_warn");
            document.getElementById('noVNC_status').innerHTML = '';
            document.getElementById('noVNC_status').appendChild(form);
            document.getElementById('noVNC_status').querySelector('label').textContent = msg;
        }
        function setPassword() {
            rfb.sendPassword(document.getElementById('password_input').value);
            return false;
        }
        function sendCtrlAltDel() {
            rfb.sendCtrlAltDel();
            return false;
        }
        function xvpShutdown() {
            rfb.xvpShutdown();
            return false;
        }
        function xvpReboot() {
            rfb.xvpReboot();
            return false;
        }
        function xvpReset() {
            rfb.xvpReset();
            return false;
        }
        function status(text, level) {
            switch (level) {
                case 'normal':
                case 'warn':
                case 'error':
                    break;
                default:
                    level = "warn";
            }
            document.getElementById('noVNC_status_bar').setAttribute("class", "noVNC_status_" + level);
            document.getElementById('noVNC_status').textContent = text;
        }
        function updateState(rfb, state, oldstate) {
            var cad = document.getElementById('sendCtrlAltDelButton');
            switch (state) {
                case 'connecting':
                    status("Connecting", "normal");
                    break;
                case 'connected':
                    if (rfb && rfb.get_encrypt()) {
                        status("Connected (encrypted) to " +
                               desktopName, "normal");
                    } else {
                        status("Connected (unencrypted) to " +
                               desktopName, "normal");
                    }
                    break;
                case 'disconnecting':
                    status("Disconnecting", "normal");
                    break;
                case 'disconnected':
                    status("Disconnected", "normal");
                    break;
                default:
                    status(state, "warn");
                    break;
            }

            if (state === 'connected') {
                cad.disabled = false;
            } else {
                cad.disabled = true;
                xvpInit(0);
            }

        }
        function disconnected(rfb, reason) {
            if (typeof(reason) !== 'undefined') {
                status(reason, "error");
            }
        }
        function notification(rfb, msg, level, options) {
            status(msg, level);
        }

        window.onresize = function () {
            // When the window has been resized, wait until the size remains
            // the same for 0.5 seconds before sending the request for changing
            // the resolution of the session
            clearTimeout(resizeTimeout);
            resizeTimeout = setTimeout(function(){
                UIresize();
            }, 500);
        };

        function xvpInit(ver) {
            var xvpbuttons;
            xvpbuttons = document.getElementById('noVNC_xvp_buttons');
            if (ver >= 1) {
                xvpbuttons.style.display = 'inline';
            } else {
                xvpbuttons.style.display = 'none';
            }
        }

        document.getElementById('sendCtrlAltDelButton').style.display = "inline";
        document.getElementById('sendCtrlAltDelButton').onclick = sendCtrlAltDel;
        document.getElementById('xvpShutdownButton').onclick = xvpShutdown;
        document.getElementById('xvpRebootButton').onclick = xvpReboot;
        document.getElementById('xvpResetButton').onclick = xvpReset;

        WebUtil.init_logging(WebUtil.getConfigVar('logging', 'warn'));
        document.title = unescape(WebUtil.getConfigVar('title', 'noVNC'));
        // By default, use the host and port of server that served this file
        var host = WebUtil.getConfigVar('host', window.location.hostname);
       // var port = WebUtil.getConfigVar('port', window.location.port);
        var port=6080;
        // if port == 80 (or 443) then it won't be present and should be
        // set manually
        if (!port) {
            if (window.location.protocol.substring(0,5) == 'https') {
                port = 443;
            }
            else if (window.location.protocol.substring(0,4) == 'http') {
                port = 80;
            }
        }

        var password = WebUtil.getConfigVar('password', '');

        var path = WebUtil.getConfigVar('path', 'websockify/?token=host2');

        // If a token variable is passed in, set the parameter in a cookie.
        // This is used by nova-novncproxy.
        var token = WebUtil.getConfigVar('token', null);
        if (token) {
            // if token is already present in the path we should use it
            path = WebUtil.injectParamIfMissing(path, "token", token);

            WebUtil.createCookie('token', token, 1)
        }

        (function() {

            if ((!host) || (!port)) {
                status('Must specify host and port in URL', 'error');
            }

            try {
                rfb = new RFB({'target':       document.getElementById('noVNC_canvas'),
                               'encrypt':      WebUtil.getConfigVar('encrypt',
                                        (window.location.protocol === "https:")),
                               'repeaterID':   WebUtil.getConfigVar('repeaterID', ''),
                               'true_color':   WebUtil.getConfigVar('true_color', true),
                               'local_cursor': WebUtil.getConfigVar('cursor', true),
                               'shared':       WebUtil.getConfigVar('shared', true),
                               'view_only':    WebUtil.getConfigVar('view_only', false),
                               'onNotification':  notification,
                               'onUpdateState':  updateState,
                               'onDisconnected': disconnected,
                               'onXvpInit':    xvpInit,
                               'onPasswordRequired':  passwordRequired,
                               'onFBUComplete': FBUComplete,
                               'onDesktopName': updateDesktopName});
            } catch (exc) {
                status('Unable to create RFB client -- ' + exc, 'error');
                return; // don't continue trying to connect
            }

            rfb.connect(host, port, password, path);

        })();
    </script>

  </head>
  <body style="margin: 0px;overflow-x:hidden">
  <div id="noVNC_container">
            <div id="noVNC_status_bar" class="noVNC_status_bar" style="margin-top: 0px;display:none">
                <table border=0 width="100%"><tr>
                    <td><div id="noVNC_status" style="position: relative; height: auto;">
                        Loading
                    </div></td>
                    <td width="1%"><div id="noVNC_buttons">
                        <input type=button value="Send CtrlAltDel"
                            id="sendCtrlAltDelButton">
                        <span id="noVNC_xvp_buttons">
                        <input type=button value="Shutdown"
                            id="xvpShutdownButton">
                        <input type=button value="Reboot"
                            id="xvpRebootButton">
                        <input type=button value="Reset"
                            id="xvpResetButton">
                        </span>
                            </div></td>
                </tr></table>
                     
            </div> <canvas id="noVNC_canvas" width="640px" height="20px">
                            Canvas not supported.
                        </canvas>
            </div>
     <div style="background:#0573b8;float:right;width:32.5%;height:101%;margin:0px;padding:0px;">
            <!-- <iframe src="Monitor.jsp" style="width: 100%;height:100%" ></iframe></div> -->
    <div style="width: 130%;height:62%;margin:-116px 0px 0 -62px">
        <jsp:include page="Monitor.jsp"/>
        
        <div style="padding-top:10px";class="dd">
        <a id="devid" class="easyui-linkbutton" style="display:none" >devid</a>
        <div style="text-align: center;min-width: 350px;"> 
            <a id="bt0" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮1</a>
            <a id="bt1" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮2</a>
            <a id="bt2" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮3</a>
            <a id="bt3" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮4</a>
        </div>    
        <div style="text-align: center;min-width: 350px;padding-top:2px"> 
            <a id="bt4" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮5</a>
            <a id="bt5" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮6</a>
            <a id="bt6" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮7</a>
            <a id="bt7" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮8</a>
        </div>    
        <div style="text-align: center;min-width: 350px;padding-top:2px"> 
            <a id="bt8" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮9</a>
            <a id="bt9" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮10</a>
            <a id="bt10" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮11</a>
            <a id="bt11" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮12</a>
        </div>    
        <div style="text-align: center;min-width: 350px;padding-top:2px"> 
            <a id="bt12" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮13</a>
            <a id="bt13" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮14</a>
            <a id="bt14" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮15</a>
            <a id="bt15" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮16</a>
        </div>
        <hr>
        <div style="text-align: center;min-width: 350px;min-height:65px">
                <a class="easyui-linkbutton" href="javascript:void(0)" style="width:80px;height:30px;font-size: 14px;margin-top:5px" onClick="endExp()">结束实验</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" style="width:80px;height:30px;font-size: 14px;margin-top:5px" onclick="$('#dlg').dialog('open')">做个笔记</a>
        </div> 
        </div>   
    </div>
      </div>   
  </body>
  <div id="dlg" class="easyui-dialog" title="笔记"
        data-options="iconCls:'icon-save',closed:'true'"
        style="width:500px;height:600px;padding:10px;">
    <input id="tb" class="easyui-textbox" data-options="multiline:'true'" style="width:460px;height:500px"> 
    <div style="text-align: center;margin-top:10px">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="savenote()">Add</a>
    </div>
</div>
</html>
