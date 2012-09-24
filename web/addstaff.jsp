<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="helper.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            } HMSHelper mgr = new HMSHelper();
 %>
<html>
    <head>
        <meta charset="utf-8">
        <title>ClaimSync Extended</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Le styles -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link type="text/css" href="css/custom-theme/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
        <link href="css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css">
        <style type="text/css" title="currentStyle">
            @import "css/jquery.dataTables_themeroller.css";
            @import "css/custom-theme/jquery-ui-1.8.16.custom.css";
            body {
                /*    overflow: hidden; */
            }

            .large_button {
                background-color: #35AFE3;
                background-image: -moz-linear-gradient(center top , #45C7EB, #2698DB);
                box-shadow: 0 1px 0 0 #6AD2EF inset;
                color: #FFFFFF;
                text-decoration: none;
                font-weight: lighter;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 36px;
            }

            .large_button:hover {
                background-color: #FBFBFB;
                background-image: -moz-linear-gradient(center top , #FFFFFF, #F5F5F5);
                background-repeat: repeat-x;
                border: 1px solid #DDDDDD;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 0 #FFFFFF inset;
                list-style: none outside none;
                color: #777777;
                /* padding: 7px 14px; */
            }
        </style>

        <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
        <script type="text/javascript">
            function submitform(){
                var name = document.getElementById("name").value;
                // var roledescription = document.getElementById("roledescription").value;
              
                 
                $.post('action/unitaction.jsp', { action : "units", name : name}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );
            }
            
            function updateUnit(){
                var uname = document.getElementById("nameunit").value;
                var uid = document.getElementById("unitid").value;
                // var roledescription = document.getElementById("roledescription").value;
              
                 
                $.post('action/unitaction.jsp', { action : "edit", uname : uname, uid : uid}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );
            }
            
            function deleteUnit(){
                var id = document.getElementById("id").value;
                // var roledescription = document.getElementById("roledescription").value;
                var con = confirm("Are You Sure You Want Delete This Staff");
                if (con ==true)
                {
                    $.post('action/staffaction.jsp', { action : "delete", id : id}, function(data) {
                        alert(data);
                        $('#results').html(data).hide().slideDown('slow');
                    } );
                }
                else 
                {
                    alert("Delete Was Cancled!");
                    //return;
                }
                 
                
            }
            
            function addpermission(name){
                var perms = document.getElementsByName(name);
                for(var i = 0; i<perms.length;i++){
                    alert("here"+perms[i].value);
                }
                 
            }
        </script>
    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <!-- Navbar
        ================================================== -->
        <div style="display: none;" class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
                    <a class="brand" href="../"><img src="images/logo.png" width="200px;" /></a>

                    <div style="margin-top: 10px;" class="nav-collapse">
                        <ul class="nav pull-right">

                            <li class="dropdown">
                                <a class="active" > Logged in as:  <%=mgr.getStafftableByid(user.getStaffid()).getLastname() %> <%=mgr.getStafftableByid(user.getStaffid()).getOthername() %></a>

                            </li>
                            <li class="divider-vertical"></li>

                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> Account <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li>
                                        <a target="_blank" href="bootstrap.min.css"><i class="icon-wrench"></i> Settings </a>
                                    </li>

                                    <li>
                                        <a target="_blank" href="bootstrap.css"><i class="icon-question-sign"></i> Help </a>
                                    </li>
                                    <li>
                                        <a target="_blank" href="bootstrap.css"><i class="icon-share"></i> Feedback </a>
                                    </li>
                                    <li class="divider"></li>

                                    <li>
                                        <a target="_blank" href="logout.jsp"><i class="icon-off"></i> Log Out</a>
                                    </li>

                                </ul>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li>
                            <a href="#">Inventory</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>

            <div style="position: absolute; left: 30%; top: 200px; text-align: center;" class="progress1">
                <img src="images/logoonly.png" width="136px;" style="margin-bottom: 20px;" />
                <a href="#"> <h3 class="segoe" style="text-align: center; font-weight: lighter;"> Your page is taking longer than expected to load.....
                        <br />
                        Please be patient!</h3>
                    <br />
                </a>
                <div  class="progress progress-striped active span5">

                    <div class="bar"
                         style="width: 100%;"></div>
                </div>
            </div>

            <section style="margin-top: -30px;" id="dashboard">
                <%if (session.getAttribute("lasterror") != null) {%>

                <div class="alert alert-danger">
                    <%=session.getAttribute("lasterror")%> 
                </div>
                <%
                        session.removeAttribute("lasterror");
                    }%>
                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%

                        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

                       // HMSHelper mgr = new HMSHelper();

                        List itmss = mgr.listAllStaff();




                    %>     
                    <%@include file="widgets/leftsidebar.jsp" %>
                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li>
                                    <h4>Add New Unit</h4>
                                    <br/>
                                    <a> <i class="icon-tasks"></i>Complete The Fields Below To Add A New Unit</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="dialog_link">

                                        <i class="icon-tasks"></i>Show Employees
                                    </a>

                                </li>

                            </ul>

                            <form action="action/staffaction.jsp" method="post" onsubmit="return validateForm();" name="items" >

                                <fieldset>

                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Employee ID: </label>
                                        <div class="controls">
                                            <input type="text" name="employeeid" id="employeeid">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Employee ID: </label>
                                        <div class="controls">
                                            <select name="title">
                                                <option value="Prof.">Prof.</option>
                                                <option value="Dr.">Dr.</option>
                                                <option value="Mr.">Mr.</option>
                                                <option value="Mrs.">Mrs.</option>
                                                <option value="Miss.">Miss.</option>
                                                <option value="Ms.">Ms.</option>
                                            </select>
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Last Name: </label>
                                        <div class="controls">
                                            <input type="text" name="lname" id="fname">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Other Names: </label>
                                        <div class="controls">
                                            <input type="text" name="othername" id="othername">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Social Security Number: </label>
                                        <div class="controls">
                                            <input type="text" name="ssn" id="ssn">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputError">Date of Birth</label>
                                        <div class="controls">
                                            <select class="input-mini"  name="day">
                                                <option>D</option>
                                                <option value="01">1</option>
                                                <option value="02">2</option>
                                                <option value="03">3</option>
                                                <option value="04">4</option>
                                                <option value="05">5</option>
                                                <option value="06">6</option>
                                                <option value="07">7</option>
                                                <option value="08">8</option>
                                                <option value="09">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                                <option value="22">22</option>
                                                <option value="23">23</option>
                                                <option value="24">24</option>
                                                <option value="25">25</option>
                                                <option value="26">26</option>
                                                <option value="27">27</option>
                                                <option value="28">28</option>
                                                <option value="29">29</option>
                                                <option value="30">30</option>
                                                <option value="31">31</option>
                                            </select>

                                            <select class="input-mini" name="month">
                                                <option>M</option>
                                                <option value="01">Jan</option>
                                                <option value="02">Feb</option>
                                                <option value="03">Mar</option>
                                                <option value="04">Apr</option>
                                                <option value="05">May</option>
                                                <option value="06">Jun</option>
                                                <option value="07">Jul</option>
                                                <option value="08">Aug</option>
                                                <option value="09">Sep</option>
                                                <option value="10">Oct</option>
                                                <option value="11">Nov</option>
                                                <option value="12">Dec</option>
                                            </select>



                                            <select class="input-small"  name="year">
                                                <option>Y</option>

                                                <option value="2012">2012</option>
                                                <option value="2011">2011</option>
                                                <option value="2010">2010</option>
                                                <option value="2009">2009</option>
                                                <option value="2008">2008</option>
                                                <option value="2007">2007</option>
                                                <option value="2006">2006</option>
                                                <option value="2005">2005</option>
                                                <option value="2004">2004</option>
                                                <option value="2003">2003</option>
                                                <option value="2002">2002</option>
                                                <option value="2001">2001</option>
                                                <option value="2000">2000</option>
                                                <option value="1999">1999</option>
                                                <option value="1998">1998</option>
                                                <option value="1997">1997</option>
                                                <option value="1996">1996</option>
                                                <option value="1995">1995</option>
                                                <option value="1994">1994</option>
                                                <option value="1993">1993</option>
                                                <option value="1992">1992</option>
                                                <option value="1991">1991</option>
                                                <option value="1990">1990</option>
                                                <option value="1989">1989</option>
                                                <option value="1988">1988</option>
                                                <option value="1987">1987</option>
                                                <option value="1986">1986</option>
                                                <option value="1985">1985</option>
                                                <option value="1984">1984</option>
                                                <option value="1983">1983</option>
                                                <option value="1982">1982</option>
                                                <option value="1981">1981</option>
                                                <option value="1980">1980</option>
                                                <option value="1979">1979</option>
                                                <option value="1978">1978</option>
                                                <option value="1977">1977</option>
                                                <option value="1976">1976</option>
                                                <option value="1975">1975</option>
                                                <option value="1974">1974</option>
                                                <option value="1973">1973</option>
                                                <option value="1972">1972</option>
                                                <option value="1971">1971</option>
                                                <option value="1970">1970</option>
                                                <option value="1969">1969</option>
                                                <option value="1968">1968</option>
                                                <option value="1967">1967</option>
                                                <option value="1966">1966</option>
                                                <option value="1965">1965</option>
                                                <option value="1964">1964</option>
                                                <option value="1963">1963</option>
                                                <option value="1962">1962</option>
                                                <option value="1961">1961</option>
                                                <option value="1960">1960</option>
                                                <option value="1959">1959</option>
                                                <option value="1958">1958</option>
                                                <option value="1957">1957</option>
                                                <option value="1956">1956</option>
                                                <option value="1955">1955</option>
                                                <option value="1954">1954</option>
                                                <option value="1953">1953</option>
                                                <option value="1952">1952</option>
                                                <option value="1951">1951</option>
                                                <option value="1950">1950</option>
                                                <option value="1949">1949</option>
                                                <option value="1948">1948</option>
                                                <option value="1947">1947</option>
                                                <option value="1946">1946</option>
                                                <option value="1945">1945</option>
                                                <option value="1944">1944</option>
                                                <option value="1943">1943</option>
                                                <option value="1942">1942</option>
                                                <option value="1941">1941</option>
                                                <option value="1940">1940</option>
                                                <option value="1939">1939</option>
                                                <option value="1938">1938</option>
                                                <option value="1937">1937</option>
                                                <option value="1936">1936</option>
                                                <option value="1935">1935</option>
                                                <option value="1934">1934</option>
                                                <option value="1933">1933</option>
                                                <option value="1932">1932</option>
                                                <option value="1931">1931</option>
                                                <option value="1930">1930</option>
                                                <option value="1929">1929</option>
                                                <option value="1928">1928</option>
                                                <option value="1927">1927</option>
                                                <option value="1926">1926</option>
                                                <option value="1925">1925</option>
                                                <option value="1924">1924</option>
                                                <option value="1923">1923</option>
                                                <option value="1922">1922</option>
                                                <option value="1921">1921</option>
                                                <option value="1920">1920</option>
                                                <option value="1919">1919</option>
                                                <option value="1918">1918</option>
                                                <option value="1917">1917</option>
                                                <option value="1916">1916</option>
                                                <option value="1915">1915</option>
                                                <option value="1914">1914</option>
                                                <option value="1913">1913</option>
                                                <option value="1912">1912</option>
                                                <option value="1911">1911</option>
                                                <option value="1910">1910</option>
                                                <option value="1909">1909</option>
                                                <option value="1908">1908</option>
                                                <option value="1907">1907</option>
                                                <option value="1906">1906</option>
                                                <option value="1905">1905</option>
                                                <option value="1904">1904</option>
                                                <option value="1903">1903</option>
                                                <option value="1902">1902</option>
                                                <option value="1901">1901</option>
                                                <option value="1900">1900</option>
                                            </select>

                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01">Gender</label>
                                        <div class="controls">
                                            <select name="gender" id="select01">
                                                <option>Male</option>
                                                <option>Female</option>
                                            </select>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Place of Birth: </label>
                                        <div class="controls">
                                            <input type="text" name="pob" id="pob">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Year Employed: </label>
                                        <div class="controls">
                                            <select name="yearemployed">
                                                <<option>Y</option>

                                                <option value="2012">2012</option>
                                                <option value="2011">2011</option>
                                                <option value="2010">2010</option>
                                                <option value="2009">2009</option>
                                                <option value="2008">2008</option>
                                                <option value="2007">2007</option>
                                                <option value="2006">2006</option>
                                                <option value="2005">2005</option>
                                                <option value="2004">2004</option>
                                                <option value="2003">2003</option>
                                                <option value="2002">2002</option>
                                                <option value="2001">2001</option>
                                                <option value="2000">2000</option>
                                                <option value="1999">1999</option>
                                                <option value="1998">1998</option>
                                                <option value="1997">1997</option>
                                                <option value="1996">1996</option>
                                                <option value="1995">1995</option>
                                                <option value="1994">1994</option>
                                                <option value="1993">1993</option>
                                                <option value="1992">1992</option>
                                                <option value="1991">1991</option>
                                                <option value="1990">1990</option>
                                                <option value="1989">1989</option>
                                                <option value="1988">1988</option>
                                                <option value="1987">1987</option>
                                                <option value="1986">1986</option>
                                                <option value="1985">1985</option>
                                                <option value="1984">1984</option>
                                                <option value="1983">1983</option>
                                                <option value="1982">1982</option>
                                                <option value="1981">1981</option>
                                                <option value="1980">1980</option>
                                                <option value="1979">1979</option>
                                                <option value="1978">1978</option>
                                                <option value="1977">1977</option>
                                                <option value="1976">1976</option>
                                                <option value="1975">1975</option>
                                                <option value="1974">1974</option>
                                                <option value="1973">1973</option>
                                                <option value="1972">1972</option>
                                                <option value="1971">1971</option>
                                                <option value="1970">1970</option>
                                                <option value="1969">1969</option>
                                                <option value="1968">1968</option>
                                                <option value="1967">1967</option>
                                                <option value="1966">1966</option>
                                                <option value="1965">1965</option>
                                                <option value="1964">1964</option>
                                                <option value="1963">1963</option>
                                                <option value="1962">1962</option>
                                                <option value="1961">1961</option>
                                                <option value="1960">1960</option>
                                                <option value="1959">1959</option>
                                                <option value="1958">1958</option>
                                                <option value="1957">1957</option>
                                                <option value="1956">1956</option>
                                                <option value="1955">1955</option>
                                                <option value="1954">1954</option>
                                                <option value="1953">1953</option>
                                                <option value="1952">1952</option>
                                                <option value="1951">1951</option>
                                                <option value="1950">1950</option>
                                                <option value="1949">1949</option>
                                                <option value="1948">1948</option>
                                                <option value="1947">1947</option>
                                                <option value="1946">1946</option>
                                                <option value="1945">1945</option>
                                                <option value="1944">1944</option>
                                                <option value="1943">1943</option>
                                                <option value="1942">1942</option>
                                                <option value="1941">1941</option>
                                                <option value="1940">1940</option>
                                                <option value="1939">1939</option>
                                                <option value="1938">1938</option>
                                                <option value="1937">1937</option>
                                                <option value="1936">1936</option>
                                                <option value="1935">1935</option>
                                                <option value="1934">1934</option>
                                                <option value="1933">1933</option>
                                                <option value="1932">1932</option>
                                                <option value="1931">1931</option>
                                                <option value="1930">1930</option>
                                                <option value="1929">1929</option>
                                                <option value="1928">1928</option>
                                                <option value="1927">1927</option>
                                                <option value="1926">1926</option>
                                                <option value="1925">1925</option>
                                                <option value="1924">1924</option>
                                                <option value="1923">1923</option>
                                                <option value="1922">1922</option>
                                                <option value="1921">1921</option>
                                                <option value="1920">1920</option>
                                                <option value="1919">1919</option>
                                                <option value="1918">1918</option>
                                                <option value="1917">1917</option>
                                                <option value="1916">1916</option>
                                                <option value="1915">1915</option>
                                                <option value="1914">1914</option>
                                                <option value="1913">1913</option>
                                                <option value="1912">1912</option>
                                                <option value="1911">1911</option>
                                                <option value="1910">1910</option>
                                                <option value="1909">1909</option>
                                                <option value="1908">1908</option>
                                                <option value="1907">1907</option>
                                                <option value="1906">1906</option>
                                                <option value="1905">1905</option>
                                                <option value="1904">1904</option>
                                                <option value="1903">1903</option>
                                                <option value="1902">1902</option>
                                                <option value="1901">1901</option>
                                                <option value="1900">1900</option>
                                            </select>
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Role: </label>
                                        <div class="controls">
                                            <select name="role">
                                                <option>R</option>
                                                <%
                                                    List roles = mgr.listRoles();
                                                    for (int j = 0; j < roles.size(); j++) {
                                                        Roletable roletable = (Roletable) roles.get(j);
                                                %>
                                                <option value="<%=roletable.getRoleid()%>"><%=roletable.getRolename()%></option> 
                                                <% }

                                                %>
                                            </select>
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Extra Role: </label>
                                        <div class="controls">
                                            <input type="text" name="extrarole" id="extrarole">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01">Email</label>
                                        <div class="controls">

                                            <input type="text" name="email" id="extrarole">
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Address: </label>
                                        <div class="controls">
                                            <input type="text" name="address" id="address">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Contact: </label>
                                        <div class="controls">
                                            <input type="text" name="contact" id="contact">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Next of Kin: </label>
                                        <div class="controls">
                                            <input type="text" name="nextofkin" id="nextofkin">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Next of Kin Contact: </label>
                                        <div class="controls">
                                            <input type="text" name="kincontact" id="kincontact">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Department Name: </label>
                                        <div class="controls">
                                            <select name="departmentid">
                                                <option>D</option>
                                                <%
                                                    List departments = mgr.listDepartments();
                                                    for (int j = 0; j < departments.size(); j++) {
                                                        Department department = (Department) departments.get(j);
                                                %>
                                                <option value="<%=department.getDepartmentid()%>"><%=department.getDepartment()%></option> 
                                                <% }

                                                %>
                                            </select>
                                        </div>
                                        <p class="help-block"></p>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Qualifications: </label>
                                        <div class="controls">
                                            <table>
                                                <tr>
                                                    <td>Qualification</td><td>From</td><td>To</td><td>Institution</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        SHS 
                                                        <input type="hidden" name="shs" id="bachelors" value="SHS"> 
                                                    </td>
                                                    <td>
                                                        <input type="text" name="shsfrom" id="bachelors"> 
                                                    </td>

                                                    <td> <input type="text" name="shsto" id="bachelors"> 

                                                    </td>
                                                    <td>
                                                        <input type="text" name="shsinstitution" id="bachelors"> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        HND
                                                        <input type="hidden" name="hnd" id="bachelors" value="HND"> 
                                                    </td>
                                                    <td>
                                                        <input type="text" name="hndfrom" id="bachelors"> 
                                                    </td>

                                                    <td> <input type="text" name="hndto" id="bachelors"> 

                                                    </td>
                                                    <td>
                                                        <input type="text" name="hndinstitution" id="bachelors"> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Bachelors: 
                                                        <input type="hidden" name="bachelors" id="bachelors" value="Bachelors"> 
                                                    </td>
                                                    <td>
                                                        <input type="text" name="bachelorsfrom" id="bachelors"> 
                                                    </td>

                                                    <td> <input type="text" name="bachelorsto" id="bachelors"> 

                                                    </td>
                                                    <td>
                                                        <input type="text" name="bachelorsinstitution" id="bachelors"> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Masters
                                                        <input type="hidden" name="masters" id="bachelors" value="Masters"> 
                                                    </td>
                                                    <td>
                                                        <input type="text" name="mastersfrom" id="bachelors"> 
                                                    </td>

                                                    <td> <input type="text" name="mastersto" id="bachelors"> 

                                                    </td>
                                                    <td>
                                                        <input type="text" name="mastersinstitution" id="bachelors"> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Doctorate
                                                        <input type="hidden" name="phd" id="bachelors" value="Doctorate"> 
                                                    </td>
                                                    <td>
                                                        <input type="text" name="phdfrom" id="bachelors"> 
                                                    </td>

                                                    <td> <input type="text" name="phdto" id="bachelors"> 

                                                    </td>
                                                    <td>
                                                        <input type="text" name="phdinstitution" id="bachelors"> 
                                                    </td>
                                                </tr>
                                            </table>

                                            <p class="help-block"></p>

                                            <p class="help-block"></p>

                                            <p class="help-block"></p>
                                        </div>
                                    </div>

                                    <div style="text-align: center;" class="form-actions">

                                        <div class="form-actions">

                                            <button class="btn btn-danger btn-large" type="submit" name="action" value="stafftable" onclick='submitform();return false;'>
                                                <i class="icon-arrow-right icon-white"> </i> Add Staff 
                                            </button>

                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>

                    </div>
                    <div class="clearfix"></div>

                </div>
                <div style="display: none;" id="dialog" title="List of All Staff">
                    <table class="example display">
                        <thead>
                            <tr>
                                <th>
                                    Staff Name 
                                </th>
                                <th>Username</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                <th>Permission</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < itmss.size(); i++) {
                                    Stafftable stafftable = (Stafftable) itmss.get(i);
                                    // List users = mgr.listUsers(stafftable.getStaffid());
                                    //Users user = (Users) users.get(0);
%>
                            <tr>
                                <td>
                                    <%=stafftable.getLastname()%>, <%=stafftable.getOthername()%>
                                </td>
                                <td>

                                </td>
                                <td><% if (stafftable.isActive()) {%>
                                    <button class="btn btn-group btn-medium" id="<%=stafftable.getStaffid()%>_link">
                                        <i class="icon-arrow-right icon-white"> </i> Edit 
                                    </button>
                                    <%} else {%>In active<%}%>
                                    <div style="display: none;" id="<%=stafftable.getStaffid()%>_dialog" title="Editting <%=stafftable.getLastname()%>, <%=stafftable.getOthername()%>">
                                        <form action="action/staffaction.jsp" method="post" onsubmit="return validateForm();" name="items" >

                                            <fieldset>      
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Employee ID: </label>
                                                    <div class="controls">
                                                        <input type="text" name="employeeid" id="employeeid" value="<%=stafftable.getStaffid()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Last Name: </label>
                                                    <div class="controls">
                                                        <input type="text" name="lname" id="fname" value="<%=stafftable.getLastname()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Other Names: </label>
                                                    <div class="controls">
                                                        <input type="text" name="othername" id="othername" value="<%=stafftable.getOthername()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Social Security Number: </label>
                                                    <div class="controls">
                                                        <input type="text" name="ssn" id="ssn" value="<%=stafftable.getSsn()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="inputError">Date of Birth</label>
                                                    <div class="controls">
                                                        <input type="text" name="dob" id="ssn" value="<%=stafftable.getDob()%>">
                                                        <span class="help-inline"></span>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01">Gender</label>
                                                    <div class="controls">
                                                        <input type="text" name="gender" id="gender" value="<%=stafftable.getGender()%>">
                                                        <p class="help-inline">

                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Place of Birth: </label>
                                                    <div class="controls">
                                                        <input type="text" name="pob" id="pob" value="<%=stafftable.getPlaceofbirth()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Year Employed: </label>
                                                    <div class="controls">
                                                        <input type="text" name="yearemployed" id="pob" value="<%=stafftable.getYearofemployment()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Role: </label>
                                                    <div class="controls">
                                                        <%=mgr.getRoleByid(stafftable.getRole()).getRolename()%>
                                                        <select name="role">
                                                            <option>R</option>
                                                            <%
                                                                //List roles = mgr.listRoles();
                                                                for (int j = 0; j < roles.size(); j++) {
                                                                    Roletable roletable = (Roletable) roles.get(j);
                                                                    if (stafftable.getRole() == roletable.getRoleid()) {%>
                                                            <option value="<%=roletable.getRoleid()%>" selected="selected"><%=roletable.getRolename()%></option> 
                                                            <%} else {%>
                                                            <option value="<%=roletable.getRoleid()%>"><%=roletable.getRolename()%></option> 
                                                            <% }
                                                                }
                                                            %>
                                                        </select>
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Extra Role: </label>
                                                    <div class="controls">
                                                        <input type="text" name="extrarole" id="extrarole" value="<%=stafftable.getExtraduty()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01">Email</label>
                                                    <div class="controls">

                                                        <input type="text" name="email" id="extrarole" value="<%=stafftable.getEmail()%>">
                                                        <p class="help-inline">

                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Address: </label>
                                                    <div class="controls">
                                                        <input type="text" name="address" id="address" value="<%=stafftable.getAddress()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Contact: </label>
                                                    <div class="controls">
                                                        <input type="text" name="contact" id="contact" value="<%=stafftable.getContact()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Next of Kin: </label>
                                                    <div class="controls">
                                                        <input type="text" name="nextofkin" id="nextofkin" value="<%=stafftable.getNextofkin()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Next of Kin Contact: </label>
                                                    <div class="controls">
                                                        <input type="text" name="kincontact" id="kincontact" value="<%=stafftable.getNextofkincontact()%>">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Department Name: </label>
                                                    <div class="controls">
                                                        <%=mgr.getDepartmentByid(stafftable.getUnit()).getDepartment()%>
                                                        <select name="departmentid">
                                                            <option>D</option>
                                                            <%
                                                                // List departments = mgr.listDepartments();
                                                                for (int j = 0; j < departments.size(); j++) {
                                                                    Department department = (Department) departments.get(j);
                                                                    //Roletable roletable = (Roletable) roles.get(j);
                                                                    if (stafftable.getUnit() == department.getDepartmentid()) {%>
                                                            <option value="<%=department.getDepartmentid()%>" selected="selected"><%=department.getDepartment()%></option> 
                                                            %>

                                                            <% } else {%>
                                                            <option value="<%=department.getDepartmentid()%>"><%=department.getDepartment()%></option> 
                                                            <%  }
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                    <p class="help-block"></p>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="input01"> Qualifications: </label>
                                                    <div class="controls">
                                                        <table>
                                                            <tr>
                                                                <td>Qualification</td><td>From</td><td>To</td><td>Institution</td>
                                                                <% List qualifications = mgr.listQualificationByStaffid(stafftable.getStaffid());
                                                                    Qualification qualification = (Qualification) qualifications.get(0);
                                                                %>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    SHS 
                                                                    <input type="hidden" name="shs" id="bachelors" value="SHS"> 
                                                                    <input type="hidden" name="shsid" id="bachelors" value="<%=qualification.getQuid()%>"> 
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="shsfrom" id="bachelors" value="<%=qualification.getStartyear()%>"> 
                                                                </td>

                                                                <td> <input type="text" name="shsto" id="bachelors" value="<%=qualification.getEndyear()%>"> 

                                                                </td>
                                                                <td>
                                                                    <input type="text" name="shsinstitution" id="bachelors" value="<%=qualification.getInstitution()%>"> 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <% qualification = (Qualification) qualifications.get(1);%>
                                                                <td>
                                                                    HND
                                                                    <input type="hidden" name="hnd" id="bachelors" value="HND"> 
                                                                    <input type="hidden" name="hndid" id="bachelors" value="<%=qualification.getQuid()%>"> 
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="hndfrom" id="bachelors" value="<%=qualification.getStartyear()%>"> 
                                                                </td>

                                                                <td> <input type="text" name="hndto" id="bachelors" value="<%=qualification.getEndyear()%>"> 

                                                                </td>
                                                                <td>
                                                                    <input type="text" name="hndinstitution" id="bachelors" value="<%=qualification.getInstitution()%>"> 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <% qualification = (Qualification) qualifications.get(2);%>
                                                                <td>
                                                                    Bachelors: 
                                                                    <input type="hidden" name="bachelors" id="bachelors" value="Bachelors"> 
                                                                    <input type="hidden" name="bachelorid" id="bachelors" value="<%=qualification.getQuid()%>"> 
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="bachelorsfrom" id="bachelors" value="<%=qualification.getStartyear()%>"> 
                                                                </td>

                                                                <td> <input type="text" name="bachelorsto" id="bachelors" value="<%=qualification.getEndyear()%>"> 

                                                                </td>
                                                                <td>
                                                                    <input type="text" name="bachelorsinstitution" id="bachelors" value="<%=qualification.getInstitution()%>" > 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <% qualification = (Qualification) qualifications.get(3);%>
                                                                <td>
                                                                    Masters
                                                                    <input type="hidden" name="masters" id="bachelors" value="Masters"> 
                                                                    <input type="hidden" name="mastersid" id="bachelors" value="<%=qualification.getQuid()%>"> 
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="mastersfrom" id="bachelors" value="<%=qualification.getStartyear()%>"> 
                                                                </td>

                                                                <td> <input type="text" name="mastersto" id="bachelors" value="<%=qualification.getEndyear()%>"> 

                                                                </td>
                                                                <td>
                                                                    <input type="text" name="mastersinstitution" id="bachelors" value="<%=qualification.getInstitution()%>"> 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <% qualification = (Qualification) qualifications.get(4);%>
                                                                <td>
                                                                    Doctorate
                                                                    <input type="hidden" name="phd" id="bachelors" value="Doctorate"> 
                                                                    <input type="hidden" name="phdid" id="bachelors" value="<%=qualification.getQuid()%>"> 
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="phdfrom" id="bachelors" value="<%=qualification.getStartyear()%>"> 
                                                                </td>

                                                                <td> <input type="text" name="phdto" id="bachelors" value="<%=qualification.getEndyear()%>"> 

                                                                </td>
                                                                <td>
                                                                    <input type="text" name="phdinstitution" id="bachelors" value="<%=qualification.getInstitution()%>"> 
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <p class="help-block"></p>

                                                        <p class="help-block"></p>

                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>

                                                <div style="text-align: center;" class="form-actions">

                                                    <div class="form-actions">

                                                        <button class="btn btn-danger btn-large" type="submit" name="action" value="update">
                                                            <i class="icon-arrow-right icon-white"> </i> Update Staff Detail 
                                                        </button>

                                                    </div>
                                                </div>

                                            </fieldset>
                                        </form>
                                    </div>
                                </td>

                                <td>
                                    <% if (stafftable.isActive()) {%>
                                    <form action="action/unitaction.jsp" method="post">
                                        <input type="hidden" id="id" value="<%=stafftable.getStaffid()%>"/> 
                                        <input type="hidden" id="userid" value="<%=stafftable.getStaffid()%>"/> 

                                        <button class="btn btn-danger btn-medium" type="submit" name="action" value="delete" onclick='deleteUnit();return false;'>
                                            <i class="icon-arrow-right icon-white"> </i> Delete  
                                        </button>
                                    </form>
                                    <%} else {%>
                                    Not Active  
                                    <%}%>
                                </td>
                                <td>
                                    <% if (stafftable.isActive()) {%>
                                    <button class="btn btn-group btn-medium" id="<%=stafftable.getStaffid()%>_permission">
                                        <i class="icon-arrow-right icon-white"> </i> Set Permission 
                                    </button>
                                    <%} else {%>
                                    Not Active  
                                    <%}%>
                                    <div style="display: none;" id="<%=stafftable.getStaffid()%>_dialog_permission" title="Permissions: <%=stafftable.getLastname()%>, <%=stafftable.getOthername()%>">
                                        <form action="action/permissionaction.jsp" method="post" onsubmit="return validateForm();" name="items" >
                                            <table class="example display">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            Permission
                                                        </th>
                                                        <th>
                                                            Check to Set Permission
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% List lists = mgr.listPermissions();
                                                        List<Integer> index = new ArrayList();
                                                        for (int v = 0; v < lists.size(); v++) {
                                                            Permission permission = (Permission) lists.get(v);
                                                            List perms = mgr.listStaffPermissions(stafftable.getStaffid());
                                                            // if(perms != null){
                                                            for (int u = 0; u < perms.size(); u++) {
                                                                 

                                                                StaffPermission staffPermission = (StaffPermission) perms.get(u);
                                                                index.add(staffPermission.getPermissionid());
                                                            }

                                                    %>
                                                    <tr>
                                                        <td>
                                                            <%=permission.getPermission()%>
                                                        </td>
                                                        <td>
                                                            <%if (index.contains(permission.getPermissionid())) {%>
                                                            <input type="checkbox" name="permission[]" checked="checked" value="<%=permission.getPermissionid()%>"/>
                                                            <%} else {%>
                                                            <input type="checkbox" name="permission[]"  value="<%=permission.getPermissionid()%>"/>
                                                            <%}%>
                                                        </td>
                                                    </tr>
                                                    <%
                                                            //}
                                                        }%>
                                                </tbody>
                                            </table>
                                            <input type="hidden" name="staffid" value="<%=stafftable.getStaffid()%>"/>
                                            <div style="text-align: center;" class="form-actions">

                                                <div class="form-actions">

                                                    <button class="btn btn-danger btn-large" type="submit" name="action" value="setpermission" onclick='addpermission("permission<%=stafftable.getStaffid()%>[]")'>
                                                        <i class="icon-arrow-right icon-white"> </i> Set Permissions 
                                                    </button>

                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                </div>

            </section>

            <footer style="display: none; margin-top: 50px;" class="footer">
                <p style="text-align: center" class="pull-right">
                    <img src="images/logo.png" width="100px;" />
                </p>
            </footer>

        </div><!-- /container -->    

    </div>
</div>
<!--end static dialog-->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap-dropdown.js"></script>
<script src="js/bootstrap-scrollspy.js"></script>
<script src="js/bootstrap-collapse.js"></script>
<script src="js/bootstrap-tooltip.js"></script>
<script src="js/bootstrap-popover.js"></script>
<script src="js/application.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>

<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/date.js"></script>
<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js"></script>

<script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
<script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
<script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>

<script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
<script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>

<script type="text/javascript" src="js/tablecloth.js"></script>
<script type="text/javascript" src="js/demo.js"></script>

<!--initiate accordion-->
<script type="text/javascript">
    $(function() {

        var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

        menu_ul.hide();

        $(".menu").fadeIn();
        $(".content1").fadeIn();
        $(".navbar").fadeIn();
        $(".footer").fadeIn();
        $(".subnav").fadeIn();
        $(".progress1").hide();

        menu_a.click(function(e) {
            e.preventDefault();
            if(!$(this).hasClass('active')) {
                menu_a.removeClass('active');
                menu_ul.filter(':visible').slideUp('normal');
                $(this).addClass('active').next().stop(true, true).slideDown('normal');
            } else {
                $(this).removeClass('active');
                $(this).next().stop(true, true).slideUp('normal');
            }
        });

    });
    
    
    
    /* function validateForm()
    {
        var x=document.forms["items"]["name"].value;
        if (x==null || x=="")
        {
            alert("Item must be filled out");
            return false;
        }
        
        var x=document.forms["edit"]["uname"].value;
        if (x==null || x=="")
        {
            alert("Item must be filled out");
            return false;
        }


        var x=document.forms["items"]["item_quantity"].value;
        if (x==null || x=="")
        {
            alert("Quantity must be filled out");
            return false;
        }
        var x=document.forms["items"]["price_per_item"].value;
        if (x==null || x=="")
        {
            alert("Price must be filled out");
            return false;
        }
        var x=document.forms["items"]["date"].value;
        if (x==null || x=="")
        {
            alert("Date must be filled out");
            return false;
        }
        var x=document.forms["items"]["exp_date"].value;
        if (x==null || x=="")
        {
            alert("Expiring Date must be filled out");
            return false;
        }
    }*/

    function todaysdate()
    {
        var currentDate = new Date()
        var day = currentDate.getDate()
        var month = currentDate.getMonth() + 1
        var year = currentDate.getFullYear()
        var dat=(" " + year + "-" + month + "-" + day )
        //document.write(dat)
        // alert("Todays Date is "+dat)
        return dat; 
   
 
    }
</script>
<% for (int i = 0;
            i < itmss.size();
            i++) {
        Stafftable vst = (Stafftable) itmss.get(i);
%>


<script type="text/javascript">
   
                      
    $("#<%= vst.getStaffid()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= vst.getStaffid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= vst.getStaffid()%>_dialog_permission").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getStaffid()%>_link").click(function(){
      
        $("#<%=vst.getStaffid()%>_dialog").dialog('open');
    
    })
    
    
    $("#<%= vst.getStaffid()%>_permission").click(function(){
      
        $("#<%=vst.getStaffid()%>_dialog_permission").dialog('open');
    
    })
  
    
    $("#<%= vst.getStaffid()%>_adddrug_link").click(function(){
  
        $("#<%=vst.getStaffid()%>_adddrug_dialog").dialog('open');
        
    })
   
    
</script>



<% }%>
</body>
</html>