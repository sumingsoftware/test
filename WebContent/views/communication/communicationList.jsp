<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hsbc.hktools.entity.GroupName" %>
<%@ page import="com.hsbc.hktools.entity.Contacts" %>
<%@ page import="java.util.List" %>
<%
	int intPage = Integer.parseInt(request.getAttribute("intPage").toString());
	int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
    List<GroupName> groupNameList = (List<GroupName>)request.getAttribute("groupNameList");
    List<Contacts> contactsList = (List<Contacts>)request.getAttribute("contactsList");
    int pageSize = 10;
 %>
<html>
<head>
<title>通讯信息列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/cssD.css" rel=stylesheet>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/select2.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script src="js/select2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function checkNum()
	{
		rNum=0;
		var actID=document.all.contactCheckBox;
		for(i=0;i<actID.length;i++){
			if(actID[i].checked==true){
				rNum=rNum +1 ;
			}
		}
		return rNum;
	}
	function checkAll()
	{
		var actID=document.all.contactCheckBox;
		if(document.form1.checkall.checked==false){
			for(i=0;i<actID.length;i++){
				actID[i].checked=false;
			}
		}else{
			for(i=0;i<actID.length;i++){
				actID[i].checked=true;
			}
		}
	}
	function modify()
	{
		if(checkNum()!=1)
		{
			//alert("最多只能选择一个联系人.");
			jDialog.alert("最多只能选择一个联系人.");	
		}
		else if(checkNum() ==0)
		{
		    //alert("至少选择一个联系人。");
		    jDialog.alert("至少选择一个联系人。");	
		}
		else{
		    var selectedContactId;
		    var actID=document.all.contactCheckBox;
		    
			for(i=0;i<actID.length;i++){
				if(actID[i].checked==true){
					selectedContactId = actID[i].value;
					break;
				}
		    }
			document.form1.action="editContacts.mvc?contactsId=" + selectedContactId;
			document.form1.submit();
		}
	}
	
	function formsubmit(page)
	{
		str=document.form1;
		str.page.value=page;
		str.submit();
	}
	function changepage()
	{
		str=document.form1;
		str.page.value=str.selectpage.value;
		str.submit();
	}
    
    function checkSelectAll()
	{
	    if(document.form1.checkall.checked==false && checkNum() == <%=pageSize%>)
	    {
	        document.form1.checkall.checked=true;
	    }
	    else if(document.form1.checkall.checked==true && checkNum() != <%=pageSize%>)
	    {
	        document.form1.checkall.checked=false;
	    }
	}
	
	function deleteContacts()
	{
	    if(checkNum() ==0)
		{
		    //alert("至少选择一个联系人。");
		    jDialog.alert("至少选择一个联系人。");	
		}
		else
		{
		    var actID=document.all.contactCheckBox;
		    var requestStr = "deleteContacts.mvc?contactIds=";
		    
			for(i=0;i<actID.length;i++){
				if(actID[i].checked==true){
					requestStr = requestStr + actID[i].value + ",";
				}
		    }
		    
		    if("," == requestStr.indexOf(requestStr.length - 1))
		    {
		        requestStr = requestStr.substring(0, requestStr.length - 1);
		    }
		    
			//alert("删除成功。");
			jDialog.confirm('确定删除？',{
				handler : function(button,dialog) {
					    document.form1.action=requestStr;
			            document.form1.submit();
			            //jDialog.alert("删除成功!");		
					}
				},{
					handler : function(button,dialog) {
						dialog.close();
					}
			});
		}
	}
	
	function getFilter()
	{
	    if((document.form1.name.value=="" || document.form1.name.value.trim()=="") &&
	    (document.form1.groupId.value=="" || document.form1.groupId.value.trim()==""))
        {
           //alert("请输入过滤条件。");
           jDialog.alert("请输入过滤条件。");	
        }
        else
        {
            document.form1.action="filterContactList.mvc?name=" + document.form1.name.value + "&groupId=" + document.form1.groupId.value;
			document.form1.submit();
        }
	}
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico12.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong> 通讯信息列表</strong></font></td>
  </tr>
