<!DOCTYPE html>
<html lang="en">
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
		</style>
		<link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="third-party/jQuery-UI-Date-Range-Picker/css/ui.daterangepicker.css" media="screen" rel="Stylesheet" type="text/css" />

		<!--Load the AJAX API-->
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
			// Load the Visualization API and the piechart package.
			google.load('visualization', '1.0', {
				'packages' : ['corechart']
			});

			// Set a callback to run when the Google Visualization API is loaded.
			google.setOnLoadCallback(drawChart);

			// Callback that creates and populates a data table,
			// instantiates the pie chart, passes in the data and
			// draws it.
			function drawChart() {

				var data = google.visualization.arrayToDataTable([['x', 'Emmanuel', 'Adwoa', 'Ama'], ['Jan', 1000, 1000, 500], ['Feb', 2000, 500, 4000], ['Mar', 4000, 5000, 2000], ['Apr', 8000, 500, 1000], ['May', 7000, 1000, 500], ['Jun', 7000, 500, 1000]]);
				// Set chart options
				var options = {
					'title' : 'Total Utilisation ',
					'width' : 400,
					'height' : 200,
					'is3D' : true,
					'colors' : ['#3FB3FF', '#379CDE', '#256A96', '#163F59', '#091B26'],
					vAxis : {
						title : "Value of Claims (GHS)"
					},
					hAxis : {
						title : "Month"
					},

				};

				var options1 = {
					'title' : 'Diagnosis ',
					'width' : 550,
					'height' : 250,
					'is3D' : true,
					'colors' : ['#3FB3FF', '#379CDE', '#256A96', '#163F59', '#091B26']

				};

				var options2 = {
					'title' : 'Patient Visit Types ',
					'width' : 400,
					'height' : 220,
					'is3D' : true,
					'colors' : ['#3FB3FF', '#379CDE', '#256A96', '#163F59', '#091B26'],
					vAxis : {
						title : "# of Visits"
					},
					hAxis : {
						title : "Month"
					},

				};

				var options3 = {
					'title' : 'Type of Service Rendered ',
					'width' : 550,
					'height' : 250,
					'is3D' : true,
					'colors' : ['#3FB3FF', '#379CDE', '#256A96', '#163F59', '#091B26']

				};

				// Instantiate and draw our chart, passing in some options.
				var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
				chart.draw(data, options);
				var chart1 = new google.visualization.PieChart(document.getElementById('chart_div1'));
				chart1.draw(data, options1);
				var chart2 = new google.visualization.LineChart(document.getElementById('chart_div2'));
				chart2.draw(data, options2);
				var chart3 = new google.visualization.PieChart(document.getElementById('chart_div3'));
				chart3.draw(data, options3);

			}
		</script>
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

						<!--		<li>
						<a href="#">Home <i class="icon-chevron-right"></i></a>
						</li>
						<li>
						<a href="#">Statistics & Reports <i class="icon-chevron-right"></i></a>
						</li>
						<li>
						<a href="#">Client Utilization </a>
						</li>
						--->

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
							<li class="item1">
								<a  href="#"><i class="icon-home"></i> Departments </a>

								<ul>
									<li class="subitem1">
										<a href="#">Wards</a>
									</li>
									<li class="subitem2">
										<a href="#">Pharmacy </a>
									</li>
									<li class="subitem3">
										<a href="#"> Laboratory </a>
									</li>
								</ul>
							</li>
							<li class="item2">
								<a href="#"><i class=" icon-tasks"></i> Patients</a>
								<ul>
									<li class="subitem1">
										<a href="#">Outpatients</a>
									</li>
									<li class="subitem2">
										<a href="#">Inpatients</a>
									</li>
									<li class="subitem3">
										<a href="#">Search Patients </a>
									</li>
								</ul>

							</li>
							<li class="item3">
								<a href="#"><i class="icon-user"></i> Sponsorship</a>
								<ul>
									<li class="subitem1">
										<a href="#">Institution</a>
									</li>
									<li class="subitem2">
										<a href="#">Private Insurance</a>

									</li>

									<li class="subitem2">
										<a href="#">Out of Pocket Patients</a>
									</li>
									<li class="subitem2">
										<a href="#">NHIS</a>
									</li>

								</ul>
							</li>
							<li class="item4">
							<a href="#"><i class="icon-lock"></i> Inventory</a>
								<ul>
									<li class="subitem1">
										<a href="#">Suppliers</a>
									</li>
									<li class="subitem2">
										<a href="#">Vendors</a>
									</li>
									<li class="subitem3">
										<a href="#">Purchases</a>
									</li>
								</ul>
							</li>
							<li class="item5">
								<a href="#"> <i class="icon-list-alt"></i> Payroll </a>
								<ul>
									<li class="subitem1">
										<a href="#">Staff</a>
									</li>
									<li class="subitem2">
										<a href="#">Taxes </a>
									</li>
									
								</ul>
							</li>

						</ul>
					</div>

					<div style="margin-top: 0px; "class="span12 offset3 content1 hide">
						<ul class="breadcrumb span9 pull-right" style="padding-bottom: 0px; line-height: 27px;">
							<li>
								<h4><a href="#">At-a-Glance Dashboard</a></h4>
							</li>
							<li style="padding-left: 10px;" class="pull-right">
								<input type="text" class="input-medium" placeholder="Select Date Range" value="4/23/99" id="rangeA" />

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

						<div style="height: 200px; overflow: hidden; margin-bottom: 20px; padding: 0px; width: 420px;" class="box span4  pull-left " id="myModal">
							<div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

								<img class="pull-left" src="img/glyphicons/png/glyphicons_043_group.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3> Patient Attendance</h3> </a>

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

						<div style="height: 200px; overflow: hidden; margin-bottom: 20px; width: 420px;" class="box span4  pull-left" id="myModal">
							<div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

								<img class="pull-left" src="img/glyphicons/png/glyphicons_227_usd.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3> Billing </h3> </a>

							</div>
							<div style="height: 240px; margin-top: 10px; padding: 20px; z-index: 1000; overflow: hidden;" class="box-body">

								<span style="width: 33%; text-align: center; float: left;"> <h1> 200,000 </h1>
									<br />
									<a> Cash Receipts </a></span>
								<span style="width: 33%; text-align: center; float: left;"> <h1> 10,000 </h1>
									<br />
									<a>Cash Payments </a> </span>
								<span style="width: 33%; text-align: center; float: left;"> <h1> 13,000 </h1>
									<br />
									<a>Claims Submitted </a> </span>

							</div>

						</div>

						<div style="height: 200px; overflow: hidden; width: 420px;" class="box span4 pull-left" id="myModal">
							<div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

								<img class="pull-left" src="img/glyphicons/png/glyphicons_003_user.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3>Staff on Duty</h3> </a>

							</div>
							<div style="height: 240px; margin-top: 10px; padding: 20px; z-index: 1000; overflow: hidden;" class="box-body">

								<span style="width: 33%; text-align: center; float: left;"> <h1> 5 </h1>
									<br />
									<a> Doctors </a></span>
								<span style="width: 33%; text-align: center; float: left;"> <h1> 23 </h1>
									<br />
									<a>Nurses </a> </span>
								<span style="width: 33%; text-align: center; float: left;"> <h1> 35 </h1>
									<br />
									<a>Other Staff </a> </span>

							</div>

						</div>

						<div style="height: 200px; overflow: hidden; width: 420px;" class="box span4 pull-left" id="myModal">
							<div class="modal-header" style="height: 12%; background-color: #F8F8F8;">

								<img class="pull-left" src="img/glyphicons/png/glyphicons_029_notes_2.png" /><a class="pull-left" style=" padding-left: 20px;"> <h3> Insurance & Claims</h3> </a>

							</div>
							<div style="height: 240px; margin-top: 10px; padding: 20px; z-index: 1000; overflow: hidden;" class="box-body">

								<span style="width: 33%; text-align: center; float: left;"> <h1> 2000 </h1>
									<br />
									<a> NHIS Patients </a></span>
								<span style="width: 33%; text-align: center; float: left;"> <h1> 1,000 </h1>
									<br />
									<a>Private Patients </a> </span>
								<span style="width: 33%; text-align: center; float: left;"> <h1> 1,700 </h1>
									<br />
									<a>Claims Processed </a> </span>

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

		<script type="text/javascript" src="js/tablecloth.js"></script>  -->
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

		</script>

	</body>
</html>
