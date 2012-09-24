<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
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

        <%
            Users user = (Users) session.getAttribute("staff");
            if (user == null) {
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
            HMSHelper mgr = new HMSHelper();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            //Patient p = (Patient)session.getAttribute("patient");
            //get current date time with Date()
            Date date = new Date();
            //System.out.println(dateFormat.format(date));

            List visits = mgr.listUnitVisitations((String) session.getAttribute("unit"), dateFormat.format(date));
            List treatments = null;

            // for (int i = 0; i < visits.size(); i++) {
            //   Visitationtable visit = (Visitationtable) visits.get(i);
        %>

        <script type="text/javascript">
            
            function alert(){
                
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
                            <a href="#">Pharmacy</a><span class="divider"></span>
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

                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li>
                                    <a> <i class="icon-tasks"></i> Accounts</a><br/>
                                    <%if (session.getAttribute("lasterror") != null) {%>
                                    <h3><a> <%=session.getAttribute("lasterror")%> </a></h3>
                                    <%}%>
                                </li>

                            </ul>
                            <table class="example display">
                                <thead>
                                    <tr>
                                        <th> Patient No </th>
                                        <th> Patient Name </th>
                                        <th> Date of Birth  </th>
                                        <th> Sponsor </th>
                                        <th> Membership ID </th>
                                        <th> Request Date </th>
                                        <th><%=(String) session.getAttribute("unit")%></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (visits != null) {
                                            for (int i = 0; i < visits.size(); i++) {
                                                Visitationtable vst = (Visitationtable) visits.get(i);
                                    %>
                                    <tr>
                                        <td colspan="7">
                                            <div class="dialog" id="<%=vst.getVisitid()%>_dialog" title="Accounts">

                                                <div class="well thumbnail">
                                                    <ul style="margin-left: 0px;" class="breadcrumb">
                                                        <li>
                                                            <span class="divider"></span> Patient Receipt
                                                        </li>    
                                                    </ul>
                                                    <%
                                                        Double total = 0.0;
                                                        String previouslocation = vst.getPreviouslocstion();
                                                        String[] previouslocations = previouslocation.split("_");
                                                        if (previouslocations[0].equals("pharmacy")) {%>
                                                    <form action="action/accountsaction.jsp" method="post">
                                                        <table class="table example display">
                                                            <thead>
                                                                <tr style="color: #000;">
                                                                    <th>Requested </th>
                                                                    <th>Quantity </th>
                                                                    <th>Unit Cost </th>
                                                                    <th>Total </th>
                                                                    <th>Amount Paid</th>
                                                                    <th>Outstanding Amount</th>
                                                                    <th>Payment</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%

                                                                    List ptreatmentss = mgr.patientTreatment(vst.getVisitid());

                                                                    for (int r = 0; r < ptreatmentss.size(); r++) {
                                                                        Patienttreatment ptPatienttreatments = (Patienttreatment) ptreatmentss.get(r);
                                                                        // if (ptPatienttreatments.getDispensed().equalsIgnoreCase("No")) {
                                                                %>
                                                                <tr>
                                                                    <td>
                                                                        <%=mgr.getTreatment(ptPatienttreatments.getTreatmentid()).getTreatment()%> </td>
                                                                    <td><%=ptPatienttreatments.getQuantity()%> </td>
                                                                    <td><%=ptPatienttreatments.getPrice()%> </td>

                                                                    <td><%= (ptPatienttreatments.getQuantity() * ptPatienttreatments.getPrice())%></td>
                                                                    <%if (ptPatienttreatments.getDispensed().equals("Afford")) {%>
                                                                    <td>
                                                                        <input type="text" name="mn_<%=ptPatienttreatments.getId()%>"/>
                                                                        <input type="hidden" name="pid[]" value="<%=ptPatienttreatments.getId()%>"/>
                                                                    </td>
                                                                    <td id="outstanding"></td>
                                                                    <td><input type="checkbox" name="paid[]" value="<%=ptPatienttreatments.getId()%>"/></td>
                                                                        <% total = total + (ptPatienttreatments.getQuantity() * ptPatienttreatments.getPrice());%>

                                                                    <%}
                                                                        if (ptPatienttreatments.getDispensed().equals("No")) {%>
                                                                    <td>Cannot Afford</td>
                                                                    <td>
                                                                        <%= (ptPatienttreatments.getQuantity() * ptPatienttreatments.getPrice())%>
                                                                    </td>
                                                                    <td></td>

                                                                    <%}
                                                                        if (ptPatienttreatments.getDispensed().equals("paid")) {%>
                                                                    <td><%= (ptPatienttreatments.getQuantity() * ptPatienttreatments.getPrice())%></td>
                                                                    <td>0</td>
                                                                    <td>Awaiting Dispensing</td>
                                                                    <%}
                                                                        if (ptPatienttreatments.getDispensed().equals("Dispensed")) {%>
                                                                    <td>
                                                                        <%= (ptPatienttreatments.getQuantity() * ptPatienttreatments.getPrice())%> 
                                                                    </td>
                                                                    <td>0</td>
                                                                    <td>Dispensed</td>
                                                                    <%}%>


                                                                </tr>

                                                                <%//}
                                                                    }
                                                                %>
                                                                <tr>
                                                                    <td>Total Cost</td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td><%=total%></td>
                                                                </tr>
                                                            </tbody>

                                                        </table>

                                                        <div style="text-align: center;" class="form-actions">

                                                            <!-- <input type="hidden" name="unitid" value="Accounts"/>-->
                                                            <input type="hidden" name="patient" value="<%=vst.getPatientid()%>"/>
                                                            <input type="hidden" name="visitid" value="<%=vst.getVisitid()%>"/>
                                                            <!-- <input type="submit" name="action" value="Forward to Accounts"/>-->
                                                            <select name="unitid">
                                                                <%
                                                                    List units = mgr.listUnits();
                                                                    for (int j = 0; j < units.size(); j++) {
                                                                        Units unit = (Units) units.get(j);
                                                                %>
                                                                <option value="<%=unit.getType()%>_<%=unit.getUnitid()%>"><%=unit.getUnitname()%></option> 
                                                                <% }
                                                                    List wards = mgr.listWard();
                                                                    for (int j = 0; j < wards.size(); j++) {
                                                                        Ward ward = (Ward) wards.get(j);
                                                                %>
                                                                <option value="<%=ward.getType()%>_<%=ward.getWardid()%>"><%=ward.getWardname()%></option> 
                                                                <% }

                                                                %>
                                                            </select>
                                                            <br/>

                                                            <button type="submit" name="action" value="Pharmacy Receipt" class="btn btn-danger btn-large">

                                                                <i class="icon-white icon-arrow-right"> </i> Forward
                                                            </button>
                                                        </div>
                                                    </form>
                                                    <%}%>
                                                    <%
                                                        String prev = vst.getPreviouslocstion();
                                                        String[] prevs = prev.split("_");
                                                        if (prevs[0].equals("lab")) {%>
                                                    <form action="action/accountsaction.jsp" method="post">
                                                        <table class="table example display">
                                                            <thead>
                                                                <tr style="color: #000;">
                                                                    <th>Requested </th>
                                                                    <th>Quantity </th>
                                                                    <th>Unit Cost </th>
                                                                    <th>Total </th>
                                                                    <th>Amount Paid</th>
                                                                    <th>Outstanding Amount</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    List pinvestigations = mgr.patientInvestigation(vst.getVisitid());
                                                                    for (int u = 0; u < pinvestigations.size(); u++) {
                                                                        Patientinvestigation patientinvestigation = (Patientinvestigation) pinvestigations.get(u);
                                                                        if (patientinvestigation.getPerformed().equalsIgnoreCase("No")) {%>
                                                                <tr style="color:  red">

                                                                    <td >
                                                                        <%=mgr.getInvestigation(patientinvestigation.getInvestigationid()).getInvestigation()%>
                                                                    </td>
                                                                    <td><%=patientinvestigation.getQuantity()%> </td>
                                                                    <td><%=patientinvestigation.getPrice()%></td>
                                                                    <% int qty = patientinvestigation.getQuantity() == 0 ? 1 : patientinvestigation.getQuantity();
                                                                        double tt = patientinvestigation.getPrice() * qty;%>
                                                                    <td><%=tt%></td>
                                                                    <td><input type="text" name="nm_<%=patientinvestigation.getId()%>" readonly="readonly"/></td>
                                                                    <td><%=tt - patientinvestigation.getAmountpaid()%></td>
                                                                    <td>CANNOT AFFORD</td>
                                                                </tr>

                                                                <% }
                                                                    if (patientinvestigation.getPerformed().equalsIgnoreCase("paid")) {%>
                                                                <tr>

                                                                    <td >
                                                                        <%=mgr.getInvestigation(patientinvestigation.getInvestigationid()).getInvestigation()%>
                                                                    </td>
                                                                    <td><%=patientinvestigation.getQuantity()%> </td>
                                                                    <td><%=patientinvestigation.getPrice()%></td>
                                                                    <% int qty = patientinvestigation.getQuantity() == 0 ? 1 : patientinvestigation.getQuantity();
                                                                        double tt = patientinvestigation.getPrice() * qty;%>
                                                                    <td><%=tt%></td>
                                                                    <td>Paid</td>
                                                                    <td><%=tt - patientinvestigation.getAmountpaid()%></td>
                                                                    <td>Pending Performance</td>

                                                                </tr>
                                                                <%}
                                                                    if (patientinvestigation.getPerformed().equalsIgnoreCase("Afford")) {%>
                                                                <tr>
                                                            <input type="hidden" name="vid[]" value="<%=patientinvestigation.getId()%>"/>
                                                            <td >
                                                                <%=mgr.getInvestigation(patientinvestigation.getInvestigationid()).getInvestigation()%> </td>
                                                            <td><%=patientinvestigation.getQuantity()%> </td>
                                                            <td><%=patientinvestigation.getPrice()%></td>
                                                            <% int qty = patientinvestigation.getQuantity() == 0 ? 1 : patientinvestigation.getQuantity();
                                                                double tt = patientinvestigation.getPrice() * qty;%>
                                                            <td><%=tt%></td>
                                                            <td><input type="text" name="nm_<%=patientinvestigation.getId()%>"/></td>
                                                            <td><%=tt - patientinvestigation.getAmountpaid()%></td>
                                                            <td><input type="checkbox" name="checks[]" value="<%=patientinvestigation.getId()%>" /></td>
                                                                <% total = total + patientinvestigation.getPrice();%> 

                                                            </tr>

                                                            <%}
                                                                if (patientinvestigation.getPerformed().equalsIgnoreCase("Yes")) {%>
                                                            <tr>

                                                                <td >
                                                                    <%=mgr.getInvestigation(patientinvestigation.getInvestigationid()).getInvestigation()%> </td>
                                                                <td><%=patientinvestigation.getQuantity()%> </td>
                                                                <td><%=patientinvestigation.getPrice()%></td>
                                                                <% int qty = patientinvestigation.getQuantity() == 0 ? 1 : patientinvestigation.getQuantity();
                                                                    double tt = patientinvestigation.getPrice() * qty;%>
                                                                <td><%=tt%></td>
                                                                <td><%=patientinvestigation.getAmountpaid()%></td>
                                                                <td><%=tt - patientinvestigation.getAmountpaid()%></td>
                                                                <td>Performed</td>
                                                            </tr>
                                                            <%   }
                                                                }%> 
                                                            <tr>
                                                                <td>Total</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%= total%></td>
                                                            </tr>

                                                            </tbody>

                                                        </table>

                                                        <div style="text-align: center;" class="form-actions">

                                                            <!-- <input type="hidden" name="unitid" value="Accounts"/>-->
                                                            <input type="hidden" name="patient" value="<%=vst.getPatientid()%>"/>
                                                            <input type="hidden" name="visitid" value="<%=vst.getVisitid()%>"/>
                                                            <!-- <input type="submit" name="action" value="Forward to Accounts"/>-->
                                                            <select name="unitid">
                                                                <%
                                                                    List units = mgr.listUnits();
                                                                    for (int j = 0; j < units.size(); j++) {
                                                                        Units unit = (Units) units.get(j);
                                                                %>
                                                                <option value="<%=unit.getType()%>_<%=unit.getUnitid()%>"><%=unit.getUnitname()%></option> 
                                                                <% }
                                                                    List wards = mgr.listWard();
                                                                    for (int j = 0; j < wards.size(); j++) {
                                                                        Ward ward = (Ward) wards.get(j);
                                                                %>
                                                                <option value="<%=ward.getType()%>_<%=ward.getType()%>"><%=ward.getWardname()%></option> 
                                                                <% }
                                                                    List consultingrooms = mgr.listConRooms();
                                                                    for (int j = 0; j < consultingrooms.size(); j++) {
                                                                        Consultingrooms consultingroom = (Consultingrooms) consultingrooms.get(j);
                                                                %>
                                                                <option value="<%=consultingroom.getType()%>_<%=consultingroom.getType()%>"><%=consultingroom.getConsultingroom()%></option> 
                                                                <% }



                                                                %>

                                                                %>
                                                            </select>
                                                            <br/>

                                                            <button type="submit" name="action" value="Laboratory Receipt" class="btn btn-danger btn-large">

                                                                <i class="icon-white icon-arrow-right"> </i> Forward
                                                            </button>
                                                        </div>
                                                    </form>
                                                    <%}
                                                        String rec = vst.getPreviouslocstion();
                                                        String[] recs = rec.split("_");%>
                                                        <%=rec%>
                                                        <%if (recs[0].equals("records")){%>
                                                    <form action="action/accountsaction.jsp" method="post">
                                                        <table class="table example display">
                                                            <thead>
                                                                <tr style="color: #000;">
                                                                    <th>Requested </th>
                                                                    <th>Total </th>
                                                                    <th>Amount Paid</th>
                                                                    <th>Payment Status</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% List l = mgr.listPatientConsultationByVisitid(vst.getVisitid());
                                                                    System.out.println(l.size());
                                                                    Patientconsultation patientconsultation = (Patientconsultation) l.get(0);
                                                                    if (patientconsultation != null) {%>
                                                                <tr>
                                                                    <td><%=mgr.getConsultationId(patientconsultation.getTypeid()).getContype()%></td>
                                                                    <td><%=mgr.getConsultationId(patientconsultation.getTypeid()).getAmount()%></td>
                                                                    <td><input type="text" name="amountpaid" value=""/></td>
                                                                    <td><select name="status">
                                                                            <option value="Full">Fully Payment</option>
                                                                            <option value="Part">Part Payment</option>
                                                                            <option value="umpaid">No Payment</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <%}
                                                                %>
                                                            </tbody>
                                                        </table>
                                                        <div style="text-align: center;" class="form-actions">

                                                            <!-- <input type="hidden" name="unitid" value="Accounts"/>-->
                                                            <input type="hidden" name="patient" value="<%=vst.getPatientid()%>"/>
                                                            <input type="hidden" name="cid" value="<%=patientconsultation.getId()%>"/>
                                                            <input type="hidden" name="visitid" value="<%=vst.getVisitid()%>"/>
                                                            <!-- <input type="submit" name="action" value="Forward to Accounts"/>-->

                                                            <select name="unitid">
                                                                <%

                                                                    List list = mgr.listWard();
                                                                    for (int r = 0; r < list.size(); r++) {
                                                                        Ward ward = (Ward) list.get(r);

                                                                %>

                                                                <option value="<%=ward.getType()%>_<%=ward.getWardid()%>"><%=ward.getWardname()%></option>
                                                                <%}
                                                                    List lists = mgr.listUnits();

                                                                    for (int v = 0; v < lists.size(); v++) {
                                                                        Units unit = (Units) lists.get(v);


                                                                %>  

                                                                <option value="<%=unit.getType()%>_<%=unit.getUnitid()%>"><%=unit.getUnitname()%></option>
                                                                <%}
                                                                %>
                                                            </select>
                                                            <br/>

                                                            <button type="submit" name="action" value="Consultation Receipt" class="btn btn-danger btn-large">

                                                                <i class="icon-white icon-arrow-right"> </i> Forward
                                                            </button>
                                                        </div>
                                                            </form>
                                                        <%}%>

                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5><%=mgr.getPatientByID(vst.getPatientid()).getFname()%></h5> <h5><b> Date of Birth :</b> <%=mgr.getPatientByID(vst.getPatientid()).getDateofbirth()%></h5> </span>"
                                            data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getEmployer()%> </td>  </tr> <tr> <td> Sponsor </td> <td> <%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(vst.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%> </td> </tr> <tr>
                                            <td> Policy Number </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getBenefitplan()%> </td> </tr>  </table> "> <%=vst.getPatientid()%>   </td>
                                        <td><%=mgr.getPatientByID(vst.getPatientid()).getFname()%>, <%=mgr.getPatientByID(vst.getPatientid()).getMidname()%> <%=mgr.getPatientByID(vst.getPatientid()).getLname()%></td>
                                        <td><%=mgr.getPatientByID(vst.getPatientid()).getDateofbirth()%> </td>

                                        <td><%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(vst.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%> </td>
                                        <td><%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%>   </td>

                                        <td><%=vst.getDate()%> </td>

                                        <td>
                                            <button class="btn btn-info" id="<%=vst.getVisitid()%>_link">
                                                <i class="icon-white icon-check"></i> Receipt
                                            </button></td>
                                    </tr>
                                    <%}
                                        }%> 

                                </tbody>
                            </table>

                        </div>

                    </div>
                    <div class="clearfix"></div>

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
<script type="text/javascript" src="js/jquery.dataTables.js"></script>
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

</script>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        $('.example').dataTable({
            "bJQueryUI" : true,
            "sPaginationType" : "full_numbers",
            "iDisplayLength" : 25,
            "aaSorting" : [],
            "bSort" : true

        });
        $(".patient").popover({

            placement : 'right',
            animation : true

        });

    });

</script>
<% for (int i = 0;
            i < visits.size();
            i++) {
        Visitationtable vst = (Visitationtable) visits.get(i);
%>


<script type="text/javascript">
   
                      
    $("#<%= vst.getVisitid()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= vst.getVisitid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getVisitid()%>_link").click(function(){
      
        $("#<%=vst.getVisitid()%>_dialog").dialog('open');
    
    })
   
    $("#<%= vst.getPatientid()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getVisitid()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=vst.getVisitid()%>_adddrug_dialog").dialog('open');
        
    })
     
</script>


<% }%>

</body>
</html>
