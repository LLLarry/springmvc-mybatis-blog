<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/3/3
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
request.getAttribute("javax.servlet.forward.request_uri")
或者
${requestScope['javax.servlet.forward.request_uri']}
--%>

<c:set var="URI" value="${requestScope['javax.servlet.forward.request_uri']}" />
<div class="slide">
    <ul class="layui-nav layui-nav-tree" style="height: 100%" lay-filter="test" lay-shrink="all">
        <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
        <li class="layui-nav-item
        ${(URI == '/home' || URI == '/add') ? 'layui-nav-itemed' : '' }
        ">
            <a href="javascript:;">文章信息</a>
            <dl class="layui-nav-child">
                <dd class="${URI == '/home' ? 'layui-this' : ''}">
                    <a href="/home" >文章列表</a>
                </dd>
                <dd  class="${URI == '/add' ? 'layui-this' : ''}">
                    <a href="/add">新增文章</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item
        ${(URI == '/user/listpage') ? 'layui-nav-itemed' : '' }
        ">
            <a href="javascript:;">用户信息</a>
            <dl class="layui-nav-child">
                <dd  class="${URI == '/user/listpage' ? 'layui-this' : ''}"
                ><a href="/user/listpage">用户列表</a></dd>
                <dd><a href="">后台模版</a></dd>
                <dd><a href="">电商平台</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">产品</a></li>
        <li class="layui-nav-item"><a href="">大数据</a></li>
    </ul>
</div>
