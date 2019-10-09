<%--
  Created by IntelliJ IDEA.
  User: kaiguan
  Date: 2019/9/27
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>产品管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/layui/layui.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
</head>
<body>

    <div class="layui-fluid">
        <table class="layui-table" id="productList" lay-filter="test"></table>
    </div>

    <div id="addForm" hidden="hidden" style="padding: 25px">
        <form action="<%=request.getContextPath() %>/product/insert" method="post" class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">产品名称：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="productName" placeholder="请输入产品名称" required lay-verify="required"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">产品种类：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="productKind" placeholder="请输入产品种类"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-inline">
                    <select name="productState" required lay-verify="required">
                        <option value="">请选择状态</option>
                        <option value="0">锁定</option>
                        <option value="1">有效</option>
                        <option value="2">失效</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">产品介绍：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="productIntroduce" placeholder="请输入产品介绍"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="up1">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" style="width: 300px;height: 300px" id="upDemo1">
                        <p id="demoText1"></p >
                    </div>
                </div><br>
            </div>
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input" name="productImageAp" id="productImageAp">
            </div>
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input" name="productImageVp" id="productImageVp">
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
        <form action="<%=request.getContextPath() %>/product/update" method="post" class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">产品编号：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="productId" id="productId" readonly lay-verify="readonly"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">产品名称：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="productName" id="productName" placeholder="请输入产品名称" required lay-verify="required"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">产品种类：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="productKind" id="productKind" placeholder="请输入产品种类"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-inline">
                    <select name="productState" required lay-verify="required">
                        <option value="">请选择状态</option>
                        <option value="0">锁定</option>
                        <option value="1">有效</option>
                        <option value="2">失效</option>
                    </select><br>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">产品介绍：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="productIntroduce" placeholder="请输入产品介绍"><br>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="up2">修改图片</button>
                    <div class="layui-upload-list">
                        <img  src="" class="layui-upload-img" style="width: 300px;height: 300px" id="upDemo2">
                        <p id="demoText2"></p >
                    </div>
                </div><br>
            </div>
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input" name="productImageAp" id="productEditImageAp">
            </div>
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input" name="productImageVp" id="productEditImageVp">
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline layui-input-block">
                    <input type="submit" class="layui-btn" value="确定">
                    <input type="reset" class="layui-btn" value="重置">
                </div>
            </div>
        </form>
    </div>

    <div id="layEditForm" hidden="hidden" style="padding: 25px">
        <form action="<%=request.getContextPath() %>/product/textAreaUpdate" method="post" class="layui-form">
            <div class="layui-form-item">
                <textarea id="lefProductIntroduce" style="display: none" name="productIntroduce"></textarea>
            </div>
            <div class="layui-input-inline">
                <input type="hidden" class="layui-input" name="productId" id="lefProductId">
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 195px">
                    <input type="submit" class="layui-btn" value="保存">
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
                elem : '#productList',
                url : '<%=request.getContextPath() %>/product/productList',
                page : true,
                cols : [ [
                    {type : 'checkbox'},
                    {field : 'productId',title : '产品编号',align : 'center',width : 120,sort : true},
                    {field : 'productName',title : '产品名称',align : 'center',width : 200},
                    {field : 'productKind',title : '产品种类',align : 'center',width : 200},
                    {field : 'productState',title : '状态',align : 'center',width : 100},
                    /*{field : 'productIntroduce',title : '产品介绍',align : 'center',width : 200},*/
                    {title : '产品介绍',align : 'center',width : 200,
                        toolbar :
                            '<div>' +
                            '<a class="layui-btn" lay-event="lookEdit">查看/编辑</a>' +
                            '</div>'
                    },
                    {title : '相关图片',align : 'center',templet : imgbox,width : 150},
                    {fixed : 'right',title : '操作',width : 200,align : 'center',
                        toolbar :
                            '<div class="layui-btn-group">' +
                            '<a class="layui-btn" lay-event="edit">编辑</a>' +
                            '<a class="layui-btn layui-btn-danger" lay-event="del">删除</a>' +
                            '</div>'
                    }
                ] ],
                limits : [5, 10, 15],
                toolbar :
                    '<div class="layui-btn-group" style="padding: 15px;">' +
                    '产品名称：' +
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
                            url : "<%=request.getContextPath() %>/product/delete?productId="+data.productId,
                            success : function (msg) {
                                layer.alert(msg.msg);
                                layer.close(index);
                            }
                        });
                    });
                }else if (obj.event === 'edit'){
                    $("#productId").val(data.productId);
                    $("#productName").val(data.productName);
                    $("#productKind").val(data.productKind);
                    $("#productState").val(data.productState);
                    $("#productIntroduce").val(data.productIntroduce);
                    $("#upDemo2").attr("src",data.productImageVp);
                    form.render();
                    layer.open({
                        type : 1,
                        title : '编辑产品',
                        area : '420px',
                        moveType : 1,
                        resize : false,
                        anim : 4,
                        moveOut: true,
                        content : $('#editForm')
                    });
                }else if (obj.event === 'lookEdit'){
                    $("#lefProductId").val(data.productId);
                    $("#lefProductIntroduce").val(data.productIntroduce);
                    layer.open({
                        title : "编辑产品介绍",
                        type : 1,
                        area : '600px',
                        moveType : 1,
                        resize : false,
                        anim : 4,
                        moveOut: true,
                        content : $("#layEditForm")
                    });
                }
            });

            table.on('toolbar(test)', function (obj) {
                if(obj.event === 'add'){
                    form.render();
                    layer.open({
                        type : 1,
                        title : '添加产品',
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

        layui.use('form', function(){
            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });

        function imgbox(data){
            var productImageVp = data.productImageVp;
            var img="<img src='"+productImageVp+"'style='width:50px;height:50px;'/>";
            return img;
        }

        layui.use('upload', function() {
            var $ = layui.jquery;
            var upload = layui.upload;
            // 图片上传
            var uploadInst = upload.render({
                elem : '#up1',
                url : '<%=request.getContextPath() %>/product/uploadImg',
                before : function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#upDemo1').attr('src', result);
                    });
                },
                done : function (res) {
                    if (res.code < 0) {
                        return layer.msg('上传失败');
                    } else if (res.code == 1) {
                        layer.msg("上传成功");
                        $("#productImageAp").val(res.abspath);
                        $("#productImageVp").val(res.virtualPath);
                    }
                },
                error : function () {
                    var demoText = $('#demoText1');
                    demoText.html('<span style="color: red">上传失败</span>'+
                                    '<a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });

        layui.use('upload', function() {
            var $ = layui.jquery;
            var upload = layui.upload;
            // 图片上传
            var uploadInst = upload.render({
                elem : '#up2',
                url : '<%=request.getContextPath() %>/product/uploadImg',
                before : function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#upDemo2').attr('src', result);
                    });
                },
                done : function (res) {
                    if (res.code < 0) {
                        return layer.msg('修改失败');
                    } else if (res.code == 1) {
                        layer.msg("修改成功");
                        $("#productEditImageAp").val(res.abspath);
                        $("#productEditImageVp").val(res.virtualPath);
                    }
                },
                error : function () {
                    var demoText = $('#demoText2');
                    demoText.html('<span style="color: red">修改失败</span>'+
                        '<a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });

        layui.use('layedit', function(){
            var layedit = layui.layedit;
            layedit.build('lefProductIntroduce', {
                tool : ['strong','underline','|','left','center','right']
            });
        });
    </script>

</body>
</html>
