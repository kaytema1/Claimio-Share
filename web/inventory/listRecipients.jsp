<%-- 
    Document   : listRecipients
    Created on : Jul 6, 2012, 2:08:40 PM
    Author     : Lisandro
--%>


<%@page import="entities.Receive"%>
<%@page import="entities.Post"%>
<%@page import="entities.ItemsTable"%>
<%@page import="entities.itemHelper"%>
<%@page import="entities.HibernateUtil"%>
<%@page import="org.hibernate.classic.Session"%>
<%@page import="java.util.*"%>

<html>

    <head>
        <script language="javascript">
            function editRecord(id){
                var f=document.form;
                f.method="post";
                f.action='edit_items.jsp?id='+id;
                f.submit();
            }
            function deleteRecord(id){
                var f=document.form;
                f.method="post";
                f.action='deleteReceiver.jsp?id='+id;
                f.submit();
            }

        </script>


        <style type="text/css">
            form{

            }

            body {
                background-color: #FFF;
                background-image: url(images/09.gif);
            }
            #b
            {
                background-color:#8BC500;
            }
            .gradientbuttons ul{
                padding: 3px 0;
                margin-left: 0;
                margin-top: 1px;
                margin-bottom: 0;
                font: bold 13px Verdana;
                list-style-type: none;
                text-align: center; /*set to left, center, or right to align the menu as desired*/
            }

            .gradientbuttons li{
                display: inline;
                margin: 0;
            }

            .gradientbuttons li a{
                text-decoration: none;
                padding: 5px 7px;
                margin-right: 5px;
                border: 1px solid #778;
                color: white;
                border:1px solid gray;
                background: #3282c2;
                border-radius: 8px; /*w3c border radius*/
                box-shadow: 3px 3px 4px rgba(0,0,0,.5); /* w3c box shadow */
                -moz-border-radius: 8px; /* mozilla border radius */
                -moz-box-shadow: 3px 3px 4px rgba(0,0,0,.5); /* mozilla box shadow */
                background: -moz-linear-gradient(center top, #a4ccec, #72a6d4 25%, #3282c2 45%, #357cbd 85%, #72a6d4); /* mozilla gradient background */
                -webkit-border-radius: 8px; /* webkit border radius */
                -webkit-box-shadow: 3px 3px 4px rgba(0,0,0,.5); /* webkit box shadow */
                background: -webkit-gradient(linear, center top, center bottom, from(#a4ccec), color-stop(25%, #72a6d4), color-stop(45%, #3282c2), color-stop(85%, #357cbd), to(#72a6d4)); /* webkit gradient background */
            }

            .gradientbuttons li a:hover{
                color: lightyellow;
            }

            .redtheme li a{
                font-size:18px;
                background: darkred;
                background: -moz-linear-gradient(center top, #f5795d, #e55e3f 25%, #d02700 45%, #e55e3f 85%, #f5795d);
                background: -webkit-gradient(linear, center top, center bottom, from(#f5795d), color-stop(25%, #e55e3f), color-stop(45%, #d02700), color-stop(85%, #e55e3f), to(#f5795d)); 
            }

            .greentheme li a{
                font-size:12px;
                background: green;
                background: -moz-linear-gradient(center top, #7ad690, #3ec05c 25%, #298a40 45%, #3ec05c 85%, #7ad690);
                background: -webkit-gradient(linear, center top, center bottom, from(#7ad690), color-stop(25%, #3ec05c), color-stop(45%, #298a40), color-stop(85%, #3ec05c), to(#7ad690)); 
            }

            .blacktheme li a{
                font-size:16px;
                background: black;
                background: -moz-linear-gradient(center top, #9f9f9f, #686868 25%, #2a2a2a 45%, #686868 85%, #9f9f9f);
                background: -webkit-gradient(linear, center top, center bottom, from(#9f9f9f), color-stop(25%, #686868), color-stop(45%, #2a2a2a), color-stop(85%, #686868), to(#9f9f9f)); 
            }

            .orangetheme li a{
                font-size:14px;
                background: #e55e3f;
                background: -moz-linear-gradient(center top, #ecad9a, #e5937c 25%, #cf4c2a 45%, #e5937c 85%, #ecad9a);
                background: -webkit-gradient(linear, center top, center bottom, from(#ecad9a), color-stop(25%, #e5937c), color-stop(45%, #cf4c2a), color-stop(85%, #e5937c), to(#ecad9a)); 
            }

        </style>
    </head>
    <body >
        <div align="right">
            <ul class="gradientbuttons bluetheme">
                <li><a href="addType.jsp">Add New Types</a></li>
                <li><a href="index.jsp">Add Items</a></li>
                <li><a href="search_item.jsp">Search Items</a></li>
                <li><a href="application.jsp">List Items</a></li>
                <li><a href="check.jsp">Check</a></li>
            </ul>
        </div>

        <br><br>
        <%!  Session session1 = null;%>

        <div align="center"><h4>Total list of All Posted Items</h4></div>
        <table border="1" align="center"  name="tabl">
            <form  name="form">
                <tr><th>Date</th><th>Items</th><th>Item Id</th><th>Quantity</th><th>Unit</th><th>Recipient</th><th>Transaction Id</th><th>Delete</th></tr>
                <%

                    HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

                    itemHelper itm = new itemHelper();

                    List itmss = itm.listRecievers();
                    for (int i = 0; i < itmss.size(); i++) {
                        Receive itt = (Receive) itmss.get(i);

                        Date date = itt.getDate();
                        String items = itt.getItems();
                        String itemId = itt.getItemId();
                        int quantity = itt.getQuantity();
                        String unit = itt.getUnit();
                        String recipient = itt.getReceiver();
                        String transactionId = itt.getTransactionId();
                        int id = itt.getId();


                %>              








                <tr>
                    <td><%=date%></td>
                    <td><%=items%></td>
                    <td><%= itemId%></td>
                    <td><%=quantity%></td>
                    <td><%=unit%></td>
                    <td><%=recipient%></td>
                    <td><%=transactionId%></td>






                    <td><input type="button" name="delete" value="Delete" style="background-color:red;font-weight:bold;color:white;" onclick="show_confirm(),deleteRecord(<%=id%>); " ></td></tr>


                <%
                    }
                //session1.close();
                %>

                <tr><td align="center"><a href="check.jsp">Check for expired products</a> 
                    </td></tr></ul>


        </table>
    </form>

</body>
<script type="text/javascript">

    function show_confirm()
    {
        var con = confirm("Are You Sure You Want Delete This Item");
        if (con ==true)
        {
   
                      
            alert("Delete Was Successfull!");
        }
        else 
        {
            alert("Delete Was Cancled!");
        }
    }





   

</script>

<script type="text/javascript" src="jquery-1.4.2.js"></script>

<script type="text/javascript">
    function todaysdate()
    {
        var currentDate = new Date()
        var day = currentDate.getDate()
        var month = currentDate.getMonth() + 1
        var year = currentDate.getFullYear()
        var dat=(" " + year + "-" + month + "-" + day )
        //document.write(dat)
        alert("Todays Date is "+dat)
   
   
 
    }
</script>
</html>