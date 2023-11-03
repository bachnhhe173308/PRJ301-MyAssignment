<%-- 
    Document   : checkAttendance
    Created on : Oct 21, 2023, 8:01:19 PM
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
                                <th>Subject</th>
                                <th>StudentID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Attendance</th>
                                <th>Description</th>
                                <th>Taker</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.atts}" var="a" varStatus="loop">
                                <c:set var="index" value="${loop.index + 1}" />
                                <tr>
                                    <td>
                                        ${index}
                                        <input type="hidden" name="stuid" value="${a.student.id}"/>
                                    </td>
                                    <td>
                                        ${a.session.group.subject.name}
                                    </td>
                                    <td>
                                        ${a.student.id}
                                    </td>
                                    <td>
                                        ${a.student.name}
                                    </td>
                                    <td>
                                        <img src="${a.student.img}" style="height:146px;width:111px;border-width:0px;"/>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${a.status}">
                                                <span style="color: green;">Present</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="color: red;">Absent</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <input type="text" value="${a.description}" name="description${a.student.id}" disabled/>
                                    </td>
                                    <td>
                                        ${a.session.instructor.name}
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <a href="attendance?sid=${param.sid}"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">Edit</button></a>
            
            <a href="home"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">Back to Home</button></a>
            
            <a href="ListStudentAttendance?gname=${param.gname}&subname=${param.subname}"><button style="display: flex; margin: 0 auto; margin-bottom: 1%">View attendance sheet in class</button></a>
            
        </div>
    </body>
</html>
