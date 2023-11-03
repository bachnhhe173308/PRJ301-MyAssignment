<%-- 
    Document   : timetable
    Created on : Oct 19, 2023, 8:45:40 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            table {
                border-collapse: collapse; /* Loại bỏ khoảng cách giữa các đường kẻ */
                width: 100%; /* Đảm bảo bảng đầy đủ chiều rộng của container */
            }
            table thead tr{
                padding: 10px;
                border: 1px solid black;
            }
            table thead tr th {
                padding: 10px;
                border: 1px solid black;
            }
            table tbody tr {
                padding: 10px;
                border: 1px solid black;
            }
            table tbody tr td {
                padding: 10px;
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <img src="img/Logo_Dai_hoc_FPT.png" alt="" style="margin-left: 36%; width: 30%"/>
        <h1 style="margin-left: 42%">Weekly Schedule</h1>

        <div style="margin-top: 2%;text-align: center;">
            <a>Campus: </a>
            <select id="campusSelector">
                <option value="FU-HL">FU-HL</option>
                <option value="FU-HCM">FU-HCM</option>
                <option value="FU-CT">FU-CT</option>
            </select>
        </div>

        <form action="timetable" method="GET">
            <div style="text-align: center;">
                <label for="lecture">Lecture: </label>
                <input type="text" name="name" value="${param.name}"/><br>
                Get Date: <input type="date" value="${requestScope.from}" name="from"/>
                <input type="submit" value="View"/>
            </div>
        </form>

        <table style="width: -webkit-fill-available;margin: 3% 1%;">
            <thead style="background-color: orange;">
                <tr>
                    <th style="text-align: inherit;">
                        From <input type="date" value="${requestScope.from}" name="from" disabled /><br>
                        To <input type="date" value="${requestScope.to}" name="to" disabled/> 
                    </th>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <th>
                            ${d}
                        </th>
                    </c:forEach>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.slots}" var="s" varStatus="loop">
                    <tr>
                        <td>Slot ${s.id} (${s.description})</td>
                        <c:forEach items="${requestScope.dates}" var="d">
                            <td>
                                <c:forEach items="${requestScope.sessions}" var="k">
                                    <c:if test="${k.date eq d and k.slot.id eq s.id}">
                                        <a href="attendance?sid=${k.id}">
                                            ${k.group.name}<br>
                                            -${k.group.subject.name}<br>
                                            at ${k.room.id}<br>
                                            <c:if test="${k.isAtt}">
                                                <font color="green">(attended)</font>
                                            </c:if>
                                            <c:if test="${!k.isAtt}">
                                                <font color="red">(not yet)</font>
                                            </c:if>
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="home"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">Back to Home</button></a>
    </body>
</html>
