<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>密码设置</title>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
<script type="text/javascript">
      var checkAndSubmit;
    
	  $(document).ready(function(){ 
	     checkAndSubmit = function()
	     {
	        var newpassword = $("#newPassword")[0].value;
		    var newpassword2 = $("#newPassword2")[0].value;
		    
		    if(!newpassword || "" == $.trim(newpassword))
		    {
		        //alert("请输入新的密码信息!");
		        jDialog.alert("请输入新的密码信息!");		
		        return false;
		    }
		    
	   	    if(!newpassword2 || "" == $.trim(newpassword2))
		    {
		        //alert("请再次输入新的密码信息!");
		        jDialog.alert("请再次输入新的密码信息!");
		        return false;
		    }
		    
		    if(newpassword != newpassword2)
		    {
		         //alert("两次输入密码不一致!");
		        jDialog.alert("两次输入密码不一致!");
		        return false;
		    }
		    
		        $.ajax({
			        url:"password.mvc",
			        data:"newpassword=newpassword",
			        success: function(msg){
				     //alert( "保存成功！ ");
				     jDialog.alert("保存成功！");
			    }
		    }); 
	    }
		});
</script>
</head>
<body>
<table width="98%" border="0" cellpadding="0" cellspacing="2" align="center">
<tr> 
    <td height="21" bgcolor="#19e680">&nbsp;<img src="images/ico/ico45.gif" width="32" height="32" hspace="2" vspace="2" align="absmiddle"><font size="+1"><strong>系统安全密码设置</strong></font></td>
  </tr>
</table>
<%-- <font color=red><%=request.getParameter("message")%></font> --%>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	  <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" class="TableMenu">
	  <form name="form1" method="post" onsubmit="return checkAndSubmit();" action="updatePassword.mvc">
      <tr>
        <td  class="a3">重新设置密码:</td>
		    <td>
			   <input id="newPassword" type="password" name="newPassword"  size=30>&nbsp;&nbsp;
				</td>
      </tr>
		  <tr>
		    <td>再次确认新密码:</td>
			  <td>
			    <input id="newPassword2" type="password" name="newPassword2"  size=30>
			  </td>
			</tr>
      <tr bgcolor="#ffffff">
        <td height="30" colspan="4" align="center">
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