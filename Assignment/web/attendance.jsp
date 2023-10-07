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
        <link rel="stylesheet" type="text/css" href="../newcss.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1><span>Single activity Attendance</span></h1>
                </div>
                <div class="col-md-4">
                    <table style="margin-top: 2%">
                        <tbody>
                            <tr>
                                <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="https://apps.apple.com/app/id1527723314">
                                        <img src="https://fap.fpt.edu.vn/images/app-store.png" style="width: 120px; height: 40px" alt="apple store">
                                    </a>
                                </td>
                                <td>
                                    <a href="https://play.google.com/store/apps/details?id=com.fuct">
                                        <img src="https://fap.fpt.edu.vn/images/play-store.png" style="width: 120px; height: 40px" alt="google store">
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table style="width: 100%; border-collapse: collapse;margin-top: 5%; margin-bottom: 2%">
                        <thead style="background-color: #a0c3e1;">
                            <tr>
                                <th>No</th>
                                <th>Group</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Comment</th>
                                <th>Taker</th>
                                <th>Record time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance" value=""/>
                                    Absent<input type="radio" name="attendance" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance2" value=""/>
                                    Absent<input type="radio" name="attendance2" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance3" value=""/>
                                    Absent<input type="radio" name="attendance3" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance4" value=""/>
                                    Absent<input type="radio" name="attendance4" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance5" value=""/>
                                    Absent<input type="radio" name="attendance5" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance6" value=""/>
                                    Absent<input type="radio" name="attendance6" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance7" value=""/>
                                    Absent<input type="radio" name="attendance7" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance8" value=""/>
                                    Absent<input type="radio" name="attendance8" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance9" value=""/>
                                    Absent<input type="radio" name="attendance9" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance10" value=""/>
                                    Absent<input type="radio" name="attendance10" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance11" value=""/>
                                    Absent<input type="radio" name="attendance11" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance12" value=""/>
                                    Absent<input type="radio" name="attendance12" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance13" value=""/>
                                    Absent<input type="radio" name="attendance13" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance14" value=""/>
                                    Absent<input type="radio" name="attendance14" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance15" value=""/>
                                    Absent<input type="radio" name="attendance15" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance16" value=""/>
                                    Absent<input type="radio" name="attendance16" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance17" value=""/>
                                    Absent<input type="radio" name="attendance17" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance18" value=""/>
                                    Absent<input type="radio" name="attendance18" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance19" value=""/>
                                    Absent<input type="radio" name="attendance19" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance20" value=""/>
                                    Absent<input type="radio" name="attendance20" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance21" value=""/>
                                    Absent<input type="radio" name="attendance21" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance22" value=""/>
                                    Absent<input type="radio" name="attendance22" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance23" value=""/>
                                    Absent<input type="radio" name="attendance23" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance24" value=""/>
                                    Absent<input type="radio" name="attendance24" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance25" value=""/>
                                    Absent<input type="radio" name="attendance25" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance26" value=""/>
                                    Absent<input type="radio" name="attendance26" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance27" value=""/>
                                    Absent<input type="radio" name="attendance27" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance28" value=""/>
                                    Absent<input type="radio" name="attendance28" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance29" value=""/>
                                    Absent<input type="radio" name="attendance29" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td><a href="">PRJ301</a></td>
                                <td>HE130919</td>
                                <td>Phan Việt Bách</td>
                                <td>
                                    <center><img src="" style="height:146px;width:111px;border-width:0px;"></center>
                                </td>
                                <td>
                                    Present<input type="radio" name="attendance30" value=""/>
                                    Absent<input type="radio" name="attendance30" value=""/>
                                </td>
                                <td></td>
                                <td><a href="">sonnt5</a></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <input name="submit" type="submit" id="attend" value="Save" style="display: flex; margin: 0 auto; margin-bottom: 5%">
            </div>
        </div>
    </body>
</html>
