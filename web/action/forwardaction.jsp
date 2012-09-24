<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="entities.*,helper.HibernateUtil,org.hibernate.Session,java.util.Date" %>
<% try {
        Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
            
        Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
        sess.beginTransaction();
        HMSHelper mgr = new HMSHelper();
        if (request.getParameter("patientid") != null) {
            Patient p = mgr.getPatientByID(request.getParameter("patientid"));
            session.setAttribute("patient", p);
            response.sendRedirect("../index.jsp");
            return;
        }

        if ("forward".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("unitid");


            Patient p = (Patient) session.getAttribute("patient");
            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String previous = mgr.getPatientFolder(patientid).getStatus();
            int type = -1;
            try {
                type = Integer.parseInt(request.getParameter("contype"));
            } catch (NumberFormatException e) {
                response.sendRedirect("../records.jsp");
                return;
            }
            if (patientid.equals("")) {
                response.sendRedirect("../records.jsp");
                return;
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();

            String l = mgr.stepOverVisit(patientid, dateFormat.format(date));

            if (l.equalsIgnoreCase("Yes")) {
                session.setAttribute("lasterror", "Patient is already logged");
                response.sendRedirect("../records.jsp");
                return;
            }

            Visitationtable visit = mgr.createNewVisit(patientid, "", "", unitName, (String)session.getAttribute("unit"), type, "");
            mgr.updateFolderLocation((String)session.getAttribute("unit"), unitName, patientid);
            mgr.addPatientConsultation(visit.getVisitid(), type);
            session.setAttribute("lasterror", "Successfully forwarded");
            response.sendRedirect("../records.jsp");
            return;

        }
        if ("Forward to Accounts".equals(request.getParameter("action"))) {
            //System.out.println("here");
            String unitName = request.getParameter("unitid") == null ? (String)session.getAttribute("unit") : request.getParameter("unitid");
            String[] ptid = request.getParameterValues("dispensed[]") == null ? null : request.getParameterValues("dispensed[]");
            String[] afford = request.getParameterValues("afford[]") == null ? null : request.getParameterValues("afford[]");
            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            //String unit = request.getParameter("unitid") == null ? "Pharmacy" : request.getParameter("unitid");
            String visit = request.getParameter("visitid");
            String loc = request.getParameter("from");
            String previous = mgr.getPatientFolder(patientid).getStatus();
            int visitid = - 1;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../pharmacy.jsp");
                return;
            }


            if (patientid != null && !unitName.equals("")) {
                // System.out.println(patientid);
                mgr.updateFolderLocation((String)session.getAttribute("unit"), unitName, patientid);
                mgr.updateVisitationStatus(visitid, unitName, (String)session.getAttribute("unit"));

                if (ptid != null) {
                    for (int r = 0; r < ptid.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(ptid[r]), "Yes");
                    }
                }
                if (afford != null) {
                    for (int r = 0; r < afford.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(afford[r]), "Afford", 0.0);
                    }
                }
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../pharmacy.jsp");
                return;
            }
            session.setAttribute("lasterror", "Please try again");
            response.sendRedirect("../pharmacy.jsp");
            return;
            //String registrationDate = request.getParameter("dor");
        }

        if ("Forward".equals(request.getParameter("laboratory"))) {

            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String id[] = request.getParameterValues("ids[]") == null ? null : request.getParameterValues("ids[]");
            String labid = request.getParameter("labid") == null ? "Laboratory" : request.getParameter("labid");
            String[] results = request.getParameterValues("results[]") == null ? null : request.getParameterValues("results[]");
            String[] affords = request.getParameterValues("afford[]") == null ? null : request.getParameterValues("afford[]");
            String[] concentration = request.getParameterValues("concentration[]") == null ? null : request.getParameterValues("concentration[]");
            String[] range = request.getParameterValues("range[]") == null ? null : request.getParameterValues("range[]");
            String unitName = request.getParameter("unitid");
            // String previous = mgr.getPatientFolder(patientid).getStatus();
            String visit = request.getParameter("visitid");
            String loc = request.getParameter("from");

            int visitid = - 1;
            int orderid = -1;
            try {
                visitid = Integer.parseInt(visit);
                orderid = Integer.parseInt(labid);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../laboratory.jsp");
                return;
            }

            //  int pid =  - 1;

            try {
                String prev = mgr.getVisitById(visitid).getPreviouslocstion();
                String[] prevs = prev.split("_");
                if (prevs[0].equals("consultation")) {
                    /*System.out.println(visitid);
                     System.out.println(unitName);*/
                    mgr.updateFolderLocation((String)session.getAttribute("unit"), unitName, patientid);
                    mgr.updateVisitationStatus(visitid, unitName, (String)session.getAttribute("unit"));

                    if (affords != null) {
                        for (int r = 0; r < affords.length; r++) {
                            //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                            mgr.updatePatientInvestigation(Integer.parseInt(affords[r]), "", "", "", "Afford", 0.0);
                            // mgr.updateLaborders(1, "",new Date());
                        }
                    }

                }
                if (prevs[0].equals("account")) {
                    /* System.out.println(visitid);
                     System.out.println(unitName);*/
                    mgr.updateFolderLocation((String)session.getAttribute("unit"), unitName, patientid);
                    mgr.updateVisitationStatus(visitid, unitName, (String)session.getAttribute("unit"));
                    mgr.updateLaborders(orderid, new Date());


                    for (int r = 0; r < id.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        String result = request.getParameter("results" + id[r]) == "" ? "" : request.getParameter("results" + id[r]);
                        String concen = request.getParameter("concentration" + id[r]) == "" ? "" : request.getParameter("concentration" + id[r]);
                        String rnge = request.getParameter("range" + id[r]) == "" ? "" : request.getParameter("range" + id[r]);

                        mgr.updatePatientInvestigation(Integer.parseInt(id[r]), result, concen, rnge, "Yes", 0.0);
                        // mgr.updateLaborders(1, "",new Date());
                    }
                }
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../laboratory.jsp");
                return;
            } catch (NullPointerException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../laboratory.jsp");
                return;
            }
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();

    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>