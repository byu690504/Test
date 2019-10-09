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
    <title>订单管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
</head>
<body>

    <div class="layui-fluid">
        <table class="layui-table" id="ordersList" lay-filter="test"></table>
    </div>

    <div id="addForm" hidden="hidden" style="padding: 25px">
        <form action="<%=request.getContextPath() %>/orders/insert" method="post" class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">订单编号：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderId" placeholder="请输入订单编号" required lay-verify="required"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购客户：</label>
                <div class="layui-input-inline <%--layui-input-block--%>">
                    <select name="customName" required lay-verify="required">
                        <option value="">请选择客户名称</option>
                        <option value="索尼">索尼</option>
                        <option value="苹果">苹果</option>
                        <option value="微软">微软</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购产品：</label>
                <div class="layui-input-inline <%--layui-input-block--%>">
                    <select name="productName" required lay-verify="required">
                        <option value="">请选择产品名称</option>
                        <option value="摄影机">摄影机</option>
                        <option value="电脑">电脑</option>
                        <option value="服务器">服务器</option>
                        <option value="投影仪">投影仪</option>
                        <option value="耳机">耳机</option>
                        <option value="主机">主机</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购数量：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderNumber" placeholder="请输入订购数量"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">税前单价：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderPrice" placeholder="请输入税前单价"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">单位：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderUnit" placeholder="请输入单位名称"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订单状态：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderState"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购日期：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input laydate" id="orderAddBuyTime" name="orderBuyTime" placeholder="请选择时间">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">要求日期：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input laydate" id="orderAddRequireTime" name="orderRequireTime" placeholder="请选择时间">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">合同扫描：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderImage"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">附件：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderFile"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订单要求：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderRequire"><br>
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
        <form action="<%=request.getContextPath() %>/orders/update" method="post" class="layui-form">
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input" name="orderId" id="orderId">
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购客户：</label>
                <div class="layui-input-inline">
                    <select name="customName" required lay-verify="required">
                        <option value="">请选择客户名称</option>
                        <option value="索尼">索尼</option>
                        <option value="苹果">苹果</option>
                        <option value="微软">微软</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购产品：</label>
                <div class="layui-input-inline">
                    <select name="productName" required lay-verify="required">
                        <option value="">请选择产品名称</option>
                        <option value="摄影机">摄影机</option>
                        <option value="电脑">电脑</option>
                        <option value="服务器">服务器</option>
                        <option value="投影仪">投影仪</option>
                        <option value="耳机">耳机</option>
                        <option value="主机">主机</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购数量：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderNumber" id="orderNumber" placeholder="请输入订购数量"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">税前单价：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderPrice" id="orderPrice" placeholder="请输入税前单价"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">单位：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderUnit" id="orderUnit" placeholder="请输入单位名称"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订单状态：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderState" id="orderState"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订购日期：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input laydate" name="orderBuyTime" id="orderEditBuyTime" placeholder="请选择时间">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">要求日期：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input laydate" name="orderRequireTime" id="orderEditRequireTime" placeholder="请选择时间">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">合同扫描：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderImage" id="orderImage"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">附件：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderFile" id="orderFile"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订单要求：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="orderRequire" id="orderRequire"><br>
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
        layui.use(['layer', 'table', 'form', 'laydate'], function () {
            //数据表格
            var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;
            var laydate = layui.laydate;
            var $ = layui.$;
            table.render({
                elem : '#ordersList',
                url : '<%=request.getContextPath() %>/orders/ordersList',
                page : true,
                cols : [ [
                    {type : 'checkbox'},
                    {field : 'orderId',title : '订单编号',align : 'center',width : 120,sort : true},
                    {field : 'customName',title : '订购客户',align : 'center',width : 100},
                    {field : 'productName',title : '订购产品',align : 'center',width : 100},
                    {field : 'orderNumber',title : '订购数量',align : 'center',width : 100},
                    {field : 'orderPrice',title : '税前单价',align : 'center',width : 100},
                    {field : 'orderUnit',title : '单位',align : 'center',width : 100},
                    {field : 'orderState',title : '状态',align : 'center',width : 100},
                    {field : 'orderBuyTime',title : '订购日期',align : 'center',width : 200,
                        templet : '<div>{{ layui.util.toDateString(d.orderBuyTime,\"yyyy-MM-dd HH:mm:ss\") }}</div>'},
                    {field : 'orderRequireTime',title : '要求日期',align : 'center',width : 200,
                        templet : '<div>{{ layui.util.toDateString(d.orderRequireTime,\"yyyy-MM-dd HH:mm:ss\") }}</div>'},
                    {field : 'orderRequire',title : '订单要求',align : 'center',width : 100},
                    {field : 'orderImage',title : '相关图片',width : 100},
                    {field : 'orderFile',title : '订单附件',align : 'center',width : 100},
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

            //监听行内工具栏事件
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
                            url : "<%=request.getContextPath() %>/orders/delete?orderId="+data.orderId,
                            success : function (msg) {
                                layer.alert(msg.msg);
                                layer.close(index);
                            }
                        });
                    });
                }else if(obj.event === 'edit'){
                    laydate.render({
                        elem : '#orderEditBuyTime',
                        type : 'datetime',
                        min : '2019-1-01 00:00:00',
                        max : '2020-12-31 23:59:59'
                    });
                    laydate.render({
                        elem : '#orderEditRequireTime',
                        type : 'datetime',
                        min : '2019-1-01 00:00:00',
                        max : '2020-12-31 23:59:59'
                    });
                    $("#orderId").val(data.orderId);
                    $("#customName").val(data.customName);
                    $("#productName").val(data.productName);
                    $("#orderNumber").val(data.orderNumber);
                    $("#orderPrice").val(data.orderPrice);
                    $("#orderUnit").val(data.orderUnit);
                    $("#orderState").val(data.orderState);
                    $("#orderEditBuyTime").val(layui.util.toDateString(data.orderBuyTime,'yyyy-MM-dd HH:mm:ss'));
                    $("#orderEditRequireTime").val(layui.util.toDateString(data.orderRequireTime,'yyyy-MM-dd HH:mm:ss'));
                    $("#orderRequire").val(data.orderRequire);
                    $("#orderImage").val(data.orderImage);
                    $("#orderFile").val(data.orderFile);
                    // 表单渲染,需要渲染才会有效果显示出来
                    form.render();
                    layer.open({
                        type : 1,
                        title : '编辑订单',
                        area : '420px',
                        moveType : 1,
                        resize : false,
                        anim : 4,
                        moveOut: true,
                        content : $('#editForm')
                    });
                }
            });

            //监听头部工具栏事件
            table.on('toolbar(test)', function (obj) {
                if(obj.event === 'add'){
                    laydate.render({
                        elem : '#orderAddBuyTime',
                        type : 'datetime',
                        min : '2019-1-01 00:00:00',
                        max : '2020-12-31 23:59:59'
                    });
                    laydate.render({
                        elem : '#orderAddRequireTime',
                        type : 'datetime',
                        min : '2019-1-01 00:00:00',
                        max : '2020-12-31 23:59:59'
                    });
                    form.render();
                    layer.open({
                        type : 1,
                        title : '添加订单',
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
