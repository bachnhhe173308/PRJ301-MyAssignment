<%-- 
    Document   : login
    Created on : Sep 27, 2023, 2:25:33 PM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url(img/bg.jpg);
                background-size: cover;
                background-position: center;
                display: flex;
                margin: 0;
                padding: 0;
                height: 100vh;
            }
            .container {
                width: 50%;
                background-color: #fff;
                margin: 0 auto;
                border-radius: 5px;
                margin-top: 100px;
                display: flex;
                align-items: center;
                width: 60%;
                height: 60%;
                box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                overflow: hidden;
                opacity: 0.9;
            }
            .container img {
                width: 50%;
                height: 100%;
                object-fit: cover;
            }
            .login-container {
                width: 50%;
                padding: 20px;
            }
            h2 {
                text-align: center;
            }
            form {
                text-align: center;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="checkbox"] {
                margin-left: 5px;
            }
            input[type="submit"] {
                background-color: #007BFF;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-container">
                <p style="color: aquamarine">${msg}</p>
                <h2>Login</h2>
                <form action="login" method="POST">
                    <input type="text" class="login-input" placeholder="Username" name="username">
                    <br/>
                    <input type="password" class="login-input" placeholder="Password" name="password">
                    <br/>
                    <p style="color: red">${error}</p>
                    <input type="submit" value="Login"/>
                </form>
            </div>
            <img src="img/dh-fpt.jpg" alt=""/>
        </div>
    </body>
</html>
 