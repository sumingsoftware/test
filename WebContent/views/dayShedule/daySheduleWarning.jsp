<%@page import="org.apache.taglibs.standard.tag.common.core.ChooseTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="com.hsbc.hktools.entity.DaySchedule"%>
<%
	List<DaySchedule> leftDayScheduleList = (List<DaySchedule>)request.getAttribute("leftDayScheduleList");
	int warningSize = leftDayScheduleList.size();
 %>
<html>
<head>
<title>日程安排信息报警</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/cssD.css" rel=stylesheet>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico17.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong> 日程安排信息报警</strong></font></td>
  </tr>
</table>
<table class="table table-hover table-striped" width="103%" border="1" cellspacing="0" cellpadding="1" bordercolorlight='#000000' bordercolordark='#FFFFFF'>
  <tr class="tablehead"> 
		<td  nowrap> 
      <div align="center">主题</div>
    </td>
	 <td>
	   <div align="center">场所</div>
		</td>
		<td>
		  <div align="center">内容</div>
		</td>
		<td>
		  <div align="center">时间</div>
		</td>
		<td>
		  <div align="center">剩余天数</div>
		</td>
  </tr>
	<c:choose>
	    <c:when test="${0 != warningSize}">
	        <c:forEach items="${leftDayScheduleList}" var="daySchedule">
	          <tr align="center"> 
			    <td width="20%" nowrap>&nbsp;<a style="color: blue;" href="editDaySchedule.mvc?dayScheduleId=${daySchedule.getDayScheduleId()}">${daySchedule.getTitle()}</a></td>
			    <td nowrap>&nbsp;${daySchedule.getPlace()}</td>
				  <td nowrap>&nbsp;${daySchedule.getContent()}</td>
				  <td nowrap>&nbsp;${daySchedule.getYear()}年${daySchedule.getMonth()}月${daySchedule.getDay()}日</td>
				  <td nowrap><font color=red>&nbsp;${daySchedule.getLeftDays()}</font></td>
			  </tr>
			</c:forEach>
	    </c:when>
	    <c:otherwise>
	        <tr><td align=center colspan=5><font color=red>当前没有日程安排信息报警!</font></td></tr>
	    </c:otherwise>
	</c:choose>
</table>
</body>
</html>