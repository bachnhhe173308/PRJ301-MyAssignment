<%-- 
    Document   : home
    Created on : Nov 2, 2023, 10:52:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
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

            .test ul li{
                margin-bottom: 20%;
            }
            
            .test ul li a {
                color: #fff;
                font-weight: 500;
                transition: background 0.3s;
                border-radius: 4px;
                margin: 0 2%;
                padding: 8px 30px;
                text-decoration: none;
                font-size: x-large;
            }

            .test ul li a:hover {
                background-color: #555;
            }
            
            .content {
                flex: 1;
                text-align: center;
                overflow-y: auto;
            }

            .content img {
                max-width: 100%;
                height: auto;
                border-radius: 4px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);

            }

            .links-container {
                flex: 1; /* Đảm bảo container mới sẽ chiếm hết không gian còn lại */
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
            }

            .test {
                box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.1);
                position: fixed;
                top: 0;
                left: 0;
                height: 100%; /* Đặt chiều cao của cột bên trái bằng chiều cao màn hình */
                width: 250px; /* Đặt chiều rộng của cột bên trái (tùy chỉnh) */
                background-color: darkgreen; /* Màu nền của cột bên trái */
                overflow: auto;
            }

        </style>
    </head>

    <body>
        <nav class="test">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="timetable">TimeTable</a></li>
                <li><a href="logout"> Log out</a></li>
            </ul>
        </nav>
        
        <header>
            <h1>Welcome ${sessionScope.account.displayname}</h1>
        </header>


        <div class="content">
            <img src="img/Untitled-6057-1612360667.png" alt="Image Description" />
        </div>

    </body>
</html>