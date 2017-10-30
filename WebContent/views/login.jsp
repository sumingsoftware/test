<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>通讯录管理系统</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/htmleaf-demo.css">
	<link href="../css/signin.css" rel="stylesheet">
	<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<link href="css/jDialog.css" rel="stylesheet">
<script src="js/jDialog.js" type="text/javascript"></script>
	<script type="text/javascript">
		function check() {
				if (document.form1.username.value == ""
						|| document.form1.password.value == "") {
					//alert("请输入用户名称和口令！");
					jDialog.alert("请输入用户名称和口令！");	
					return false;
				}
		}
	</script>
</head>
<body>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>通讯录管理系统</h1>
		
		</header>
		<div class="signin">
			<div class="signin-head"><img src="../images/test/head_120.png" alt="" class="img-circle"></div>
			<form class="form-signin" role="form" action="${pageContext.request.contextPath}/checkLogin.mvc">
				<input type="text" name="username" class="form-control" placeholder="用户名" required autofocus />
				<input type="password" name="password" class="form-control" placeholder="密码" required />
				<button class="btn btn-lg btn-warning btn-block" onClick="return check();" type="submit">登录</button>
			</form>
		</div>
	</div>
</body>
</html>