<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
     Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("wards".equals(request.getParameter("action"))) {
            String shortcut = null;
            String description  = null;
            
            try {
                 shortcut = request.getParameter("name");
                 description = request.getParameter("beds");
               }
            catch(NullPointerException e){
               out.print("No field can be empty");
                return;
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Dosage dosage = null;
            dosage = mgr.addDosage(shortcut, description);
            out.print("Shortcut successfully Added");
            return;
        }
        /*if ("edit".equals(request.getParameter("action"))) {
             String wardName = null;
             String description  = null;
             
            try {
                 wardName = request.getParameter("uname");
                 
                 description = request.getParameter("ubeds");
            } 
            catch(NullPointerException e){
               out.print("There is a problem please try again");
                return;
            }

            //String registrationDate = request.getParameter("dor");

            /*HMSHelper mgr = new HMSHelper();
            Ward ward = null;
            ward = mgr.updateWardInfo(wardid,wardName, numberOfBeds,occupied);
            out.print("Ward successfully Added");
            return;*/
       // }
      /*  if ("delete".equals(request.getParameter("action"))) {
          
            int wardid  = -1;
            
            try {
                
                 wardid = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException e) {
                out.print("There is a problem please try again");
                return;
                
            }
            catch(NullPointerException e){
               out.print("There is a problem please try again");
                return;
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Ward ward = null;
            ward = mgr.deleteWard(wardid);
            out.print("Ward successfully Added");
            return;
        }*/
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../addward.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>