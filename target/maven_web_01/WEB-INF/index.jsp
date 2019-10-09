<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/9/24
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <!-- 头部区域 -->
        <div class="layui-header layui-bg-black">
            <div class="layui-logo">
                制造物联及生产管理平台
            </div>
            <ul class="layui-layout-right">
                <li style="color: #009E94;">
                    计算机科学与技术学院
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="<%=request.getContextPath() %>/img/1.jpg" class="layui-nav-img">管理员你好
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="<%=request.getContextPath() %>/logout">退出</a>
                </li>
            </ul>
        </div>
        <!-- 左侧导航区域 -->
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">
                            计划进度
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="<%=request.getContextPath() %>/orders/toOrdersList" target="pageTarget">订单管理</a>
                            </dd>
                            <dd>
                                <a href="<%=request.getContextPath() %>/customer/toCustomerList" target="pageTarget">客户管理</a>
                            </dd>
                            <dd>
                                <a href="<%=request.getContextPath() %>/product/toProductList" target="pageTarget">产品管理</a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">
                            系统管理
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="<%=request.getContextPath() %>/sysUser/toList" target="pageTarget">用户管理</a>
                            </dd>
                            <dd>
                                <a href="<%=request.getContextPath() %>/sysUser/toList" target="pageTarget">角色管理</a>
                            </dd>
                            <dd>
                                <a href="<%=request.getContextPath() %>/sysUser/toList" target="pageTarget">权限管理</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 主体区域 -->
        <div class="layui-body layui-bg-white">
            <iframe name="pageTarget" style="width: 100%; height: 100%; border: 0 none; vertical-align: middle;" frameborder="1"></iframe>
        </div>
    </div>
</body>
<script>
    layui.use('element', function() {
    });
</script>
</html>
