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
<% Users user = (Users) session.getAttribute("staff");
    if (user == null) {
        session.setAttribute("lasterror", "Please Login");
        response.sendRedirect("index.jsp");
    }%>
<html>
    <%

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        HMSHelper itm = new HMSHelper();

        List itmss = itm.listAppointment();
    %>
    <head>
        <title>Appointments & Scheduling </title>
        <link rel='stylesheet' type='text/css' href='css/bootstrap.min.css' />
        <link rel='stylesheet' type='text/css' href='css/custom-theme/jquery-ui-1.8.16.custom.css' />
        <link rel='stylesheet' type='text/css' href='fullcalendar/fullcalendar.css' />
        <link rel='stylesheet' type='text/css' href='fullcalendar/fullcalendar.print.css' media='print' />

        <link type="text/css" href="css/custom-theme/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
        <link href="css/docs.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/styles.css"/>
        <style type="text/css" title="currentStyle">
            @import "css/jquery.dataTables_themeroller.css";
            @import "css/custom-theme/jquery-ui-1.8.16.custom.css";
            body {
                overflow: hidden;
            }



            .large_button {
                background-color: #35AFE3;
                background-image: -moz-linear-gradient(center top , #45C7EB, #2698DB);
                box-shadow: 0 1px 0 0 #6AD2EF inset;
                color: #FFFFFF;
                text-decoration: none;
                font-weight: lighter;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 30px;
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







    </head>   
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead " id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide ">
                    <ul class="nav nav-pills">

                        <li>
                            <a href="records.jsp">Records</a><span class="divider"></span>
                        </li>
                        <li class="active">
                            <a href="#">Appointments</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>

            <div style="position: absolute; left: 35%; top: 200px; text-align: center;" class="progress1">
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



                <%if (session.getAttribute("lasterror") != null) {%>
                <div class="alert  <%=session.getAttribute("class")%> span12 center">
                    <b> <%=session.getAttribute("lasterror")%>  </b>
                </div>
                <br/>
                <div style="margin-bottom: 20px;" class="clearfix"></div>
                <%session.removeAttribute("lasterror");
                    }%>



                <div class="row">


                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 ">


                        <div class="hide span12" id='calendar'></div>
                        <div class="hide" id="dialog">
                            <form class="form-horizontal" action="action/saveAppointment.jsp" name="mainForm"onkeyup="ddd();">
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">Title</label>
                                    <div class="controls">
                                        <input type="text" name="title" id="titleId"/>
                                    </div>
                                </div>
                                
                                <div class="control-group">
                                    <label class="control-label" for="inputPassword">Appointment Type</label>
                                    <div class="controls">
                                        <select >
                                            <option>
                                                Emergency
                                            </option>
                                            <option>
                                                Pregnancy
                                            </option>
                                        </select>
                                    </div>
                                    
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputPassword">Enter Doctor Id</label>
                                    <div class="controls">
                                        <input type="text" name="doctorId" id="doctorId"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputPassword">Enter Patient Id</label>
                                    <div class="controls">
                                        <input type="text" name="patientId" id="patientId"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputPassword">Appointment Detail</label>
                                    <div class="controls">
                                        <input type="text" name="content" id="content"/>
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
                        <div class="hide">
                            <form method="post" action="action/updatetitle.jsp" name="updateTitle">
                                <input type="text" name="newtitle" id="titleId4"/>
                                <input type="text" name="start" id="startId4"/>
                            </form>
                        </div>
                        <div class="hide">
                            <form method="post" action="action/honored.jsp" name="deleteForm">

                                <input type="hidden" name="title" id="titleId2"/>
                                <input type="hidden" name="id" id="eventdelete"/>

                            </form>
                        </div>
                        <div class="hide">
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


                        <div id="edit-confirm" title="Edit Options" align="center"  class="hide center">
                            <h3> What would you like to do? </h3>
                            <div style="margin-left: 20px; margin-top: 50px;" class="btn-group center">
                                <button id="cancelevent" class="btn btn-danger">
                                    <i class="icon icon-white icon-remove"> </i>
                                    Cancel
                                </button>
                                <button id="updateevent" class="btn "> 
                                    <i class="icon  icon-edit"> </i> Update
                                </button>
                                <button id="honorevent" class="btn btn-success">
                                    <i class="icon icon-white icon-check"> </i>
                                    Honor
                                </button>
                            </div>

                        </div>

                    </div>  

                </div> 
            </section>

            <footer style=" margin-top: 50px;" class="footer hide">
                <p style="text-align: center" class="pull-right">
                    <img src="images/logo.png" width="100px;" />
                </p>
            </footer>
        </div>�
        <!-- /container -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap-dropdown.js"></script>
        <script src="js/bootstrap-scrollspy.js"></script>
        <script src="js/bootstrap-collapse.js"></script>
        <script src="js/bootstrap-tooltip.js"></script>
        <script src="js/bootstrap-popover.js"></script>
        <script src="js/application.js"></script>
        <script src="js/jquery.validate.min.js"></script>


        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>

        <script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/date.js"></script>
        <script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js"></script>

        <script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>

        <script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
        <script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>

        <!--  <script type="text/javascript" src="js/tablecloth.js"></script>  -->
        <script type="text/javascript" src="js/demo.js"></script>

        <script type='text/javascript' src='fullcalendar/fullcalendar.min.js'></script>
    </body>


    <script type='text/javascript'>

   

        $(document).ready(function() {
            var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');
            
            

            menu_ul.hide();

            $(".menu").fadeIn();
            $(".content1").fadeIn();
            $(".navbar").fadeIn();
            $(".footer").fadeIn();
            $(".subnav").fadeIn();
            $(".alert").fadeIn();
            $(".progress1").hide();
            $("#calendar").fadeIn();
                
                
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
            
            
                
            $("#dialog").dialog({
                autoOpen: false,
                title: "Schedule Appointment",
                width: "500",
                height: "400"
                    
            })
                           
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
		
            var calendar = $('#calendar').fullCalendar({
                defaultView: 'agendaWeek',
                theme: true,
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'agendaDay,agendaWeek,month'
                        
                    //month ,agendaDay
                },
                droppable:true,
                selectable: true,
                selectHelper: true,
                firstDay: 1,
                height: 550,
                allDayText   : "All Day",
                axisFormat : 'h:mm tt',
                defaultEventMinutes: '30',
                firstHour: 7,
                agenda: 'h:mm { - h:mm }tt',
                buttonText : {
                    prev:     '&nbsp;&#9668;&nbsp;',  // left triangle
                    next:     '&nbsp;&#9658;&nbsp;',  // right triangle
                    prevYear: '&nbsp;&lt;&lt;&nbsp;', // <<
                    nextYear: '&nbsp;&gt;&gt;&nbsp;', // >>
                    today:    'Today',
                    month:    'Month',
                    week:     'Week',
                    day:      'Day'
                },
                eventBackgroundColor : "#35AFE3",
                eventTextColor: "#EEE",
                
               
                     
                           
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
                        modal: true,
                        buttons: {
                          /*  "Cancel Appointment": function() {
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
                            } */
                        } 
                    });
                    
                    $("#cancelevent").click(function(){
                        var deleteForm = document.deleteForm.submit();
                    });
                    
                    $("#updateevent").click(function(){
                        
                        var newTitleId = prompt('Update Title',titleId2);
                        var newTitleId1=document.getElementById('titleId4').value = newTitleId;
                        var start4= document.getElementById('startId4').value = calEvent.start;
                        var updateForm = document.updateTitle.submit();
                    
                    });
                    
                    $("#honorevent").click(function(){
                        var id= document.getElementById('id').value = calEvent.id;
                        var updateHonred = document.honored.submit();
                    });
	
         
                },

                events: [
        <%      for (int i = 1; i < itmss.size(); i++) {


                Appoint itt = (Appoint) itmss.get(i);
                if (!itt.isHonored()) {
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
                             
                            title:'<%=title%> '+'<%=patient%> '+' <%=doctor%>',
                            start: new Date('<%=start%>'),
                            end: new Date('<%=end%>'),
                            id: "<%=id%> ",    
                            allDay: <%=allDay%>
                            
                    
                
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
