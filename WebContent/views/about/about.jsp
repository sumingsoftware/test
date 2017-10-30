<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.String"%>
<%@ page import="com.hsbc.hktools.entity.SystemInfo"%>
<html>
<%
    SystemInfo systemInfo = (SystemInfo)request.getAttribute("systemInfo");
    String systemName = systemInfo.getSystemName();
    String author = systemInfo.getAuthor();
    String qq = systemInfo.getQq();
    String email = systemInfo.getEmail();
    String webAddress = systemInfo.getWebAddress();
    String webName= systemInfo.getWebName();
    String nickName = systemInfo.getNick();
 %>
<head>
<title>关于</title>
<style type="text/css">
<!--
body {
  border:0;
  overflow:	hidden;
  margin: 0;
  font:	MessageBox;
  background-color:#D6D3CE;
}
td {  
font-size: 12px; 
line-height: 18px;
font:	MessageBox;
}
-->
</style>
</head>
<body oncontextmenu="return false">
<table border="0" cellspacing="5" cellpadding="4" width="95%" align="center">
<tr>
    <td> <fieldset style="padding-bottom:5px"><legend>关于 </legend><legend>关于 <%=systemName%></legend>
      <table border="0" cellspacing="0" cellpadding="0" width="95%" align="center">
        <tr> 
          <td align="right"><font color="#0000FF">版本：　V1.0</font></td>
        </tr>
        <tr> 
          <td width="100%">Copyright  <br>
            &copy; 2017. All Rights Reserved<br>
            <br>
            系统开发：<font color="#FF0000"><%=author %></font><br>
            QQ：<%=qq%><br>
            Email：<%=email%>
            <br>
            博客：<a href="<%=webAddress%>" target="_blank"><%=webAddress%></a> <br>
             网名：<%=webName%> <br>
    英文名：<%=nickName%><br>
            <br>
          </td>
        </tr>
      </table>
 </fieldset>
 </td>
</tr>
<tr>
    <td align="right" valign="top">
<input type="button" class="buttons" value=" 确定 " onClick="window.close()"></td>
</tr>
</table>
</body>
</html>
