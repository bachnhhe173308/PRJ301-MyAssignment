<%-- 
    Document   : attendance
    Created on : Oct 7, 2023, 2:52:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Single activity Attendance</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
        table thead tr{
            padding: 10px;
        }
        table thead tr th {
            padding: 10px;
        }
        table tbody tr {
            padding: 10px;
        }
        table tbody tr td {
            padding: 10px;
        }

        </style>
    </head>
    <body>
        <img src="img/Logo_Dai_hoc_FPT.png" alt="" style="margin-left: 36%; width: 30%"/>
        <div class="container">
            <h1>Single activity Attendance</h1>
            
            <div class="row">
                <div class="col-md-12">
                    <table style="width: 100%; border-collapse: collapse;margin-top: 5%; margin-bottom: 2%">
                        <thead style="background-color: orange;">
                            <tr>
                                <th>No</th>
                                <th>Group</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Attendance</th>
                                <th>Taker</th>
                                <th>Record time</th>
                                <th>Number of absences</th>
                                <th>Total number of sessions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 1; i <= 10; i++) {
                            %>
                            <tr>
                                <td><%= i %></td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Nguyễn Văn A</td>
                                <td>
                                    <center><img src="img/Richard.png" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                    <td>
                                        Present<input type="radio" name="attendance<%= i %>" value=""/><br>
                                        Absent<input type="radio" name="attendance<%= i %>" value=""/>
                                    </td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                                <td>0</td>
                                <td>20</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <input name="submit" type="submit" id="attend" value="Save" style="display: flex; margin: 0 auto; margin-bottom: 5%">
            </div>
        </div>
    </body>
</html>
