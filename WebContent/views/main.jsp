<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.lang.String" %>

<%-- <%
if session("adminName")="" then
  response.Redirect "login.jsp"
end if
%> --%>
<%
String basePath = request.getContextPath();
String dateStr = (String)request.getAttribute("dateStr");
%>

<html>
<head>
<%-- <title><%=SystemName%> ---- [<%=WebName%>出品]</title> --%>
<title>main</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/jquery-confirm.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/jquery-confirm.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script type = "text/javascript">
   $(document).ready(function(){
        $("#exitSystem").click(function(event){
			jDialog.confirm('你确定要退出系统吗？',{
			handler : function(button,dialog) {
			        parent.location.href = "views/login.jsp";
					dialog.close();
				}
			},{
				handler : function(button,dialog) {
					dialog.close();
				}
			});
		});
		
		$("#mainFrame").css("height", document.body.offsetHeight-55);
    }); 
    
    function about() 
	{ 
		window.open('about.mvc',"关于","height:150px,width:260px,help:no,status:no,scroll:no",false);
	}
	
	/* function menu(t)
	{
		var aChildren = eval("lMenu");
		for(i=0; i < aChildren.length; i++) 
		{
			aChildren[i].className = t;
	    }
	
	} */
	
	function displayOrHidden()
	{
	    var aChildren = document.getElementsByName("lMenu");
		for(i=0; i < aChildren.length; i++) 
		{
		    var className = aChildren[i].className;
		    
		    if("hidden" == className)
		    {
		        aChildren[i].className = "";
		    }
		    else
		    {
		        aChildren[i].className = "hidden";
		    }
	    }
	}

	function tick() {
		var hours, minutes, seconds;
		var intHours, intMinutes, intSeconds;
		var today;
		
		today = new Date();
		intHours = today.getHours();
		intMinutes = today.getMinutes();
		intSeconds = today.getSeconds();
		
		if (intHours == 0) 
		{
			hours = "00:";
		} 
		else if (intHours < 10) 
		{ 
			hours = "0" + intHours+":";
		} 
		else 
		{
			hours = intHours + ":";
		}
		
		if (intMinutes < 10) 
		{
			minutes = "0"+intMinutes+":";
		} 
		else 
		{
			minutes = intMinutes+":";
		}
		
		if (intSeconds < 10) 
		{
			seconds = "0"+intSeconds+" ";
		} 
		else 
		{
			seconds = intSeconds+" ";
		} 
		
		timeString = hours+minutes+seconds;
		Clock.innerHTML = timeString;
		window.setTimeout("tick();", 1000);
	}

	window.onload = tick;
