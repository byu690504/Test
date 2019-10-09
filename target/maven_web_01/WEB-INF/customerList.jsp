<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/9/25
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
</head>
<body>

    <div class="layui-fluid">
        <table class="layui-table" id="customerList" lay-filter="test"></table>
    </div>

    <div id="addForm" hidden="hidden" style="padding: 25px">
        <form action="<%=request.getContextPath() %>/customer/insert" method="post" class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">客户编号：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customId" placeholder="请输入客户编号" required lay-verify="required"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户名称：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customName" placeholder="请输入客户名称" required lay-verify="required"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户全称：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customCompany" placeholder="请输入客户全称"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customAddress" placeholder="请输入地址"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">传真：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customFax" placeholder="请输入传真"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customEmail" placeholder="请输入邮箱"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">经理姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customManager" placeholder="请输入经理姓名"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customPhone" placeholder="请输入联系电话"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户状态：</label>
                <div class="layui-input-inline">
                    <select name="customState" required lay-verify="required">
                        <option value="">请选择客户状态</option>
                        <option value="0">锁定</option>
                        <option value="1">有效</option>
                        <option value="2">失效</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customComment" placeholder="请输入备注"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline layui-input-block">
                    <input type="submit" class="layui-btn" value="提交">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </div>
        </form>
    </div>

    <div id="editForm" hidden="hidden" style="padding: 25px">
        <form action="<%=request.getContextPath() %>/customer/update" method="post" class="layui-form">
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input" name="customId" id="customId">
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户名称：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customName" placeholder="请输入客户名称" required lay-verify="required"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户全称：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customCompany" placeholder="请输入客户全称"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customAddress" placeholder="请输入地址"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">传真：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customFax" placeholder="请输入传真"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customEmail" placeholder="请输入邮箱"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">经理姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customManager" placeholder="请输入经理姓名"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customPhone" placeholder="请输入联系电话"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">客户状态：</label>
                <div class="layui-input-inline">
                    <select name="customState" required lay-verify="required">
                        <option value="">请选择客户状态</option>
                        <option value="0">锁定</option>
                        <option value="1">有效</option>
                        <option value="2">失效</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="customComment" placeholder="请输入备注"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline layui-input-block">
                    <input type="submit" class="layui-btn" value="确定">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </div>
        </form>
    </div>

    <script>
        layui.use(['layer', 'table', 'form'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;
            var $ = layui.$;
            table.render({
                elem : '#customerList',
                url : '<%=request.getContextPath() %>/customer/customerList',
                page : true,
                cols : [ [
                    {type : 'checkbox'},
                    {field : 'customId',title : '客户编号',align : 'center',width : 120,sort : true},
                    {field : 'customName',title : '客户名称',align : 'center',width : 100},
                    {field : 'customCompany',title : '客户全称',align : 'center',width : 100},
                    {field : 'customAddress',title : '地址',align : 'center',width : 100},
                    {field : 'customFax',title : '传真',align : 'center',width : 100},
                    {field : 'customEmail',title : '邮箱',align : 'center',width : 100},
                    {field : 'customManager',title : '经理姓名',align : 'center',width : 100},
                    {field : 'customPhone',title : '联系电话',align : 'center',width : 100},
                    {field : 'customState',title : '客户状态',align : 'center',width : 100},
                    {field : 'customComment',title : '备注',align : 'center',width : 100},
                    {fixed : 'right',title : '操作',width : 200,align : 'center',
                        toolbar :
                            '<div class="layui-btn-group">' +
                            '<a class="layui-btn layui-btn" lay-event="edit">编辑</a>' +
                            '<a class="layui-btn layui-btn-danger layui-btn" lay-event="del">删除</a>' +
                            '</div>'
                    }
                ] ],
                limits : [5, 10, 15],
                toolbar :
                    '<div class="layui-btn-group" style="padding: 15px;">' +
                    '客户名称：' +
                    '<div class="layui-inline">' +
                    '<input class="layui-input" name="" autocomplete="off" />' +
                    '</div>' +
                    '<button class="layui-btn" lay-filter="reload">搜索</button>' +
                    '<button class="layui-btn" lay-filter="pageSubmit" lay-event="add">新增</button>' +
                    '</div>'
            });

            table.on('tool(test)', function (obj) {
                var data=obj.data;
                if(obj.event === 'del'){
                    layer.confirm('确定要删除吗', {
                        title:'删除',
                        anim : 6
                    }, function (index) {
                        obj.del();
                        $.ajax({
                            type : "POST",
                            url : "<%=request.getContextPath() %>/customer/delete?customId="+data.customId,
                            success : function (msg) {
                                layer.alert(msg.msg);
                                layer.close(index);
                            }
                        });
                    });
                }else if (obj.event === 'edit'){
                    $("#customId").val(data.customId);
                    $("#customName").val(data.customName);
                    $("#customCompany").val(data.customCompany);
                    $("#customAddress").val(data.customAddress);
                    $("#customFax").val(data.customFax);
                    $("#customEmail").val(data.customEmail);
                    $("#customManager").val(data.customManager);
                    $("#customPhone").val(data.customPhone);
                    $("#customState").val(data.customState);
                    $("#customComment").val(data.customComment);
                    form.render();
                    layer.open({
                        type : 1,
                        title : '编辑客户',
                        area : '420px',
                        moveType : 1,
                        resize : false,
                        anim : 4,
                        moveOut: true,
                        content : $('#editForm')
                    });
                }
            });

            table.on('toolbar(test)', function (obj) {
                if(obj.event === 'add'){
                    form.render();
                    layer.open({
                        type : 1,
                        title : '添加客户',
                        area : '420px',
                        moveType : 1,
                        resize : false,
                        anim : 4,
                        moveOut: true,
                        content : $('#addForm')
                    });
                }
            });
        });
    </script>
</body>
</html>
