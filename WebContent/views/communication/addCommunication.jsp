<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hsbc.hktools.entity.GroupName" %>
<%
	request.setCharacterEncoding("UTF-8");
	List<GroupName> groupNameList = (List<GroupName>)request.getAttribute("groupNameList");
 %>
<html>
<head>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script type="text/javascript">
	function checkForm() {
	  if (document.form1.name.value == "") {
	      jDialog.alert("姓名不能为空!");
		  document.form1.name.focus();
		  return false;
		}
		
		jDialog.alert('添加成功!');
		return true;
	}
</script>
</head>
<table width="100%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico55.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong> 通讯信息添加</strong></font></td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	  <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" class="TableMenu">
	  <form name="form1" method="post" onsubmit="return checkForm();" action="addContactSubmit.MVC">
      <tr>
	    <td height="30" style="font-size:14px" colspan="2"><img src="images/ADD.gif" border="0" hspace="2" align="absmiddle">通讯信息添加 <font size="-1">(带<font color=red>*</font>号的为必填项)</font></td>
      </tr>
      <tr>
        <td  class="a3">姓名:</td>
		    <td>
			   <input id="name" type="text" name=name size=30>&nbsp;&nbsp;<font color=red>*</font>
				</td>
      </tr>
		  <tr>
        <td  class="a3">性别:</td>
		    <td>
			    <select name=sex id="sex">
				   <option value="男">男</option>
					 <option value="女">女</option>
				  </select>
				</td>
      </tr>
		 <tr>
		   <td>生日:</td>
			 <td>
			  <select name="year" id="year">
					 <c:forEach begin="1920" step="1" end="2017" var="i">
					     <option value='${i}'>${i}</option>
					 </c:forEach>
				 </select>年
				 <select name="month" id="month">
					 <c:forEach begin="1" step="1" end="12" var="i">
					     <option value='${i}'>${i}</option>
					 </c:forEach>
				 </select>月
				 <select name="day" id="day">
					 <c:forEach begin="1" step="1" end="31" var="i">
					     <option value='${i}'>${i}</option>
					 </c:forEach>
				 </select>日
			 </td>
		 </tr>
		 <tr>
		   <td  class="a3">所属分组:</td>
			 <td>
				 <select name=groupId id="groupId">
					 <c:forEach items="${groupNameList}" var="groupNameVar">
					     <option value='${groupNameVar.groupId}'>${groupNameVar.groupName}</option>
					 </c:forEach>
				 </select>
			 </td>
	   </tr>
		 <tr>
		   <td>电话:</td>
			 <td>
				 <input id="telephone" type="text" name=telephone size=20>
			 </td>
		 </tr>
		 <tr>
		   <td>QQ:</td>
			 <td>
				 <input id="qq" type="text" name="qq" size=20>
			 </td>
		 </tr>
		 <tr>
		   <td>Email:</td>
			 <td>
			   <input id="email" type="text" name="email" size=20>
			 </td>
		 </tr>
		 <tr>
			  <td>工作地点:</td>
			  <td><input id="workPlace" type="text" name="workPlace" size=50></td>
			</tr>
		 <tr>
			  <td>居住地址:</td>
			  <td><input id="address" type="text" name="address" size=50></td>
			</tr>
      <tr bgcolor="#ffffff">
        <td height="30" colspan="4" align="center"><input name="submit"  type="submit" value=" 确认添加 ">
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