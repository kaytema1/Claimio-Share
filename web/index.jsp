<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="helper.HibernateUtil"%>
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
            
            .modal {
                top: 65%;
            }
        </style>

        <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
        <script type="text/javascript">
            function submitform(){
                var name= document.getElementById("name").value;
              
                var bool = validateForm();
                if(bool){
                    $.post('action/permissionaction.jsp',{ action : "units", name : name}, function(data){
                        alert(data);
                    })
                }else{
                    alert("Permission field cannot be empty");
                }
            }
            
            function updateUnit(name,id){
                var uname = document.getElementById(name).value;
                var uid = document.getElementById(id).value;
               
                $.post('action/permissionaction.jsp', { action : "edit", uname : uname, uid : uid}, function(data) {
                    alert(data);
                    $('#results').html(data).hide().slideDown('slow');
                } );
            }
            
            function deleteUnit(id){
                var id = document.getElementById(id).value;
                // var roledescription = document.getElementById("roledescription").value;
                var con = confirm("Are You Sure You Want Delete This Item");
                if (con ==true)
                {
                    $.post('action/permissionaction.jsp', { action : "delete", id : id}, function(data) {
                        alert(data);
                        $('#results').html(data).hide().slideDown('slow');
                    } );
                }
                else 
                {
                    alert("Delete Was Cancelled!");
                    //return;
                }
            }
        </script>
    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <!-- Navbar
        ================================================== -->
        
        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        

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
                    
                    <%if (session.getAttribute("lasterror") != null) {%>
                    <div class="alert hide <%=session.getAttribute("class")%> span12 center">
                        <b> <%=session.getAttribute("lasterror")%>  </b>
                    </div>
                    <br/>
                    <div style="margin-bottom: 20px;" class="clearfix"></div>
                    <%session.removeAttribute("lasterror");
                        }%>

                    <%

                        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

                        HMSHelper mgr = new HMSHelper();

                        List itmss = mgr.listPermissions();




                    %>     
                    <br/>
                    <br/>
                    <br/>
                    <div  class="modal hide">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3>Sign In</h3>
                        </div>

                        <form class="form-horizontal" action="action/login.jsp" method="post" name="items" >

                            <fieldset>
                                <div class="modal-body">
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Username </label>
                                        <div class="controls">
                                            <input type="text" name="username" id="name">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Password </label>
                                        <div class="controls">
                                            <input type="password" name="password" id="name">
                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01"> Unit </label>
                                        <div class="controls">
                                            <select class="input-medium" name="unit">
                                                <% List list = mgr.listWard();
                                                    for (int i = 0; i < list.size(); i++) {
                                                        Ward ward = (Ward) list.get(i);
                                                %>
                                                <option value="<%=ward.getType()%>_<%=ward.getWardid()%>"><%=ward.getWardname()%></option>
                                                <%}
                                                    List lists = mgr.listUnits();

                                                    for (int r = 0; r < lists.size(); r++) {
                                                        Units unit = (Units) lists.get(r);
                                                %>  
                                                <option value="<%=unit.getType()%>_<%=unit.getUnitid()%>"><%=unit.getUnitname()%></option>
                                                <%}
                                                    List ls = mgr.listConRooms();
                                                    for (int x = 0; x < ls.size(); x++) {
                                                        Consultingrooms conroom = (Consultingrooms) ls.get(x);
                                                %>
                                                <option value="<%=conroom.getType()%>_<%=conroom.getConsultingroomid()%>"><%=conroom.getConsultingroom()%></option>
                                                <%}%>
                                            </select>

                                            <p class="help-block"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">

                                    <button class="btn btn-info btn-large" type="submit" value="login" name="action">
                                        <i class=" icon-lock icon-white"> </i> Sign In 
                                    </button>

                                </div>
                            </fieldset>
                        </form>


                    </div>


                    <div class="clearfix"></div>

                </div>


            </section>

            <!--    <footer style="display: none; position: static; bottom: 500px;"  class="footer">
                    <p style="text-align: center" class="pull-right">
                        <img src="images/logo.png" width="100px;" />
                    </p>
                </footer>   -->

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
<script type="text/javascript" src="js/demo.js"></script>

<!--initiate accordion-->
<script type="text/javascript">
    $(function() {

        var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

        menu_ul.hide();
        $(".alert").fadeIn();
        $(".modal").fadeIn();
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
    
    
    
    function validateForm()
    {
        var x=document.forms["items"]["name"].value;
        if (x==null || x=="")
        {
            // alert("Item must be filled out");
            return false;
        }
        /* var x=document.forms["edit"]["uname"].value;
        if (x==null || x=="")
        {
            // alert("Item must be filled out");
            return false;
        }*/
        
        return true;
    }
    function todaysdate()
    {
        var currentDate = new Date()
        var day = currentDate.getDate()
        var month = currentDate.getMonth() + 1
        var year = currentDate.getFullYear()
        var dat=(" " + year + "-" + month + "-" + day )
        //document.write(dat)
        // alert("Todays Date is "+dat)
        return dat; 
   
 
    }
</script>
<% for (int i = 0;
            i < itmss.size();
            i++) {
        Permission vst = (Permission) itmss.get(i);
%>


<script type="text/javascript">
   
                      
    $("#<%= vst.getPermissionid()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= vst.getPermissionid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getPermissionid()%>_link").click(function(){
      
        $("#<%=vst.getPermissionid()%>_dialog").dialog('open');
    
    })
  
    
    $("#<%= vst.getPermissionid()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=vst.getPermissionid()%>_adddrug_dialog").dialog('open');
        
    })
   
    
</script>



<% }%>
</body>
</html>