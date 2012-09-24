<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="java.util.List"%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
     
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("login".equals(request.getParameter("action"))) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String unit = request.getParameter("unit");
            if (username.equals("") || password.equals("") || unit.equals("")) {
                session.setAttribute("lasterror", "Sorry Can't log you in");
                response.sendRedirect("../index.jsp");
                return;
            }


            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Users user = mgr.getUserById(username);
            List list = mgr.login(username, password);
            String[] redirect = unit.split("_");
            //Password password1 = new Password();
            if (Password.check(password, user.getPassword())) {
                session.setAttribute("lasterror", "Sign in successful");
                session.setAttribute("staff", user);
                if (redirect[0].equals("ward")) {
                    response.sendRedirect("../ward.jsp");
                    session.setAttribute("unit", unit);
                    return;
                }
                if (redirect[0].equals("consultation")) {
                    response.sendRedirect("../consultingroom.jsp");
                    session.setAttribute("unit", unit);
                    return;
                }
                if (redirect[0].equals("lab")) {
                    response.sendRedirect("../laboratory.jsp");
                    session.setAttribute("unit", unit);
                    return;
                }
                if (redirect[0].equals("pharmacy")) {
                    response.sendRedirect("../pharmacy.jsp");
                    session.setAttribute("unit", unit);
                    return;
                }
                if (redirect[0].equals("account")) {
                    response.sendRedirect("../accounts.jsp");
                    session.setAttribute("unit", unit);
                    return;
                }
                if (redirect[0].equals("records")) {
                    response.sendRedirect("../records.jsp");
                    session.setAttribute("unit", unit);
                    return;
                }
                if (redirect[0].equals("vitals")) {
                    response.sendRedirect("../opd.jsp");
                    session.setAttribute("unit", unit);
                    return;
                }

            }

            session.setAttribute("lasterror", "Sorry Can't log you in");
            response.sendRedirect("../index.jsp");
            return;

        }


        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        session.setAttribute("lasterror", "Wrong username or password");
        response.sendRedirect("../index.jsp");
        return;
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>