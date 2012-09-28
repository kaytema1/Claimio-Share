<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
    if (user == null) {
        session.setAttribute("lasterror", "Please Login");
        response.sendRedirect("index.jsp");
    }
    HMSHelper mgr = new HMSHelper();
%>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>

    </head>
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -80px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li>
                            <a href="#">Records</a><span class="divider"></span>
                        </li>
                        <li class="active">
                            <a href="#">Nurses Station</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>


            <%@include file="widgets/loading.jsp" %>

            <section id="dashboard">

                <%if (session.getAttribute("lasterror") != null) {%>
                <div class="alert hide <%=session.getAttribute("class")%> span12 center">
                    <b> <%=session.getAttribute("lasterror")%>  </b>
                </div>
                <br/>
                <div style="margin-bottom: 20px;" class="clearfix"></div>
                <%session.removeAttribute("lasterror");
                    }%>
                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>
                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">



                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>

                                <tr>
                                    <th>Folder Number </th>
                                    <th>Full Name </th>
                                    <th>Sponsor</th>
                                    <th>Registered On</th>
                                    <th> </th>



                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    //Patient p = (Patient)session.getAttribute("patient");
                                    //get current date time with Date()
                                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                                    Date date = new Date();
                                    //System.out.println(dateFormat.format(date));
                                    List visits = mgr.listUnitVisitations((String) session.getAttribute("unit"), dateFormat.format(date));
                                    // List patients = mgr.listPatients();
                                    for (int i = 0; i < visits.size(); i++) {
                                        Visitationtable visit = (Visitationtable) visits.get(i);


                                %>

                                <tr>
                                    <td style="text-transform: uppercase" class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <%= mgr.getPatientByID(visit.getPatientid()).getFname()%> <%= mgr.getPatientByID(visit.getPatientid()).getMidname()%> <%= mgr.getPatientByID(visit.getPatientid()).getLname()%></h5> <h5><b> Date of Birth :</b> <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofbirth())%>  </h5> <span>"
                                        data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%= mgr.getPatientByID(visit.getPatientid()).getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%= mgr.getPatientByID(visit.getPatientid()).getEmployer()%>  </td>  </tr> <tr> <td> Sponsor </td> <td> <%=mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(visit.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%>  </td> </tr> <tr>
                                        <td> Policy Number </td> <td> <%= mgr.sponsorshipDetails(visit.getPatientid()).getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%= mgr.sponsorshipDetails(visit.getPatientid()).getBenefitplan()%> </td> </tr>  </table> ">
                                        <a href="vital.jsp?patientid=<%=visit.getPatientid()%>&id=<%=visit.getVisitid()%>"><%= visit.getPatientid()%> </a> 
                                    </td>
                                    <td>
                                        <%=mgr.getPatientByID(visit.getPatientid()).getFname()%> <%=mgr.getPatientByID(visit.getPatientid()).getMidname()%> <%=mgr.getPatientByID(visit.getPatientid()).getLname()%>
                                    </td>
                                    <td>
                                        <%=mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(visit.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%> 
                                    </td>
                                    <td>
                                        <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofregistration())%>
                                    </td>
                                    <td>
                                        <a id="<%=visit.getPatientid()%><%=visit.getVisitid()%>link"  class="visitlink btn btn-info btn-small"> <i class="icon-pencil icon-white"> </i> New Vital Record </a>
                                    </td>
                                </tr>
                                <% }

                                %>
                            </tbody>
                        </table>
                    </div> 

                    <div class="clear"></div>



                </div>

            </section>

            <%@include file="widgets/footer.jsp" %>

        </div><!-- /container -->



        <%@include file="widgets/javascripts.jsp" %>

        <%   for (int i = 0; i < visits.size(); i++) {
                Visitationtable visit = (Visitationtable) visits.get(i);%>
        <script type="text/javascript">
            $(document).ready(function(){
                                                      
               
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog({
                    autoOpen : false,
                    width : 750,
                    modal :true,
                    position : "top"
		
                });
                
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>link').click(function(){
                   
                    $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog('open');
                    return false;
                });
                
                                                        
                
            });
        </script>

        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="visit hide" id="<%=visit.getPatientid()%><%=visit.getVisitid()%>"  title=" <%= mgr.getPatientByID(visit.getPatientid()).getFname()%> <%= mgr.getPatientByID(visit.getPatientid()).getLname()%> 's Vitals">

            <div class="well thumbnail">
                <ul style="margin-left: 0px; text-transform: uppercase" class="breadcrumb">
                    <li>
                        <span class="divider"></span> <b> Folder No: <%= mgr.getPatientByID(visit.getPatientid()).getPatientid()%> </b>
                    </li>
                </ul>
                <form action="action/vitalaction.jsp" method="post" class="form-horizontal">

                    <fieldset>
                        <div style="float: left;">
                            <div class="control-group">
                                <label class="control-label" for="input01">Temperature : </label>
                                <div class="controls">
                                    <input type="text" name="temp" class="input-mini" placeholder="37" value=""/>
                                    <p class="help-inline">(Celsius)</p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Weight : </label>
                                <div class="controls">
                                    <input type="text" name="weight" class="input-mini" placeholder="60" value=""/>
                                    <p class="help-inline">(kg)</p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Height: </label>
                                <div class="controls">
                                    <input type="text" name="height" class="input-mini" placeholder="150" value=""/>
                                    <p class="help-inline">(cm)</p>
                                </div>
                            </div>


                            <div class="well thumbnail" style="padding: 20px; padding-left: 5px;">
                                <ul style="margin-left: 0px;" class="breadcrumb">
                                    <li>
                                        <b>  Blood Pressure </b>
                                    </li>
                                </ul>  


                                <div class="control-group">
                                    <label class="control-label" for="input01">Systolic </label>
                                    <div class="controls">

                                        <input type="text" name="systolic" class="input-mini" placeholder="90–119" value=""/>
                                        <p class="help-inline"> mmHg</p>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="input01">Diastolic </label>
                                    <div class="controls">

                                        <input type="text" name="diatolic" class="input-mini" placeholder="60–79" value=""/>
                                        <p class="help-inline"> mmHg</p>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="input01">Pulse: </label>
                                    <div class="controls">
                                        <input type="text" name="pulse"class="input-mini" placeholder="60–100" value=""/>
                                        <p class="help-inline">BPM</p>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div style="float: right;">

                            <div class="control-group">
                                <label class="control-label" for="input01">Other Symptoms: </label>
                                <div class="controls">
                                    <textarea class="medium"  id="message" rows="5" name="vitals"></textarea><br/>
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div style="margin-top: 115px;" class="control-group">
                                <label class="control-label" for="input01">To Consultation Room: </label>
                                <div class="controls">
                                    <select class="chzn-select medium-select select chzn-done input-medium" name="conroom">
                                        <%
                                            List ls = mgr.listConRooms();
                                            for (int x = 0; x < ls.size(); x++) {
                                                Consultingrooms conroom = (Consultingrooms) ls.get(x);
                                        %>
                                        <option value="<%=conroom.getType()%>_<%=conroom.getConsultingroomid()%>"><%=conroom.getConsultingroom()%></option>
                                        <%}

                                        %>


                                    </select>
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div  class="control-group">
                                <div class="controls">
                                    <div style="text-align: center;">
                                        <input type="hidden" name="patientid" value="<%= visit.getPatientid()%>"/>
                                        <input type="hidden" name="id" value="<%=visit.getVisitid()%>"/>
                                        <button class="btn btn-danger btn-large" type="submit" name="action" value="Forward">
                                            <i class="icon-arrow-right icon-white"> </i> Forward 
                                        </button>

                                    </div>
                                    <p class="help-block"></p>
                                </div>
                            </div>
                        </div>

                    </fieldset>

                </form>

            </div>
        </div>


        <div class="clear"></div>

        <% }%>

    </body>
</html>



</body>
</html>