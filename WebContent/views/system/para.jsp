<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.hsbc.hktools.entity.SystemInfo" %>
<%@ page import="java.lang.String" %>
<% 
SystemInfo systemInfo = (SystemInfo)request.getAttribute("systemInfo");
String systemName = systemInfo.getSystemName();
String author = systemInfo.getAuthor();
String qq = systemInfo.getQq();
String telephoneNumber = systemInfo.getTelephoneNumber();
String email = systemInfo.getEmail();
String webAddress = systemInfo.getWebAddress();
String webName = systemInfo.getWebName();
int id = systemInfo.getId();
String nick = systemInfo.getNick();
%>
<html>
<head>
<title><spring:message code="message.system.parameter.config"/></title>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
	    $("form").submit(function(e){
		     jDialog.alert('更新成功!');
		});
	});
</script>
</head>
<body>
<table width="98%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico29.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong>系统参数设置</strong></font></td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	  <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" class="TableMenu">
	  <form name="form" method="post" onsubmit="return checkForm();" action="updateSystemInfo.mvc">
      <tr>
        <td  class="a3"><spring:message code="message.system.systemname"/></td>
		    <td>
			   <input type="text" name="systemName" value='<%= systemName%>' size=30>&nbsp;&nbsp;
				</td>
      </tr>
		  <tr>
		    <td>开发者:</td>
			  <td>
			    <input type="text" name="author" value="<%= author%>" size=20>
			  </td>
			</tr>
		  <tr>
		    <td>曾用名:</td>
			  <td>
			    <input type="text" name="nick" value="<%= nick%>" size=20>
			  </td>
			</tr>
			<tr>
		    <td>开发者QQ:</td>
			  <td>
			    <input type="text" name="qq" value='<%= qq%>' size=20>
			  </td>
			</tr>
			<tr>
		    <td>开发者电话:</td>
			  <td>
			    <input type="text" name="telephoneNumber" value='<%= telephoneNumber%>' size=20>
			  </td>
			</tr>
			<tr>
		    <td>开发者Email:</td>
			  <td>
			    <input type="text" name="email" value='<%= email%>' size=30>
			  </td>
			</tr>
		  <tr>
		    <td>网址:</td>
			  <td>
			    <input type="text" name="webAddress" value='<%= webAddress%>' size=30>
			  </td>
			</tr>
			<tr>
		    <td>网站名称:</td>
			  <td>
			    <input type="text" name="webName" value='<%= webName%>' size=30>
			  </td>
			</tr>
      <tr bgcolor="#ffffff">
        <td height="30" colspan="4" align="center">
     	  <input type="hidden" id="systemInfoId" name="systemInfoId" value='<%=id%>'>
		  <input name="submit"  type="submit" value=" 确认更新 ">
		  <input type="reset" value=" 重新填写 ">
		  </td>
      </tr>
	  </form>
	  </table>
	</td>
  </tr>	  	    
</table>
</body>
</html>