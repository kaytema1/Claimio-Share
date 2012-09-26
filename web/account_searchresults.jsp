<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>ClaimSync Extended</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <% Users user = (Users) session.getAttribute("staff");
            if (user == null) {
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }%>

        <%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>

        <%
            HMSHelper mgr = new HMSHelper();
            String searchid = request.getParameter("searchid") == null ? "" : request.getParameter("searchid");
            String searchquery = request.getParameter("searchquery") == null ? "" : request.getParameter("searchquery");

            Patient p = null;
            List list = null;
            Visitationtable vs = null;
            int lastVisitId = 0;

            try {
                if (searchid.equalsIgnoreCase("memberdshipnumber")) {
                    if (searchquery.equals("")) {
                        session.setAttribute("lasterror", "Invalid search. Please enter a correct value in the field provided");
                        session.setAttribute("class", "alert-error");
                        response.sendRedirect("records.jsp");
                        return;
                    }
                    // Sponsorhipdetails spd = mgr.getSearchedSpID(searchquery.trim());
                    List l = mgr.getSearchedSpID(searchquery.trim());
                    Sponsorhipdetails spd = (Sponsorhipdetails) l.get(0);

                    p = (Patient) mgr.getPatientByID(spd.getPatientid());

                }
                if (searchid.equalsIgnoreCase("fullname")) {
                    if (searchquery.equals("")) {
                        session.setAttribute("lasterror", "Invalid search. Please enter a correct value in the field provided");
                        session.setAttribute("class", "alert");
                        response.sendRedirect("records.jsp");
                        return;
                    }
                    list = mgr.getPatientByName(searchquery);


                }
                if (searchid.equalsIgnoreCase("patientid")) {
                    if (searchquery.equals("")) {
                        session.setAttribute("lasterror", "Invalid search. Please enter a correct value in the field provided");
                        session.setAttribute("class", "alert");
                        response.sendRedirect("records.jsp");
                        return;
                    }
                    p = mgr.getPatientByID(searchquery.trim());

                }
                if (searchid.equalsIgnoreCase("dob")) {
                    if (searchquery.equals("")) {
                        session.setAttribute("lasterror", "Invalid search. Please enter a correct value in the field provided");
                        session.setAttribute("class", "alert");
                        response.sendRedirect("records.jsp");
                        return;
                    }
                    System.out.println(searchquery);

                    list = mgr.listPatientByDob(searchquery);
                    System.out.println("here " + list.size());

                }

                List visits = mgr.patientHistory(p.getPatientid());

                for (int r = 0; r < visits.size(); r++) {
                    vs = (Visitationtable) visits.get(r);
                    lastVisitId = vs.getVisitid();
                }
            } catch (Exception e) {
                session.setAttribute("lasterror", "Invalid search. Please enter a correct value in the field provided");
                session.setAttribute("class", "alert");
                response.sendRedirect("account_search.jsp");
                return;
            }


        %>
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
                overflow: hidden;
            }

            .large_button {
                background-color: #FBFBFB;
                background-image: -moz-linear-gradient(center top , #FFFFFF, #F5F5F5);
                background-repeat: repeat-x;
                border: 1px solid #DDDDDD;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 0 #FFFFFF inset;
                list-style: none outside none;
                font-weight: lighter;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 36px;
                /* padding: 7px 14px; */
            }

            .large_button:hover {
                background-color: #35AFE3;
                background-image: -moz-linear-gradient(center top , #45C7EB, #2698DB);
                box-shadow: 0 1px 0 0 #6AD2EF inset;
                color: #FFFFFF;
                text-decoration: none;
            }


            .table th {
                border-top: 1px solid #DDDDDD;
                line-height: 10px;
                text-align: center;
                vertical-align: top;
                color: #000000;
            }

            .table td {
                padding: 6px;
                padding-bottom: 0px;
                line-height: 25px;
            }



        </style>
        <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li>
                            <a href="account_search.jsp">Find Patient</a><span class="divider"></span>
                        </li>
                        <li class="active">
                            <a href="#">Search Results</a><span class="divider"></span>
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
            <%if (p != null) {%>
            <section style="margin-top: -30px;" id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <div class="row">
                    <%@include file="widgets/leftsidebar.jsp" %>


                    <div style="display: none;" class="span9 offset3 thumbnail well content1 hide">

                        <%if (session.getAttribute("lasterror") != null) {%>
                        <div class="alert hide <%=session.getAttribute("class")%> span12 center">
                            <b> <%=session.getAttribute("lasterror")%>  </b>
                        </div>
                        <br/>
                        <div style="margin-bottom: 20px;" class="clearfix"></div>
                        <%session.removeAttribute("lasterror");
                            }%>

                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>
                                <tr>
                                    <th>Folder # </th>
                                    <th>Full Name </th>
                                    <th>Sponsor</th>
                                    <th>Date of Birth</th>
                                    <th>Location</th>
                                    <th>Billing Type</th>

                                </tr>
                            </thead>
                            <tbody>

                                <tr class="odd gradeX">

                                    <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <b><%= p.getFname()%>, <%= p.getLname()%> <%= p.getMidname()%> </b></h5> <h5><b> Date of Birth :</b> <%= p.getDateofbirth()%></h5> <span>"
                                        data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%= p.getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%= p.getEmployer()%>  </td>  </tr> <tr> <td> Sponsor </td> <td>
                                        <%=  mgr.getSponsor(mgr.sponsorshipDetails(p.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(p.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(p.getPatientid()).getSponsorid()).getSponsorname()%>  </td> </tr>
                                        </table>">
                                        <a class="patientid"><%= p.getPatientid()%></a>
                                    </td>
                                    <td><%= p.getFname()%>, <%= p.getLname()%> <%= p.getMidname()%></td><td><%= mgr.getSponsor(mgr.sponsorshipDetails(p.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(p.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(p.getPatientid()).getSponsorid()).getSponsorname()%></td><td>  <%= p.getDateofbirth()%> </td>
                                    <td><%= mgr.getPatientFolder(p.getPatientid()).getStatus()%></td>
                                    <td>
                                        <div class="btn-group">
                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                                Action
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li> <a href="#" id="<%= p.getPatientid()%>_patientidlink"> Last Visit </a> </li>
                                                <li> <a href="#" id="<%= p.getPatientid()%>_patientidlink2"> Previous Visits </a> </li>
                                                <li> <a href="#" id="<%= p.getPatientid()%>_patientidlink3"> Billing History </a> </li>
                                            </ul>
                                        </div></td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="usersummary hide" id="<%= p.getPatientid()%>_dialog"  title="Patient Information">
                                            <div class="well thumbnail">
                                                <ul style="margin-left: 0px;" class="breadcrumb">
                                                    <li>
                                                        <span class="divider"></span> Folder No: <%=lastVisitId%>
                                                    </li>
                                                    <li>
                                                        <span class="divider"></span> <%= p.getLname()%>, <%= p.getMidname()%> <%= p.getFname()%>
                                                    </li>
                                                    <li>
                                                        <span class="divider"></span> <%=p.getGender()%>
                                                    </li>
                                                    <li>
                                                        <span class="divider"></span> <%= p.getEmployer()%>
                                                    </li>
                                                </ul>

                                                <ul style="margin-left: 0px; margin-bottom: 0px;" class="breadcrumb">
                                                    <li>   <b> Consultation  </b> </li>
                                                </ul>   
                                                <table class="table right table table-bordered table-condensed">

                                                    <thead>
                                                        <tr>
                                                            <th>Item</th>
                                                            <th>Description</th>
                                                            <th>Charge</th>
                                                            <th>Amount Paid</th>
                                                            <th>Outstanding</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <tr>
                                                            <td> Consultation Type </td>
                                                            <%

                                                                int conTypeId = vs.getVisittype();

                                                                Consultation cs = mgr.getConsultationId(conTypeId);
                                                                String csType = cs.getContype();
                                                                double csCost = cs.getAmount();

                                                                Patientconsultation pc = (Patientconsultation) mgr.getPatientConsultationByVisitid(vs.getVisitid()).get(0);
                                                                System.out.println("amntPd : " + pc.getAmountpaid());

                                                                double amountPaid = pc.getAmountpaid();
                                                                double amountOutstanding = amountPaid - csCost;

                                                            %>
                                                            <td><%=csType%></td>
                                                            <td><%=csCost%></td>
                                                            <td><%=amountPaid%></td>
                                                            <td><%=amountOutstanding%></td>
                                                        </tr>
                                                </table>


                                                <%
                                                    List pTreatments = mgr.getPatientTreatmentByVisitid(lastVisitId);

                                                    if (!pTreatments.isEmpty()) { %>

                                                <ul style="margin-left: 0px; margin-bottom: 0px;" class="breadcrumb">
                                                    <li>   <b> Pharmacy  </b> </li>
                                                </ul>
                                                <table class="table right table table-bordered table-condensed">

                                                    <thead>
                                                        <tr>
                                                            <th>Item</th>
                                                            <th>Type</th>
                                                            <th>Price</th>
                                                            <th>Qty</th>
                                                            <th>Total</th>
                                                            <th>Amount Paid</th>
                                                            <th>Outstanding</th>
                                                        </tr>
                                                    </thead>

                                                    <%                  Patienttreatment pT = null;
                                                        int treatmentId = 0;
                                                        Treatment treatment = null;
                                                        double qty = 0, price = 0, totalCost = 0, amntPaid = 0, balance = 0;

                                                        for (int u = 0; u < pTreatments.size(); u++) {
                                                            pT = (Patienttreatment) pTreatments.get(u);
                                                            treatmentId = pT.getTreatmentid();
                                                            treatment = mgr.getTreatment(treatmentId);

                                                            qty = pT.getQuantity();
                                                            price = pT.getPrice();
                                                            totalCost = qty * price;

                                                            amntPaid = pT.getAmounpaid();

                                                            balance = amntPaid - totalCost;
                                                    %>

                                                    <tr>
                                                        <td><%=treatment.getTreatment()%></td>
                                                        <td><%=pT.getType()%></td>

                                                        <td><%=price%></td>
                                                        <td><%=qty%></td>

                                                        <td><%=totalCost%></td>
                                                        <td><%=amntPaid%></td>
                                                        <td><%=balance%></td>
                                                    </tr>
                                                    <% }%>

                                                    </tbody>
                                                </table>
                                                <%  }%>


                                                <%
                                                    List pInvestigations = mgr.getPatientInvestigatonsByVisitid(lastVisitId);

                                                    if (!pInvestigations.isEmpty()) { %>

                                                <ul style="margin-left: 0px; margin-bottom: 0px;" class="breadcrumb">
                                                    <li>   <b> Laboratory  </b> </li>
                                                </ul>
                                                <table class="table right table table-bordered table-condensed">


                                                    <thead>
                                                        <tr>
                                                            <th>Item</th>
                                                            <th>Price</th>
                                                            <th>Amount Paid</th>
                                                            <th>Outstanding</th>
                                                        </tr>
                                                    </thead> 


                                                    <%                      Patientinvestigation pI = null;
                                                        int invId = 0;
                                                        Investigation inv = null;
                                                        double price = 0, amntPaid = 0, balance = 0;

                                                        for (int q = 0; q < pInvestigations.size(); q++) {

                                                            pI = (Patientinvestigation) pInvestigations.get(q);
                                                            invId = pI.getInvestigationid();
                                                            inv = mgr.getInvestigation(invId);

                                                            price = pI.getPrice();

                                                            amntPaid = pI.getAmountpaid();

                                                            //   if(totalCost < amntPaid) {
                                                            balance = amntPaid - price;

                                                    %>

                                                    <tr>
                                                        <td><%=inv.getName()%></td>

                                                        <td><%=price%></td>

                                                        <td><%=amntPaid%></td>
                                                        <td><%=balance%></td>

                                                    </tr>
                                                    <% }%>

                                                    </tbody>
                                                </table>
                                                <%  } %>                       

                                                <div class="clearfix"></div>

                                                <!--  <div class="btn-group" style="margin-left: 40%;">
                                                      <button class="btn update_sponsor btn-info">
                                                          Sponsorship
                                                      </button>
                                                  </div>  -->
                                                <br />
                                                <div class="clearfix"></div>

                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="usersummary hide" id="<%= p.getPatientid()%>_dialog2"  title="Patient Information">
                                            <div class="well thumbnail">
                                            </div>
                                        </div>

                                    </td>
                                    <td>
                                        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="usersummary hide" id="<%= p.getPatientid()%>_dialog3"  title="Patient Information">
                                            <div class="well thumbnail">
                                            </div>
                                        </div>
                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>

                                </tr>


                            </tbody>
                        </table>

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



        <%}%>
        <%if (list != null) {%>
        <section style="margin-top: -30px;" id="dashboard">

            <!-- Headings & Paragraph Copy -->
            <div class="row">
                <%@include file="widgets/leftsidebar.jsp" %>


                <div style="display: none;" class="span9 offset3 thumbnail well content1 hide">



                    <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                        <thead>
                            <tr>
                                <th>Folder # </th>
                                <th>Full Name </th>
                                <th>Sponsor</th>
                                <th>Date of Birth</th>
                                <th>Location</th>
                                <th>Consultation Type</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < list.size(); i++) {
                                    Patient pp = (Patient) list.get(i);
                                    System.out.println("test " + list.size());
                            %>
                            <tr class="odd gradeX">
                                <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <b> <%= pp.getFname()%>, <%= pp.getLname()%> <%= pp.getMidname()%> </b></h5> <h5><b> Date of Birth :</b> <%= pp.getDateofbirth()%></h5> <span>"
                                    data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%= pp.getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%= pp.getEmployer()%>  </td>  </tr> <tr> <td> Sponsor </td> <td><%=mgr.getSponsor(mgr.sponsorshipDetails(pp.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(pp.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(pp.getPatientid()).getSponsorid()).getSponsorname()%>  </td> </tr>
                                    </table>"><a class="patientid"><%= pp.getPatientid()%></a></td><td><b><%= pp.getFname()%>, <%= pp.getLname()%> <%= pp.getMidname()%> </b></td><td><%= mgr.getSponsor(mgr.sponsorshipDetails(pp.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(pp.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(pp.getPatientid()).getSponsorid()).getSponsorname()%></td><td>  <%= pp.getDateofbirth()%> </td>
                                <td><%= mgr.getPatientFolder(pp.getPatientid()).getStatus()%></td>
                                <td>
                                    <div style="display: block" id="s_<%=pp.getPatientid()%>">
                                        <select class="input-medium" name="contype" onchange='showConType("d_<%=pp.getPatientid()%>")' id="ty_<%=pp.getPatientid()%>">
                                            <option>Select</option>
                                            <%
                                                List types = mgr.listConsultation();
                                                for (int j = 0; j < types.size(); j++) {
                                                    Consultation unit = (Consultation) types.get(j);
                                            %>
                                            <option value="<%=unit.getConid()%>"><%=unit.getContype()%></option> 
                                            <% }%>
                                        </select>
                                    </div>
                                    <div id="d_<%=pp.getPatientid()%>" style="display: none">
                                        <a  id="<%=pp.getPatientid()%>_patientidlink"  class="btn btn-info" onclick='getType("ty_<%=pp.getPatientid()%>","type_<%=pp.getPatientid()%>")'> <i class="icon-pencil icon-white"> </i> New Visit </a>
                                    </div></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>

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

    <%for (int i = 0; i < list.size(); i++) {
            Patient ppp = (Patient) list.get(i);
    %>
    <div style="max-height: 600px; y-overflow: scroll; display: none;" class="usersummary hide" id="<%= ppp.getPatientid()%>_dialog"  title="Patient Information">
        <div class="well thumbnail">
            <ul style="margin-left: 0px;" class="breadcrumb">
                <li>
                    <span class="divider"></span> Folder No: <%= ppp.getPatientid()%>
                </li>
            </ul>

            <div style="margin-top: 12px; padding-top: 5px;  padding-bottom: 5px; text-align: center;" class="thumbnail span2">
                <img src="images/default_profile.png" />

            </div>

            <table class="table span3 right table table-bordered table-condensed">
                <tr>
                    <td> Folder Number </td>

                    <td><b> <%= ppp.getPatientid()%></b></td>
                </tr>

                <tr>
                    <td> Full Name</td>

                    <td><b> <%= ppp.getFname()%></b></td>
                </tr>

                <tr>
                    <td> Gender </td>

                    <td><b> <%=ppp.getGender()%></b></td>
                </tr>

                <tr>
                    <td> Employer </td>

                    <td><b> <%= ppp.getEmployer()%></b></td>
                </tr>



            </table>







        </div>
    </div>




    <script type="text/javascript">
   
               
        $("#<%= ppp.getPatientid()%>_dialog").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
 
        $("#<%= ppp.getPatientid()%>_dialog2").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
 
        $("#<%= ppp.getPatientid()%>_dialog3").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
    
 
    
        $("#<%= ppp.getPatientid()%>_patientidlink").click(function(){
      
            $("#<%=ppp.getPatientid()%>_dialog").dialog('open');
    
        })
 
        $("#<%= ppp.getPatientid()%>_patientidlink2").click(function(){
      
            $("#<%=ppp.getPatientid()%>_dialog2").dialog('open');
    
        }) 
 
        $("#<%= ppp.getPatientid()%>_patientidlink2").click(function(){
      
            $("#<%=ppp.getPatientid()%>_dialog3").dialog('open');
    
        }) 
   
        $("#<%= ppp.getPatientid()%>_dialog").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
   
    
    </script>



    <% }
    } else {

    %>

    <br/> 

    <div class="alert hide alert-info container center">
        <b> No Results Found!  </b>
    </div>
    <br/>
    <div class="container-fluid center">


        <img id="bgimage"  class="center hide" width="40%" src="images/logoonly.png" />

    </div>   
    <%        }
    %>

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
            $(".alert").fadeIn();
            $(".content1").fadeIn();
            $(".navbar").fadeIn();
            $(".footer").fadeIn();
            $(".subnav").fadeIn();
            $("#bgimage").fadeIn();
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
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function() {

            $('.example').dataTable({
                "bJQueryUI" : true,
                "sScrollY" : "300px",
                "sPaginationType" : "full_numbers",
                "iDisplayLength" : 25,
                "aaSorting" : [],
                "bSort" : true

            });

            $(".patient").popover({

                placement : 'right',
                animation : true

            });

            $(".patient_visit").popover({

                placement : 'top',
                animation : true

            });
            
            
            $("#<%= p.getPatientid()%>_dialog").dialog({
                autoOpen : false,
                width : 1000,
                modal :true

            });
        
        
            $("#<%= p.getPatientid()%>_dialog2").dialog({
                autoOpen : false,
                width : 1000,
                modal :true

            });
            
            
            $("#<%= p.getPatientid()%>_dialog3").dialog({
                autoOpen : false,
                width : 1000,
                modal :true

            });
            $("#<%= p.getPatientid()%>_patientidlink").click(function(){
      
                $("#<%=p.getPatientid()%>_dialog").dialog('open');
    
            })
            
            
            
            
        
            $("#<%= p.getPatientid()%>_patientidlink2").click(function(){
      
                $("#<%=p.getPatientid()%>_dialog2").dialog('open');
    
            })
            
             
        
            $("#<%= p.getPatientid()%>_patientidlink3").click(function(){
      
                $("#<%=p.getPatientid()%>_dialog3").dialog('open');
    
            })

        });
            
        function showConType(id){
            var show = document.getElementById(id);
            //var shows = document.getElementById("nhis");
            //if(show.style.display == "block"){
            show.style.display="block";
            //}else{
                
            //  } if(show.style.display == "none"){ 
            // shows.style.display="none";
        }

        function getContype(){
            var show = document.getElementById("ty").value
            document.getElementById("contype").value = show;
            var t = document.getElementById("contype").value;
            
            
            //alert(t);
        }
        function getType(i,d){
            var show = document.getElementById(i).value
            document.getElementById(d).value = show;
            var t = document.getElementById("contype").value;
            
            
        }
    </script>
    <% if (list != null) {
            for (int i = 0;
                    i < list.size();
                    i++) {
                Patient vst = (Patient) list.get(i);
    %>


    <script type="text/javascript">
   
                      
        $("#<%= vst.getPatientid()%>_dialog").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
        
        $("#<%= vst.getPatientid()%>_dialog2").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
        
        $("#<%= vst.getPatientid()%>_dialog3").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
    
   
    
        $("#<%= vst.getPatientid()%>_patientidlink").click(function(){
      
            $("#<%=vst.getPatientid()%>_dialog").dialog('open');
    
        })
        
        $("#<%= vst.getPatientid()%>_patientidlink2").click(function(){
      
            $("#<%=vst.getPatientid()%>_dialog2").dialog('open');
    
        }) 
        
        $("#<%= vst.getPatientid()%>_patientidlink2").click(function(){
      
            $("#<%=vst.getPatientid()%>_dialog3").dialog('open');
    
        }) 
   
        $("#<%= vst.getPatientid()%>_dialog").dialog({
            autoOpen : false,
            width : 1000,
            modal :true

        });
   
    
    </script>



    <% }
        }%>

</body>
</html>
