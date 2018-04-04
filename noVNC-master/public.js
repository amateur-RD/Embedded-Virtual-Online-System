function getcookie(name)
{
	var strCookie=document.cookie;
    var arrCookie=strCookie.split('; ');
    for (var i=0;i<arrCookie.length;i++)
    {
		var arr=arrCookie[i].split('=');
        if (arr[0]==name)
			return unescape(arr[1]);
    }
    return '';
}
function setcookie(name,value,expirehours)
{
	var cookieString=name+'='+escape(value);
    if (expirehours>0)
    {
		var date=new Date();
        date.setTime(date.getTime()+expirehours*3600*1000);
        cookieString=cookieString+'; expires='+date.toGMTString();
	}
    document.cookie=cookieString;
}
function setDocTitle(name)
{
	top.document.title = name;
}

//��ֹF5ˢ��
var check=function(e){
   e=e||window.event;
   //alert(e.which||e.keyCode);
   if((e.which||e.keyCode)==116){
    if(e.preventDefault){
    e.preventDefault();}
    else{event.keyCode = 0;
     e.returnValue=false;} 
   } 
}
if(document.addEventListener){
   document.addEventListener("keydown",check,false);
}
else{
   document.attachEvent("onkeydown",check);
}

var language=getcookie('language');
if (language==''){
		if (navigator.appName == 'Netscape') 
				language = navigator.language; 
		else 
				language = navigator.browserLanguage; 	
		language=language.toLowerCase();
		if (language.indexOf('zh-cn') > -1) 
			language = 'simple_chinese'; 
		else 
			language = 'english'; 	
}

if (language=='simple_chinese')
	document.write('<script src="simple_chinese/string.js"><\/script><script src="simple_chinese/oem.js"><\/script>');
else
	document.write('<script src="english/string.js"><\/script><script src="english/oem.js"><\/script>');
	
	
function reboot()
{
	var url;
	if (confirm(_sure_reboot))
	{
		top.reboot_seconds = 30;
		url='reboot.cgi?next_url=reboot.htm';
		url+='&loginuse='+loginuser+'&loginpas='+encodeURIComponent(loginpass);
		//$.getScript(url);
		location=url;
	}
}
function restore_factory()
{
	var url;
	if (confirm(_sure_restore))
	{
		top.reboot_seconds = 30;
		url='restore_factory.cgi?next_url=rebootme.htm';
		url+='&loginuse='+loginuser+'&loginpas='+encodeURIComponent(loginpass);
		//$.getScript(url);
		location=url;
	}
}

	
function removeSelfClass(){
	$("#dd-status", parent.document).removeClass("selected");
	$("#dd-alias", parent.document).removeClass("selected");
	$("#dd-datetime", parent.document).removeClass("selected");
	//$("#dd-media", parent.document).removeClass("selected");
	$("#dd-recordpath", parent.document).removeClass("selected");
	
	$("#dd-alarm", parent.document).removeClass("selected");
	$("#dd-mail", parent.document).removeClass("selected");
	$("#dd-ftp", parent.document).removeClass("selected");
	$("#dd-log", parent.document).removeClass("selected");
	
	$("#dd-ip", parent.document).removeClass("selected");
	$("#dd-ap", parent.document).removeClass("selected");
	$("#dd-wireless", parent.document).removeClass("selected");
	$("#dd-ddns", parent.document).removeClass("selected");
	
	
	$("#dd-ptz", parent.document).removeClass("selected");
	
	$("#dd-multidev", parent.document).removeClass("selected");
	$("#dd-user", parent.document).removeClass("selected");
	$("#dd-upgrade", parent.document).removeClass("selected");

}
var PRI_REFUSE=0;
var PRI_VISITOR=1;
var PRI_OPERATOR=2;
var PRI_ADMINISTRATOR=255;