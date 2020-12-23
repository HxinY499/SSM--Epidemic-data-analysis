<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/13
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Document</title>
    <%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.js"></script>
    <link href="${APP_PATH}/static/css/login.css" rel="stylesheet">
</head>

<body>
<div class="show-login-btn btn">
    登&nbsp;&nbsp;&nbsp;&nbsp;录
</div>
<div class="show-register-btn btn">
    注&nbsp;&nbsp;&nbsp;&nbsp;册
</div>
<div class = "msg">
    ${msg}
</div>

<div class="login-box">
    <div class="hide-login-btn">
        +
    </div>
    <form action="login" method="POST" class="login-form">
        <h1>Welcome</h1>
        <input class="txtb" type="text" name="userName" placeholder="用户名" />
        <input class="txtb" type="password" name="passWord" placeholder="密码" />
        <input class="login-btn btn" type="submit" value="登录"/>
    </form>
</div>

<div class="register-box">
    <div class="hide-register-btn">
        +
    </div>
    <form action="register" method="POST" class="register-form">
        <h1>Welcome</h1>
        <input class="txtb" type="text" name="userName" placeholder="用户名" />
        <input class="txtb" type="password" name="passWord" placeholder="密码" />
        <input class="txtb" type="email" name="email" placeholder="邮箱" />
        <input class="register-btn btn" type="submit" value="注册"/>
    </form>
</div>




<script type="text/javascript">
    $(".show-login-btn").click(function() {
        $(".login-box").addClass("showed");
    });

    $(".hide-login-btn").click(function() {
        $(".login-box").removeClass("showed");
    });

    $(".show-register-btn").click(function() {
        $(".register-box").addClass("showed");
    });

    $(".hide-register-btn").click(function() {
        $(".register-box").removeClass("showed");
    });
</script>
</body>

</html>
