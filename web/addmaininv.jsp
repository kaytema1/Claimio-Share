

<%@page import="java.util.Calendar"%>
<%@page import="helper.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%
    HMSHelper mgr = new HMSHelper();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    Date date = new Date();

%>
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
        </style>

        <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />


    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <!-- Navbar
        ================================================== -->
        <div style="display: none;" class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
                    <a class="brand" href="../"><img src="images/logo.png" width="200px;" /></a>

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
                                    <li>
                                        <a target="_blank" href="bootstrap.css"><i class="icon-share"></i> Feedback </a>
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

                        <li>
                            <a href="#">Inventory</a><span class="divider"></span>
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

                <div class="alert alert-danger">
                    <%=session.getAttribute("lasterror")%> 
                </div>
                <%
                        session.removeAttribute("lasterror");
                    }%>



                <div class="row">


                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <form enctype="multipart/data"action="action/labsavingaction.jsp" method="POST" class="form-horizontal well">
                            <fieldset>
                                <div style="float: left;" class="pre_first_half">
                                    <div class="control-group">
                                        <label class="control-label" for="input01">Code</label>
                                        <div class="controls">
                                            <input type="text" name="code" id="input01" value=""/>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <label class="control-label" for="input01">Name</label>
                                        <div class="controls">
                                            <input  type="text" name="name"  id="input01"/>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="input01">Rate</label>
                                        <div class="controls">
                                            <input type="text" name="rate"  id="input01"/>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01">Low Bound</label>
                                        <div class="controls">
                                            <input type="text" name="lowbound"  id="input01"/>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01">High Bound</label>
                                        <div class="controls">
                                            <input type="text" name="highbound"  id="input01"/>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="selectError">Lab Type</label>
                                        <div class="controls">
                                            <select id="payment" name="type" onchange='OnChange(this.value);'>
                                                <option >Select</option>
                                                <!--     <option id="nhis" value="nhis" onclick="showInsurance()">National Health Insurance</option>
                                                   <option id="cash" value="cash" onclick="hideIt()">Out of Pocket </option>
                                                   <option id="private"value="private" onclick="showMembershipbox()">Private Health Insurance</option>
                                                   <option id="corporate" value="cooperate" onclick="showCorporate()">Corporate</option>  -->

                                                <%

                                                    List labTypes3 = mgr.listLabTypes();
                                                    for (int i = 0; i < labTypes3.size(); i++) {
                                                        Labtypes lType = (Labtypes) labTypes3.get(i);
                                                %>
                                                <option value="<%=lType.getLabTypeId()%>"><%=lType.getLabType()%></option>
                                                <% }

                                                %>

                                            </select>

                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="input01">Type of Test</label>
                                        <div class="controls">
                                            <select id="typeoftest" name="typeoftest" id="select01">
                                                <option id="maintest" value="0">Select</option>
                                                <option id="maintest" value="1">Main Test</option>
                                                <option id="subtest" value="2">Sub Test</option>
                                            </select>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>
                                    <div id="groupunder" class="control-group hide">
                                        <label class="control-label" for="input01">Main Test</label>
                                        <div class="controls">

                                            <select id="combo" name="combo">
                                            </select>

                                            <p class="help-inline">

                                            </p>
                                        </div>
                                        <input type="hidden" id="hiddenGroupUnderId" name="hiddenGroupUnderId" value="" />
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="input01">Units</label>
                                        <div class="controls">
                                            <input type="text" name="units"  id="input01"/>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>
                                                
                                                



                                </div>
                                <div  style="float: left;" class="second">            

                                    <div class="control-group">
                                        <label class="control-label" for="inputSuccess">Interpretation</label>
                                        <div class="controls">
                                            <textarea type="text" name="interpretation" id="inputSuccess"></textarea>
                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="city">Default Value</label>
                                        <div class="controls">
                                            <input type="text" name="defaultvalue" id="inputSuccess"/>
                                            <span class="help-inline"></span>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputSuccess">Range From</label>
                                        <div class="controls">
                                            <input type="text" name="rangefrom" id="inputSuccess"/>
                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputSuccess">Range Up To</label>
                                        <div class="controls">
                                            <input type="text" name="rangeupto" id="inputSuccess"/>
                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                 <!--   <div class="control-group">
                                        <label class="control-label" for="inputSuccess">Comments</label>
                                        <div class="controls">
                                            <input type="text" name="comments" id="inputSuccess"/>
                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                 -->
                                    <div class="control-group">
                                        <label class="control-label" for="inputSuccess">Report Coll ( Days )</label>
                                        <div class="controls">
                                            <input type="text" name="reportcolldays" id="inputSuccess"/>
                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputSuccess">Report Coll ( Time )</label>
                                        <div class="controls">
                                            <input type="text" name="reportcolltime" id="inputSuccess"/>
                                            <span class="help-inline"></span>
                                        </div>
                                    </div>
                                    <!--            <div class="control-group">
                                                    <label class="control-label" for="inputSuccess">Employer</label>
                                                    <div class="controls">
                                                        <input type="text" name="employer" id="inputSuccess"/>
                                                        <span class="help-inline"></span>
                                                    </div>
                                                </div>
                                    <!-- <div class="control-group">
                                         <label class="control-label" for="inputSuccess">Upload Image</label>
                                         <div class="controls">
                                             <input type="file" name="imglocation" id="inputSuccess"/>
                                             <span class="help-inline"></span>
                                         </div>
                                     </div>-->




                                    <div class="control-group">
                                        <label class="control-label" for="input01">Results Options</label>
                                        <div class="controls">
                                            <select id="resultsoptions"  name="resultsoptions" id="select01">
                                                <option value="Yes">Yes</option>
                                                <option value="No">No</option>
                                            </select>
                                            <p class="help-inline">

                                            </p>
                                        </div>
                                    </div>

                                    <div id="add" class="control-group">
                                        <div class="controls">
                                            <input name="option1" type="text" />
                                            <input type="hidden" id="hiddencount" name="hiddencount" value="1" />
                                            <p class="help-inline">
                                                <input id="resultoptionadd"  class="btn btn-info" type="button" value="Add" />

                                            </p> <br/> <br/>    
                                        </div>
                                    </div>

                                    <div id="clonehub" class="control-group hide clonehub">
                                        <br/>
                                        <div class="controls">
                                            <input count="1" id="option1" type="text" >
                                            <p class="help-inline">


                                            </p>
                                        </div>
                                    </div>


                                </div>
                            </fieldset>
                            <div style="text-align: center;">
                                <button id="submitbutton" type="submit" name ="action" value="patient" class="btn btn-danger btn-large">
                                    <i class="icon-ok icon-white"></i> Save Investigation
                                </button>

                            </div>

                        </form>
                    </div>

                </div>
                <div class="clearfix"></div>
            </section>

            <footer style="display: none; margin-top: 50px;" class="footer">
                <p style="text-align: center" class="pull-right">
                    <img src="images/logo.png" width="100px;" />
                </p>
            </footer>




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
        var x=document.forms["edit"]["uname"].value;
        if (x==null || x=="")
        {
            // alert("Item must be filled out");
            return false;
        }
        
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
            i < 4;
            i++) {
        Labtypes vst = new Labtypes();
%>


<script type="text/javascript">
   
                      
    $("#<%= vst.getLabTypeId()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= vst.getLabTypeId()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getLabTypeId()%>_link").click(function(){
      
        $("#<%=vst.getLabTypeId()%>_dialog").dialog('open');
    
    })
  
    
    $("#<%= vst.getLabTypeId()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=vst.getLabTypeId()%>_adddrug_dialog").dialog('open');
        
    })
   
    