</script>
</head>
<body oncontextmenu="return false">
<script src="js/myjs.js" type="text/javascript"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr> 
	  <td width="112" height="26">
	   <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	     <tr> 
	       <td height="24" align="center"><a href="http://blog.csdn.net/smshuxue" target="_blank"><font  face="Arial Black" color="#5858E6">我的CSDN</font></a></td>
	     </tr>
	   </table>
	  </td>
	  <td>
	      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="TableMenu">
	       <tr> 
	         <td width="6" height="24" align="center"><img src="images/Menu_Line2.gif" hspace="2"></td>
	         <td width="80"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr>
	               <td height="22" nowrap class="coolbutton" name="r1" buttontype="radio" onClick="ListMenu(1,2);" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_1.gif" width="14" height="14" hspace="2" align="absmiddle">通讯录管理</td>
	             </tr>
	           </table></td>
	         <!-- <td width="80"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr>
	               <td height="22" nowrap class="coolbutton" name="r1" buttontype="radio" onClick="ListMenu(1,2);" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_1.gif" width="14" height="14" hspace="2" align="absmiddle">分组管理</td>
	             </tr>
	           </table></td> -->
	         <td width="80"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" nowrap class="coolbutton" name="r1" buttontype="radio" onClick="ListMenu(3);" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_2.gif" width="14" height="14" hspace="2" align="absmiddle">日程安排管理</td>
	             </tr>
	           </table></td>
	      
	         <td width="80"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" nowrap class="coolbutton" name="r1" buttontype="radio" onClick="ListMenu(4,5);" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_5.gif" width="14" height="14" hspace="2" align="absmiddle">系统设置</td>
	             </tr>
	           </table></td>
	         <td width="13" height="24" align="right" background="images/Menu_Line1.gif"><img src="images/Menu_Line2.gif" hspace="2"></td>
	         <td width="50"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" class="coolbutton" nowrap onClick="OfficeMain.history.go(-1);" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/back.gif" width="14" height="14" hspace="2" align="absmiddle">后退</td>
	             </tr>
	           </table></td>
	         <td width="50"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" class="coolbutton" nowrap onClick="OfficeMain.history.go(1);" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/forward.gif" width="14" height="14" hspace="2" align="absmiddle">前进</td>
	             </tr>
	           </table></td>
	         <td width="50"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" class="coolbutton" nowrap onClick="OfficeMain.location.reload();" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/ref.gif" width="16" height="16" hspace="2" align="absmiddle">刷新</td>
	             </tr>
	           </table></td>
	         <td width="13" height="24" align="right" background="images/Menu_Line1.gif"><img src="images/Menu_Line2.gif" hspace="2"></td>
	         <td width="20"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" class="coolbutton" onClick="OfficeMain.location.href='desk.mvc';" nowrap title="系统简介" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_6.gif" width="16" height="16" hspace="2" align="absmiddle">系统简介</td>
	             </tr>
	           </table></td>		  
	      <!--    <td width="20"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" class="coolbutton" onClick="displayOrHidden()" id="b2" nowrap buttontype="radio" value="true" title="显示/隐藏菜单" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_6.gif" width="14" height="14" hspace="2" align="absmiddle">显示/隐藏菜单</td>
	             </tr>
	           </table></td> -->
	         <td width="13" height="24" align="right" background="images/Menu_Line1.gif"><img src="images/Menu_Line2.gif" hspace="2"></td>
	         <td width="50"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td height="22" class="coolbutton" onClick="about();" nowrap title="关于系统" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_7.gif" width="14" height="14" hspace="2" align="absmiddle">关于</td>
	             </tr>
	           </table>
	           </td>
	          <td width="50" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
	             <tr> 
	               <td id="exitSystem" height="22" nowrap class="coolbutton" title="退出系统" onMouseOver="this.bgColor='#ffffff'" onMouseOut="this.bgColor='#D6D3CE'" style="cursor:hand"><img src="images/menu_img_8.gif" width="14" height="14" hspace="2" align="absmiddle">退出</td>
	             </tr>
	           </table></td>
	         <td width="13" height="24" align="right" background="images/Menu_Line1.gif"><img src="images/Menu_Line2.gif" hspace="2"></td>
		  <td>&nbsp;</td>
	       </tr>
	    </table>
	   </td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr> 
    <td width="110" id="lMenu" name="lMenu">
	    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td valign="top" nowrap class="HollowField" id="NavMenu"></td>
	      </tr>
	    </table>
	    <script>ListMenu(1,2);</script> 
    </td>
    <td  valign="top" nowrap class="HollowField">
      <iframe  id="mainFrame" src="addCommunication.mvc" name="OfficeMain" width="100%" height="100%" scrolling="yes" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0"></iframe>
    </td>
  </tr>
  <tr> 
    <td width="110" id="lMenu" name="lMenu">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="TableMenu">
	        <tr> 
	          <td height="26" align="center"><font color="#333333">&nbsp;<span id="Clock"></span></font></td>
	        </tr>
	    </table>
    </td>
    <td  height="28" align="right" valign="top" nowrap>
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td width="100%"><table width="100%" border="0" cellspacing="0" cellpadding="1" class="TableMenu">
	              <tr> 
	                <td height="26" align="center"><font color="#0000FF">欢迎您:<span id="username"><%=request.getSession().getAttribute("adminName")%></span> 
	                  <font color="#999999">您的登录时间:<%=dateStr%></font></font></td>
	              </tr>
	            </table></td>
	          <td align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr> 
	               <%--  <td align="right">&nbsp;<span disabled style="font-size:9pt;">程序维护：<%=Author%><br>
	                  QQ：<%=QQ%>1 E-mail：<%=Email%></span></td> --%>
	              </tr>
	            </table></td>
	        </tr>
	      </table>
      </td>
  </tr>
</table>
</body>
</html>
