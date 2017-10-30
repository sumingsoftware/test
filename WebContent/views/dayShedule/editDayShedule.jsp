<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
  if session("adminName")="" then  '如果管理员还没有登陆就跳转到登陆页面
    Response.Redirect "../login.asp"
	End if
	
	dim title,place,content,year,month,day,daySheduleId
	daySheduleId = Request("IID") '取得待修改信息的id号
  if Request("submit") <> "" then '如果submit变量的不为空则要求进行新日程安排信息的添加
	  title = Request("title") '取得日程安排主题
	  place = Request("place") '取得日程安排地点
	  content = Request("content") '取得日程安排内容
	  year = Trim(Request("year"))
	  month = Trim(Request("month"))
	  day = Trim(Request("day")) 
	  sql = "update dayShedule set title='" & title & "',place='" & place & "',content='" & content &_
					"',year=" & year & ",month=" & month & ",day=" & day & " where daySheduleId=" & daySheduleId
		objConn.Execute(sql)
		Response.Write "<script>('日程安排信息更新成功!');</script>"
	end if
	
	set daySheduleRs = objConn.Execute("select * from dayShedule where daySheduleId=" & daySheduleId)
%> --%>
<%@ page import="com.hsbc.hktools.entity.DaySchedule"%>
<%@ page import="java.lang.String"%>

<%
    request.setCharacterEncoding("UTF-8");
    DaySchedule daySchedule = (DaySchedule)request.getAttribute("daySchedule");
    int dayScheduleId = daySchedule.getDayScheduleId();
    String title = daySchedule.getTitle();
    String place = daySchedule.getPlace();
    String content = daySchedule.getContent();
 %>
<html>
<head>
<link href="css/jquery-confirm.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script type="text/javascript">
function checkForm() {
  if (document.form1.title.value == "") {
      jDialog.alert("主题信息不能为空!");
	  document.form1.title.focus();
	  return false;
	}
	
	jDialog.alert('更新成功!');
	return true;
}

	/* $(document).ready(function(){ 
	    $("form").submit(function(e){
		     alert('更新成功!');
		});
	}); */
</script>
</head>
<body>
<table width="98%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico29.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong> 日程安排信息修改</strong></font></td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	  <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" class="TableMenu">
	  <form name="form" method="post" onsubmit="return checkForm();" action="editDayScheduleSubmit.mvc?dayScheduleId=<%=dayScheduleId%>">
      <tr>
	    <td height="30" style="font-size:14px" colspan="2"><img src="images/ADD.gif" border="0" hspace="2" align="absmiddle">日程安排信息修改 <font size="-1">(带<font color=red>*</font>号的为必填项)</font></td>
      </tr>
      <tr>
        <td  class="a3">主题:</td>
		    <td>
			   <input type="text" name="title" value='<%=title%>' size=30>&nbsp;&nbsp;<font color="red">*</font>
				</td>
      </tr>
		  <tr>
		    <td>地点:</td>
			  <td>
			    <input type="text" name="place" value='<%=place%>' size=20>
			  </td>
			</tr>
		 <tr>
		    <td>内容:</td>
			  <td>
			    <textarea cols=40 rows=5 name="content"><%=content%></textarea>
				</td>
		 </tr>
		 <tr>
		   <td>时间:</td>
			 <td>&nbsp;
			     <select name="year">
			       <c:forEach begin="2017" end="2026" var="i">
			           <c:choose>
			               <c:when test="${i == daySchedule.getYear()}">
			                   <option value='${i}' selected>${i}</option>
			               </c:when>
			               <c:otherwise>
			                   <option value="${i}">${i}</option>
			               </c:otherwise>
			           </c:choose>
			       </c:forEach>
				 </select>年
				 <select name="month">
				 	<c:forEach begin="1" end="12" var="i">
			           <c:choose>
			               <c:when test="${i == daySchedule.getMonth()}">
			                   <option value="${i}" selected>${i}</option>
			               </c:when>
			               <c:otherwise>
			                   <option value="${i}">${i}</option>
			               </c:otherwise>
			           </c:choose>
			        </c:forEach>
				 </select>月
				 <select name="day">
					<c:forEach begin="1" end="31" var="i">
			           <c:choose>
			               <c:when test="${i == daySchedule.getDay()}">
			                   <option value="${i}" selected>${i}</option>
			               </c:when>
			               <c:otherwise>
			                   <option value="${i}">${i}</option>
			               </c:otherwise>
			           </c:choose>
			        </c:forEach>
				 </select>日
			 </td>
		 </tr>
      <tr bgcolor="#ffffff">
        <td height="30" colspan="4" align="center">
		  <input type="hidden" id="dayScheduleId" name="dayScheduleId" value='<%=dayScheduleId%>'>
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