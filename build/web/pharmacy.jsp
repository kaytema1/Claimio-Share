<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="java.util.Formatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
    if (user == null) {
        session.setAttribute("lasterror", "Please Login");
        session.setAttribute("class", "alert-error");
        response.sendRedirect("index.jsp");


    }%>

<%
    HMSHelper mgr = new HMSHelper();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    //Patient p = (Patient)session.getAttribute("patient");
    //get current date time with Date()
    Date date = new Date();
    //System.out.println(dateFormat.format(date));
    List visits = mgr.listUnitVisitations((String) session.getAttribute("unit"), dateFormat.format(date));
    List treatments = null;
    // for (int i = 0; i < visits.size(); i++) {
    //   Visitationtable visit = (Visitationtable) visits.get(i);
%>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
    </head>
    <script type="text/javascript">
        
        
        function alert(){
            
        }
    </script>


    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li class="active">
                            <a href="#">Pharmacy</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>

            <%@include file="widgets/loading.jsp" %>

            <section style="margin-top: -30px;" id="dashboard">

                <%if (session.getAttribute("lasterror") != null) {%>
                <div class="alert hide <%=session.getAttribute("class")%> span12 center">
                    <b> <%=session.getAttribute("lasterror")%>  </b>
                </div>
                <br/>
                <div style="margin-bottom: 20px;" class="clearfix"></div>
                <%session.removeAttribute("lasterror");
                    }%>



                <div class="row">


                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div class="span9 thumbnail well content">

                            <table class="example display table">
                                <thead>
                                    <tr>
                                        <th> Patient No </th>
                                        <th> Patient Name </th>
                                        <th> Date of Birth  </th>
                                        <th> Sponsor </th>
                                        <th> Policy # </th>
                                        <th> Request Date </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (visits != null) {
                                            for (int i = 0; i < visits.size(); i++) {
                                                Visitationtable vst = (Visitationtable) visits.get(i);
                                    %>
                                    <tr>
                                        <td>
                                            <div class="dialog" id="<%=vst.getPatientid()%>_dialog" title="Dispense Drugs">

                                                <div class="well thumbnail">
                                                    <ul style="margin-left: 0px;" class="breadcrumb">
                                                        <li>
                                                            <span class="divider"></span> Dispense Drug
                                                        </li>    
                                                    </ul>
                                                    <form action="action/forwardaction.jsp" method="post">
                                                        <table class="table">
                                                            <thead>
                                                                <tr style="color: #FFF;">
                                                                    <th> Drug </th>
                                                                    <th> Type </th>
                                                                    <th> Dosage </th>
                                                                    <th> Quantity</th>                                                                
                                                                    <th> Unit Cost </th>
                                                                    <th> Total </th>
                                                                    <th> Payment</th>
                                                                    <th> Dispensed</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%

                                                                    List ptreatmentss = mgr.patientTreatment(vst.getVisitid());
                                                                    for (int r = 0; r < ptreatmentss.size(); r++) {
                                                                        Patienttreatment ptPatienttreatments = (Patienttreatment) ptreatmentss.get(r);
                                                                %>
                                                                <tr>
                                                                    <td><%=mgr.getTreatment(ptPatienttreatments.getTreatmentid()).getTreatment()%> </td>
                                                                    <td> <%=ptPatienttreatments.getType()%>  </td>
                                                                    <td><%=ptPatienttreatments.getDosage().split("_")[1]%>  </td>

                                                                    <td> <%=ptPatienttreatments.getQuantity()%> </td>

                                                                    <td><%=ptPatienttreatments.getPrice()%> </td>
                                                                    <td><%= (ptPatienttreatments.getQuantity() * ptPatienttreatments.getPrice())%></td>
                                                                    <%if (ptPatienttreatments.getDispensed().equalsIgnoreCase("paid")) {%> 
                                                                    <td>
                                                                        Paid
                                                                    </td>
                                                                    <td>
                                                                        <input type="checkbox" name="dispensed[]" value="<%=ptPatienttreatments.getId()%>"/>
                                                                    </td>
                                                                    <%}
                                                                        if (ptPatienttreatments.getDispensed().equalsIgnoreCase("No")) {%>
                                                                    <td>
                                                                        Can You Afford?
                                                                    </td> 
                                                                    <td>
                                                                        <input type="checkbox" name="afford[]" value="<%=ptPatienttreatments.getId()%>"/>
                                                                    </td>
                                                                    <%}
                                                                        if (ptPatienttreatments.getDispensed().equalsIgnoreCase("Afford")) {%>
                                                                    <td>
                                                                        Pending Payment
                                                                    </td>
                                                                    <td>
                                                                        Can Afford
                                                                    </td>
                                                                    <%}
                                                                        if (ptPatienttreatments.getDispensed().equalsIgnoreCase("Dispensed")) {%>
                                                                    <td>
                                                                        Dispensed
                                                                    </td>
                                                                    <td>
                                                                        Dispensed
                                                                    </td>
                                                                    <%}%>

<!--  <input type="hidden" name="visitid" value="<%=ptPatienttreatments.getId()%>"/>
  <input type="hidden" name="visitid" value="<%=ptPatienttreatments.getId()%>"/>-->
                                                                </tr>

                                                                <%}%> 



                                                                <tr>

                                                                    <!--here

                                                                    <form action="labnpharmactions.jsp" method="post"/>-->

                                                                    <td><b>Name of Drug

                                                                        </b>

                                                                        <br />
                                                                        <%   if (mgr.sponsorshipDetails(vst.getPatientid()).getType().equalsIgnoreCase("nhis")) {%>

                                                                        <select class="input-xlarge"  id="treatment" onchange = "addTreatment()">
                                                                            <%
                                                                                //treatments = mgr.listNhisTreatment();
                                                                                treatments = mgr.listTreatments();
                                                                                String replacedString = "";
                                                                                String[] treatmentString = null;
                                                                                if (treatments != null) {
                                                                                    for (int v = 0; v < treatments.size(); v++) {
                                                                                        Treatment treatment = (Treatment) treatments.get(v);
                                                                                        treatmentString = treatment.getTreatment().split(",");
                                                                                        if (treatmentString[0].contains("Injection")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Injection", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Tablet")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Tablet", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Suppository")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Suppository", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Capsule")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Capsule", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Syrup")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Syrup", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Cream")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Cream", " ");
                                                                                        }

                                                                            %>
                                                                            <option value="<%=replacedString%>><<%=treatment.getTreatmentid()%>"><%=replacedString%></option> 
                                                                            <% }

                                                                                }
                                                                            %>
                                                                        </select>
                                                                        <%  } else {%>                                      
                                                                        <select class="input-xlarge" id="treatment" onchange = "addTreatment()">
                                                                            <%
                                                                                treatments = mgr.listTreatments();
                                                                                String replacedString = "";
                                                                                String[] treatmentString = null;
                                                                                if (treatments != null) {
                                                                                    for (int v = 0; v < treatments.size(); v++) {
                                                                                        Treatment treatment = (Treatment) treatments.get(v);
                                                                                        treatmentString = treatment.getTreatment().split(",");
                                                                                        if (treatmentString[0].contains("Injection")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Injection", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Tablet")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Tablet", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Suppository")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Suppository", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Capsule")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Capsule", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Syrup")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Syrup", " ");
                                                                                        }
                                                                                        if (treatmentString[0].contains("Cream")) {
                                                                                            replacedString = treatmentString[0].replaceAll("Cream", " ");
                                                                                        }

                                                                            %>
                                                                            <option value="<%=replacedString%>><<%=treatment.getTreatmentid()%>"><%=replacedString%></option> 
                                                                            <% }

                                                                                }
                                                                            %>
                                                                        </select>

                                                                        <%   }
                                                                        %>

                                                                    </td>
                                                                    <td><b>Type

                                                                        </b>
                                                                        <br />
                                                                        <select name="type" class="input-small"> <option value="Tab">
                                                                                Tab
                                                                            </option>
                                                                            <option value="Syrup">
                                                                                Syrup
                                                                            </option>
                                                                            <option value="Capsule">
                                                                                Capsule
                                                                            </option>
                                                                            <option value="Cream">
                                                                                Cream
                                                                            </option></select></td>
                                                                    <td>

                                                                        <b>Recommended Dosage

                                                                        </b> <br />
                                                                        <input name="dosage" type="text" class="input-medium" />
                                                                    </td>
                                                                    <td><b>Quantity

                                                                        </b>
                                                                        <br />

                                                                        <select name="qty" class="input-mini">  <option value="0">
                                                                                0
                                                                            </option>
                                                                            <option value="1">
                                                                                1
                                                                            </option>
                                                                            <option value="2">
                                                                                2
                                                                            </option>
                                                                            <option value="3">
                                                                                3
                                                                            </option>
                                                                            <option value="4">
                                                                                4
                                                                            </option>
                                                                            <option value="5">
                                                                                5
                                                                            </option>
                                                                            <option value="6">
                                                                                6
                                                                            </option>
                                                                            <option value="7">
                                                                                7
                                                                            </option>
                                                                            <option value="8">
                                                                                8
                                                                            </option>
                                                                            <option value="9">
                                                                                9
                                                                            </option>
                                                                            <option value="10">
                                                                                10
                                                                            </option>
                                                                        </select></td>


                                                                        <td colspan="4" class="center"> 
                                                                       

                                                                        <button style="margin-top: 15px;" name="dosage" type="button"  class="btn btn-large btn-danger center" onclick=";return false"/>
                                                                        <i class="icon icon-white icon-plus-sign"></i> Add
                                                                        </button>
                                                                        
                                                                        <!-- <button class="btn btn-info" id="">
                                                                                                        </td>
                                                                </tr>


                                                                        <!-- </form>
        
                                                                       end-->

                                                            </tbody>

                                                        </table>

                                                        <div style="text-align: center;" class="form-actions">


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
                                                            <input type="hidden" name="from" value="Pharmacy"/>
                                                            <button class="btn btn-info" name="action" value="Forward to Accounts">
                                                                <i class="icon-white icon-check"></i> Forward
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-transform: uppercase; color: #4183C4;" class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5><%=mgr.getPatientByID(vst.getPatientid()).getFname()%> <%=mgr.getPatientByID(vst.getPatientid()).getMidname()%> <%=mgr.getPatientByID(vst.getPatientid()).getLname()%></h5> <h5><b> Date of Birth :</b> <%=mgr.getPatientByID(vst.getPatientid()).getDateofbirth()%></h5> </span>"
                                            data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getEmployer()%> </td>  </tr> <tr> <td> Sponsor </td> <td> <%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(vst.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%> </td> </tr> <tr>
                                            <td> Policy Number </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getBenefitplan()%> </td> </tr>  </table> "> <%=vst.getPatientid()%>   </td>
                                        <td><%=mgr.getPatientByID(vst.getPatientid()).getFname()%> <%=mgr.getPatientByID(vst.getPatientid()).getMidname().substring(0, 1)%>. <%=mgr.getPatientByID(vst.getPatientid()).getLname()%></td>
                                        <td><%= formatter.format(mgr.getPatientByID(vst.getPatientid()).getDateofbirth())%> </td>

                                        <td><%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(vst.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%>  </td>
                                        <td><%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%>   </td>

                                        <td><%=formatter.format(vst.getDate())%> </td>

                                        <td>
                                            <button class="btn btn-info btn-small" id="<%=vst.getPatientid()%>_link">
                                                <i class="icon-white icon-check"></i> Dispense
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
        $(".alert").fadeIn();
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
        
        
        $(".patient").popover({

            placement : 'right',
            animation : true

        });
    
        $('.example').dataTable({
            "bJQueryUI" : true,
            "sPaginationType" : "full_numbers",
            "iDisplayLength" : 25,
            "sScrollY" : "300px",
            "aaSorting" : [],
            "bSort" : true

        });
            
            

        
        
        

    });

</script>
<% for (int i = 0;
            i < visits.size();
            i++) {
        Visitationtable vst = (Visitationtable) visits.get(i);
%>


<script type="text/javascript">
   
                      
    $("#<%= vst.getPatientid()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= vst.getVisitid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getPatientid()%>_link").click(function(){
      
        $("#<%=vst.getPatientid()%>_dialog").dialog('open');
    
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
