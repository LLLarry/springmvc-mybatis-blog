<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2021/3/7
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @font-face {font-family: "iconfont";
            src: url('//at.alicdn.com/t/font_2404919_6dxgsb89mdj.eot?t=1615105906430'); /* IE9 */
            src: url('//at.alicdn.com/t/font_2404919_6dxgsb89mdj.eot?t=1615105906430#iefix') format('embedded-opentype'), /* IE6-IE8 */
            url('data:application/x-font-woff2;charset=utf-8;base64,d09GMgABAAAAAAN4AAsAAAAAB4gAAAMpAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHEIGVgCDBgqCZIJUATYCJAMMCwgABCAFhG0HQhumBsgeB47rUJG7Hhr/WfCUut63WtnfJweJSkJSEDoAnh65+8DV5cJVJm18sK6OCHVOlfESgL6YFWbdDl+Sa/kCCPj/D/fc8gDntSyX91p7c9QJMA4ooLE2beH/QT6Qf4PldU0KA/jibgjgqKcNGTJse43lsLBBAsjSRSITy1V02IFiIUIIO2Za5AQBkTloPgPHk9+XX3QagSFQ2F4j58/42DBTNlNTfeKZqh6/nQXQ54ECbYAFmd5pm0gyi7WhOFeWGs4OsQhmq2CSkPA8RXjRfzwDEsIKywDQAnEDmbKSDYFMzTswACgAIZAFLCbGdVCqfCHAVKiQSlWqVWZLudfZDczlnKHl3+U11iu5k049blLuxtNaevZZ8/LXn9Sc/589lqrktq5QRvLyJuTkjJv4+fTQ4xr+dlVo5uG7IifvroElN3f8JNyHI3k8yh/n5q7OcBN5LboY/MgRy7QPQtVR6ZP/7zpf8pc6O5+02pEsMSdOmCXPeU5RWj5m68PLyKXaEWLREE7f8ec6d+vsKpbNtCpPPeVbZcpyYvjg1sgPRpvNV69uJmIDBDXnBupoebz9o9/mfC+99zV9l1I1nTb3MhfcttrGzNq1e5bMll27gAsMjPbMJAYkXp+rTxJHNUcX/qK/YdzfL71mVPv8i2ILQPHiR6vRJ/EW9UB0A3aBH8KfWGU9IdOrdXiSFySVIaRvV4vznCQwVyWlyxVVJxeCEFG1AEMWdUGJaEKwlDYQENMFQiL6g6O14fNjKltNErEpoJW9BIQKHoKhHM9AqeALwVJKIKCaPxBSoYJjvFReMabZRW7wamRc5GF2BIs40xCE0S2kxWcUPY2hsjCh3ZEcOQgd23WoJxdoIG0xZo0v9te6AswnU4dhZD/UNBNWkqkg57YXuq41aN9+fteD2nNMPVZgMATC4ILwgNlEgEVwmBgIUX2XQuPnzyAiHhoMNFDR5byDEA5y86CjdjpMICxkxqSKV7lnDT4ifWtxEQDzIUx0wDDSDdHQMAEru7spIBwubQsXRCwG2vNa86fK2scr9OfbADjYaBUjKha3aYUhSp4uR1XF3NoDAAAA') format('woff2'),
            url('//at.alicdn.com/t/font_2404919_6dxgsb89mdj.woff?t=1615105906430') format('woff'),
            url('//at.alicdn.com/t/font_2404919_6dxgsb89mdj.ttf?t=1615105906430') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+ */
            url('//at.alicdn.com/t/font_2404919_6dxgsb89mdj.svg?t=1615105906430#iconfont') format('svg'); /* iOS 4.1- */
        }

        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .icon-yonghuming:before {
            content: "\e60d";
        }

        .icon-yonghuming1:before {
            content: "\e619";
        }

        * {
            padding: 0;
            margin: 0;
        }
        section {
            width: 100vw;
            height: 100vh;
            background: url("/library/image/logn_bg.jpg");
            background-attachment: fixed;
            background-position: center;
        }
        main {
            position: absolute;
            left: 50%;
            top: 40%;

            width: 80%;
            max-width: 450px;
            padding: 40px;

            background-color: rgba(0,0,0,.3);
            transform: translate(-50%, -50%);
            border-radius: 10px;
        }
        main h1 {
            text-align: center;
            color: #fff;
            font-size: 36px;
            text-transform: uppercase;
            margin-bottom: 15px;
        }
        .form-item {
            padding: 10px 0;
            display: flex;
            color: #fff;
            font-size: 18px;
            text-align: center;
        }
        .form-item label {
            padding: 0 15px;
            display: flex;
            align-items: center;
        }
        .form-item label i {
            font-size: 24px;
        }
        .form-item input {
            flex: 1;
            height: 40px;
            box-sizing: border-box;
            padding: 5px 15px;
            background-color: transparent;
            border: none;
            outline: none;
            border-bottom: 2px solid #fff;
            color: #fff;
            font-size: 18px;
        }
        .form-item.bottom  {
            display: flex;
            justify-content: center;
        }
        .form-btn {
            border-radius: 44px;
            width: 80%;
            background: linear-gradient(90deg, #FFE4E1, #87CEFA);
            padding: 10px 12px;
            margin-top: 20px;
            cursor: pointer;
            transition: all .4s;
            user-select: none;
        }
        .form-btn:hover {
            background: linear-gradient(90deg, #FFF0F5, #AFEEEE);
        }
    </style>
</head>
<body>
    <section>
        <main>
            <h1>Login</h1>
            <form action="">
                <div class="form-item">
                    <label for="username"><i class="iconfont icon-yonghuming1"></i></label>
                    <input type="text" id="username" name="username" autoComplete="off">
                </div>
                <div class="form-item">
                    <label for="password"><i class="iconfont icon-yonghuming"></i></label>
                    <input type="password" id="password" name="password" autoComplete="off">
                </div>
                <div class="form-item bottom">
                    <div class="form-btn">登陆</div>
                </div>
            </form>
        </main>
    </section>
</body>
</html>
