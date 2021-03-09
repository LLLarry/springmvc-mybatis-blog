<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/3/3
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开始使用layui</title>
    <link rel="stylesheet" href="/library/layui/css/layui.css">
</head>
<style>
    .layout-content {
        display: flex;
        height: calc(100vh - 60px);
    }
    main {
        width: calc(100vw - 240px);
        padding: 20px;
    }
    .tb-content {
        padding: 20px;
        background-color: #fff;
    }
    [lay-id="demo"] {
        background-color: #ffffff;
    }
</style>
<jsp:include page="../common/layout/top.jsp"></jsp:include>
<div class="layout-content">
    <jsp:include page="../common/layout/slide.jsp"></jsp:include>
    <main class="layui-bg-gray">
        <div style="margin-bottom: 15px;">
            <span class="layui-breadcrumb">
              <a >文章信息</a>
              <a href="/home"><cite>文章列表</cite></a>
            </span>
        </div>
        <div class="layui-card">
            <div class="layui-card-body">
                <form class="layui-form layui-inline" lay-filter="form">
                    <div class="layui-form-item layui-inline">
                        <label class="layui-form-label">ID</label>
                        <div class="layui-input-block">
                            <input type="text" name="id" value="${param.id}" placeholder="请输入ID" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-inline">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" value="${param.title}" placeholder="请输入标题" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item layui-inline">
                        <label class="layui-form-label">作者</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" value="${param.username}"  placeholder="请输入作者" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item layui-inline">
                        <label class="layui-form-label">标签</label>
                        <div class="layui-input-block">
                            <select name="type" placeholder="请选择标签"  >
                                <option ${param.type == '' ? 'selected' : ''} value=""></option>
                                <option ${param.type == 1 ? 'selected' : ''} value="1">天文</option>
                                <option ${param.type == 2 ? 'selected' : ''} value="2">地理</option>
                                <option ${param.type == 3 ? 'selected' : ''} value="3">文学</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item layui-inline">
                        <div class="layui-input-block">
                            <button class="layui-btn submit-btn">搜索</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <h4>文章列表</h4>
        <div class="tb-content">
            <table id="demo" lay-filter="test" ></table>
        </div>
    </main>
</div>
<input type="hidden" value="${param.id}" id="id" >
<input type="hidden" value="${param.title}" id="title" >
<input type="hidden" value="${param.username}" id="username" >
<input type="hidden" value="${param.type}" id="type" >

<script src="/library/layui/layui.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(function (){
        var id = $('#id').val().trim()
        var title = $('#title').val().trim()
        var username = $('#username').val().trim()
        var type = $('#type').val().trim()
        layui.use(['table', 'form', 'element'], function(){
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#demo'
                ,height: 500 //312
                ,url: '/getArticleList' //数据接口
                ,page: true //开启分页
                ,loading: true
                ,cols: [[ //表头
                    {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                    ,{field: 'title', title: '文章标题'}
                    ,{field: 'username', title: '作者'}
                    ,{field: 'name', title: '文章标签', sort: true}
                    ,{field: 'comment', title: '是否开启评论', sort: true,
                        templet: function (row){
                            return row.comment == 1 ? "<span style='color:#5FB878;' >开启</span>" : "<span style='color:#FF5722;'>关闭</span>"
                        }
                    }
                    ,{field: 'view_count', title: '浏览数'}
                    ,{field: 'create_time', title: '创建时间', sort: true}
                    ,{field: '', title: '操作', width:200,
                        templet: function (row){
                            return '   <a class="layui-btn layui-btn-sm" lay-event="edit" href="/edit/'+row.id+'">编辑</a>\n' +
                                '   <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del" onclick="deleteArticle.call(this, '+row.id+')">删除</a>'

                        }
                    }
                ]],
                where: {
                    id, title,username,type
                },
            });

            var form = layui.form;
            $('.submit-btn').on('click', function (e) {
                e.preventDefault()
                var data = fmtObject(form.val("form"));
                window.location.href = location.pathname +stringURL(data)
            })
        });
    })

    /* 删除文章 通过id */
    function deleteArticle(id) {
        var _this = this
        layer.alert('确认删除此文章吗？', function(index){
            layer.close(index);
            $.ajax({
                url: '/deleteArticle',
                data: {
                    id
                },
                success:function(res){
                    if (res.code == 200) {
                        var $tr = $(_this).parents("tr")
                        var index = $tr.data('index')
                        $tr.parents('.layui-table-box').find('.layui-table-fixed tr[data-index="'+index+'"]').remove()
                        $tr.remove()
                        layer.msg('删除成功',{time: 2000});
                    } else {
                        layer.msg(res.msg)
                    }
                },
                error: function (err) {
                    layer.msg("异常错误")
                }
            })
        });
    }

    function fmtObject(data) {
        var string =  Object.prototype.toString.call(data)
        if (string === '[object Object]'){
            for (const key in data) {
                data[key]= data[key].trim()
               if (data[key] === '') {
                   delete data[key]
               }
            }
        }
        return data
    }

    function stringURL(data) {
        var string =  Object.prototype.toString.call(data)
        let url= "?"
        if (string === '[object Object]'){
            for (const key in data) {
                data[key]= data[key].trim()
                let ketAndVal = key+"="+data[key]
                url = url + ketAndVal+"&"
            }
        }
        return url.substring(0,url.length-1)
    }
</script>
</body>
</html>