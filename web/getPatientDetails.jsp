<%-- 
    Document   : getPatientDetails
    Created on : Aug 11, 2011, 5:38:12 AM
    Author     : sdot
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,helper.HibernateUtil"%>
<%

    HMSHelper mgr = new HMSHelper();
    Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
    sess.beginTransaction();


    String sMembershipid = request.getParameter("patientmembershipnumber").toString();
    
    
    if (sMembershipid != null) {

        int labTypeId = Integer.parseInt(sMembershipid);
        DetailedInvestigation detailedInv = null;
        String detInvList = "";

        List courses = mgr.listLabTypeDetailedInv(labTypeId);
        System.out.println("courses.size : " + courses.size());

        for (Iterator iterator = courses.iterator(); iterator.hasNext();) {

            LabtypeDetailedinv course = (LabtypeDetailedinv) iterator.next();

            System.out.println("akjdlfajdflkajdflk ::: " + course.getDetailedInvId());

            if(course != null) {
                detailedInv = mgr.getDetailedInvById(course.getDetailedInvId());
                detInvList += detailedInv.getDetailedInvId() + "))" + detailedInv.getName() + "^"; 
            }
            System.out.println("detInvList ::: " + detInvList);
        }

        try {
            detInvList = "$" + (detInvList.substring(0, detInvList.length() - 1)).trim();
            System.out.println("detInvList : " + detInvList);
            out.write(detInvList);
        } catch (Exception e) {
            //   e.printStackTrace();
            out.write("djaldjfakfalkdjfalkdjflajkdfalkflka");
        }
    } else {%>
<jsp:forward page="addmaininv.jsp"/>
<% }%>

