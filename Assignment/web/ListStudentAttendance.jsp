<%-- 
    Document   : ListAttendanceStudent
    Created on : Oct 27, 2023, 1:29:58 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1>Attendance sheet of class ${param.gname} with subject ${param.subname}: </h1>
        <div class="row">
            <div class="col-md-12">
                <table style="width: 100%; border-collapse: collapse;margin-top: 5%; margin-bottom: 2%">
                    <thead style="background-color: orange;">
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Absent Percent</th>
                                <c:forEach items="${requestScope.dates}" var="d">
                                <th>
                                    ${d}
                                </th>
                            </c:forEach>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                            <tr>
                                <td>
                                    ${s.id}
                                </td>
                                <td>
                                    ${s.name}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${requestScope.absentPercentages[loop.index] > 20}">
                                            <font color="red">${requestScope.absentPercentages[loop.index]}%</font>
                                        </c:when>
                                        <c:otherwise>
                                            ${requestScope.absentPercentages[loop.index]}%
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <c:forEach items="${requestScope.atts}" var="a">

                                        <c:if test="${a.session.date eq d and a.student.id eq s.id}">
                                            <c:choose>
                                                <c:when test="${a.status == true}">
                                                    <td>
                                                        <font color="green">P</font>
                                                    </td>
                                                </c:when>
                                                <c:when test="${a.status == false}">
                                                    <td>
                                                        <font color="red">A</font>
                                                    </td>
                                                </c:when>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${a.session.date eq d}">
                                            <c:if test="${a.status == null}">
                                                <td>
                                                    <font color="blue">...</font>
                                                </td>
                                            </c:if>
                                        </c:if>

                                    </c:forEach>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <a href="home"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">Back to Home</button></a>
    </body>
</html>
