<%-- 
    Document   : index
    Created on : Jul 17, 2012, 5:08:57 PM
    Author     : lisandro
--%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import="entities.*"%>
<%@page import="java.util.List"%>
<%@page import="entities.HMSHelper"%>
<%@page import="helper.HibernateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
    <%

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        HMSHelper itm = new HMSHelper();

        List itmss = itm.listAppointment();
    %>
    <head>
        <link rel='stylesheet' type='text/css' href='css/bootstrap.min.css' />
        <link rel='stylesheet' type='text/css' href='css/custom-theme/jquery-ui-1.8.16.custom.css' />
        <link rel='stylesheet' type='text/css' href='fullcalendar/fullcalendar.css' />
        <link rel='stylesheet' type='text/css' href='fullcalendar/fullcalendar.print.css' media='print' />
        <script type='text/javascript' src='js/jquery-1.6.2.min.js'></script>
        <script type='text/javascript' src='js/jquery-ui-1.8.16.custom.min.js'></script>
        <script type='text/javascript' src='js/jquery.ui.dialog.js'></script>
        <script type='text/javascript' src='fullcalendar/fullcalendar.min.js'></script>
        <style type='text/css'>

            body {
                margin-top: 40px;
                text-align: center;
                font-size: 14px;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            }

            #calendar {
                width: 900px;
                margin: 0 auto;


            }


        </style>




    </head>   
    <body>


        <div id='calendar'></div>
        <div id="dialog">
            <form class="form-horizontal" action="action/saveAppointment.jsp" name="mainForm"onkeyup="ddd();">
                <div class="control-group">
                    <label class="control-label" for="inputEmail">Type</label>
                    <div class="controls">
                        <select name="title" id="titleId"/>
                        <% List types = itm.listAppointType();
                        for(int i=0; i<types.size();i++){
                            AppointType appointType = (AppointType)types.get(i);
                        
                        %>
                        <option value="<%=appointType.getTypeid() %>"><%=appointType.getType()%></option>
                        <%}%>
                        </select>
                       
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">By Patient</label>
                    <div class="controls">
                        <select name="patientId" id="patientId"/>
                          <% List pList = itm.listPatients();
                        for(int i=0; i<pList.size();i++){
                            Patient patient = (Patient)pList.get(i);
                        
                        %>
                        <option value="<%=patient.getPatientid() %>"><%=patient.getLname()%> <%=patient.getMidname()%> <%=patient.getFname()%></option>
                        <%}%>  
                        </select>
                        
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">With Doctor</label>
                    <div class="controls">
                       
                        <select name="doctorId" id="doctorId"/>
                          <% List staffs = itm.listAllStaff();
                        for(int i=0; i<staffs.size();i++){
                            Stafftable stafftable = (Stafftable)staffs.get(i);
                        
                        %>
                        <option value="<%=stafftable.getStaffid() %>"><%=stafftable.getLastname()%> <%=stafftable.getOthername()%></option>
                        <%}%>
                        </select>
                        
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">Appointment Detail</label>
                    <div class="controls">
                        <textarea name="content"></textarea>
                        
                    </div>
                    <input type="hidden" name="start" id="startId"/>
                    <input type="hidden" name="end" id="endId"/>
                    <input type="hidden" name="allday" id="allDayId"/>
                </div>
                <div class="form-actions">
                    <div class="controls">

                        <button type="submit" id="saveEvent" class="btn btn-info btn-large">Save </button>
                    </div>
                </div>
            </form>
        </div>
        <div style="display: none;">
            <form method="post" action="action/updatetitle.jsp" name="updateTitle">
                <input type="text" name="newtitle" id="titleId4"/>
                <input type="text" name="start" id="startId4"/>
            </form>
        </div>
        <div style="display: none;">
            <form method="post" action="action/honored.jsp" name="deleteForm">

                <input type="hidden" name="title" id="titleId2"/>
                <input type="hidden" name="id" id="eventdelete"/>
                
            </form>
        </div>
        <div style="display: none;">
            <form method="post" id="update" action="action/update.jsp" name="update">
                <input type="hidden" name="id" id="eventId"/>
                
                <input type="hidden" name="title" id="titleId1"/>

                <input type="hidden" name="start" id="startId1"/>

                <input type="hidden" name="end" id="endId1"/>

                <input type="hidden" name="allday" id="allDayId1"/>
            </form>
        </div>
        <div>
            <form action="action/honored.jsp" name="honored">
                <input type="hidden" name="id" id="id"/>
            </form>
        </div>


        <div id="edit-confirm" title="Edit Options" align="center" style="display: none">
            <p><span class="ui-icon ui-icon-alert" style="float:none"></span>Options</p>
        </div>

    </body>


    <script type='text/javascript'>

   

        $(document).ready(function() {
                
            $("#dialog").dialog({
                autoOpen: false,
                
                width: "500"
                    
            })
                           
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
		
            var calendar = $('#calendar').fullCalendar({
                defaultView: 'agendaWeek',
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'agendaWeek,month'
                        
                    //month ,agendaDay
                },
                droppable:true,
                selectable: true,
                selectHelper: true,
                     
                           
                select: function(start, end, allDay, view) {
                    $("#dialog").dialog('open'); 
                    //   var title = prompt('Appointment Title');            
                    //   var doctorId1 = prompt('Doctor Id');
                    //  var patientId1 = prompt('Patient Id');
                    //  var content1 = prompt('Appointment Detail');  
                    
                     
                        
                    // var showform = document.getElementById("frm");
                    //showform.style.display='';
                    var title =  $("#titleId").attr("value");
                    var doctorId1 =   $("#doctorId").attr("value")
                    var patientId1 = $("#patientId").attr("value")
                    var content1 = $("#content").attr("value")
                    $("#startId").attr("value",start)
                    $("#allDayId").attr("value",allDay)
                    $("#endId").attr("value",end)
                    
                    var startId= document.getElementById('startId').value = start;
                    var endId= document.getElementById('endId').value = end;
                    var allDayId = document.getElementById('allDayId').value = allDay;
                    var  titleId=document.getElementById('titleId').value = title;
                    var doctorId = document.getElementById('doctorId').value = doctorId1;
                    var patientId = document.getElementById('patientId').value = patientId1
                    var content = document.getElementById('content').value = content1;
                     
                    $("#saveEvent").click(function(){
                        var submitNow=document.mainForm.submit();
                    });  
                     
                    
                       
                       
                    /// alert(start3);
                    if (title) {
                        calendar.fullCalendar('renderEvent',
                        {
                            title: title,
                            start: start,
                                  
                            end: end,
                            allDay: allDay
                                
                            
                                
                        },
                        true // make the event "stick"
                         
                    );
                    }
                      
                    calendar.fullCalendar('unselect');
                },
                editable: true,
                eventResize: function(event,dayDelta,minuteDelta,revertFunc) {
                        
                    var startId1= document.getElementById('startId1').value = event.start;
                    var endId1= document.getElementById('endId1').value = event.end;
                    var allDayId1 = document.getElementById('allDayId1').value = event.allDay;
                    var titleId1=document.getElementById('titleId1').value = event.title;
                    
                    $("#startId1").attr("value",event.start);
                    $("#endId1").attr("value",event.end);
                    $("#allDayId1").attr("value",event.allDay);
                    $("#titleId1").attr("value",event.title);
                    $("#eventId").attr("value",event.id);
                    var submit = confirm("Do You Want To Save Changes?");
                    if (submit==true)
                    {   alert(event.id);
                        alert($("#eventId").val());
                        alert(event.start);
                        alert(event.title);
                        alert(event.end);
                        alert(event.allDay);
                        $("#update").submit();
                        
                            
                    }
                    else
                    {   alert("Nay its not true");
                        return;
                    } 

                },
                eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
                        
                    var startId1= document.getElementById('startId1').value = event.start;
                    var endId1= document.getElementById('endId1').value = event.end;
                    var allDayId1 = document.getElementById('allDayId1').value = event.allDay;
                    var titleId1=document.getElementById('titleId1').value = event.title;
                    
                    $("#startId1").attr("value",event.start);
                    $("#endId1").attr("value",event.end);
                    $("#allDayId1").attr("value",event.allDay);
                    $("#titleId1").attr("value",event.title);
                    $("#eventId").attr("value",event.id);
        
                    var submit = confirm("Do You Want To Save Changes?");
                    if (submit==true)
                    {   
                        
                        $("#update").submit();
                        var f=document.update.submit();
                        // f.method="post";
                        //f.action='updateItems.jsp?id='+id;
                        //f.submit();
                    }
                    else
                    {
                        return;  
                    } 
                },
                eventClick: function(calEvent, jsEvent, view) {
                        
                    var  titleId2=document.getElementById('titleId2').value = calEvent.title;
                    // alert(calEvent.title);
                    $( "#dialog:ui-dialog" ).dialog( "destroy" );
                        
                    $("#eventdelete").attr("value",calEvent.id);
                    $( "#edit-confirm" ).dialog({
                        //resizable: false,
                        //height:140,
                        //modal: true,
                        buttons: {
                            "Cancel Appointment": function() {
                                var deleteForm = document.deleteForm.submit();
                      
                            },
                            "Update Appointment": function() {
                                var newTitleId = prompt('Update Title',titleId2);
                                var newTitleId1=document.getElementById('titleId4').value = newTitleId;
                                var start4= document.getElementById('startId4').value = calEvent.start;
                                var updateForm = document.updateTitle.submit();
                            },
                            "Honored":function(){
                                //var newTitleId = prompt('Update',titleId2);
                                //var  newTitleId1=document.getElementById('titleId4').value = newTitleId;
                                var id= document.getElementById('id').value = calEvent.id;
                                var updateHonred = document.honored.submit();
                            }
                        }
                    });
	
         
                },

                events: [
        <%      for (int i = 1; i < itmss.size(); i++) {


                Appoint itt = (Appoint) itmss.get(i);
                 if(!itt.isHonored()){
                String title = itt.getTitle();
                String start = itt.getStart();
                String end = itt.getEnd();
                String allDay = itt.getAllday();
                String patient = itt.getPatientId();
                String doctor = itt.getDoctorId();
                int id = itt.getId();




                System.out.print("Title " + title + " " + start);
                System.out.print("___________________________" + itmss.size() + "____________________________________________________");
        %> 
                           
                       
                       
                        {
                             
                                    title:'<%=itm.getAppointTypeByid(Integer.parseInt(title)).getType()%>',
                            start: new Date('<%=start%>'),
                            end: new Date('<%=end%>'),
                            id: "<%=id%> ",    
                            allDay: <%=allDay%>,
                            color: 'white',  
                            textColor: 'green'   
                          
                            
                    
                
                        },
        <% System.out.print("allDay " + allDay + "");%>
        <% }
            }%>
                            {
                            
                            }
   
                        ]
                      
         
                    }
                );
		
                });
           
    </script>


</html>
