<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            } HMSHelper mgr = new HMSHelper(); %>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
        <script type="text/javascript">
            function updateLaborders(){
                alert("here at least");
            }
            var diagnosis = "";
            var treatment = "";
            var investigation = "";
            var addcount = 0;
            
            function showdetails(id){
                var show = document.getElementById(id);
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function showdTreatment(){
                var show = document.getElementById("treat");
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function showdInvestigation(){
                var show = document.getElementById("lab");
                if(show.style.display == "none"){
                    show.style.display="block";
                }else{
                    // show.style.display = "block"
                    show.style.display="none";             
                }
            }
            function addDiagnosis(id,dd){               
                var diag = document.getElementById(id).value;
                diagnosis = diagnosis+"<>"+diag;
               
                document.getElementById(dd).value = diagnosis;
              
            }
            function addTreatment(id,dd){               
                var treat = document.getElementById(id).value;                
                treatment = treatment+"<>"+treat;                
                document.getElementById(dd).value=treatment;
                 
            }
            function addDosage(id,dd,dr){ 
                
                var treat = document.getElementById(id).value;  
                var duration = document.getElementById(dr).value;  
                treatment = treatment+"><"+treat+"><"+duration;                
                document.getElementById(dd).value=treatment;
                //return false;
            }
            function addType(id,dd){  
                var treat = document.getElementById(id).value;                
                treatment = treatment+"><"+treat;                
                document.getElementById(dd).value=treatment;
                 
            }
            function addQuantity(id,dd){ 
                var treat = document.getElementById(id).value;                
                treatment = treatment+"><"+treat;                
                document.getElementById(dd).value=treatment;
                 
            }
            function addInvestigation(id,dd){                
                var treat = document.getElementById(id).value;             
                investigation = investigation+"<>"+treat;               
                document.getElementById(dd).value=investigation;
               
            }
            function addDiadChecks(id1,id2){
                addcount++;
                //alert("here");
                var t1 = document.getElementById(id1).value;
                var tr = document.createElement("tr");
                var td1 = document.createElement("td"); 
                var td5 = document.createElement("td"); 
                var td6 = document.createElement("td"); 
                //var text = document.createTextNode(document.getElementById(id1).value);
                var cb = document.createElement( "input" );
                var btn = document.createElement("button")
                //var btn.type = "button";
                btn.innerHTML = 'Remove';
                
                cb.type = "checkbox";
                cb.id = "id_"+addcount;
                cb.name = "diaglist";
                var ttt = t1;
                var str = t1.split("><");
                var text = document.createTextNode(str[0]);
                cb.value = ttt;
                cb.checked = true;
                tr.id = "tr_"+addcount;
                td1.appendChild(text);
                td6.appendChild(btn);
                
                td5.appendChild(cb);
                tr.appendChild(td1);
                tr.appendChild(td5);
                tr.appendChild(td6);
                
                document.getElementById( id2 ).appendChild( tr );
                btn.onclick = function(){
    
                    var tbl = document.getElementById(id2);
                    var rem = confirm("Are you sure you to remove this diagnosis");
                    if(rem){
                        tbl.removeChild(document.getElementById(tr.id));
                        alert("Removed Successfully");
                        return false;
                    }else{
                        return false;
                    }
                };
            }
            function addInvestigationCheck(id1,id2){
                addcount++;
                var t1 = document.getElementById(id1).value;
                var tr = document.createElement("tr");
                var td1 = document.createElement("td"); 
                var td5 = document.createElement("td");
                var td6 = document.createElement("td");
                // var text = document.createTextNode(document.getElementById(id1).value);
                var cb = document.createElement( "input" );
                var btn = document.createElement( "button" );
                btn.innerHTML = 'Remove';
                cb.type = "checkbox";
                cb.id = "id";
                cb.name = "labtest";
                var ttt = t1;
                var str = t1.split("><");
                var text = document.createTextNode(str[0]);
                cb.value = ttt;
                cb.checked = true;
                td1.appendChild(text);
                td6.appendChild(btn);
                
                td5.appendChild(cb);
                tr.appendChild(td1);
                tr.id = "tr1_"+addcount;
                tr.appendChild(td5);
                tr.appendChild(td6);
                document.getElementById( id2 ).appendChild( tr );
               var ch = document.getElementById("labtest");
               
                btn.onclick = function(){
    
                    var tbl = document.getElementById(id2);
                    var rem = confirm("Are you sure you to remove this diagnosis");
                    if(rem){
                        tbl.removeChild(document.getElementById(tr.id));
                        alert("Removed Successfully");
                        return false;
                    }else{
                        return false;
                    }
                };
            }
            function addCheckboxes (id1,id2,id3,id4,id5,id6,id7){
                addcount++;
                var t1 = document.getElementById(id1).value;
                var t2 = document.getElementById(id2).value;
                var t3 = document.getElementById(id3).value;
                var t4 = document.getElementById(id4).value;
                var t5 = document.getElementById(id5).value;
                var t6 = document.getElementById(id6).value;
                if(t1 =="Select"){
                    alert("Please select treatment before adding");
                    document.getElementById(id1).focus();
                    return;
                }
                if(t2 =="Select"){
                    alert("Please select drug form before adding");
                    document.getElementById(id2).focus();
                    return;
                }
                if(t3 =="0"){
                    alert("Quantity cannot be 0");
                    document.getElementById(id3).focus();
                    return;
                }
                if(t4 =="Select"){
                    alert("Please add dosage");
                    document.getElementById(id4).focus();
                    return;
                }
                if(t5 =="duration"){
                    alert("Please add duration");
                    document.getElementById(id5).focus();
                    return;
                }
                if(t6 =="Select"){
                    alert("Please select drug strength");
                    document.getElementById(id6).focus();
                    return;
                }
                
                var tr = document.createElement("tr");
               
                var td1 = document.createElement("td");
                var td2 = document.createElement("td");
                var td3 = document.createElement("td");
                var td4 = document.createElement("td");
                var td5 = document.createElement("td");
                var td6 = document.createElement("td");
                var td7 = document.createElement("td");
                var td8 = document.createElement("td");
                var text = document.createTextNode(document.getElementById(id1).value);
                var text2 = document.createTextNode(document.getElementById(id2).value);
                var text3= document.createTextNode(document.getElementById(id3).value);
                var text4 = document.createTextNode(document.getElementById(id4).value);
                var text5 = document.createTextNode(document.getElementById(id5).value);
                var text6 = document.createTextNode(document.getElementById(id6).value);
                var btn = document.createElement( "button" );
                btn.innerHTML = 'Remove';
                // alert(text);
                //tr.appendChild(td);
                var cb = document.createElement( "input" );
                cb.type = "checkbox";
                cb.id = "id";
                
                tr.id = "tr2_"+addcount;
                cb.name = "data";
                
                //Injection Diazopam 10mg Daily for 2 weeks 
                var spl = t1.split("><");
                var dosage = t4.split("_");
                var prescription = ""+t2+" "+spl[0]+" "+t6+" "+dosage[1]+" for "+t5;
                var presctext = document.createTextNode(prescription);
                var ttt = ""+t1+"><"+t2+"><"+t3+"><"+t4;
                cb.value = ttt;
                cb.checked = true;
                td1.appendChild(presctext);
                td2.appendChild(text2);
                td3.appendChild(text3);
                td4.appendChild(text4);
                td5.appendChild(text5);
                td6.appendChild(text6);
                
                
                td7.appendChild(cb);
                td8.appendChild(btn);
                // td.appendChild(text);
                tr.appendChild(td1);
                // tr.appendChild(td2);
                // tr.appendChild(td3);
                // tr.appendChild(td4);
                // tr.appendChild(td5);
                // tr.appendChild(td6);
                tr.appendChild(td7);
                tr.appendChild(td8);
                
                document.getElementById( id7 ).appendChild( tr );
                //return false;
                // tr.appendChild(td8);
                
               
                btn.onclick = function(){
    
                    var tbl = document.getElementById(id7);
                    var rem = confirm("Are you sure you to remove this diagnosis");
                    if(rem){
                        tbl.removeChild(document.getElementById(tr.id));
                        alert("Removed Successfully");
                        return false;
                    }else{
                        return false;
                    }
                };
            }
            
            function addSelect(id){
                var sel = document.getElementById(id).value;
               
                var sels = document.getElementById("pid");
                var opttext = document.createTextNode(sel);
                var opt = document.createElement("option");
                opt.appendChild(opttext);
                opt.value=sel;
                alert(sel);
                sels.appendChild(opt);
            }
            
            function addInvestigationSelect(id){
                var sel = document.getElementById(id).value;
               
                var sels = document.getElementById("inid");
                var opttext = document.createTextNode(sel);
                var opt = document.createElement("option");
                opt.appendChild(opttext);
                opt.value=sel;
                alert(sel);
                sels.appendChild(opt);
            }
            
            function addTreatmentSelect(id){
                var sel = document.getElementById(id).value;
               
                var sels = document.getElementById("trid");
                var opttext = document.createTextNode(sel);
                var opt = document.createElement("option");
                opt.appendChild(opttext);
                opt.value=sel;
                alert(sel);
                sels.appendChild(opt);
            }
            
            function echoAdded(){
                var echo = document.getElementById("pid").value;
                
                alert(echo);
            }
            function removeMe(id){
                //alert("here"+id.value);
                id.value=""; 
                var rem = document.removeChild(id);
                alert("here"+rem.value)
            }
        </script>

        <script>
            $.("addCheckBoxes").click(function(){
                return false;
            });
        </script>
       
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
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">

                        <ul style="margin-left: 0px;" class="breadcrumb">
                            <li>
                                <a>Consultation Room</a><br/>

                            </li>
                        </ul>


                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>

                                <tr>
                                    <th>Folder Number </th>
                                    <th>Full Name </th>
                                    <th>Sponsor</th>
                                    <th>Registered On</th>
                                    <th> <%=(String)session.getAttribute("unit")%></th>



                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   
                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, d MMMM yyyy");
                                    Visitationtable vs = null;
                                    List investigations = null;
                                    List treatments = null;
                                    List dosages = null;

                                    Date date = new Date();
                                    //System.out.println(dateFormat.format(date));
                                    List visits = mgr.listUnitVisitations((String)session.getAttribute("unit"), dateFormat.format(date));
                                    if(visits != null){
                                    for (int i = 0; i < visits.size(); i++) {
                                        Visitationtable visit = (Visitationtable) visits.get(i);
                                        vs = mgr.currentVisitations(visit.getVisitid());

                                       // List patientHistory = mgr.patientHistory(visit.getPatientid());
                                %>
                                <tr>
                                    <td>
                                        <!--<a href="condetails.jsp?patientid=<%=visit.getPatientid()%>&id=<%=visit.getVisitid()%>"> -->
                                            <%= visit.getPatientid()%> </a> 
                                    </td>
                                    <td>
                                        <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>, <%= mgr.getPatientByID(visit.getPatientid()).getMidname()%> <%= mgr.getPatientByID(visit.getPatientid()).getLname()%>
                                    </td>
                                    <td>
                                        <%=mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid())==null?mgr.sponsorshipDetails(visit.getPatientid()).getType():mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%> 
                                    </td>
                                    <td>
                                        <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofregistration())%>
                                    </td>
                                    <td>
                                        <a id="<%=visit.getPatientid()%><%=visit.getVisitid()%>link"  class="visitlink btn btn-info"> <i class="icon-pencil icon-white"> </i> Consultation </a>
                                    </td>
                                </tr>
                                <% }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div> 
            </section>

        </div>
        <%@include file="widgets/footer.jsp" %>

    </div><!-- /container -->


    <%@include file="widgets/javascripts.jsp" %>

    <%

        String file = "";
        String file2 = "";

        /*  if (mgr.sponsorshipDetails(visit.getPatientid()).getType().equalsIgnoreCase("nhis")) {
         file = "gettreatment.jsp";
         } else {
         file = "getnhistreatment.jsp";
         }*/
if(visits != null){
        for (int i = 0; i < visits.size(); i++) {
            Visitationtable visit = (Visitationtable) visits.get(i);
            // vs = mgr.currentVisitations(visit.getVisitid());
            List patientHistory = mgr.patientHistory(visit.getPatientid());
    %>
    <script type="text/javascript">
        $(document).ready(function(){
                                                      
               
            $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog({
                autoOpen : false,
                width : 1000,
                modal :true,
                position : "top"
		
            });
                
            $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>link').click(function(){
                   
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog('open');
                return false;
            });
                
                                                        
                
        });
    </script>

    <div style="y-overflow: scroll; display: none;" class="visit hide" id="<%=visit.getPatientid()%><%=visit.getVisitid()%>"  title="Consultation for <%= mgr.getPatientByID(visit.getPatientid()).getFname()%>,  <%= mgr.getPatientByID(visit.getPatientid()).getLname()%>   ">



        <div class="span10">

            <div style="margin-left: -50px;" class="span2 ">
                <ul class="menu">
                    <li>  <a class="history_link "> <i class="icon icon-white icon-list-alt"> </i>  History </a></li>
                    <li> <a class="vital_link active"> <i class="icon-white icon-list-alt"> </i> Vitals </a></li>
                    <li> <a class="diagnosis_link"> <i class="icon-white icon-list-alt"> </i> Diagnosis </a></li>
                    <li> <a class="laboratory_link"> <i class="icon-white icon-list-alt"> </i> Lab Request </a></li>
                    <li> <a class="results_link"> <i class="icon-white icon-list-alt"> </i> Lab Results </a></li>
                    <li> <a class="prescription_link"> <i class="icon-white icon-list-alt"> </i> Prescription </a></li>
                    <li> <a class="clerking_link"> <i class="icon-white icon-list-alt"> </i> Clerking </a></li>
                </ul>
            </div>
            <div class="span8">
                <form class="form-inline" action="action/labnpharmactions.jsp" method="post" id="frm">
                    <div style="display: block; " class="well thumbnail center vital">
                        <ul class="breadcrumb">
                            <li>
                                <a style="text-align: center;">Vitals</a>
                            </li>

                        </ul>
                        <%if (vs.getVitals() == null) {%>
                        <%="No vitals available"%>
                        <%} else {
                            String[] vts = visit.getVitals().split("-");
                            String[] bps = vts[3].split(":");

                        %>
                        <table class="table span3 right table table-bordered table-condensed">
                            <tr>
                                <td>Temperature</td>

                                <td><b><%=vts[0]%> (Celsius)</b></td>
                            </tr>

                            <tr>
                                <td>Weight </td>

                                <td><b><%=vts[1]%> (Kg)</b></td>
                            </tr>

                            <tr>
                                <td>Height </td>

                                <td><b><%=vts[2]%> (m)</b></td>
                            </tr>
                            <tr>
                                <td>Blood Pressure </td>

                                <td><b>Systolic <%=bps[0]%></b><br/>
                                    <b>Diatolic <%=bps[1]%></b><br/>
                                    <b>Pulse <%=vts[4]%> (minutes)</b><br/>
                                </td>
                            </tr>
                            <tr>
                                <td>Symptoms </td>

                                <td><b><%=vts[5]%></b></td>
                            </tr>

                        </table>

                        <%}%>

                        </textarea>
                        <table  class="table">

                            <thead style="color: black;">
                                <tr>
                                    <th>
                                        Visit Date
                                    </th>
                                    <th>
                                        Vital Details
                                    </th>

                                </tr>
                            </thead>
                            <tbody style="height: 100px; overflow-y: auto;">
                                <% for (int r = 0; r < patientHistory.size(); r++) {
                                        Visitationtable vps = (Visitationtable) patientHistory.get(r);
                                        String[] vts = vs.getVitals().split("-");
                                        String[] bps = vts[3].split(":");
                                %>
                                <tr>

                                    <td>
                                        <%=vps.getDate()%>
                                    </td>

                                    <td>
                                        Temperature: <%=vts[0]%> (celsius) | Weight: <%=vts[1]%> (Kg) | Height: <%=vts[2]%> (m) | Blood Pressure: Systolic <%=bps[0]%> Diatolic <%=bps[1]%> | Pulse: <%=vts[4]%> | Pulse: <%=vts[5]%>

                                    </td>

                                </tr>
                                <%}%>
                            </tbody>

                        </table>

                    </div>
                    <div style="display: none;" class="well thumbnail center diagnosis">
                        <ul class="breadcrumb">
                            <li>
                                <a style="text-align: center;">Diagnosis</a>
                            </li>

                        </ul>
                         <!--<button id="addCheckBoxes" class="btn btn-info span2" onclick='addSelect("diagnosis<%=visit.getVisitid()%>"); addDiadChecks("diagnosis<%=visit.getVisitid()%>" );addDiagnosis("diagnosis<%=visit.getVisitid()%>","dd<%=visit.getVisitid()%>");return false;'>
                                                <i class="icon-white icon-pencil"> </i>   Add
                                            </button>
                        <input type="text" id="diagnosis_details" value=""/>
                        <script>
                            $("#diagnosis_details").autocomplete("getdiag.jsp");
                        </script>-->
                        <select id="diagnosis<%=visit.getVisitid()%>" onchange =''>

                            <%
                                List diagnoses = mgr.listDiagnosis();
                                for (int t = 0; t < diagnoses.size(); t++) {
                                    Diagnosis diagnosis = (Diagnosis) diagnoses.get(t);
                            %>
                            <option value="<%=diagnosis.getDiagnosis()%>><<%=diagnosis.getId()%>"><%=diagnosis.getDiagnosis()%></option> 
                            <% }

                            %>
                        </select><br/>
                        <button id="addCheckBoxes" class="btn btn-info span2" onclick='addDiadChecks("diagnosis<%=visit.getVisitid()%>","appendd_<%=visit.getVisitid()%>" );return false;'>
                            <i class="icon-white icon-pencil"> </i>   Add Diagnosis
                        </button>


                        <div id="appendd_<%=visit.getVisitid()%>">

                            <table id="appendd_<%=visit.getVisitid()%>">

                            </table>
                        </div>

                        <!--  <div id="nid">
                              <select id="pid" onchange="echoAdded()">
                                  <option value="Select" onclick="removeMe(this)">Select</option>
  
                              </select>
                          </div>-->
                        <br/>

                    </div>
                    <div style="display: none;" class="well thumbnail center history">
                        <ul class="breadcrumb">
                            <li>
                                <a style="text-align: center;">History</a>
                            </li>

                        </ul>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th style="width: 150px;">
                                        Visit Date
                                    </th>
                                    <th>

                                        Investigation
                                    </th>
                                    <th>

                                        Diagnosis
                                    </th>
                                    <th>

                                        Treatment
                                    </th>
                                    <th>

                                        Clerking
                                    </th>
                                </tr>

                            </thead>
                            <tbody style="max-height: 100px; overflow-y: auto;">

                                <% for (int r = 0; r < patientHistory.size(); r++) {
                                        Visitationtable vps = (Visitationtable) patientHistory.get(r);
                                        List pdiagnosis = mgr.patientDiagnosis(vps.getVisitid());
                                        List pInvestigation = mgr.patientInvestigation(vps.getVisitid());
                                        List pTreatment = mgr.patientTreatment(vps.getVisitid());
                                        List patientClerkings = mgr.listPatientClerkingByVisitid(vps.getVisitid());

                                %>
                                <tr>

                                    <td>
                                        <%=vps.getDate()%>
                                    </td>

                                    <td>
                                        <% for (int s = 0; s < pdiagnosis.size(); s++) {
                                                Patientdiagnosis pd = (Patientdiagnosis) pdiagnosis.get(s);
                                                if (pd != null) {
                                        %>
                                        <h5><%= mgr.getId(pd.getDiagnosisid()).getDiagnosis()%></h5> 
                                        <%}
                                            }%>
                                    </td>
                                    <td>
                                        <% for (int s = 0; s < pInvestigation.size(); s++) {
                                                Patientinvestigation pi = (Patientinvestigation) pInvestigation.get(s);
                                                if (pi != null) {
                                        %>
                                        <h5><%= mgr.getInvestigation(pi.getInvestigationid()).getInvestigation()%></h5> 
                                        <% }
                                            }%>
                                    </td>
                                    <td>
                                        <% for (int s = 0; s < pTreatment.size(); s++) {
                                                Patienttreatment pt = (Patienttreatment) pTreatment.get(s);
                                                if (pt != null) {
                                        %>
                                        <h5><%= mgr.getTreatment(pt.getTreatmentid()).getTreatment()%></h5> 
                                        <% }
                                            }%>
                                    </td>
                                    <td>
                                        <%
                                            for (int s = 0; s < patientClerkings.size(); s++) {
                                                Patientclerking patientClerking = (Patientclerking) patientClerkings.get(s);
                                                if (patientClerking != null) {
                                        %>
                                        <h5><%= mgr.getClerkingQuestionByid(patientClerking.getQuestionid()).getQuestion()%></h5> 
                                        <h6><%= mgr.getClerkingAnswerByid(patientClerking.getAnswerid()).getAnswer()%></h6> 
                                        <% }
                                            }%>
                                    </td>

                                </tr>
                                <%}%>

                            </tbody>

                        </table>

                    </div>
                    <div style="display: none;" class="well thumbnail center prescription">
                        <ul class="breadcrumb">
                            <li>
                                <a>Prescription Form</a>
                            </li>
                        </ul>

                        <div id="treat">

                            <table> 

                                <thead>

                                    <tr>
                                        <th>
                                            Name of Drug
                                        </th>
                                        <th>
                                            Strength 
                                        </th>
                                        <th>
                                            Form 
                                        </th>
                                        <th>
                                            Dosage
                                        </th>
                                        <th>
                                            Duration 
                                        </th>
                                        <th>
                                            Quantity 
                                        </th>


                                    </tr>

                                </thead>
                                <tbody style="max-height: 100px; overflow-y: auto;">                     

                                    <tr>

                                        <td> 
                                            <%
                                                if (mgr.sponsorshipDetails(visit.getPatientid()).getType().equalsIgnoreCase("nhis")) {%>
                                            <!--<input type="text" id="dianosis_details" value=""/>
                                                                    <script>
                                                                        $("#diagnosis_details").autocomplete("getnhistreatment.jsp");
                                                                    </script>-->

                                            <select class="xxlarge"  id="treatment<%=visit.getVisitid()%>" onchange = 'addTreatment("treatment<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")'>
                                                <option value="Select">Select Treatment</option>
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
                                            <!--<input type="text" id="dianosis_details" value=""/>
                        <script>
                            $("#diagnosis_details").autocomplete("gettreatment.jsp");
                        </script>-->
                                            <select class="xxlarge"  id="treatment<%=visit.getVisitid()%>" onchange = 'addTreatment("treatment<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")'>
                                                <option value="Select">Select Treatment</option>
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
                                        <td>
                                            <select class="input-small" name="strength" id="strength<%=visit.getVisitid()%>" onchange=addType("drugtype<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")>
                                                <option value="Select">
                                                    Select
                                                </option>
                                                <option value="100MG">
                                                    100MG
                                                </option>
                                                <option value="300MG">
                                                    300MG
                                                </option>
                                                <option value="10 mg/ml">
                                                    10 mg/ml
                                                </option>
                                                <option value="250 m">
                                                    250 m
                                                </option>
                                                <option value="5 mg/ml">
                                                    5 mg/ml
                                                </option>
                                                <option value="10 % B1/M">
                                                    10 % B1/M
                                                </option>
                                                <option value="1% A/M ">
                                                    1% A/M 
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="input-small" name="drugtype" id="drugtype<%=visit.getVisitid()%>" onchange=addType("drugtype<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")>
                                                <option value="Select">
                                                    Select
                                                </option>
                                                <option value="Tablet">
                                                    Tablet
                                                </option>
                                                <option value="Syrup">
                                                    Syrup
                                                </option>
                                                <option value="Capsule">
                                                    Capsule
                                                </option>
                                                <option value="Cream">
                                                    Cream
                                                </option>
                                                <option value="Injection">
                                                    Injection
                                                </option>
                                                <option value="Suppository">
                                                    Suppository
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="large"  name="dosage" id="dosage<%=visit.getVisitid()%>">
                                                <option value="Select">Select Dosage</option>
                                                <%
                                                    dosages = mgr.listDosages();
                                                    if (dosages != null) {
                                                        for (int v = 0; v < dosages.size(); v++) {
                                                            Dosage dosage = (Dosage) dosages.get(v);
                                                %>
                                                <option value="<%=dosage.getShortcut()%>_<%=dosage.getMapped()%>"><%=dosage.getShortcut()%></option> 
                                                <% }
                                                    }
                                                %>
                                            </select>
                                        </td>
                                        <td>

                                            <input type="text" value="duration" class="input-small" name="duration" id="duration<%=visit.getVisitid()%>"/>
                                        </td>
                                        </td>
                                        <td>                                   
                                            <select class="input-mini" name="qty" id="qty<%=visit.getVisitid()%>" onchange=addQuantity("qty<%=visit.getVisitid()%>","tt<%=visit.getVisitid()%>")>
                                                <option value="0">
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

                                            </select>
                                        </td>


                                    </tr>
                                </tbody>
                            </table>
                            <table>

                                <tbody style="max-height: 100px; overflow-y: auto;">
                                    <tr>
                                        <td class="center">
                                           <!-- <button id="addCheckBoxes" class="btn btn-info span2" onclick='addTreatmentSelect("treatment<%=visit.getVisitid()%>");addCheckboxes("treatment<%=visit.getVisitid()%>","drugtype<%=visit.getVisitid()%>","qty<%=visit.getVisitid()%>","dosage<%=visit.getVisitid()%>");return false;'>
                                                <i class="icon-white icon-pencil"> </i>   Add Treatment
                                            </button>-->
                                            <button id="addCheckBoxes" class="btn btn-info span2" onclick='addCheckboxes("treatment<%=visit.getVisitid()%>","drugtype<%=visit.getVisitid()%>","qty<%=visit.getVisitid()%>","dosage<%=visit.getVisitid()%>","duration<%=visit.getVisitid()%>","strength<%=visit.getVisitid()%>","append_<%=visit.getVisitid()%>");return false;'>
                                                <i class="icon-white icon-pencil"> </i>   Add Treatment
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>


                            </table>


                   <!-- <textarea style="width: 95%" name="treatment" id="tt<%=visit.getVisitid()%>" ></textarea> -->
                            <div id="" style="display: none;">
                            </div>

                            <table class="table" id="append_<%=visit.getVisitid()%>">
                                <thead>
                                    <tr>
                                        <th colspan="8">
                                            Selected Prescription
                                        </th>
                                    </tr>
                                </thead>

                            </table>
                            <!-- <div id="din">
                                 <select id="trid" onchange="echoAdded()">
                                     <option value="Select" onclick="removeMe(this)">Select</option>
 
                                 </select>
                             </div>-->

                            <table >
                                <thead>
                                    <tr>
                                        <th colspan="5">
                                            Prescription Note
                                        </th>
                                    </tr>
                                </thead>

                            </table>



                            <textarea style="width: 95%"  name="prescription_notes" ></textarea>


                        </div>
                    </div>
                    <div style="display: none;" class="well thumbnail center laboratory">
                        <ul class="breadcrumb">
                            <li>
                                <a href="#" onclick="showdInvestigation()">Laboratory Request Form</a>
                            </li>

                        </ul>
                        <div class="center" id="lab">

                            Investigation <br /> <br />

                            <% if (mgr.sponsorshipDetails(vs.getPatientid()).getType().equalsIgnoreCase("nhis")) {%>
                            <!--<input type="text" id="dianosis_details" value=""/>
                        <script>
                            $("#diagnosis_details").autocomplete("getnhisinvestigation.jsp");
                        </script> -->
                            <select  id="test<%=visit.getVisitid()%>" onchange = 'addInvestigationSelect("test<%=visit.getVisitid()%>");addInvestigationCheck("test<%=visit.getVisitid()%>");addInvestigation("test<%=visit.getVisitid()%>","lb<%=visit.getVisitid()%>")'>
                                <option value="Select">Select Investigation</option>
                                <%
                                    // List treatments = mgr.patientTreatment(int visitationid);
                                    //investigations = mgr.listNhisInvesigation();
                                investigations = mgr.listInvestigation();
                                    if (investigations != null) {
                                        for (int p = 0; p < investigations.size(); p++) {
                                            Investigation investigation = (Investigation) investigations.get(p);
                                %>
                                <option value="<%=investigation.getInvestigation()%>><<%= investigation.getInvestigationId()%>"><%=investigation.getInvestigation()%></option> 
                                <% }%>
                            </select>
                            <%}
                            } else {%>
                            <!--<input type="text" id="dianosis_details" value=""/>
                        <script>
                            $("#diagnosis_details").autocomplete("getinvestigation.jsp");
                        </script> -->
                            <select  id="test<%=visit.getVisitid()%>" onchange = ''>
                                <option value="Select">Select Investigation</option>
                                <%
                                    // List treatments = mgr.patientTreatment(int visitationid);
                                    investigations = mgr.listInvestigation();
                                    if (investigations != null) {
                                        for (int p = 0; p < investigations.size(); p++) {
                                            Investigation investigation = (Investigation) investigations.get(p);
                                %>
                                <option value="<%=investigation.getInvestigation()%>><<%= investigation.getInvestigationId()%>"><%=investigation.getInvestigation()%></option> 
                                <% }%>
                            </select> 
                            <% }
                                }%>

                            <br />
                   <!-- <textarea style="width: 95%" name="investigation" id="lb<%=visit.getVisitid()%>"></textarea> -->
                            <div id="appendx_<%=visit.getVisitid()%>">
                                <table id="appendx_<%=visit.getVisitid()%>">

                                </table>
                            </div>
                            <!-- <div id="din">
                                 <select id="inid" onchange="echoAdded()">
                                     <option value="Select" onclick="removeMe(this)">Select</option>
 
                                 </select>
                             </div>-->
                            <br />
                         <!--   <button id="addCheckBoxes" class="btn btn-info span2" onclick='addInvestigationSelect("test<%=visit.getVisitid()%>");addInvestigationCheck("test<%=visit.getVisitid()%>");addInvestigation("test<%=visit.getVisitid()%>","lb<%=visit.getVisitid()%>");return false;'>
                                                <i class="icon-white icon-pencil"> </i>   Add
                                            </button>-->
                            <button id="addCheckBoxes" class="btn btn-info span2" onclick='addInvestigationCheck("test<%=visit.getVisitid()%>","appendx_<%=visit.getVisitid()%>");return false;'>
                                <i class="icon-white icon-pencil"> </i>   Add Investigation
                            </button>

                            Investigation Note <br />  <br />
                            <textarea style="width: 95%" name="investigation_note"></textarea> 
                        </div>

                    </div>
                    <div style="display: none;" class="well thumbnail center results">
                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">

                            <thead>
                                <tr>
                                    <th>
                                        <label > Order By</label>
                                    </th>
                                    <th>
                                        <label > Ordered Date </label>
                                    </th>
                                    <th>
                                        <label > Done On </label>
                                    </th>
                                    <th>
                                        <label > View </label>
                                    </th>
                                    

                                </tr>
                            </thead>
                            <tbody>
                                <% List labids = mgr.listLabordersByVisitid(visit.getVisitid()); 
                                if(labids.size() > 0){
                                    System.out.println(labids.size());
                                Laborders laborder = (Laborders)labids.get(0);
                               if(labids != null){
                                %>
                                 <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <%=laborder.getOrderdate()%> 
                                    </td>
                                    <td>
                                         <%=laborder.getDonedate()%> 
                                        
                                    </td>
                                    
                                    <td>
                                        <button  value="view" class="btn btn-danger btn-large" onclick="updateLaborders();return false;">

                                        <i class="icon-white icon-arrow-right"> </i> View Lab Report
                                    </button>
                                    </td>
                                </tr>
                                <% }}else{%>
                            <div>No laboratory request for today's visit</div>
                                <%}
                                List results = mgr.listLabordersByPatientid(visit.getPatientid());
                                if(results != null){
                                    for (int var = 0; var < results.size(); var++) {
                                        Laborders laborders = (Laborders) results.get(var);
                                        if(!laborders.getViewed()){
                                %>
                                <tr>
                                    <td>
                                       
                                    </td>
                                    <td>
                                        <%=laborders.getOrderdate()%> 
                                    </td>
                                    <td>
                                         <%=laborders.getDonedate()%> 
                                        <!-- <input type="hidden" name="labid" value="<%=laborders.getOrderid()%>"/> -->
                                    </td>
                                    
                                    <td>
                                        <button  value="view" class="btn btn-danger btn-large" onclick="updateLaborders();return false;">

                                        <i class="icon-white icon-arrow-right"> </i> View Lab Report
                                    </button>
                                    </td>
                                </tr>
                                <%}
                                    }
                                }%>
                            </tbody>

                        </table>
                    </div>
                    <div style="display: none;" class="well thumbnail center clerk">

                        <ul class="breadcrumb">
                            <li>
                                <a href="#" onclick="">Current Visit</a>
                            </li>

                        </ul>
                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">

                            <thead>
                                <tr>
                                    <th>
                                        <label style="width: 253px;"> Question </label>
                                    </th>
                                    <th>
                                        <label class="span4"> Answers </label>
                                    </th>
                                    <th>
                                        <label class="span4"> New Answers </label>
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <%List questions = mgr.listClerkQuestions();
                                    for (int cl = 0; cl < questions.size(); cl++) {
                                        Clerkingquestion clerkingquestion = (Clerkingquestion) questions.get(cl);

                                %>
                                <tr>
                                    <td>
                                      <!-- <input type="checkbox" name="qtns" value="<%=clerkingquestion.getClerkid()%>"/> --><%=clerkingquestion.getQuestion()%>
                                    </td>
                                    <td>
                                        <%
                                            List answers = mgr.listClerkAnswersByQuestionid(clerkingquestion.getClerkid());
                                            for (int ca = 0; ca < answers.size(); ca++) {
                                                Clerkinganswer clerkinganswer = (Clerkinganswer) answers.get(ca);%>
                                        <input type="checkbox" name="anss[]" value="<%=clerkinganswer.getQuestionid()%>-<%=clerkinganswer.getAnswerid()%>"/> <%=clerkinganswer.getAnswer()%><br/>

                                        <%}%>
                                    </td>
                                    <td>
                                        <textarea name="newanswers_<%=clerkingquestion.getClerkid()%>"></textarea>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>

                        </table>
                    </div>
                    <div class="form-actions center" >
                        <ul class="breadcrumb">
                            <li>
                                <a href="#" onclick="">Additional Notes</a>
                            </li>

                        </ul>
                        <textarea name="further"></textarea>
                    </div>
                    <div class="form-actions center" >
                        <table>

                            <tr>


                                <td>
                                    <select name="unitid">
                                            <% List list = mgr.listWard();
                                                for (int j = 0; j < list.size(); j++) {
                                                    Ward ward = (Ward) list.get(j);
                                            %>
                                            <option value="<%=ward.getType()%>_<%=ward.getWardid()%>"><%=ward.getWardname()%></option>
                                            <%}
                                                List lists = mgr.listUnits();

                                                for (int r = 0; r < lists.size(); r++) {
                                                    Units unit = (Units) lists.get(r);
                                            %>  
                                            <option value="<%=unit.getType()%>_<%=unit.getUnitid()%>"><%=unit.getUnitname()%></option>
                                            <%}
                                               %>
                                    </select>
                                    <input type="hidden" name="patientid" value="<%=visit.getPatientid()%>"/>
                                    <input type="hidden" name="id" value="<%=visit.getVisitid()%>"/> 
                                </td>

                                <td>

                                    <label style="margin-top: 10px;">Admit Patient</label>

                                </td>

                                <td>

                                    <%if (visit.getPatientstatus().equals("In Patient")) {%>
                                    <input style="vertical-align: middle;" type="checkbox" checked="checked" name="admission" value="In Patient"/>
                                    <% } else {%> <input style="vertical-align: middle;" type="checkbox" name="admission" value="In Patient"/>  <%}%>


                                </td>

                                <td>

                                    <button type="submit" name="action" value="Forward" class="btn btn-danger btn-large">

                                        <i class="icon-white icon-arrow-right"> </i> Forward
                                    </button>

                                </td>

                            </tr>
                        </table>
                    </div>
                </form>

            </div>
            <div class="clear"></div>
        </div>
    </div>
    <% //}%>
    <%     }
        }
    %>

</body>
</html>