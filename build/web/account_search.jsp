<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
        <%
        Users user = (Users) session.getAttribute("staff");
            if (user == null) {
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
            HMSHelper mgr = new HMSHelper();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();
            List visits = mgr.listRecentVisits(dateFormat.format(date));
        %>
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

                        <li class="active">
                            <a href="#">Find Patient</a><span class="divider"></span>
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

            <section style="margin-top: -30px;" id="dashboard">

                <!-- Headings & Paragraph Copy -->



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

                        <%if (session.getAttribute("lasterror") != null) {%>
                        <div class="alert hide <%=session.getAttribute("class")%> span12 center">
                            <b>  <%=session.getAttribute("lasterror")%> </b>
                        </div>

                        <div class="clearfix"></div>
                        <%session.removeAttribute("lasterror");
                            }%>

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">


                            <div style="margin-top: 20px;" class="clearfix"></div>
                            <br />
                            <br />
                            <a href="#">
                                <div   class="dialog_link2 span3 offset2 center  well large_button">
                                    <img style="margin-top: -4px;" width= " 36px;" src="images/16.png" />  Find Patient
                                </div> </a>

                            <div class="clearfix"></div>
                            <br />
                            <br />
                            <br />

                            <div class="clearfix"></div>
                       

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

    

        <div style="display: none;" id="dialog2" title="Patient Search">

            <form class="form-horizontal" action="account_searchresults.jsp" method="post">
                <fieldset>
                    <div class="control-group center">
                        <h3> Search By </h3>
                        <br />

                        <select name="searchid">
                            <option value="patientid">Patient ID/Folder No.</option>
                            <option value="fullname">Patient First or Last Names</option>
                            <option value="memberdshipnumber">Policy No.</option>
                            <option value="dob">Date of Birth(0000-00-00)</option>
                        </select>

                    </div>

                    <hr />

                    <div class="clearfix"></div>
                    <div class="center">

                        <input type="text" placeholder="Please enter search query" class="input-xlarge"  name="searchquery"/>

                        <br />
                        <br />
                        <br />

                        
                        
                        <button type="submit" name="action" class="btn btn-large btn-info">
                            <i class="icon-white icon-search"></i> Search
                        </button>
                    </div>

                </fieldset>
            </form>

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
        <script src="js/jquery.validate.min.js"></script>

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
            
            
            
            $(".submit_button").click(function(){
                
                $(".MustSelectOpt").each(function(){
                   
                    var selectedid =  $(this).attr('id');
                    var selectedvalue = $(this).attr('value')
                    
                    if(selectedvalue=="Select"){
                       
                        $('#'+selectedid).closest('.control-group').addClass('error').removeClass('success')
                    }
                    else{
                       
                        $('#'+selectedid).closest('.control-group').addClass('success').removeClass('error');
                    }
                   
                });
                
               
                
            });
            
            
            
            
            
            $(".MustSelectOpt").change(function(){
                
                var selectedvalue = $(this).attr('value')
                var selectedid = $(this).attr('id');    
                //alert(selectedvalue);
                //alert(selectedid);
                if($("#"+selectedid).attr("value")=="Select"){
                    
                    $('#'+selectedid).closest('.control-group').addClass('error').removeClass('success')
                    // $('.MustSel').closest('.control-group').addClass('error').removeClass('success')
                        
                }else{
                    $('#'+selectedid).closest('.control-group').addClass('success').removeClass('error');        
                    //  $('.MustSel').closest('.control-group').addClass('success').removeClass('error');
                }
                        
                  
                    
            })
        
            $('#registration').validate({
                rules: {
                    fname: {
                        minlength: 2,
                        required: true
                    },
                    lname: {
                        minlength: 2,
                        required: true
                    },
                    midname: {
                        minlength: 2,
                        required: false
                    },
                    
                   
                    
                    address: {
                        required: true
                        
                    }
                },
                highlight: function(label) {
                    $(label).closest('.control-group').addClass('error');
                },
                success: function(label) {
                    label
                    .text('OK!').addClass('valid')
                    .closest('.control-group').addClass('success');
                }
            });
        
            $("#payment").change(function() {
          
                var payment =  $('#payment option:selected').attr('id');
            
                if(payment=='nhis'){
                    //alert("nhis");
                    $("#companydiv").slideUp();
                    $("#privatediv").slideUp();
                    $("#nhisdiv").slideDown();
                    $('#nhismembershipid').rules('add', {
                        required : true,
                        minlength: 2
                    });
                    $('#coperateid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                    $('#benefitplan').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                    $('#membershipid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                
                
                }else if(payment=='cash'){
                    //alert("cash");
                    $("#companydiv").slideUp();
                    $("#privatediv").slideUp();
                    $("#nhisdiv").slideUp();
                    $('#nhismembershipid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                    $('#coperateid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                    $('#benefitplan').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                    $('#membershipid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                
                }else if(payment=='private'){
                    //alert("private");
                    $("#companydiv").slideUp();
                    $("#privatediv").slideDown();
                    $("#nhisdiv").slideUp();
                    /* $('#benefitplan').rules('add', {
                       required : true,
                        minlength: 2
                    });
                    
                     */
                    if ($('#sponsor').attr('value')=="Select"){
                        $('#sponsor').closest('.control-group').addClass('error').removeClass('success')
                    }
                    
                    $('#membershipid').rules('add', {
                        required : true,
                        minlength: 2
                    });
                    $('#nhismembershipid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                    $('#coperateid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
               
            
                }else if(payment=='corporate'){
                    //alert("corporate");
                    $("#companydiv").slideDown();
                    $("#privatediv").slideUp();
                    $("#nhisdiv").slideUp();
                    
                    if ($('#coperate').attr('value')=="Select"){
                        $('#coperate').closest('.control-group').addClass('error').removeClass('success')
                    }
                    
                    $('#coperateid').rules('add', {
                        required : true,
                        minlength: 2
                    });
                    $('#nhismembershipid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                
                    $('#benefitplan').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                    $('#membershipid').rules('remove', {
                        required : true,
                        minlength: 2
                    });
                }
                else{
                    alert("Please Select Payment Method");
                }
            });
               
               
               
           
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

            });
            
            
            
            
            
            function showMembershipbox(){
                               var show = document.getElementById("privateid");
                               var shows = document.getElementById("nhis");
                              
                               show.style.display="block";
                               shows.style.display="none";
                           
                       }
        
            function showCorporate(){
                               var show = document.getElementById("privateid");
                               var shows = document.getElementById("nhis");
                              
                               show.style.display="none";
                               shows.style.display="none";
                           
                       }
        
                       function showInsurance(){
                               var show = document.getElementById("nhis");
                               var shows = document.getElementById("privateid");
                              
                               show.style.display="block";
                               shows.style.display="none";
                           
                       }
        
                       function hideIt(){
                               var show = document.getElementById("privateid");
                                var shows = document.getElementById("nhis");
                                //if(show.style.display == "block"){
                               show.style.display="none";
                           //}else{
                               
                             //  } if(show.style.display == "none"){ 
                                shows.style.display="none";
                       }    
      
        </script>

    </body>
</html>
