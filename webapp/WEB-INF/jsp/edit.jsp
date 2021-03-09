<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="/library/md.css">
</head>
<style>
    .layout-content {
        display: flex;
        height: calc(100vh - 60px);
    }
    main {
        width: calc(100vw - 240px);
        padding: 20px;;
        overflow-y: auto;
        transition: all .5s ease-in;
    }
    .edit-content {
        display: flex;
        align-items: stretch;
        height: calc(100% - 20px);
    }
    .form-control .layui-form-label {
        float: initial;
        width: auto;
        text-align: center;
    }
    .form-control .layui-input-block {
        margin-left: 0;
    }
    .layui-icon-screen-restore {
        display: none;
    }
    .layui-icon-screen-full {
        display: block;
    }
    .mask-fixed {
        position: fixed;
        left: 0;
        top: 0;
        width: 100vw;
        height: 100vh;
        z-index: 999;
        padding: 0;
        background-color: rgba(0, 0, 0, 0.6) !important;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .mask-fixed .edit-content {
        width: 97%;
        height: 95%;
    }
    .mask-fixed .layui-icon-screen-restore {
        display: block;
    }
    .mask-fixed .layui-icon-screen-full {
        display: none;
    }
    .mask-fixed .breadcrumb-box {
        display: none;
    }
</style>
<jsp:include page="../common/layout/top.jsp"></jsp:include>
<div class="layout-content">
    <jsp:include page="../common/layout/slide.jsp"></jsp:include>
    <main class="layui-bg-gray">
        <div style="margin-bottom: 15px;" class="breadcrumb-box">
                <span class="layui-breadcrumb">
                  <a >文章信息</a>
                  <a href="/home"><cite>文章列表</cite></a>
                </span>
        </div>
        <div class="edit-content layui-row layui-col-space20">
            <div class="edit-view layui-col-xs12 layui-col-sm2">
                <div class="layui-card" style="height: 100%;">
                    <div class="layui-card-header">展示区域
                        <i class="layui-icon screen-icon layui-icon-screen-full" style="float:right; font-weight: bold; font-size: 18px;"></i>
                        <i class="layui-icon screen-icon layui-icon-screen-restore" style="float:right; font-weight: bold; font-size: 18px;"></i>
                    </div>
                    <div class="layui-card-body">
                        <form class="layui-form form-control" lay-filter="form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                            <div class="layui-form-item">
                                <label class="layui-form-label">文章标题</label>
                                <div class="layui-input-block">
                                    <input type="text" name="title" placeholder="请输入标题"  class="layui-input" value="${article.title}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">文章作者</label>
                                <div class="layui-input-block">
                                    <input type="text" name="author" placeholder="请输入作者" readonly  class="layui-input" value="${article.username}">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">文章类型</label>
                                <div class="layui-input-block">
                                    <select name="type" lay-verify="required">
                                        <c:forEach items="${articleTypeList}" var="item">
                                            <option value="${item.id}" ${article.type == item.id ? 'selected' : ''}>${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">是否开启评论</label>
                                <div class="layui-input-block">
                                    <input type="checkbox" name="comment" lay-skin="switch"
                                        ${ (type =="edit" && article.comment == 2) ? '' : 'checked'}
                                    >
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: center;">
                                    <c:if test="${type == 'add'}">
                                        <button class="layui-btn add-article">立即新增</button>
                                    </c:if>
                                    <c:if test="${type == 'edit'}">
                                        <button class="layui-btn edit-article">立即保存</button>
                                    </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="edit-area layui-col-xs12 layui-col-sm5">
                <div class="layui-card" style="height: 100%; display: flex; flex-direction: column;">
                    <div class="layui-card-header">编辑区域</div>
                    <div class="layui-card-body" style="flex: 1;">
                        <textarea name="markdown-area" placeholder="请输入内容" class="layui-textarea" style="height: 100%;">${article.content}</textarea>
                    </div>
                </div>
            </div>
            <div class="edit-view layui-col-xs12 layui-col-sm5">
                <div class="layui-card" style="height: 100%; display: flex; flex-direction: column;">
                    <div class="layui-card-header">展示区域</div>
                    <div class="layui-card-body" style="flex: 1; overflow-y: auto;">
                        <div class="md-html" style="padding-bottom: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<input  type="hidden" id="articleId" value="${article.id}">
<script src="/library/layui/layui.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/showdown/1.9.1/showdown.min.js"></script>
<script>
    $(function (){
        var converter = new showdown.Converter()
        var mdHtml = $('.md-html')
        layui.use(['table', 'form', 'element'], function(){
            var form = layui.form;

            $('.add-article').on('click', function (e){
                e.preventDefault()
                var data= form.val('form')
                var content = $("[name='markdown-area']").val()
                $.ajax({
                    url: "/addArticle",
                    type: 'post',
                    data: {
                        title: data.title,
                        content: content,
                        comment: data.comment === "on" ? 1 : 2,
                        type: data.type,
                        userId: 1
                    },
                    success: function (res) {
                        layer.msg(res.msg,function (){
                            if (res.code === 200){
                                window.location.href = "/edit/"+res.id
                            }
                        })
                    },
                    error: function (err){
                        layer.msg("异常错误")
                    }
                })
            })

            $('.edit-article').on('click', function (e){
                e.preventDefault()
                var data= form.val('form')
                console.log(data)
                var content = $("[name='markdown-area']").val()
                $.ajax({
                    url: "/editArticle",
                    type: 'post',
                    data: {
                        id: $('#articleId').val().trim(),
                        title: data.title,
                        content: content,
                        comment: data.comment === "on" ? 1 : 2,
                        type: data.type,
                        userId: 1
                    },
                    success: function (res) {
                        layer.msg(res.msg)
                    },
                    error: function (err){
                        layer.msg("异常错误")
                    }
                })
            })
        })
        $('[name="markdown-area"]').on('keyup', function (){
            var text= $(this).val().trim()
            var html= converter.makeHtml(text)
            mdHtml.html(html)
        }).trigger('keyup')



        /* 全屏按鈕 */
        $('.screen-icon').on('click', function (){
            if ($(this).is('.layui-icon-screen-full')) {
                $('main').addClass('mask-fixed')
            } else {
                $('main').removeClass('mask-fixed')
            }
        })

        // console.log(html)
    })
</script>
</body>
</html>