<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/3/3
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    header .layui-nav {
        display: flex;
        justify-content: flex-end;
    }
</style>
<header>
    <ul class="layui-nav layui-bg-blue">
        <li class="layui-nav-item">
            <a href="">控制台<span class="layui-badge">9</span></a>
        </li>
        <li class="layui-nav-item">
            <a href="/user/edit/${ sessionScope.user != null ?  sessionScope.user.id : '' }">个人中心<span class="layui-badge-dot"></span></a>
        </li>
        <li class="layui-nav-item">
            <a href=""><img src="${ sessionScope.user != null ?  sessionScope.user.avatar : '' }" class="layui-nav-img">${sessionScope.user != null ?  sessionScope.user.username : '' }</a>
            <dl class="layui-nav-child">
                <dd><a href="/user/edit/${ sessionScope.user != null ?  sessionScope.user.id : '' }">修改信息</a></dd>
                <dd><a href="">安全管理</a></dd>
                <dd><a href="/logout">退了</a></dd>
            </dl>
        </li>
    </ul>
</header>
