<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
  if session("adminName")="" then  '如果管理员还没有登陆就跳转到登陆页面
    Response.Redirect "../login.asp"
	End if
	
	id = Request("IID") '取得待修改的通讯信息id
	dim name,sex,birthday,groupId,telephone,qq,email,workPlace,address,sql
	if Request("submit") <> "" then '如果submit变量的不为空则要求进行新联系人信息的添加
	  name = Trim(Request("name")) '获取姓名
	  sex = Trim(Request("sex")) '获取性别
	  birthday = Trim(Request("year")) & "-" & Trim(Request("month")) & "-" & Trim(Request("day"))  '获取生日
	  groupId = Trim(Request("groupId")) '获取分组id
	  telephone = Trim(Request("telephone")) '获取电话信息
	  qq = Trim(Request("qq")) '获取qq信息
	  email = Trim(Request("email")) '获取Email信息
	  workPlace = Trim(Request("workPlace")) '获取工作地点信息
	  address = Trim(Request("address")) '获取居住地址
	  
	  sql = "update AddressBook set name = '" & name & "',sex = '" & sex & "',birthday ='" & birthday & "',groupId =" &_
					groupId & ",telephone = '" & telephone & "',qq = '" & qq & "',email = '" & email & "',workPlace = '" &_
					workPlace & "',address = '" & address & "' where id = " & id
		objConn.Execute(sql)
		Response.Write "<script>('通讯信息更新成功!');</script>"
	end if
	
	set AddressBookRs = objConn.Execute("select * from AddressBook where id=" & id)
%> --%>
<%@ page import="java.lang.String"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="java.lang.Boolean"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hsbc.hktools.entity.Contacts"%>
<%@ page import="com.hsbc.hktools.entity.GroupName"%>

<%
    request.setCharacterEncoding("UTF-8");
    Contacts contact = (Contacts)request.getAttribute("contacts");
    List<GroupName> groupNameList = (List<GroupName>)request.getAttribute("groupNameList");
    int contactId = contact.getId();
    boolean isMan = (Boolean)request.getAttribute("isMan");;
    
    String name = contact.getName();
    Date birthDay = contact.getBirthday();
    
    int year = (Integer)request.getAttribute("year");
	int month = (Integer)request.getAttribute("month");
	int day = (Integer)request.getAttribute("day");
    
    String telephone = contact.getTelephone();
    String qq = contact.getQq();
    String email = contact.getEmail();
    String workPlace = contact.getWorkplace();
    String address = contact.getAddress();
    
    int groupId = contact.getGroupId();
    String groupName = contact.getGroupName();
 %>
<html>
<head>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script type="text/javascript">
var issubmmit = false;

function checkForm() {
  if (document.form1.name.value == "") {
      jDialog.alert("联系人姓名输入不能为空!");		
	  document.form1.name.focus();
	  return false;
	}
	
	issubmmit = true;
	return true;
}

    $(document).ready(function(){
        $("form").submit(function(e){
		     //alert('编辑成功!');
		     
		     if(issubmmit)
		     {
		         jDialog.alert("编辑成功!")
		     }
		});
     }
    );
</script>
</head>
<body>
<table width="98%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico29.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong> 联系人信息更新</strong></font></td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	  <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" class="TableMenu">
	  <form name="form1" method="post" onsubmit="return checkForm();" action="updateContactSubmit.mvc">
      <tr>
	    <td height="30" style="font-size:14px" colspan="2"><img src="images/ADD.gif" border="0" hspace="2" align="absmiddle">联系人信息添加 <font size="-1">(带<font color=red>*</font>号的为必填项)</font></td>
      </tr>
      <tr>
        <td  class="a3">姓名:</td>
		    <td>
			   <input type="text" name=name size=30 value="<%=name%>">&nbsp;&nbsp;<font color=red>*</font>
				</td>
      </tr>
		  <tr>
        <td  class="a3">性别:</td>
		    <td>
			    <select name=sex>
					 <c:choose>
					     <c:when test="${isMan}">
					         <option value="男" selected>男</option>
					         <option value="女">女</option>
					     </c:when>
					     <c:otherwise>
					         <option value="女" selected>女</option>
					         <option value="男">男</option>
					     </c:otherwise>
					 </c:choose>
				  </select>
				</td>
      </tr>
		 <tr>
		   <td>生日</td>
			 <td>
			  <select name=year>
					 <c:forEach begin="1921" end="2027" step="1" var="i">
					     <c:choose>
					         <c:when test="${year == i}">
					             <option value="${i}" selected>${i}</option>
					         </c:when>
					         <c:otherwise>
					             <option value="${i}">${i}</option>
					         </c:otherwise>
					     </c:choose>
					 </c:forEach>
				 </select>年
				 <select name=month>
					 <c:forEach begin="1" end="12" step="1" var="i">
					     <c:choose>
					         <c:when test="${month + 1 == i}">
					             <option value="${i}" selected>${i}</option>
					         </c:when>
					         <c:otherwise>
					             <option value="${i}">${i}</option>
					         </c:otherwise>
					     </c:choose>
					 </c:forEach>
				 </select>月
				 <select name=day>
					 <c:forEach begin="1" end="31" step="1" var="i">
					     <c:choose>
					         <c:when test="${day == i}">
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
		 <tr>
		   <td  class="a3">所属分组:</td>
			 <td>
				 <select name=groupId>
					 <c:forEach items="${groupNameList}" var="group">
					     <c:choose>
					         <c:when test="${groupId == group.getGroupId()}">
					             <option value="${group.getGroupId()}" selected>${group.getGroupName()}</option>
					         </c:when>
					         <c:otherwise>
					             <option value="${group.getGroupId()}">${group.getGroupName()}</option>
					         </c:otherwise>
					     </c:choose>
					 </c:forEach>
				 </select>
			 </td>
	   </tr>
		 <tr>
		   <td>电话</td>
			 <td>
				 <input type="text" name=telephone value="<%=telephone%>" size=20>
			 </td>
		 </tr>
		 <tr>
		   <td>QQ</td>
			 <td>
				 <input type="text" name=qq value="<%=qq%>" size=20>
			 </td>
		 </tr>
		 <tr>
		   <td>Email</td>
			 <td>
			   <input type="text" name=email value="<%=email%>" size=20>
			 </td>
		 </tr>
		 <tr>
			  <td>工作地点:</td>
			  <td><input type="text" name=workPlace value="<%=workPlace%>" size=50></td>
			</tr>
		 <tr>
			  <td>居住地址:</td>
			  <td><input type="text" name=address value="<%=address%>" size=50></td>
			</tr>
      <tr bgcolor="#ffffff">
        <td height="30" colspan="4" align="center">
		  <input type="hidden" name="contactId" value=<%=contactId%>>
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