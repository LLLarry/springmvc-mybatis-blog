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
        flex: 1;
        padding: 20px;
    }
</style>
<body>

<div class="layout-content">

    <main>
        <!-- main -->

    </main>
</div>
<!-- 你的HTML代码 -->

<script src="/library/layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form;

        layer.msg('Hello World');
    });
</script>
</body>
</html>