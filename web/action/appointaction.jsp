<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        Users current = (Users) session.getAttribute("staff");
        if (current == null) {
            session.setAttribute("lasterror", "Please Login");
            response.sendRedirect("index.jsp");
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("save".equals(request.getParameter("action"))) {

            String type = request.getParameter("type");


            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            AppointType appointType = null;
            appointType = mgr.addAppointType(type);
            out.print("Appointment type Successfully Added");
            return;
        }
        if ("delete".equals(request.getParameter("action"))) {
            String id = request.getParameter("id");

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();

            mgr.deleteAppointType(Integer.parseInt(id));
            out.print("Appointment Successfully Removed");
            return;
        }
        if ("edit".equals(request.getParameter("action"))) {
            String utype = request.getParameter("utype");
            String id = request.getParameter("uid");

            if (utype.equalsIgnoreCase("")) {
                out.print("Appointment name field is empty");
                return;
            }
            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            AppointType appointType = null;
            appointType = mgr.updateAppointType(Integer.parseInt(id), utype);
            out.print("Appointment Successfully Updated");
            return;
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        out.print("There was a problem please try again");
        return;
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>