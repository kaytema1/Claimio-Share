<%-- 
    Document   : saveAppointment
    Created on : Jul 18, 2012, 12:28:30 PM
    Author     : lisandro
--%>


<%@page import="entities.*"%>
<%@page import="entities.Itemtype"%>
<%@page import="entities.HMSHelper"%>
<%@page import="helper.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% try {
    Users current = (Users) session.getAttribute("staff");
            if(current == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("appointment.jsp");
            }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();


        //  if ("submit Details".equals(request.getParameter("submit"))) {
        String doctorId = request.getParameter("doctorId");
        String patientId = request.getParameter("patientId");
        String content = request.getParameter("content");
        String start = request.getParameter("start");
        String allDay = request.getParameter("allday");
        String end = request.getParameter("end");
        String title = request.getParameter("title");
        //String q = request.getParameter("id");
        // int id = Integer.parseInt(q);

        if(doctorId.equals("") || patientId.equals("")){
            session.setAttribute("lasterror", "Sorry appointment cannot be saved wihout a doctor or patient");
            response.sendRedirect("../appointment.jsp");
            return;
        }

        System.out.println(content + "allDay" + allDay);

        System.out.println("ere");


        HMSHelper its = new HMSHelper();
        Appoint app = null;


        app = its.addAppointment(doctorId, patientId, content, start, allDay, end, title);
 session.setAttribute("lasterror", "Appointment saved successfully");
        session.setAttribute("item", app);


        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../appointment.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>