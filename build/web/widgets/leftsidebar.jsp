<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="entities.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.HMSHelper"%>
<%@page import="java.text.DateFormat"%>
<%HMSHelper mg = new HMSHelper();
    DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

    Date dt = new Date();
    //System.out.println(dateFormat.format(date));
    List vjs = mg.listRecentVisits(dateformat.format(dt), "In Patient");
    List outs = mg.listRecentVisits(dateformat.format(dt), "Out Patient");
    List labs = mg.listUnitVisitations("Laboratory", dateformat.format(dt));
    List pharmacy = mg.listUnitVisitations("Laboratory", dateformat.format(dt));
    List accs = mg.listUnitVisitations("Laboratory", dateformat.format(dt));
    List rms = mg.listUnitVisitations("Room 1", dateformat.format(dt));
%>

<div style="height: 100%; position: fixed;" class="span3">
    <ul style="display: none;"  class="menu hide">
        <li class="item1">
            <a  href="#"><i class="icon-folder-open"></i> Records Department</a>
            <ul>
                <li class="subitem1">
                    <a href="records.jsp">Front Desk </a>
                </li>
                <li class="subitem2">
                    <a href="opd.jsp">Nurses Station </a>
                </li>
                <li class="subitem3">
                    <a href="listpatients.jsp">All Patients </a>
                </li>

            </ul>

        </li>
        <li class="item2">
            <a href="#"> <i class=" icon-search"></i> Consultation
            </a> 
            <ul>
                <li class="subitem1">
                    <a href="consultingroom.jsp">Patients <span><%=rms.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="secondary.jsp">Re-Visit </a>
                </li>
                <li class="subitem2">
                    <a href="#">Appointments <span>6</span></a>
                </li>
                <li class="subitem3">
                    <a href="outpatient.jsp">Recent Out Patients <span><%=vjs.size()%></span></a>
                </li> 
                <li class="subitem4">
                    <a href="inpatient.jsp">Recent In Patients <span><%=outs.size()%></span></a>
                </li> 
                <li class="subitem5">
                    <a href="labresults.jsp">Lab Results<span>2</span></a>
                </li> 
            </ul>
        </li>
        <li class="item2">
            <a href="#"> <i class=" icon-search"></i> Male Ward
            </a> 
            <ul>
                <li class="subitem1">
                    <a href="ward.jsp">In Patients </a>
                </li>
                <li class="subitem2">
                    <a href="#">New Ward Report </a>
                </li>
                <li class="subitem3">
                    <a href="#">Ward Reports </a>
                </li> 
                <li class="subitem4">
                    <a href="#">Schedule</a>
                </li> 

            </ul>
        </li>  
        <li class="item3">
            <a href="#"><i class="icon-share"></i> Laboratory  </a>
            <ul>
                <li class="subitem1">
                    <a href="laboratory.jsp">Patients <span><%=labs.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="furtherinvestigation.jsp">Re-Visit </a>
                </li>

                <li class="subitem3">
                    <a href="#">Outstanding Investigations<span>6</span></a>
                </li>
                <li class="subitem3"> 
                    <a href="#">Procurement Sheet</a>
                </li>   
                <li class="subitem4">
                    <a href="addlabtype.jsp">Add Lab Type</a>
                </li>
                <li class="subitem4">
                    <a href="addmaininv.jsp">Add Investigation</a>
                </li>

            </ul>
        </li>
        <li class="item4">
            <a href="#"><i class="icon-check"></i> Pharmacy </a>
            <ul>
                <li class="subitem1">
                    <a href="pharmacy.jsp">Patients <span><%=pharmacy.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="furthertreatment.jsp">Re-Visit </a>
                </li>
                <li class="subitem3">
                    <a href="#">Outstanding Treatments<span>6</span></a>
                </li>
                <li class="subitem3">
                    <a href="#">Procurement Sheet</a>
                </li>  

            </ul>
        </li>
        <li class="item4">
            <a href="#"><i class="icon-check"></i> Accounts and Billing</a>
            <ul>
                <li class="subitem1">
                    <a href="accounts.jsp">Current Bills <span><%=accs.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="account_search.jsp">Patient Bills </a><span></span>
                </li>
                <li class="subitem1">
                    <a href="furtheraccounting.jsp">Re-Visit</a>
                </li>
                <li class="subitem3">
                    <a href="anballdepartments.jsp">Departmental Bills</a>
                </li>
                <li class="subitem3">
                    <a href="anballpatientsrevenues.jsp">All Patients Revenues</a>
                </li>
                <!--    <li class="subitem3">
                        <a href="anbpatientrevenues.jsp">Patient Revenues</a>
                    </li>  -->
                <li class="subitem3">
                    <a href="anballsponsorsrevenues.jsp">Sponsors Revenues</a>
                </li>


            </ul>
        </li>
        <li class="item4">
            <a href="#"><i class="icon-check"></i> Inventory</a>
            <ul>
                <li class="subitem1">
                    <a href="inventoryindex.jsp">Add Item</a>
                </li>
                <li class="subitem2">
                    <a href="addType.jsp">Add Item Type</a>
                </li>
                <li class="subitem3">
                    <a href="search_item.jsp">Search Item</a>
                </li>
                <li class="subitem4">
                    <a href="application.jsp">List Items</a>
                </li>
                <li class="subitem4">
                    <a href="check.jsp">Check Expiry</a>
                </li>
                <li class="subitem4">
                    <a href="addSupplier.jsp">Add Supplier</a>
                </li>
            </ul>
        </li>
        
        <li class="item4">
            <a href="#"><i class="icon-check"></i> Reports </a>
            <ul>
                <li class="subitem1">
                    <a href="genericformshow.jsp">Claim Form View</a>
                </li>
                <li class="subitem1">
                    <a href="genericformfill.jsp">Claim Form Fill</a>
                </li>
                <li class="subitem2">
                    <a href="emrdashboard.jsp">At-A-Glance Dashboard</a>
                </li>
                <li class="subitem3">
                    <a href="patientutilization.jsp">Patient Utilization</a>
                </li>
                <li class="subitem4">
                    <a href="patientmedicalanalysis.jsp">Patient Medical Analysis</a>
                </li>
                <li class="subitem4">
                    <a href="patientbilling.jsp">Patient Billing</a>
                </li>
                <li class="subitem4">
                    <a href="addpermission.jsp">Add Permission</a>
                </li>
                <li class="subitem4">
                    <a href="addsponsor.jsp">Add Sponsor</a>
                </li>
                <li class="subitem4">
                    <a href="addstaff.jsp">Add Staff</a>
                </li>
                <li class="subitem4">
                    <a href="addrole.jsp">Add Role</a>
                </li>
                <li class="subitem4">
                    <a href="addclerking.jsp">Clerking</a>
                </li>
                <li class="subitem4">
                    <a href="addconitems.jsp">Settings</a>
                </li>
                <li class="subitem4">
                    <a href="adddosage.jsp">Add Dosage Shortcut</a>
                </li>
            </ul>
        </li>
        <li class="item4">
            <a href="#"><i class="icon-check"></i> Admin Panel</a>
            <ul>
                <li class="subitem1">
                    <a href="addunit.jsp">Add Unit</a>
                </li>
                <li class="subitem2">
                    <a href="addconsultingroom.jsp">Add Consulting Room</a>
                </li>
                <li class="subitem3">
                    <a href="addconcharges.jsp">Add Consultation Type</a>
                </li>
                <li class="subitem4">
                    <a href="addward.jsp">Add Ward</a>
                </li>
                <li class="subitem4">
                    <a href="adddepartment.jsp">Add Department</a>
                </li>
                <li class="subitem4">
                    <a href="addpermission.jsp">Add Permission</a>
                </li>
                <li class="subitem4">
                    <a href="addsponsor.jsp">Add Sponsor</a>
                </li>
                <li class="subitem4">
                    <a href="addstaff.jsp">Add Staff</a>
                </li>
                <li class="subitem4">
                    <a href="addrole.jsp">Add Role</a>
                </li>
                <li class="subitem4">
                    <a href="addclerking.jsp">Clerking</a>
                </li>
                <li class="subitem4">
                    <a href="addconitems.jsp">Settings</a>
                </li>
                <li class="subitem4">
                    <a href="adddosage.jsp">Add Dosage Shortcut</a>
                </li>
            </ul>
        </li>

    </ul>
</div>