<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/3/6
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    .avatar-img {
        position: relative;
        width: 118px;
        height: 118px;
        object-fit: cover;
    }
    .avatar-img img {
        width: 100%;
        height: 100%;
    }
    .avatar-img>.img-mask {
        position: absolute;
        right: 0;
        top: 0;
        left: 0;
        bottom: 0;
        z-index: 99;
        color: #1E9FFF;
        font-weight: bold;
        cursor: pointer;
        background-color: rgba(0,0,0,.2);
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: all .4s ease-in-out;
    }
    .avatar-img:hover .img-mask{
        opacity: 1;
    }
    .avatar-img>.img-mask i {
        font-size: 22px;
    }
    .upload-img {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 80px;
        padding: 15px;
        border: 1px dashed #1E9FFF;
        border-radius: 8px;
        color: #1E9FFF;
    }
    .hide {
        display: none;
    }
</style>
<jsp:include page="../common/layout/top.jsp"></jsp:include>
<div class="layout-content">
    <jsp:include page="../common/layout/slide.jsp"></jsp:include>
    <main class="layui-bg-gray">
        <div style="margin-bottom: 15px;">
            <span class="layui-breadcrumb">
              <a >用户信息</a>
              <a href="/home"><cite>设置用户信息</cite></a>
            </span>
        </div>
        ${user}
        <section>
            <div class="layui-card">
                <div class="layui-card-header">用户信息</div>
                <div class="layui-card-body">
                    <form class="layui-form" lay-filter="form" style="max-width: 400px;"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                        <div class="layui-form-item">
                            <input
                                type="hidden"
                                name="id"
                                value="${user.id}"
                            >
                            <label class="layui-form-label">用户昵称</label>
                            <div class="layui-input-block">
                                <input
                                    type="text"
                                    name="username"
                                    required
                                    placeholder="请输入用户昵称"
                                    autocomplete="off"
                                    class="layui-input"
                                    value="${user.username}"
                                >
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">用户邮箱</label>
                            <div class="layui-input-block">
                                <input
                                    type="email"
                                    name="email"
                                    placeholder="请输入用户邮箱"
                                    autocomplete="off"
                                    class="layui-input"
                                    value="${user.email}"
                                >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户头像</label>
                            <div class="layui-input-block">
                                <div class="avatar-img ${user.avatar == null ? 'hide' : ''}">
                                    <img src="${user.avatar}" alt="头像">
                                    <div class="img-mask">
                                        <i class="layui-icon layui-icon-close"></i>
                                    </div>
                                </div>
                                <div class="upload-img ${user.avatar == null ? '' : 'hide'}">
                                    <i class="layui-icon layui-icon-upload-drag"></i>
                                    上传头像 （推荐118 X 118）
                                </div>
                            </div>
                        </div>
                        
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn submit-btn" lay-submit lay-filter="*">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                        <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
                    </form>
                </div>
            </div>
        </section>
    </main>
</div>
<script src="/library/layui/layui.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(function (){
        layui.use(['element', 'form', 'upload'], function (){
            var form = layui.form;
            var upload = layui.upload
            upload.render({
                elem: '.upload-img'
                ,url: '/upload/avatar'
                ,data: {
                    id: ${user.id}
                }
                ,done: function(res, index, upload){
                    //获取当前触发上传的元素，一般用于 elem 绑定 class 的情况，注意：此乃 layui 2.1.0 新增
                    var item = this.item;
                    layer.msg(res.msg)
                    if (res.code === 0) {
                        $('.avatar-img img').attr('src', res.data.src)
                        $('.upload-img').addClass('hide')
                        $('.avatar-img').removeClass('hide')
                    }
                }
            })

            $('.submit-btn').on('click', function (e){
                e.preventDefault()
                var data = form.val("form")
                $.ajax({
                    url: '/user/update',
                    data: data,
                    success: function (res){
                        if (res.code === 200) {
                            layer.msg(res.msg)
                        } else {
                            layer.msg("失败")
                        }
                    },
                    error: function () {
                        layer.msg("异常错误")
                    }
                })
            })
        })
        $('.avatar-img .layui-icon-close').on('click', function (){
            var src = $('.avatar-img img').attr('src')
            $.ajax({
                url: '/delete/avatar',
                data: {
                    avatarPath: src,
                    id: ${user.id}
                },
                success: function (res) {
                    if (res.code === 200) {
                        $('.avatar-img').addClass('hide')
                        $('.upload-img').removeClass('hide')
                        layer.msg(res.msg)
                    } else {
                        layer.msg("错误")
                    }

                },
                error: function () {
                    layer.msg("异常错误")
                }
            })

        })
    })
</script>
</body>
</html>
