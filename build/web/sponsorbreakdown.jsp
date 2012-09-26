<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


<%@page import="java.util.Random"%>
<%@page import="java.util.Random"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
    if (user == null) {
        session.setAttribute("lasterror", "Please Login");
        response.sendRedirect("index.jsp");
    }%>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
        <%

            HMSHelper mgr = new HMSHelper();
            List sponsoredPatients = null;
            boolean proceed = false;

            boolean correctDateFound = false;
            boolean singleDateValue = true;
            SimpleDateFormat dateformatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date dateUtilDate = new java.util.Date();
            java.sql.Date dateSqlDate = null;

            SimpleDateFormat rangeformatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date rangeUtilDate = new java.util.Date();
            java.sql.Date rangeSqlDate = null;

            String displayedDate = "";
            String dateValue = "";
            String dateRange = "";
            String splittedDateDuration[] = new String[2];
            String[] splittedDate = new String[3];
            String[] splittedDateRange = new String[3];

            System.out.println("telling");
            dateRange = request.getParameter("daterange");
            System.out.println("dateRange : " + dateRange);

            String sId = request.getParameter("sid");

            if (request.getParameter("daterange") != null) {
                dateValue = request.getParameter("daterange");
                displayedDate = dateValue;

                if (!dateValue.isEmpty()) {
                    correctDateFound = true;
                    if (dateValue.contains("-")) {
                        singleDateValue = false;

                        splittedDateDuration = dateValue.split("-");
                        dateValue = splittedDateDuration[0];
                        dateRange = splittedDateDuration[1];

                        dateRange = dateRange.replace("/", "-");
                        splittedDateRange = dateRange.split("-");
                        dateRange = splittedDateRange[2].trim() + "-" + splittedDateRange[0].trim() + "-" + splittedDateRange[1].trim();

                        rangeUtilDate = rangeformatter.parse(dateRange);
                        rangeSqlDate = new java.sql.Date(rangeUtilDate.getTime());
                    } else {
                        singleDateValue = true;
                    }
                    dateValue = dateValue.replace("/", "-");
                    splittedDate = dateValue.split("-");
                    dateValue = splittedDate[2].trim() + "-" + splittedDate[0].trim() + "-" + splittedDate[1].trim();
                    dateUtilDate = dateformatter.parse(dateValue);
                    dateSqlDate = new java.sql.Date(dateUtilDate.getTime());
                }
            } else {

                System.out.println("sid : " + sId);
                // get all patients associated with selected sponsor id

                sponsoredPatients = mgr.listPatientsOfSponsor(Integer.parseInt(sId));

                if (!sponsoredPatients.isEmpty()) {
                    proceed = true;
                } else {
                    // return with an error msg
                }

            }
            System.out.print("dateValue : " + dateValue);
        %>
    </head>
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <%@include file="widgets/subhead.jsp" %>

            <%@include file="widgets/loading.jsp" %>

            <section id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>
                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">
                        <form action="sponsorbreakdown.jsp" method="post">
                            <ul style="margin-left: 0px; padding-bottom: 20px;" class="breadcrumb ">
                                <li style="margin-top: 10px;">
                                    <a>Sponsor Breakdown | <%=displayedDate%></a>
                                </li>
                                <li class="pull-right" style="margin-top: 7px; margin-left: 5px;">
                                    <button class="btn btn-inverse">
                                        <i class="icon icon-white icon-search"></i> Display
                                    </button>
                                </li>
                                <li class="pull-right">
                                    <input name="daterange" placeholder="Select Date Range" style="margin-top: 8px;" id="rangeA" type="text" class="input-large"  />
                                </li>
                            </ul>
                        </form>
                        <table cellpadding="0" cellspacing="0" border="0" class="display table">
                            <thead>

                                <tr>
                                    <th>Folder #</th>
                                    <th>Membership ID</th>
                                    <th>Full Name</th>
                                    <th># Of Visits</th>
                                    <th>Consultation</th>
                                    <th>Laboratory</th>
                                    <th>Pharmacy</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    if (proceed) {
                                        String pFolderNum = "", pMemNum = "", fullName = "";
                                        Sponsorhipdetails sDetails = null;
                                        List patientVisits = null;
                                        Visitationtable vTable = null;
                                        int visitId = 0;
                                        int numOfVisits = 0;
                                        List allPTreatments = null, allPInvestigations = null, allPCon = null;
                                        List allPInvs = null;
                                        List allPCons = null;
                                        Patienttreatment pTreatment = null;
                                        Patientinvestigation pInv = null;
                                        Patient patient = null;


                                        Patientconsultation pCon = null;
                                        Consultation con = null;



                                        for (int q = 0; q < sponsoredPatients.size(); q++) {
                                            sDetails = (Sponsorhipdetails) sponsoredPatients.get(q);
                                            pFolderNum = sDetails.getPatientid();
                                            pMemNum = sDetails.getMembershipid();

                                            patient = mgr.getPatientByID(sDetails.getPatientid());
                                            fullName = patient.getFname() + " " + patient.getMidname() + " " + patient.getLname();
                                            System.out.println("pFolderNum : " + pFolderNum);
                                            patientVisits = mgr.listPatientVisits(pFolderNum);

                                            if (!patientVisits.isEmpty()) {
                                                double treatCost, totTreatCost = 0, invCost, totInvCost = 0, totalPatientCost = 0;
                                                double conPrice, totalConCost = 0, conExpected, conTotExpected = 0;

                                                // get information related to all visits of this patient
                                                numOfVisits = patientVisits.size();
                                                for (int t = 0; t < numOfVisits; t++) {

                                                    vTable = (Visitationtable) patientVisits.get(t);
                                                    visitId = vTable.getVisitid();

                                                    // get all treatments
                                                    allPTreatments = mgr.getPatientTreatmentByVisitid(visitId);

                                                    if (!allPTreatments.isEmpty()) {

                                                        for (int z = 0; z < allPTreatments.size(); z++) {
                                                            pTreatment = (Patienttreatment) allPTreatments.get(z);

                                                            treatCost = pTreatment.getAmounpaid();
                                                            totTreatCost += treatCost;
                                                        }
                                                    }

                                                    // get all investigations
                                                    allPInvestigations = mgr.getPatientInvestigatonsByVisitid(visitId);

                                                    if (!allPInvestigations.isEmpty()) {

                                                        for (int z = 0; z < allPInvestigations.size(); z++) {
                                                            pInv = (Patientinvestigation) allPInvestigations.get(z);

                                                            invCost = pInv.getAmountpaid();
                                                            totInvCost += invCost;
                                                        }
                                                    }

                                                    allPCon = mgr.getPatientConsultationByVisitid(visitId);
                                                    //  System.out.println("size : " + patientVisit.size());

                                                    if (!allPCon.isEmpty()) {
                                                        System.out.println("size : " + allPCon.size());

                                                        for (int j = 0; j < allPCon.size(); j++) {
                                                            pCon = (Patientconsultation) allPCon.get(j);

                                                            con = mgr.getConsultationId(pCon.getTypeid());
                                                            conExpected = con.getAmount();
                                                            conTotExpected += conExpected;

                                                            conPrice = pCon.getAmountpaid();
                                                            totalConCost += conPrice;
                                                        }
                                                    }


                                                }
                                                System.out.println("");
                                                System.out.println("consult : " + totalConCost + ", treatment : " + totTreatCost + ", inv : " + totInvCost);
                                                totalPatientCost = totalConCost + totTreatCost + totInvCost;

                                %>                       

                                <tr>
                                    <td><%=pFolderNum%></td> 
                                    <td><%=pMemNum%></td> 
                                    <td><%=fullName%></td>
                                    <td><%=numOfVisits%></td> 
                                    <td><%=totalConCost%></td> 
                                    <td><%=totInvCost%></td>
                                    <td><%=totTreatCost%></td> 
                                    <td><%=totalPatientCost%></td>
                                </tr>

                                <%          }
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
        <script type="text/javascript">
                   
            $("#rangeA").daterangepicker();

        </script>

    </body>
</html>

</body>
</html>