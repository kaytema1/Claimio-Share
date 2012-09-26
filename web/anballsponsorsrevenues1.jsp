<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>ClaimSync Insurance Portal</title>
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
        </style>
        <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="third-party/jQuery-UI-Date-Range-Picker/css/ui.daterangepicker.css" media="screen" rel="Stylesheet" type="text/css" />

        <!--Load the AJAX API-->

        <style type="text/css" >
            body {
                overflow: hidden;
            }

            #chart_div {
                z-index: 100
            }
            .center {
                text-align: center;
            }

            .modal-header {
                background-color: #FBFBFB;
                background-image: -moz-linear-gradient(center top , #FFFFFF, #F5F5F5);
                background-repeat: repeat-x;
                border: 1px solid #DDDDDD;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 0 #FFFFFF inset;
            }
        </style>

    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <!-- Navbar
        ================================================== -->
        <div style="display: none;" class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
                    <a class="brand" href="#"><img src="images/logo.png" width="200px;" /></a>

                    <div style="margin-top: 10px;" class="nav-collapse">
                        <ul class="nav pull-right">

                            <li class="dropdown">
                                <a class="active" > Logged in as:  Mr. Amoo </a>

                            </li>
                            <li class="divider-vertical"></li>

                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> Account <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li>
                                        <a target="_blank" href="bootstrap.min.css"><i class="icon-wrench"></i> Settings </a>
                                    </li>

                                    <li>
                                        <a target="_blank" href="bootstrap.css"><i class="icon-question-sign"></i> Help </a>
                                    </li>
                                    <li class="divider"></li>

                                    <li>
                                        <a target="_blank" href="variables.less"><i class="icon-off"></i> Log Out</a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li class="active">
                            <a href="#">At-a-Glance Dashboard <i class="icon-chevron-right"></i></a>
                        </li>

                    </ul>
                </div>

            </header>

            <div style="position: absolute; left: 30%; top: 200px; text-align: center;" class="progress1">
                <img src="images/logoonly.png" width="136px;" style="margin-bottom: 20px;" />
                <a href="#"> <h3 class="segoe" style="text-align: center; font-weight: lighter;"> Your page is taken longer than expected to load.....
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

                    <div style="height: 100%; position: fixed;" class="span3">
                        <ul style="display: none; " class="menu">

                            <!--		<li class="item1">
                            <a  href="#"><i class="icon-home"></i> Dashboard </a>

                            </li>   -->
                            <li class="item2">
                                <a href="#"><i class=" icon-tasks"></i> Claims Management <span>147</span></a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="batchinbox.html">Inbox <span>14</span></a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="batchinbox.html">Accepted Claims <span>6</span></a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="batchinbox.html">Rejected Claims <span>2</span></a>
                                    </li>
                                </ul>

                            </li>
                            <li class="item3">
                                <a href="#"><i class="icon-user"></i> Staff Management </a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="viewstaff.html">View Staff <span>14</span></a>
                                    </li>
                                    <li id="new_staff_link" class="subitem2">
                                        <a  href="#">New Staff</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="item4">
                                <a href="#"><i class="icon-search"></i> Member Search </a>
                                <ul>
                                    <li class="subitem1">
                                        <a id="member_search" href="#">Search</a>
                                    </li>

                                </ul>
                            </li>
                            <!--		<li class="item4">
                            <a href="#"><i class="icon-lock"></i> Membership Authentication </a>
                            <ul>
                            <li class="subitem1">
                            <a href="#">Membership Status <span>14</span></a>
                            </li>
                            <li class="subitem2">
                            <a href="#">Benefit Status <span>6</span></a>
                            </li>
                            <li class="subitem3">
                            <a href="#">Membership Archive <span>2</span></a>
                            </li>
                            </ul>
                            </li>  -->
                            <li class="item5">
                                <a href="#"> <i class="icon-list-alt"></i> Statistics & Reports </a>
                                <ul>
                                    <li class="subitem1">
                                        <a href="clientutilization.html">Client Utilization </a>
                                    </li>
                                    <li class="subitem2">
                                        <a href="providerutilization.html">Provider Utilization </a>
                                    </li>
                                    <li class="subitem3">
                                        <a href="">Medical Analysis </a>
                                    </li>
                                    <li class="subitem4">
                                        <a href="#">Cash Claims</a>
                                    </li>
                                    <li class="subitem5">
                                        <a href="#">Medical Claims</a>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">
                        <ul class="breadcrumb span9 pull-right" style="padding-bottom: 0px; line-height: 27px;">
                            <li>
                                <h4><a href="#">At-a-Glance Dashboard</a><i class="icon-chevron-right"></i></a><span class="divider"></span></h4>
                            </li>
                            <li style="padding-left: 10px;" class="pull-right">
                                <button type="button" class="btn btn-info">
                                    <i class="icon icon-white icon-refresh"></i> Load
                                </button>

                            </li>
                            <li style="padding-left: 10px;" class="pull-right">
                                <input type="text" class="input-medium" placeholder="Select Date Range"  id="rangeA" />

                            </li>

                            <li  class="active pull-right" style="padding-top: 5px;">
                                <!--	<select class="input-large" id="selectError">
                                <option>Emmanuel Addo-Yirenkyi & Dependants</option>
                                <option>Emmanuel Addo-Yirenkyi Only </option>
                                <option>All Dependants Only </option>

                                <option>Adwoa Mansah (Dependant 1)</option>
                                <option>Kofi Manu (Dependant 2)</option>
                                <option>Ama Brako (Dependant 3)</option>
                                </select>  -->
                                <h4> Select Date Range </h4>
                            </li>

                        </ul>
                        <div style="height: 200px; overflow: hidden; width: 420px;" class="box span4 pull-left" id="myModal">
                            <div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

                                <img class="pull-left" src="img/glyphicons/png/glyphicons_029_notes_2.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3>Facilities by Claim Count </h3> </a>

                            </div>
                            <div style="height: 240px; margin-top: 10px; padding: 20px; z-index: 1000; overflow: hidden;" class="box-body">

                                <span style="width: 33%; text-align: center; float: left;"> <h1> 2000 </h1>
                                    <br />
                                    <a> Nyaho Med. Center </a></span>
                                <span style="width: 33%; text-align: center; float: left;"> <h1> 1,900 </h1>
                                    <br />
                                    <a>Dampong Medical </a> </span>
                                <span style="width: 33%; text-align: center; float: left;"> <h1> 1,700 </h1>
                                    <br />
                                    <a>Afrikids Med Center </a> </span>

                            </div>

                        </div>
                        <div style="height: 200px; overflow: hidden; margin-bottom: 20px; padding: 0px; width: 420px;" class="box span4  pull-left " id="myModal">
                            <div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

                                <img class="pull-left" src="img/glyphicons/png/glyphicons_043_group.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3>Client Attendance</h3> </a>

                            </div>
                            <div style="height: 240px; margin-top: 10px; padding: 20px; z-index: 1000; overflow: hidden;" class="box-body">

                                <span style="width: 33%; text-align: center; float: left;"> <h1> 1,700 </h1>
                                    <br />
                                    <a> Total Visits </a></span>
                                <span style="width: 33%; text-align: center; float: left;"> <h1> 1,000 </h1>
                                    <br />
                                    <a>Outpatient Visits </a> </span>
                                <span style="width: 34%; text-align: center; float: left;"> <h1> 700 </h1>
                                    <br />
                                    <a>Inpatient Admissions </a> </span>

                            </div>

                        </div>

                        <div style="height: 200px; overflow: hidden; width: 420px;" class="box span4 pull-left" id="myModal">
                            <div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

                                <img class="pull-left" src="img/glyphicons/png/glyphicons_003_user.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3>Staff by Role</h3> </a>

                            </div>
                            <div style="height: 240px; margin-top: 10px; padding: 20px; z-index: 1000; overflow: hidden;" class="box-body">

                                <span style="width: 33%; text-align: center; float: left;"> <h1> 5 </h1>
                                    <br />
                                    <a>Admins</a></span>
                                <span style="width: 33%; text-align: center; float: left;"> <h1> 23 </h1>
                                    <br />
                                    <a>Medical Vetters </a> </span>
                                <span style="width: 33%; text-align: center; float: left;"> <h1> 35 </h1>
                                    <br />
                                    <a>Admin. Vetters </a> </span>

                            </div>

                        </div>

                        <div style="height: 200px; overflow: hidden; margin-bottom: 20px; width: 420px;" class="box span4  pull-left" id="myModal">
                            <div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

                                <img class="pull-left" src="img/glyphicons/png/glyphicons_042_pie_chart.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3>Claims Processed by Type </h3> </a>

                            </div>
                            <div style="height: 240px; margin-top: 10px; padding: 20px; z-index: 1000; overflow: hidden;" class="box-body">

                                <span style="width: 33%; text-align: center; float: left;"> <h1> 200 </h1>
                                    <br />
                                    <a> New </a></span>
                                <span style="width: 33%; text-align: center; float: left;"> <h1> 10,000 </h1>
                                    <br />
                                    <a> Processed </a> </span>
                                <span style="width: 33%; text-align: center; float: left;"> <h1> 3,000 </h1>
                                    <br />
                                    <a> Rejected </a> </span>

                            </div>

                        </div>

                    </div>
                    <div class="clearfix"></div>

                </div>

            </section>

            <footer style="display: none;" class="footer">
                <p style="text-align: center" class="pull-right">
                    <img src="images/logo.png" width="100px;" />
                </p>
            </footer>

        </div><!-- /container -->

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

        <!--	<script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>

        <script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
        <script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>

        <script type="text/javascript" src="js/tablecloth.js"></script>
        <script type="text/javascript" src="js/demo.js"></script> -->
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function() {

                $('#rangeA').daterangepicker();
                var fname;
                var lname;
                var mname;
                $("#new_staff_link").click(function() {

                    $("#new_staff").dialog({
                        width : "500",
                        show : 'slide',
                        modal : 'true',
                        position : 'top',
                        title : "New Staff"
                    }).open();

                });
                $(document).live('focusin', function() {
                    fname = $("#fname").attr("value");
                    $("#fname_span").text(fname);
                    mname = $("#mname").attr("value");
                    $("#mname_span").text(mname);
                    lname = $("#lname").attr("value");
                    $("#lame_span").text(lname);
                })
                $("#fname").live('focusout', function() {

                    fname = $("#fname").attr("value");

                    $("#fname_span").text(fname);

                });

                $("#mname").live('focusout', function() {

                    fname = $("#mname").attr("value");

                    $("#mname_span").text(fname);

                });
                $("#lname").live('focusout', function() {

                    fname = $("#lname").attr("value");

                    $("#lname_span").text(fname);

                });

                $(".close_newstaff").click(function() {

                    $("#new_staff").dialog('close')

                });
                $("#assign_permissions").click(function() {
                    $("#fullname").slideDown("slow");
                    $("#staff_info").slideUp("slow");
                    $("#permissions_info").slideDown("slow")
                    $("#new_staff").dialog({

                        title : fname + " " + lname + "'s Permissions"
                    })
                    $(".staffidnname").addClass("success")

                });

                $("#back_from_permissions").click(function() {
                    $("#fullname").slideUp("slow");
                    $("#staff_info").slideDown("slow");
                    $("#permissions_info").slideUp("slow")
                    $("#new_staff").attr("title", "New Staff");
                    $("#new_staff").dialog({
                        title : "New Staff"
                    })
                    $(".staffidnname").removeClass("success")

                });

                $("#member_search").click(function() {
                    $("#member_search_dialog").dialog({
                        width : '500',
                        show : 'slide',
                        modal : 'true',
                        position : 'top',
                        title : "Member Search"
                    })
                })
                var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

                menu_ul.hide();

                $(".menu").fadeIn();
                $(".content1").fadeIn();
                $(".navbar").fadeIn();
                $(".footer").fadeIn();
                $(".subnav").fadeIn();
                $(".progress1").hide();

                menu_a.click(function(e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true, true).slideUp('normal');
                    }
                });

            });

        </script>
        <div  id="new_staff" class="hide">
            <form class="form-horizontal">
                <div class="control-group staffidnname">
                    <label class="control-label" for="staffid">Staff ID</label>
                    <div class="controls">
                        <input type="text" name="staffid"  placeholder="Staff ID">
                    </div>
                </div>

                <div id="fullname" class="control-group hide staffidnname">
                    <label class="control-label" >Name</label>
                    <div class="controls 	" style="padding-top: 5px; color: #2BA949;">
                        <span id="fname_span" style="padding-right: 10px; "> </span><span id="mname_span" style="padding-right: 10px; "> </span><span id="lname_span" style="padding-right: 10px; "> </span>
                    </div>
                </div>
                <div id="staff_info">
                    <div class="control-group">
                        <label class="control-label" for="lname">Last Name</label>
                        <div class="controls">
                            <input type="text" name="lname"  id="lname"  placeholder="Last Name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"  for="fname">First Name</label>
                        <div class="controls">
                            <input type="text" name="fname"  id="fname" placeholder="First Name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"   for="mname">Other Names</label>
                        <div class="controls">
                            <input type="text" name="mname" id="mname" placeholder="Other Names">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="mname">Email</label>
                        <div class="controls">
                            <input type="text" name="email"  placeholder="Email">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="dob">Date of Birth</label>
                        <div class="controls">
                            <input type="text" name="dob"  placeholder="Date of Birth">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="dob">Phone Number</label>
                        <div class="controls">
                            <input type="text" name="contact"  placeholder="Phone Number">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="address">Address</label>
                        <div class="controls">
                            <textarea  name="address"> </textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">Role</label>
                        <div class="controls">
                            <select name="role" placeholder="Role">
                                <option></option>
                                <option>Front Desk</option>
                                <option>Date Entry</option>
                                <option>Front Desk</option>
                                <option>Medical Advisor</option>
                                <option>Accountant</option>
                                <option>Admin</option>

                            </select>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="button" id="assign_permissions" class="btn btn-info">
                            Assign Permissions <i class="icon icon-white icon-arrow-right"> </i>
                        </button>
                        <button class="close_newstaff" type="button" class="btn">
                            Cancel
                        </button>
                    </div>
                </div>
                <div id="permissions_info" class="hide" style="margin-top: -10px;">
                    <div class="clearfix"></div>

                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            Enable Claim Vetting
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            Accepting/Rejection of Claim
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            Statistics Viewing
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            Manage Staff Account
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            View Incoming Claims
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            View Pending Claims
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            View Processed Claims
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            View Archived Claims
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">
                            <input type="checkbox">
                        </label>
                        <div class="controls" style="padding-top: 9px;">
                            Manage Service Providers
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="button" id="back_from_permissions" class="btn btn-primary">
                            Back <i class="icon icon-white icon-arrow-left"> </i>
                        </button>
                        <button type="submit" class="btn btn-info">
                            Save <i class="icon icon-white icon-check"> </i>
                        </button>
                        <button  type="button" class="close_newstaff" type="button" class="btn">
                            Cancel
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div id="member_search_dialog" class="hide">

            <form class=" center">
                Search by  
                <br />
                <select class="input-medium">
                    <option> Membership ID</option>
                    <option> Name</option>
                </select>
                <br />
                <input type="text" class="input-xlarge"> <br />
                <br/>
                <button class="btn btn-inverse" type="button">
                    <i class="icon icon-white icon-search"></i> Search
                </button>


            </form>

        </div>

    </body>
</html>
