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
		<script type="application/javascript" src="js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var chart;
				var chart1;
				var chart2;
				var chart3;
				$(document).ready(function() {
					chart = new Highcharts.Chart({
						chart : {
							renderTo : 'chart_div',
							plotBackgroundColor : null,
							plotBorderWidth : null,
							plotShadow : false,
							spacingBottom : 20,
							spacingTop : 10,
							spacingRight : 0,
							marginLeft : 70,
							marginTop : 0,
							

						},
						colors : ['#3FB3FF','#379CDE','#256A96','#163F59','#091B26'],
						title : {
							text : 'Most Reported Diagnosis'
						},
						tooltip : {
							formatter : function() {
								return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
							}
						},

						legend : {
							align : 'right',
							verticalAlign : 'top',
							x : -60,
							y : 45,
							layout : 'vertical',

						},
						plotOptions : {
							pie : {
								allowPointSelect : true,
								cursor : 'pointer',
								size : '90%',
								dataLabels : {
									enabled : false
								},
								showInLegend : true

							}
						},

						series : [{
							type : 'pie',
							name : 'Disease Frequency',
							data : [['Malaria', 45.0], ['Tuberculosis', 26.8], {
								name : 'Poli',
								y : 12.8,
								sliced : true,
								selected : true
							}, ['Gonorrhea', 8.5], ['Cholera', 6.2], ['Others', 0.7]]
						}]

					});

					chart1 = new Highcharts.Chart({
						chart : {
							renderTo : 'chart_div1',
							plotBackgroundColor : null,
							plotBorderWidth : null,
							plotShadow : false,
							spacingBottom : 20,
							spacingTop : 10,
							spacingRight : 0,
							marginLeft : 70,
							marginTop : 0,

						},
						title : {
							text : 'Most Prescribed Drugs'
						},
						tooltip : {
							formatter : function() {
								return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
							}
						},

						legend : {
							align : 'right',
							verticalAlign : 'top',
							x : -60,
							y : 45,
							layout : 'vertical',

						},
						plotOptions : {
							pie : {
								allowPointSelect : true,
								cursor : 'pointer',
								size : '90%',
								dataLabels : {
									enabled : false
								},
								showInLegend : true

							}
						},

						series : [{
							type : 'pie',
							name : 'Drug Precription Occurence',
							data : [['Paracetamol', 45.0], ['Pregnacare', 26.8], {
								name : 'Vitamin C',
								y : 12.8,
								sliced : true,
								selected : true
							}, ['Losenges', 8.5], ['Retroviral', 6.2], ['Others', 0.7]]
						}]

					});

					chart2 = new Highcharts.Chart({
						chart : {
							renderTo : 'chart_div2',
							type : 'column',
							height : 210
						},
						title : {
							text : 'Monthly Average Rainfall'
						},
						subtitle : {
							text : 'Source: WorldClimate.com'
						},
						xAxis : {
							categories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', '']
						},
						yAxis : {
							min : 0,
							title : {
								text : 'Rainfall (mm)'
							}
						},
						legend : {
							layout : 'vertical',
							backgroundColor : '#FFFFFF',
							align : 'left',
							verticalAlign : 'top',
							x : 310,
							y : 10,
							floating : true,
							shadow : true
						},
						tooltip : {
							formatter : function() {
								return '' + this.x + ': ' + this.y + ' mm';
							}
						},
						plotOptions : {
							column : {
								pointPadding : 0.2,
								borderWidth : 0
							}
						},
						series : [{
							name : 'Tokyo',
							data : [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

						}, {
							name : 'New York',
							data : [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

						}, {
							name : 'London',
							data : [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

						}, {
							name : 'Berlin',
							data : [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

						}]
					});

				});

			});
		</script>

		<script src="js/highcharts.js"></script>

		<style type="text/css" >
			body {
				overflow: hidden;
			}

			#chart_div {
				z-index: 100
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

						<li>
							<a href="#">Home <i class="icon-chevron-right"></i></a>
						</li>
						<li>
							<a href="#">Statistics & Reports <i class="icon-chevron-right"></i></a>
						</li>
						<li>
							<a href="#">Client Utilization </a>
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
							<li class="item1">
								<a  href="#"><i class="icon-home"></i> Dashboard </a>

							</li>
							<li class="item2">
								<a href="#"><i class=" icon-tasks"></i> Claims Management <span>147</span></a>
								<ul>
									<li class="subitem1">
										<a href="#">Inbox <span>14</span></a>
									</li>
									<li class="subitem2">
										<a href="#">Accepted Claims <span>6</span></a>
									</li>
									<li class="subitem3">
										<a href="#">Rejected Claims <span>2</span></a>
									</li>
								</ul>

							</li>
							<li class="item3">
								<a href="#"><i class="icon-user"></i> Staff Management </a>
								<ul>
									<li class="subitem1">
										<a href="#">View Staff <span>14</span></a>
									</li>
									<li class="subitem2">
										<a href="#">New Staff</a>
									</li>

								</ul>
							</li>
							<li class="item4">
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
							</li>
							<li class="item5">
								<a href="#"> <i class="icon-list-alt"></i> Statistics & Reports </a>
								<ul>
									<li class="subitem1">
										<a href="#">Client Utilization </a>
									</li>
									<li class="subitem2">
										<a href="#">Provider Utilization </a>
									</li>
									<li class="subitem3">
										<a href="#">Medical Analysis </a>
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
								<h4><a href="#"> Medical Analysis</a></h4>
							</li>
							<li style="padding-left: 10px;" class="pull-right">
								<input type="text" class="input-large" placeholder="Select Date Range" value="4/23/99" id="rangeA" />

							</li>
							<li style="padding-top: 5px;" class="active pull-right">
								Select Date Range
							</li>
							<!--	<li  class="active pull-right">
							<select class="input-xlarge" id="selectError">
							<option>Emmanuel Addo-Yirenkyi & Dependants</option>
							<option>Emmanuel Addo-Yirenkyi Only </option>
							<option>All Dependants Only </option>

							<option>Adwoa Mansah (Dependant 1)</option>
							<option>Kofi Manu (Dependant 2)</option>
							<option>Ama Brako (Dependant 3)</option>
							</select>
							</li>  -->

						</ul>

						<div style="height: 200px; overflow: hidden; margin-bottom: 20px; padding: 0px; width: 420px;" class="box span4 pull-left" id="myModal">

							<div id="chart_div" style="height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;" class="box-body">

							</div>

						</div>

						<div style="height: 200px; overflow: hidden; margin-bottom: 20px; width: 420px;" class="box span4  pull-left" id="myModal">

							<div id="chart_div1" style="height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;" class="box-body">

							</div>

						</div>

						<div style="height: 200px; overflow: hidden; width: 420px;" class="box span4 pull-left" id="myModal">

							<div id="chart_div2" style="height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;" class="box-body">
								<table class="table"></table>
							</div>

						</div>

						<div style="height: 200px; overflow: hidden; width: 420px;" class="box span4 pull-left" id="myModal">

							<div id="chart_div3" style="height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;" class="box-body">

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

	</body>
</html>