</script>

<% }%>

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
        
    $("#payment").change(function() {
          
        var payment =  $('#payment option:selected').attr('id');
            
        if(payment=='nhis'){
            $("#companydiv").slideUp();
            $("#privatediv").slideUp();
            $("#nhisdiv").slideDown();
                
        }else if(payment=='cash'){
            $("#companydiv").slideUp();
            $("#privatediv").slideUp();
            $("#nhisdiv").slideUp();
                
        }else if(payment=='private'){
            $("#companydiv").slideUp();
            $("#privatediv").slideDown();
            $("#nhisdiv").slideUp();
            
        }else if(payment=='corporate'){
            $("#companydiv").slideDown();
            $("#privatediv").slideUp();
            $("#nhisdiv").slideUp();
        }
        else{
            //  alert("Please Select Payment Method");
        }
    });
        
        
    $("#typeoftest").change(function() {
             
            
        var typeoftest =  $('#typeoftest option:selected').attr('id');
            
        if(typeoftest=='subtest'){
            $("#groupunder").slideDown();
                
                
        }else {
            $("#groupunder").slideUp();
                
                
        }
            
            
    });
        
        
    $("#resultsoptions").change(function() {
             
           
            
        var resultsoptions =  $('#resultsoptions option:selected').attr('value');
          
          
        
        if(resultsoptions=='Yes'){
            $("#add").slideDown();
                
                
        }else {
            $("#add").slideUp();
                
                
        }
            
            
    });
    
    
    var click_count = 1;
        
    $("#resultoptionadd").click(function() {
       
        click_count = click_count + 1;
        
        //alert($("#hiddencount").val());
        var clone = $(".clonehub").clone().attr("class","clone");
                   clone.find("#option1").attr("id","option"+click_count).attr("name","option"+click_count).attr("value","").attr("count",click_count);
                   clone.insertBefore("#clonehub");
        $("#hiddencount").attr("value",click_count);
        
           
    })
               
               
               
           
   
            
            
            
            
            
    function showMembershipbox(){
                       var show = document.getElementById("privateid");
                       var shows = document.getElementById("nhis");
                      
                       show.style.display="block";
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
    
    
    
    var xhr;
    var myArray = new Array();
    var patientDetails = new Array();
    function OnChange(dropdown){
       
        //    alert('kjkj ' + dropdown);
    
        if(dropdown == "Select") {
            //     alert('select ' + dropdown);
            document.getElementById("submitbutton").disabled = true;
        } else {
            document.getElementById("submitbutton").disabled = false;
            xhr = new XMLHttpRequest();
            xhr.onreadystatechange=processZipData;
            xhr.open("GET","getPatientDetails.jsp?patientmembershipnumber=" + dropdown);
            xhr.send(null);
        }
    }
    
    function processZipData() {
        if (xhr.readyState == 4) {
                    
            document.getElementById('combo').options.length = 0;
            var combo = document.getElementById("combo");
            var option = document.createElement("option");
            option.text = "Select";
            option.value = "Select";
            try {
                combo.add(option, null); //Standard 
            }catch(error) {
                combo.add(option); // IE only
            }
                    
                    
                    
            var data = xhr.responseText;
       //        alert("once again" + data);
            if(data.indexOf("djaldjfakfalkdjfalkdjflajkdfalkflka") != -1){
                  
                alert('No Main Tests Found Under Selected Lab Type');
                //      document.getElementById("submitbutton").disabled = true;
                  
            } else {
                      var incomingData = data.indexOf('$');
                      
                    //  alert("incoming" + incomingData);
                      var startPoint = incomingData + 1;
                      var starterData = data.substring(startPoint);
                    //  alert("starter" + starterData);
                var detailedInv = starterData.split('^');
            
                var lengthReturned = detailedInv.length;
                //          alert("length" + lengthReturned);
            
                //    if(lengthReturned > 0){
                for (k=0; k<lengthReturned; k++)
                {
                    var dInv = detailedInv[k].split('))');
                        
                    var option = document.createElement("option");
                    option.text = dInv[1];
                    option.value = dInv[0];
                    try {
                  //      alert(dInv[0]);
                        combo.add(option, null); //Standard 
                    }catch(error) {
                        combo.add(option); // IE only
                    }
                }
                //          document.getElementById("submitbutton").disabled = false;
            }
        }
    }
      
</script>
<script type="text/javascript">
    function submitform(){
                
        var t =  validateForm();
        if(t){
            var name = document.getElementById("name").value;
            $.post('action/labtypeaction.jsp', { action : "units", name : name}, function(data) {
                alert(data);
                $('#results').html(data).hide().slideDown('slow');
            } );
        }else{
            alert("You must enter lab type name");
        }
        // var roledescription = document.getElementById("roledescription").value;
              
                 
                
    }
            
    function updateUnit(name,id){
             
        var uname = document.getElementById(name).value;
        var uid = document.getElementById(id).value;
               
        $.post('action/labtypeaction.jsp', { action : "edit", uname : uname, uid : uid}, function(data) {
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
            $.post('action/labtypeaction.jsp', { action : "delete", id : id}, function(data) {
                alert(data);
                $('#results').html(data).hide().slideDown('slow');
            } );
        }
        else 
        {
            alert("Delete Was Cancled!");
            //return;
        }
                 
                
    }
            
          
            
              
           
</script>



</body>
</html>