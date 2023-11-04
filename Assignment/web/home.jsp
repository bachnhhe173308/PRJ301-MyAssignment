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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            
            .col-md-2 ul li{
                margin-bottom: 20%;
                list-style-type: none;
            }
            
            .col-md-2 ul li a {
                color: #fff;
                font-weight: 500;
                transition: background 0.3s;
                border-radius: 8px;
                margin: 0 2%;
                padding: 8px 30px;
                text-decoration: none;
                font-size: x-large;
            }

            .col-md-2 ul li a:hover {
                background-color: #555;
            }
            
            .row {
                display: flex;
                flex: 1;
                margin: 0;
                padding: 0;
            }

            nav.col-md-2 {
                background-color: #333;
                color: #fff;
                flex: 2;
                padding: 20px;
            }

            .col-md-10 {
                flex: 8;
                padding: 20px;
                text-align: center;
            }

            .col-md-10 img {
                max-width: 100%;
                height: auto;
                border-radius: 4px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);

            }
        </style>
    </head>
    <body>
        <div class="row">
            <nav class="col-md-2">
                <ul>
                    <li><a href="home"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                    <li><a href="timetable"><i class="glyphicon glyphicon-calendar"></i> TimeTable</a></li>
                    <li><a href="logout"><i class="glyphicon glyphicon-log-out"></i> Log out</a></li>
                </ul>
            </nav>
            
            <div class="col-md-10">
                <header>
                    <h1>Welcome ${sessionScope.account.displayname}</h1>
                </header>

                <img src="img/Untitled-6057-1612360667.png" alt="Image Description" />
            </div>
        </div>
    </body>
</html>