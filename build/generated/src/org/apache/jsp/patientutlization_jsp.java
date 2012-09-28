package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class patientutlization_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"utf-8\">\n");
      out.write("\t\t<title>ClaimSync Extended</title>\n");
      out.write("\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\t\t<meta name=\"description\" content=\"\">\n");
      out.write("\t\t<meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("\t\t<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->\n");
      out.write("\t\t<!--[if lt IE 9]>\n");
      out.write("\t\t<script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script>\n");
      out.write("\t\t<![endif]-->\n");
      out.write("\n");
      out.write("\t\t<!-- Le styles -->\n");
      out.write("\t\t<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\t\t<link href=\"css/bootstrap-responsive.css\" rel=\"stylesheet\">\n");
      out.write("\t\t<link type=\"text/css\" href=\"css/custom-theme/jquery-ui-1.8.16.custom.css\" rel=\"stylesheet\" />\n");
      out.write("\t\t<link href=\"css/docs.css\" rel=\"stylesheet\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/styles.css\">\n");
      out.write("\t\t<style type=\"text/css\" title=\"currentStyle\">\n");
      out.write("\t\t\t@import \"css/jquery.dataTables_themeroller.css\";\n");
      out.write("\t\t\t@import \"css/custom-theme/jquery-ui-1.8.16.custom.css\";\n");
      out.write("\t\t</style>\n");
      out.write("\t\t<link href=\"css/tablecloth.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("\t\t<link href=\"third-party/jQuery-UI-Date-Range-Picker/css/ui.daterangepicker.css\" media=\"screen\" rel=\"Stylesheet\" type=\"text/css\" />\n");
      out.write("\t\t<script type=\"application/javascript\" src=\"js/jquery-1.6.2.min.js\"></script>\n");
      out.write("\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t$(function() {\n");
      out.write("\t\t\t\tvar chart;\n");
      out.write("\t\t\t\tvar chart1;\n");
      out.write("\t\t\t\tvar chart2;\n");
      out.write("\t\t\t\tvar chart3;\n");
      out.write("\t\t\t\t$(document).ready(function() {\n");
      out.write("\t\t\t\t\tchart = new Highcharts.Chart({\n");
      out.write("\t\t\t\t\t\tchart : {\n");
      out.write("\t\t\t\t\t\t\trenderTo : 'chart_div',\n");
      out.write("\t\t\t\t\t\t\ttype : 'line',\n");
      out.write("\t\t\t\t\t\t\tmarginRight : 5,\n");
      out.write("\t\t\t\t\t\t\theight: 210\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\ttext : 'Total Patient Attendance',\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\txAxis : {\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\tcategories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\tlabels : {\n");
      out.write("\t\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\t\treturn this.value;\n");
      out.write("\t\t\t\t\t\t\t\t\t// clean, unformatted number for year\n");
      out.write("\t\t\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t\t\tstartOnTick : true\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\tyAxis : {\n");
      out.write("\t\t\t\t\t\t\tmin: 0,\n");
      out.write("\t\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\t\ttext : 'Number of Patients'\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\ttooltip : {\n");
      out.write("\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\treturn Highcharts.numberFormat(this.y, 0) + ' Patients in ' + this.x;\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\tseries : [{\n");
      out.write("\t\t\t\t\t\t\tname : 'All Patients',\n");
      out.write("\t\t\t\t\t\t\tdata : [20, 50, 100, 240, 300, 400, 702]\n");
      out.write("\t\t\t\t\t\t}, {\n");
      out.write("\t\t\t\t\t\t\tname : 'Inpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [15, 20, 30, 100, 200, 100, 426]\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t {\n");
      out.write("\t\t\t\t\t\t\tname : 'Outpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [5, 30, 70, 140, 100, 300, 426]\n");
      out.write("\t\t\t\t\t\t}]\n");
      out.write("\t\t\t\t\t});\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tchart1 = new Highcharts.Chart({\n");
      out.write("\t\t\t\t\t\tchart : {\n");
      out.write("\t\t\t\t\t\t\trenderTo : 'chart_div1',\n");
      out.write("\t\t\t\t\t\t\ttype : 'line',\n");
      out.write("\t\t\t\t\t\t\tmarginRight : 5,\n");
      out.write("\t\t\t\t\t\t\theight: 210\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\ttext : 'Total NHIS/ Private Patients',\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\txAxis : {\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\tcategories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\tlabels : {\n");
      out.write("\t\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\t\treturn this.value;\n");
      out.write("\t\t\t\t\t\t\t\t\t// clean, unformatted number for year\n");
      out.write("\t\t\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t\t\tstartOnTick : true\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\tyAxis : {\n");
      out.write("\t\t\t\t\t\t\tmin: 0,\n");
      out.write("\t\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\t\ttext : 'Number of Patients'\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\ttooltip : {\n");
      out.write("\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\treturn Highcharts.numberFormat(this.y, 0) + ' Patients in ' + this.x;\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\tseries : [{\n");
      out.write("\t\t\t\t\t\t\tname : 'All Patients',\n");
      out.write("\t\t\t\t\t\t\tdata : [20, 50, 100, 240, 300, 400, 702]\n");
      out.write("\t\t\t\t\t\t}, {\n");
      out.write("\t\t\t\t\t\t\tname : 'Inpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [15, 20, 30, 100, 200, 100, 426]\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t {\n");
      out.write("\t\t\t\t\t\t\tname : 'Outpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [5, 30, 70, 140, 100, 300, 426]\n");
      out.write("\t\t\t\t\t\t}]\n");
      out.write("\t\t\t\t\t});\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tchart2 = new Highcharts.Chart({\n");
      out.write("\t\t\t\t\t\tchart : {\n");
      out.write("\t\t\t\t\t\t\trenderTo : 'chart_div2',\n");
      out.write("\t\t\t\t\t\t\ttype : 'line',\n");
      out.write("\t\t\t\t\t\t\tmarginRight : 5,\n");
      out.write("\t\t\t\t\t\t\theight: 210\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\ttext : 'Total Outpatient Vitals',\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\txAxis : {\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\tcategories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\tlabels : {\n");
      out.write("\t\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\t\treturn this.value;\n");
      out.write("\t\t\t\t\t\t\t\t\t// clean, unformatted number for year\n");
      out.write("\t\t\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t\t\tstartOnTick : true\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\tyAxis : {\n");
      out.write("\t\t\t\t\t\t\tmin: 0,\n");
      out.write("\t\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\t\ttext : 'Number of Patients'\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\ttooltip : {\n");
      out.write("\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\treturn Highcharts.numberFormat(this.y, 0) + ' Patients in ' + this.x;\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\tseries : [{\n");
      out.write("\t\t\t\t\t\t\tname : 'All Patients',\n");
      out.write("\t\t\t\t\t\t\tdata : [20, 50, 100, 240, 300, 400, 702]\n");
      out.write("\t\t\t\t\t\t}, {\n");
      out.write("\t\t\t\t\t\t\tname : 'Inpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [15, 20, 30, 100, 200, 100, 426]\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t {\n");
      out.write("\t\t\t\t\t\t\tname : 'Outpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [5, 30, 70, 140, 100, 300, 426]\n");
      out.write("\t\t\t\t\t\t}]\n");
      out.write("\t\t\t\t\t});\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tchart3 = new Highcharts.Chart({\n");
      out.write("\t\t\t\t\t\tchart : {\n");
      out.write("\t\t\t\t\t\t\trenderTo : 'chart_div3',\n");
      out.write("\t\t\t\t\t\t\ttype : 'line',\n");
      out.write("\t\t\t\t\t\t\tmarginRight : 5,\n");
      out.write("\t\t\t\t\t\t\theight: 210\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\ttext : 'Total Inpatient Admissions',\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\txAxis : {\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\tcategories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\tlabels : {\n");
      out.write("\t\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\t\treturn this.value;\n");
      out.write("\t\t\t\t\t\t\t\t\t// clean, unformatted number for year\n");
      out.write("\t\t\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t\t\tstartOnTick : true\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\tyAxis : {\n");
      out.write("\t\t\t\t\t\t\tmin: 0,\n");
      out.write("\t\t\t\t\t\t\ttitle : {\n");
      out.write("\t\t\t\t\t\t\t\ttext : 'Number of Patients'\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\ttooltip : {\n");
      out.write("\t\t\t\t\t\t\tformatter : function() {\n");
      out.write("\t\t\t\t\t\t\t\treturn Highcharts.numberFormat(this.y, 0) + ' Patients in ' + this.x;\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\n");
      out.write("\t\t\t\t\t\tseries : [{\n");
      out.write("\t\t\t\t\t\t\tname : 'All Patients',\n");
      out.write("\t\t\t\t\t\t\tdata : [20, 50, 100, 240, 300, 400, 702]\n");
      out.write("\t\t\t\t\t\t}, {\n");
      out.write("\t\t\t\t\t\t\tname : 'Inpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [15, 20, 30, 100, 200, 100, 426]\n");
      out.write("\t\t\t\t\t\t},\n");
      out.write("\t\t\t\t\t\t {\n");
      out.write("\t\t\t\t\t\t\tname : 'Outpatients',\n");
      out.write("\t\t\t\t\t\t\tdata : [5, 30, 70, 140, 100, 300, 426]\n");
      out.write("\t\t\t\t\t\t}]\n");
      out.write("\t\t\t\t\t});\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t});\n");
      out.write("\n");
      out.write("\t\t\t});\n");
      out.write("\t\t</script>\n");
      out.write("\n");
      out.write("\t\t<script src=\"js/highcharts.js\"></script>\n");
      out.write("\n");
      out.write("\t\t<style type=\"text/css\" >\n");
      out.write("\t\t\tbody {\n");
      out.write("\t\t\t\toverflow: hidden;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t#chart_div {\n");
      out.write("\t\t\t\tz-index: 100\n");
      out.write("\t\t\t}\n");
      out.write("\t\t</style>\n");
      out.write("\n");
      out.write("\t</head>\n");
      out.write("\n");
      out.write("\t<body data-spy=\"scroll\" data-target=\".subnav\" data-offset=\"50\">\n");
      out.write("\n");
      out.write("\t\t<!-- Navbar\n");
      out.write("\t\t================================================== -->\n");
      out.write("\t\t<div style=\"display: none;\" class=\"navbar navbar-fixed-top\">\n");
      out.write("\t\t\t<div class=\"navbar-inner\">\n");
      out.write("\t\t\t\t<div class=\"container\">\n");
      out.write("\t\t\t\t\t<a class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".nav-collapse\"> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> </a>\n");
      out.write("\t\t\t\t\t<a class=\"brand\" href=\"../\"><img src=\"images/logo.png\" width=\"200px;\" /></a>\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div style=\"margin-top: 10px;\" class=\"nav-collapse\">\n");
      out.write("\t\t\t\t\t\t<ul class=\"nav pull-right\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<li class=\"dropdown\">\n");
      out.write("\t\t\t\t\t\t\t\t<a class=\"active\" > Logged in as:  Mr. Amoo </a>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"divider-vertical\"></li>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<li class=\"dropdown\">\n");
      out.write("\t\t\t\t\t\t\t\t<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\"><i class=\"icon-user\"></i> Account <b class=\"caret\"></b></a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a target=\"_blank\" href=\"bootstrap.min.css\"><i class=\"icon-wrench\"></i> Settings </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a target=\"_blank\" href=\"bootstrap.css\"><i class=\"icon-question-sign\"></i> Help </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"divider\"></li>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a target=\"_blank\" href=\"variables.less\"><i class=\"icon-off\"></i> Log Out</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("\t\t\t<!-- Masthead\n");
      out.write("\t\t\t================================================== -->\n");
      out.write("\t\t\t<header  class=\"jumbotron subhead\" id=\"overview\">\n");
      out.write("\n");
      out.write("\t\t\t\t<div style=\"margin-top: 20px; margin-bottom: -50px;\" class=\"subnav navbar-fixed-top hide\">\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-pills\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\">Home <i class=\"icon-chevron-right\"></i></a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\">Statistics & Reports <i class=\"icon-chevron-right\"></i></a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\">Client Utilization </a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t</header>\n");
      out.write("\n");
      out.write("\t\t\t<div style=\"position: absolute; left: 30%; top: 200px; text-align: center;\" class=\"progress1\">\n");
      out.write("\t\t\t\t<img src=\"images/logoonly.png\" width=\"136px;\" style=\"margin-bottom: 20px;\" />\n");
      out.write("\t\t\t\t<a href=\"#\"> <h3 class=\"segoe\" style=\"text-align: center; font-weight: lighter;\"> Your page is taken longer than expected to load.....\n");
      out.write("\t\t\t\t<br />\n");
      out.write("\t\t\t\tPlease be patient!</h3>\n");
      out.write("\t\t\t\t<br />\n");
      out.write("\t\t\t\t</a>\n");
      out.write("\t\t\t\t<div  class=\"progress progress-striped active span5\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"bar\"\n");
      out.write("\t\t\t\t\tstyle=\"width: 100%;\"></div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t<section style=\"margin-top: -30px;\" id=\"dashboard\">\n");
      out.write("\n");
      out.write("\t\t\t\t<!-- Headings & Paragraph Copy -->\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div style=\"height: 100%; position: fixed;\" class=\"span3\">\n");
      out.write("\t\t\t\t\t\t<ul style=\"display: none; \" class=\"menu\">\n");
      out.write("\t\t\t\t\t\t\t<li class=\"item1\">\n");
      out.write("\t\t\t\t\t\t\t\t<a  href=\"#\"><i class=\"icon-home\"></i> Dashboard </a>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"item2\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\"><i class=\" icon-tasks\"></i> Claims Management <span>147</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Inbox <span>14</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Accepted Claims <span>6</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem3\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Rejected Claims <span>2</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"item3\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\"><i class=\"icon-user\"></i> Staff Management </a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">View Staff <span>14</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">New Staff</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"item4\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\"><i class=\"icon-lock\"></i> Membership Authentication </a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Membership Status <span>14</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Benefit Status <span>6</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem3\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Membership Archive <span>2</span></a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li class=\"item5\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#\"> <i class=\"icon-list-alt\"></i> Statistics & Reports </a>\n");
      out.write("\t\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Client Utilization </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Provider Utilization </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem3\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Medical Analysis </a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem4\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Cash Claims</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t<li class=\"subitem5\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a href=\"#\">Medical Claims</a>\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div style=\"margin-top: 0px; \"class=\"span12 offset3 content1 hide\">\n");
      out.write("\t\t\t\t\t\t<ul class=\"breadcrumb span9 pull-right\" style=\"padding-bottom: 0px; line-height: 27px;\">\n");
      out.write("\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t<h4><a href=\"#\"> Patient Utilization</a></h4>\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li style=\"padding-left: 10px;\" class=\"pull-right\">\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" class=\"input-large\" placeholder=\"Select Date Range\" value=\"4/23/99\" id=\"rangeA\" />\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t<li style=\"padding-top: 5px;\" class=\"active pull-right\">\n");
      out.write("\t\t\t\t\t\t\t\tSelect Date Range\n");
      out.write("\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t<!--\t<li  class=\"active pull-right\">\n");
      out.write("\t\t\t\t\t\t\t\t<select class=\"input-xlarge\" id=\"selectError\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<option>Emmanuel Addo-Yirenkyi & Dependants</option>\n");
      out.write("\t\t\t\t\t\t\t\t\t<option>Emmanuel Addo-Yirenkyi Only </option>\n");
      out.write("\t\t\t\t\t\t\t\t\t<option>All Dependants Only </option>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t<option>Adwoa Mansah (Dependant 1)</option>\n");
      out.write("\t\t\t\t\t\t\t\t\t<option>Kofi Manu (Dependant 2)</option>\n");
      out.write("\t\t\t\t\t\t\t\t\t<option>Ama Brako (Dependant 3)</option>\n");
      out.write("\t\t\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\t\t\t</li>  -->\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div style=\"height: 200px; overflow: hidden; margin-bottom: 20px; padding: 0px; width: 420px;\" class=\"box span4 pull-left\" id=\"myModal\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<div id=\"chart_div\" style=\"height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;\" class=\"box-body\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div style=\"height: 200px; overflow: hidden; margin-bottom: 20px; width: 420px;\" class=\"box span4  pull-left\" id=\"myModal\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<div id=\"chart_div1\" style=\"height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;\" class=\"box-body\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div style=\"height: 200px; overflow: hidden; width: 420px;\" class=\"box span4 pull-left\" id=\"myModal\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<div id=\"chart_div2\" style=\"height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;\" class=\"box-body\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div style=\"height: 200px; overflow: hidden; width: 420px;\" class=\"box span4 pull-left\" id=\"myModal\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<div id=\"chart_div3\" style=\"height: 240px; margin-top: -5px; padding: 0px; z-index: 1000; overflow: hidden;\" class=\"box-body\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"clearfix\"></div>\n");
      out.write("\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t</section>\n");
      out.write("\n");
      out.write("\t\t\t<footer style=\"display: none;\" class=\"footer\">\n");
      out.write("\t\t\t\t<p style=\"text-align: center\" class=\"pull-right\">\n");
      out.write("\t\t\t\t\t<img src=\"images/logo.png\" width=\"100px;\" />\n");
      out.write("\t\t\t\t</p>\n");
      out.write("\t\t\t</footer>\n");
      out.write("\n");
      out.write("\t\t</div><!-- /container -->\n");
      out.write("\n");
      out.write("\t\t<!--end static dialog-->\n");
      out.write("\n");
      out.write("\t\t<!-- Le javascript\n");
      out.write("\t\t================================================== -->\n");
      out.write("\t\t<!-- Placed at the end of the document so the pages load faster -->\n");
      out.write("\t\t<script src=\"js/jquery.js\"></script>\n");
      out.write("\t\t<script src=\"js/bootstrap-dropdown.js\"></script>\n");
      out.write("\t\t<script src=\"js/bootstrap-scrollspy.js\"></script>\n");
      out.write("\t\t<script src=\"js/bootstrap-collapse.js\"></script>\n");
      out.write("\t\t<script src=\"js/bootstrap-tooltip.js\"></script>\n");
      out.write("\t\t<script src=\"js/bootstrap-popover.js\"></script>\n");
      out.write("\t\t<script src=\"js/application.js\"></script>\n");
      out.write("\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"js/jquery-ui-1.8.16.custom.min.js\"></script>\n");
      out.write("\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"third-party/jQuery-UI-Date-Range-Picker/js/date.js\"></script>\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js\"></script>\n");
      out.write("\n");
      out.write("\t\t<!--\t<script src=\"third-party/wijmo/jquery.mousewheel.min.js\" type=\"text/javascript\"></script>\n");
      out.write("\t\t<script src=\"third-party/wijmo/jquery.bgiframe-2.1.3-pre.js\" type=\"text/javascript\"></script>\n");
      out.write("\t\t<script src=\"third-party/wijmo/jquery.wijmo-open.1.5.0.min.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("\t\t<script src=\"third-party/jQuery-UI-FileInput/js/enhance.min.js\" type=\"text/javascript\"></script>\n");
      out.write("\t\t<script src=\"third-party/jQuery-UI-FileInput/js/fileinput.jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"js/tablecloth.js\"></script>  -->\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"js/demo.js\"></script>\n");
      out.write("\t\t<!--initiate accordion-->\n");
      out.write("\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t$(function() {\n");
      out.write("\n");
      out.write("\t\t\t\tvar menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');\n");
      out.write("\n");
      out.write("\t\t\t\tmenu_ul.hide();\n");
      out.write("\n");
      out.write("\t\t\t\t$(\".menu\").fadeIn();\n");
      out.write("\t\t\t\t$(\".content1\").fadeIn();\n");
      out.write("\t\t\t\t$(\".navbar\").fadeIn();\n");
      out.write("\t\t\t\t$(\".footer\").fadeIn();\n");
      out.write("\t\t\t\t$(\".subnav\").fadeIn();\n");
      out.write("\t\t\t\t$(\".progress1\").hide();\n");
      out.write("\n");
      out.write("\t\t\t\tmenu_a.click(function(e) {\n");
      out.write("\t\t\t\t\te.preventDefault();\n");
      out.write("\t\t\t\t\tif (!$(this).hasClass('active')) {\n");
      out.write("\t\t\t\t\t\tmenu_a.removeClass('active');\n");
      out.write("\t\t\t\t\t\tmenu_ul.filter(':visible').slideUp('normal');\n");
      out.write("\t\t\t\t\t\t$(this).addClass('active').next().stop(true, true).slideDown('normal');\n");
      out.write("\t\t\t\t\t} else {\n");
      out.write("\t\t\t\t\t\t$(this).removeClass('active');\n");
      out.write("\t\t\t\t\t\t$(this).next().stop(true, true).slideUp('normal');\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t});\n");
      out.write("\n");
      out.write("\t\t\t});\n");
      out.write("\n");
      out.write("\t\t</script>\n");
      out.write("\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}