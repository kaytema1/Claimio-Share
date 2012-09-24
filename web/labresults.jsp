<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }HMSHelper mgr = new HMSHelper();  %>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>

    </head>
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <%@include file="widgets/subhead.jsp" %>


            <%@include file="widgets/loading.jsp" %>

            <section id="dashboard">

                <%if (session.getAttribute("lasterror") != null) {%>

                <div class="alert alert-danger">
                    <%=session.getAttribute("lasterror")%> 
                </div>
                <%
                        session.removeAttribute("lasterror");
                    }%>
                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>
                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">

                        <ul style="margin-left: 0px; " class="breadcrumb ">
                            <li>
                                <a >Out Patient Department</a><br/>

                            </li>
                        </ul>

                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>

                                <tr>
                                    <th>Folder Number </th>
                                    <th>Full Name </th>
                                    <th>Ordered by</th>
                                    <th>Order Date</th>
                                    <th>Done Date </th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    //HMSHelper mgr = new HMSHelper();
                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    //Patient p = (Patient)session.getAttribute("patient");
                                    //get current date time with Date()
                                    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, d MMMM yyyy");
                                    Date date = new Date();
                                    //System.out.println(dateFormat.format(date));
                                    List labresults = mgr.listLaborders();
                                    int laborderid = 0;
                                    // List patients = mgr.listPatients();
                                    if (labresults != null) {
                                        for (int i = 0; i < labresults.size(); i++) {
                                            Laborders laborders = (Laborders) labresults.get(i);
                                            if (!laborders.getViewed() && laborders.isDone()) {
                                                laborderid = laborders.getOrderid();

                                %>

                                <tr>
                                    <td><%=laborders.getPatientid()%></td>
                                    <td><%=mgr.getPatientByID(laborders.getPatientid()).getFname()%>, <%=mgr.getPatientByID(laborders.getPatientid()).getMidname()%> <%=mgr.getPatientByID(laborders.getPatientid()).getLname()%></td>
                                    <td><%=mgr.getStafftableByid(laborders.getFromdoc())==null?"":mgr.getStafftableByid(laborders.getFromdoc()).getLastname()%> <%=mgr.getStafftableByid(laborders.getFromdoc())==null?"":mgr.getStafftableByid(laborders.getFromdoc()).getLastname() %></td>
                                    <td><%=laborders.getOrderdate()%></td>
                                    <td><%=laborders.getDonedate()%></td>
                                    <td>
                                        <a id="<%=laborders.getVisitid()%>link"  class="visitlink btn btn-info"> <i class="icon-pencil icon-white"> </i> View Report</a>
                                    </td>
                                </tr>
                                <% }
                                        }
                                    }
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

        <%   for (int i = 0; i < labresults.size(); i++) {
                Laborders visit = (Laborders) labresults.get(i);%>
        <script type="text/javascript">
            $(document).ready(function(){
                                                      
               
                $('#<%=visit.getVisitid()%>').dialog({
                    autoOpen : false,
                    width : 700,
                    modal :true,
                    position : "top"
		
                });
                
                $('#<%=visit.getVisitid()%>link').click(function(){
                   
                    $('#<%=visit.getVisitid()%>').dialog('open');
                    return false;
                });
                
                                                        
                
            });
        </script>

        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="visit hide" id="<%=visit.getVisitid()%>"  title="Laboratory Report">
            <form action="action/reviewaction.jsp" metho="post">
            <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                <thead>

                    <tr>
                        <th>Investigation</th>
                        <th>Result </th>
                        <th>Concentration</th>
                        <th>Range</th>

                    </tr>
                </thead>
                <tbody>
                    <%  
                        List patientInvestigations = mgr.patientInvestigation(visit.getVisitid());
                        if (patientInvestigations != null) {
                            for (int pv = 0; pv < patientInvestigations.size(); pv++) {
                                Patientinvestigation patientinvestigation = (Patientinvestigation) patientInvestigations.get(pv);
                                Investigation investigation = mgr.getInvestigation(patientinvestigation.getInvestigationid());

                    %>
                    
                    </tr>
                        <td><%=investigation.getInvestigation()%></td>
                        <td><%=patientinvestigation.getResult()%></td>
                        <td><%=patientinvestigation.getConcentration()%></td>
                        <td><%=patientinvestigation.getResultrange()%></td>
                   </tr>
                <%}
                    }%>

                </tbody>
            </table>
                    <div  class="control-group">
                                <div class="controls">
                                    <div style="text-align: center;">
                                        <input type="hidden" name="patientid" value="<%= visit.getPatientid()%>"/>
                                        <input type="hidden" name="id" value="<%=visit.getVisitid()%>"/>
                                         <input type="hidden" name="orderid" value="<%=laborderid%>"/>
                                        <button class="btn btn-danger btn-large" type="submit" name="action" value="Forward">
                                            <i class="icon-arrow-right icon-white"> </i> Further Review 
                                        </button>

                                    </div>
                                    <p class="help-block"></p>
                                </div>
                            </div>
                    </form>

        </div>


        <div class="clear"></div>

        <% }%>

    </body>
</html>



</body>
</html>