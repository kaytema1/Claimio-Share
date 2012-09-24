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
        HMSHelper mgr = new HMSHelper();

        if ("Pharmacy Receipt".equals(request.getParameter("action"))) {
            String tids[] = request.getParameterValues("pid[]") == null ? null : request.getParameterValues("pid[]");
             String paid[] = request.getParameterValues("paid[]") == null ? null : request.getParameterValues("paid[]");
            // String vids[] = request.getParameterValues("vid[]") == null ? null : request.getParameterValues("vid[]");
            // String checks[] = request.getParameterValues("checks[]") == null ? null : request.getParameterValues("checks[]");

            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String unitName = request.getParameter("unitid") == null ? "Accounts" : request.getParameter("unitid");
            String visit = request.getParameter("visitid");
            int visitid = - 1;
            //double amountpiad;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../accounts.jsp");
                return;
            }


            if (patientid != null) {
                // System.out.println(patientid);
                if (tids != null) {
                    for (int r = 0; r < tids.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        double amountpaid = request.getParameter("mn_"+tids[r])==null ? 0.0 : Double.parseDouble(request.getParameter("mn_"+tids[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(tids[r]), "paid",amountpaid);
                    }
                    mgr.updateFolderLocation((String)session.getAttribute("unit"), unitName, patientid);
                    mgr.updateVisitationStatus(visitid, unitName, (String)session.getAttribute("unit"));
                    session.setAttribute("lasterror", "Saved soccessfully");
                    response.sendRedirect("../accounts.jsp");
                    return;
                }
                
                mgr.updateFolderLocation((String)session.getAttribute("unit"), unitName, patientid);
                mgr.updateVisitationStatus(visitid, unitName, (String)session.getAttribute("unit"));
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../accounts.jsp");
                return;
            }
        }
        if ("Laboratory Receipt".equals(request.getParameter("action"))) {
            // String tids[] = request.getParameterValues("pid[]") == null ? null : request.getParameterValues("pid[]");
            String vids[] = request.getParameterValues("vid[]") == null ? null : request.getParameterValues("vid[]");
            String checks[] = request.getParameterValues("checks[]") == null ? null : request.getParameterValues("checks[]");

            String pid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String uName = request.getParameter("unitid") == null ? "Accounts" : request.getParameter("unitid");
            String vst = request.getParameter("visitid");
            int vstid = - 1;
            //double amountpiad;
            try {
                vstid = Integer.parseInt(vst);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../accounts.jsp");
                return;
            }


            if (pid != null) {
                
                if (vids != null) {
                    for (int r = 0; r < vids.length; r++) {
                       
                        double amountpaid = request.getParameter("nm_" + vids[r]) == "" ? 0 : Double.parseDouble(request.getParameter("nm_" + vids[r]));
                        mgr.updatePatientInvestigation(Integer.parseInt(vids[r]), "","","", "No", amountpaid);
                    }
                    if (checks != null) {
                        for (int r = 0; r < checks.length; r++) {
                            mgr.updatePatientInvestigationPayment(Integer.parseInt(checks[r]));
                        }
                    }
                    mgr.updateFolderLocation((String)session.getAttribute("unit"), uName, pid);
                    mgr.updateVisitationStatus(vstid, uName, (String)session.getAttribute("unit"));
                    session.setAttribute("lasterror", "Saved soccessfully");
                    response.sendRedirect("../accounts.jsp");
                    return;
                }
                mgr.updateFolderLocation((String)session.getAttribute("unit"), uName, pid);
                mgr.updateVisitationStatus(vstid, uName, (String)session.getAttribute("unit"));
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../accounts.jsp");
                return;
            }
        }
        if ("Consultation Receipt".equals(request.getParameter("action"))) {
            
            double amountpaid = request.getParameter("amountpaid") == "" ? 0.0 : Double.parseDouble(request.getParameter("amountpaid"));
            String status = request.getParameter("status") == "" ? "unpaid" : request.getParameter("status");

            String patid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String uame = request.getParameter("unitid") == null ? "Accounts" : request.getParameter("unitid");
            String vis = request.getParameter("cid");
            String vid = request.getParameter("visitid");
            int visid = - 1;
            int vint = -1;
            //double amountpiad;
            try {
                visid = Integer.parseInt(vis);
                vint = Integer.parseInt(vid);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../accounts.jsp");
                return;
            }


            if (patid != null) {
             System.out.println(visid);
                mgr.updatePatientConsultation(visid, amountpaid, status);

                mgr.updateFolderLocation((String)session.getAttribute("unit"), uame, patid);
                mgr.updateVisitationStatus(vint, uame, (String)session.getAttribute("unit"));
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../accounts.jsp");
                return;
            }
            session.setAttribute("lasterror", "Please try again");
            response.sendRedirect("../accounts.jsp");
            return;
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../accounts.jsp");
         return;
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>