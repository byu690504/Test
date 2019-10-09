<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页跳转登录页面</title>
</head>
<body>
<script>
    location.href="<%=request.getContextPath() %>/sysUser/toLogin";
</script>
</body>
</html>