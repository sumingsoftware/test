<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.Integer"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hsbc.hktools.entity.DaySchedule"%>
<% 
int intPage = Integer.parseInt(request.getAttribute("intPage").toString());
int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
List<DaySchedule> dayScheduleList = (List<DaySchedule>)request.getAttribute("dayScheduleList");
int pageSize = 10;
%>
<%-- <%
	meth=request("meth")
	if meth="del" and request("IID")<>"" then
		strsql="delete from dayShedule where daySheduleId in (" & request("IID") &")" '删除日程安排信息
		objConn.execute strsql
	end if
	title = Request("title") '取得搜索的日程安排的主题的关键字
	strsql="select * from dayShedule where 1=1"
	if  title <> "" then
	  strsql=strsql & " and title like '%" & title & "%'"
	end if
	strsql=strsql & " order by daySheduleId desc"
	'response.write strsql
	Set objRs = Server.CreateObject("adodb.recordset")
	objRs.Open strsql,objConn,1,1
	'set objRs = objConn.Execute(strsql)
	If Request("Page") = "" Then
		intPage = 1
	Else
		intPage = Clng(Request("Page"))
	End If
	objRs.PageSize = 15 '设置每页显示的记录数
	If intPage > objRs.PageCount Then
		intPage = objRs.PageCount
	End If
	If intPage <= 0 Then
		intPage = 1
	End If
	If Not objRs.EOF Then
		objRs.AbsolutePage = intPage
	End If
%> --%>
<html>
<head>
<title>日程安排信息列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/cssD.css" rel=stylesheet>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script>
	String.prototype.trim = function() { 
	  return this.replace(/(^\s*)|(\s*$)/g, ''); 
	}; 

	function checkNum()
	{
		rNum=0;
		var actID=document.all.dayScheduleSelected;
		for(i=0;i<actID.length;i++){
			if(actID[i].checked==true){
				rNum=rNum +1 ;
			}
		}
		return rNum;
	}
	function checkAll()
	{
		var actID=document.all.dayScheduleSelected;
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
			//alert("最多只能选择一个日程进行修改。");
			jDialog.alert("最多只能选择一个日程进行修改。");	
		}
		else if(checkNum() ==0)
		{
		    //alert("至少选择一个日程。");
		    jDialog.alert("至少选择一个日程。");	
		}
		else{
		    var selectedDayScheduleId;
		    var actID=document.all.dayScheduleSelected;
		    
			for(i=0;i<actID.length;i++){
				if(actID[i].checked==true){
					selectedDayScheduleId = actID[i].value;
					break;
				}
		    }
		    
			document.form1.action="editDaySchedule.mvc?dayScheduleId=" + selectedDayScheduleId;
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
    
    function deleteDaySchedule()
    {
        if(checkNum() ==0)
		{
		    //alert("至少选择一个日程。");
		    jDialog.alert("至少选择一个日程。");	
		}
		else
		{
		    var actID=document.all.dayScheduleSelected;
		    var requestStr = "deleteDaySchedule.mvc?dayScheduleIds=";
		    
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
        if(document.form2.title.value=="" || document.form2.title.value.trim()=="")
        {
           //alert("请输入过滤条件。");
           jDialog.alert("请输入过滤条件。");
        }
        else
        {
            document.form2.action="filterDaySheduleList.mvc?title=" + document.form2.title.value;
			document.form2.submit();
        }
    }
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico06.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong> 日程安排信息列表</strong></font></td>
  </tr>
</table>
<table width="103%" border="1" cellspacing="0" cellpadding="1" bordercolorlight='#000000' bordercolordark='#FFFFFF'>
 <form name="form2" method="post" action="filterDaySheduleList.mvc">
 <tr> 
	<td  align="left" height="22" colspan="10" bgcolor="#ffffff"> 
		主题:<input type="text" name="title" size="20" class="input">&nbsp;
		<input type="button" value=" 检索 " name="filter" class="button1" onclick="getFilter()">
		<input type="hidden" name="pageSize" value="10">
	    <input type="hidden" name="page" value="<%=intPage%>">
	<td>
 </tr>
 </form>
 </table>
<table width="103%" class="table table-hover table-striped" border="1" cellspacing="0" cellpadding="1" bordercolorlight='#000000' bordercolordark='#FFFFFF'>
 <form name="form1" method="post">
 <input type="hidden" name="pageSize" value="10">
 <!-- <tr> 
	<td  align="left" height="22" colspan="10" bgcolor="#ffffff"> 
		主题:<input type="text" name="title" size="20" class="input">&nbsp;
		<input type="submit" value=" 检索 " class="button1">
	<td>
 </tr> -->
  <tr class="tablehead"> 
    <td width="6%">
    <c:choose>
        <c:when test="${0 == dayScheduleList.size()}">
              <input type="checkbox" name="checkall" value="1" onclick="checkAll();" disabled="true">
        </c:when>
        <c:otherwise>
              <input type="checkbox" name="checkall" value="1" onclick="checkAll();">
        </c:otherwise>
    </c:choose>
    <label for="checkall">全选</label>
    <input type="checkbox" name="daySheduleId" value="0" disabled style="display:none;">
    </td>
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
  </tr>
  <c:choose>
      <c:when test="${dayScheduleList.size() > 0}">
            <c:forEach items="${dayScheduleList}" var="daySchedule">
                <tr align="center"> 
				    <td width="4%" class="tablehead"><input type="checkbox" name="dayScheduleSelected" value="${daySchedule.getDayScheduleId()}" onchange="checkSelectAll()"></td>
				    <td width="20%" nowrap>&nbsp;<a style="color: blue;" href="editDaySchedule.mvc?dayScheduleId=${daySchedule.getDayScheduleId()}">${daySchedule.getTitle()}</a></td>
				    <td nowrap>&nbsp;${daySchedule.getPlace()}</td>
					<td nowrap>&nbsp;${daySchedule.getContent()}</td>
					<td nowrap>&nbsp;${daySchedule.getYear()}年${daySchedule.getMonth()}月${daySchedule.getDay()}日</td>
			    </tr>
            </c:forEach>
      </c:when>
      <c:otherwise>
          <tr align="center"> 
			  <td colspan="9">没有日程安排信息</td>
		  </tr>
      </c:otherwise>
  </c:choose>
    <input type="hidden" name="meth" value="del">
  <tr> 
		      <td  align="left" height="22" colspan="10" bgcolor="#ffffff"> 
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
	  	<input type="button" value=" 添加 " class="button" onclick="location.href='addDayShedule.mvc';">&nbsp;<input type="button" value=" 删除 " onclick="deleteDaySchedule()" class="button">&nbsp;<input type="button" value=" 修改 " class="button" onclick="modify();">
	  </td>
  </tr>
    </form>
</table>
</body>
</html>
