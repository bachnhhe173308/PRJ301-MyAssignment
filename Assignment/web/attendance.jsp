<%-- 
    Document   : attendance
    Created on : Oct 7, 2023, 2:52:09 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <form action="attendance" method="post">
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
                                            <input type="radio"
                                                   <c:if test="${!a.status}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="status${a.student.id}" value="absent" /> absent
                                            <input type="radio"
                                                   <c:if test="${a.status}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="status${a.student.id}" value="present" /> present
                                        </td>
                                        <td>
                                            <input type="text" value="${a.description}" name="description${a.student.id}"/>
                                        </td>
                                        <td>
                                            ${a.session.instructor.name}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" value="${param.sid}" name="sid"/>
                    <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
                    <input type="submit" value="Save" style="display: flex; margin: 0 auto; margin-bottom: 5%">
                </div>
            </form>
        </div>
    </body>
</html>