</table>
<table class="table table-hover table-striped" width="100%" border="1" cellspacing="0" cellpadding="1" bordercolorlight='#000000' bordercolordark='#FFFFFF'>
 <form name="form1" method="post">
 <tr> 
	<td  align="left" height="22" colspan="10" bgcolor="#ffffff"> 
		姓名:<input type="text" name="name" size="20" class="input">&nbsp;
		所在分组:
  		<select name="groupId" style="border: solid 1px;">
		    <option value="">选择所在分组</option>
				 <c:forEach items="${groupNameList}" var="groupNameVar">
				     <option value="${groupNameVar.getGroupId()}">${groupNameVar.getGroupName()}</option>
				 </c:forEach>
			</select>
		<input type="button" value=" 检索 " class="button1" onclick="getFilter()">
	<td>
 </tr>
  <tr class="tablehead"> 
    <td width="4%">
    <c:choose>
        <c:when test="${0 == contactsList.size()}">
              <input type="checkbox" name="checkall" value="1" onclick="checkAll();" disabled="true">
        </c:when>
        <c:otherwise>
              <input type="checkbox" name="checkall" value="1" onclick="checkAll();">
        </c:otherwise>
    </c:choose>
    <input type="checkbox" name="connectPersonId" value="0" disabled style="display:none;">
    </td>
		<td  nowrap> 
      <div align="center">姓名</div>
    </td>
	 <td>
	   <div align="center">性别</div>
		</td>
		<td>
		  <div align="center">生日</div>
		</td>
		<td>
		  <div align="center">所在分组</div>
		</td>
		<td>
		  <div align="center">电话</div>
		</td>
		<td>
		  <div align="center">QQ</div>
		</td>
		<td>
		  <div align="center">Email</div>
		</td>
		<td  nowrap> 
      <div align="center">工作地点</div>
    </td>
    <td  nowrap> 
      <div align="center">居住地址</div>
    </td>
  </tr>
     <c:choose>
      <c:when test="${contactsList.size() > 0}">
            <c:forEach items="${contactsList}" var="contact">
                <tr align="center"> 
				    <td width="4%" class="tablehead">
					    <input type="checkbox" name="contactCheckBox" value="${contact.getId()}" onchange="checkSelectAll()">
					</td>
					<td nowrap>&nbsp;<a style="color: blue;" href="editContacts.mvc?contactsId=${contact.getId()}">${contact.getName()}</a></td>
					<td nowrap>&nbsp;${contact.getSex()}</td>
					<td nowrap>&nbsp;${contact.getBirthDayStr()}</td>
					<td nowrap>&nbsp;${contact.getGroupName()}</td>
					<td nowrap>&nbsp;${contact.getTelephone()}</td>
					<td nowrap>&nbsp;${contact.getQq()}</td>
					<td nowrap>&nbsp;${contact.getEmail()}</td>
					<td nowrap>&nbsp;${contact.getWorkplace()}</td>
					<td nowrap>&nbsp;${contact.getAddress()}</td>
			    </tr>
            </c:forEach>
      </c:when>
      <c:otherwise>
          <tr align="center"> 
			  <td colspan="10">没有联系人</td>
		  </tr>
      </c:otherwise>
  </c:choose>
    <input type="hidden" name="meth" value="del">
  <tr> 
	  <td  align="left" height="22" colspan="12" bgcolor="#ffffff"> 
			<c:choose>
			      <c:when test="${intPage == 1 || intPage == 0}">
			          "前一页"
			      </c:when>
			      <c:otherwise>
			          <a href="javascript:formsubmit('<%=intPage - 1%>');">前一页</a> 
			      </c:otherwise>
		      </c:choose>
		        &nbsp;&nbsp; 
     		  <c:choose>
			      <c:when test="${intPage == pageCount || pageCount == 0}">
			          "下一页"
			      </c:when>
			      <c:otherwise>
			          <a href="javascript:formsubmit('<%=intPage + 1%>');">下一页</a> 
			      </c:otherwise>
		      </c:choose>
		        &nbsp; 转向 
		        <select name="selectpage" onchange="changepage();">
		          <c:choose>
		              <c:when test="${pageCount <= 0}">
		                  <option value="">无</option>
		              </c:when>
		              <c:otherwise>
		                  <c:forEach begin="1" end="${pageCount}" step="1" var="variable">
		                      <c:choose>
		                          <c:when test="${intPage == variable}">
		                              <option value="${variable}" selected>${variable}</option>
		                          </c:when>
		                          <c:otherwise>
		                              <option value="${variable}">${variable}</option>
		                          </c:otherwise>
		                      </c:choose>
		                  </c:forEach>
		              </c:otherwise>
		          </c:choose>
		        </select>页
		      </td>
		    </tr>
	    <input type="hidden" name="page" value="">
  <tr align="center"> 
	  <td colspan="10">
	  	<input type="button" value=" 添加 " class="button" onclick="location.href='addCommunication.mvc';">&nbsp;<input type="button" value=" 删除 " class="button" onclick="deleteContacts()">&nbsp;<input type="button" value=" 修改 " class="button" onclick="modify();">
	  </td>
  </tr>
    </form>
</table>
</body>
</html>