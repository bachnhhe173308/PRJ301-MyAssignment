<%-- 
    Document   : home
    Created on : Nov 2, 2023, 10:52:10 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            header {
                background-color: #FFA042;
                color: #fff;
                padding: 5px 0;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            
            .left ul li{
                margin-bottom: 20%;
            }
            
            .left ul li a {
                color: #fff;
                font-weight: 500;
                transition: background 0.3s;
                border-radius: 8px;
                margin: 0 2%;
                padding: 8px 30px;
                text-decoration: none;
                font-size: x-large;
            }

            .left ul li a:hover {
                background-color: #555;
            }
            
            .container {
                display: flex;
                flex: 1;
            }

            nav.left {
                background-color: #333;
                color: #fff;
                flex: 1; /* Chiếm 1 phần bên trái */
                padding: 20px;
            }

            .content {
                flex: 9; /* Chiếm phần còn lại */
                padding: 20px;
                text-align: center;
            }

            .content img {
                max-width: 100%;
                height: auto;
                border-radius: 4px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);

            }
        </style>
    </head>
    <body>
        <div class="container">
            <nav class="left">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="timetable">TimeTable</a></li>
                    <li><a href="logout">Log out</a></li>
                </ul>
            </nav>
            
            <div class="content">
                <header>
                    <h1>Welcome ${sessionScope.account.displayname}</h1>
                </header>

                <img src="img/Untitled-6057-1612360667.png" alt="Image Description" />
            </div>
        </div>
    </body>
</html>