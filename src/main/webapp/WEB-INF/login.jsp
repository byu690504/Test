<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/9/24
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            if (window.parent.window != window) {
                window.top.location = "<%=request.getContextPath() %>/sysUser/toLogin";
            }
        }
    </script>
</head>
<body>
    <div style="margin: 0 auto;width: 100%; padding-top: 80px; background-color: #009E94">
        <div class="characters" style="margin-left: 590px; font-size: 35px">
            <i class="layui-icon layui-icon-password image" style="font-size: 35px"></i>
            <span>管理系统</span>
        </div>
    </div>
    <div style="margin: 0 auto;width: 350px;margin-top: 40px">
        <div class="form-div" style="margin-left: 40px; margin-bottom: 20px; font-size: 30px">
            <i class="layui-icon layui-icon-username" style="font-size: 30px"></i>
            <span>登录</span>
        </div>
        <form action="<%=request.getContextPath() %>/sysUser/login" method="post" class="layui-form">
            <div class="layui-form-text layui-inline" style="margin-bottom: 20px; margin-left: 155px">
                <span style="color: red">${msg}</span>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" id="userName" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" id="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <%--<c:if test="${msg==true}">
                <div class="layui-form-item">
                    <label class="layui-form-label">验证码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="code" id="code" required lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                        <br>
                        <img id="imgCode" src="<%=request.getContextPath()%>/validateCodeServlet">
                    </div>
                </div>
            </c:if>--%>
            <div class="layui-form-item">
                <div class="layui-input-block layui-input-inline">
                    <input type="submit" class="layui-btn" value="提交">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </div>
        </form>
    </div>
</body>
</html>
