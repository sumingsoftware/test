<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="com.hsbc.hktools.entity.Contacts"%>
<%
	List<Contacts> leftContactsList = (List<Contacts>)request.getAttribute("leftContactsList");
	int warningSize = leftContactsList.size();
 %>
<html>
<head>
<title>生日报警</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/cssD.css" rel=stylesheet>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico54.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong> 生日报警</strong></font></td>
  </tr>
</table>
<table class="table table-hover table-striped" align="center" width="100%" border="1" cellspacing="0" cellpadding="1" bordercolorlight='#000000' bordercolordark='#FFFFFF'>
    <tr class="tablehead">
        <div align="center"><td>姓名</td></div>
        <div align="center"><td>生日</td></div>
        <div align="center"><td>对方电话</td></div>
        <div align="center"><td>距生日天数</td></div>
    </tr>
	<c:choose>
	    <c:when test="${0 != warningSize}">
	        <c:forEach items="${leftContactsList}" var="contact">
	          <tr align="center"> 
			      <td width="20%" nowrap>&nbsp;<a style="color: blue;" href="editContacts.mvc?contactsId=${contact.getId()}">${contact.getName()}</a></td>
				  <td nowrap>&nbsp;${contact.getBirthDayStr()}</td>
				  <td nowrap>&nbsp;${contact.getTelephone()}</td>
				  <td nowrap><font color=red>&nbsp;${contact.getLeftDays()}</font></td>
			  </tr>
			</c:forEach>
	    </c:when>
	    <c:otherwise>
	        <tr><td align=center colspan=3><font color=red>现在还没有人的生日进行报警!</font></td></tr>
	    </c:otherwise>
	</c:choose>
</table>
</body>
</html>