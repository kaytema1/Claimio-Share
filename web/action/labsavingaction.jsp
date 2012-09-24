<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,helper.HibernateUtil"%>
<!DOCTYPE html>
<% try {
        // HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
        sess.beginTransaction();
        if ("patient".equals(request.getParameter("action"))) {
            String code = request.getParameter("code");

            String name = request.getParameter("name");
            String sRate = request.getParameter("rate");
            String lowBound = request.getParameter("lowbound") == "" ? "NA" : request.getParameter("lowbound");
            String highBound = request.getParameter("highbound") == "" ? "NA" : request.getParameter("highbound");
            String labType = request.getParameter("type") == "" ? "NA" : request.getParameter("type");
            System.out.println("lab type : " + labType);
            String typeOfTest = request.getParameter("typeoftest") == "" ? "NA" : request.getParameter("typeoftest");
            System.out.println("type of test : " + typeOfTest);
            String groupUnder = request.getParameter("combo") == "" ? "NA" : request.getParameter("combo");
            System.out.println("groupUnder : " + groupUnder);
            String units = request.getParameter("units") == "" ? "NA" : request.getParameter("units");
            String interpretation = request.getParameter("interpretation") == "" ? "NA" : request.getParameter("interpretation");
            String defaultValue = request.getParameter("defaultvalue") == "" ? "NA" : request.getParameter("defaultvalue");
            String rangeFrom = request.getParameter("rangefrom") == "" ? "NA" : request.getParameter("rangefrom");
            String rangeUpTo = request.getParameter("rangeupto") == "" ? "NA" : request.getParameter("rangeupto");
            String comments = request.getParameter("comments") == "" ? "NA" : request.getParameter("comments");
            String sReportCollDays = request.getParameter("reportcolldays") == "" ? "NA" : request.getParameter("reportcolldays");
            String sReportCollTime = request.getParameter("reportcolltime") == "" ? "NA" : request.getParameter("reportcolltime");
            String sResultOptions = request.getParameter("resultsoptions") == "" ? "NA" : request.getParameter("resultsoptions");

            String hiddencount = request.getParameter("hiddencount") == "" ? "NA" : request.getParameter("hiddencount");


            System.out.println("+++++++++++++++++++++++ sResultOptions : " + sResultOptions);
            System.out.println("+++++++++++++++++++++++ hiddencount : " + hiddencount);
            //String registrationDate = request.getParameter("dor");
            double rate = 0;
            int labTypeId = 0;
            int typeOfTestId = 0;
            int groupUnderId = 0;
            boolean resultOptions = false;
            try {

                System.out.println("sRate ------ two : " + sRate);
                System.out.println("labType ------ two : " + labType);
                System.out.println("typeOfTest ------ two : " + typeOfTest);
                System.out.println("group under ------ two : " + groupUnder);
                System.out.println("sResultOptions ------ two : " + sResultOptions);

                rate = Double.parseDouble(sRate);

                labTypeId = Integer.parseInt(labType);
                typeOfTestId = Integer.parseInt(typeOfTest);



                if (sResultOptions.equals("Yes")) {
                    resultOptions = true;
                }

                if (typeOfTestId == 2) {
                    groupUnderId = Integer.parseInt(groupUnder.trim());
                }
            } catch (Exception e) {
                System.out.println("caught him here ++++++++ ");
                response.sendRedirect("../addmaininv.jsp");
                return;
            }



            Date date = new Date();
            java.sql.Date colTime = new java.sql.Date(date.getTime());

            HMSHelper mgr = new HMSHelper();
            DetailedInvestigation p = null;
            LabtypeDetailedinv lbMainTest = null;
            MaininvSubinv mainInvSubInv = null;
            PossibleinvResults posInvResult = null;
            DetailedinvPosinvresults detailedInvResult = null;
            //      Folder f = null;
            //     Sponsorhipdetails sd = null;
            //    p = null;
            p = mgr.createDetailedInvestigation(code, name, rate, lowBound, highBound, labTypeId, typeOfTestId, groupUnderId,
                    units, interpretation, defaultValue, rangeFrom, rangeUpTo, comments, sReportCollDays,
                    colTime, resultOptions);

            System.out.println("p p p p : " + p);

            if (p == null) {
                session.setAttribute("lasterror", "patient details could not be saved please try again");
                response.sendRedirect("../addmaininv.jsp");
                return;
            }

            int mainTestId = p.getDetailedInvId();
            if (typeOfTestId == 1) {  // main test, associate with lab type

                System.out.println("mainTestId " + mainTestId);
                lbMainTest = mgr.addLabTypeMainTest(labTypeId, mainTestId);

                if (lbMainTest == null) {
                    session.setAttribute("lasterror", "labtype main association rejected please try again");
                    response.sendRedirect("../addmaininv.jsp");
                    return;
                }
            } else if (typeOfTestId == 2) {  // sub test, associate with main test

                System.out.println("main and sub " + groupUnderId + " " + mainTestId);

                mainInvSubInv = mgr.addMainTestSubTest(groupUnderId, mainTestId);
                if (mainInvSubInv == null) {
                    session.setAttribute("lasterror", "main sub association rejected please try again");
                    response.sendRedirect("../addmaininv.jsp");
                    return;
                }
            }
        
            if (resultOptions) {  // detailed inv has associated results
                System.out.println("we goin home");

                // first save the result on its own


                String resOptions = "";
                String param = "option";

                if (!hiddencount.equalsIgnoreCase("NA")) {
                    int positiveResCount = Integer.parseInt(hiddencount);

                    for (int q = 1; q <= positiveResCount; q++) {
                        param = "option";


                        param = param + q;
                        
                        System.out.println("param : " + param);
                        resOptions = request.getParameter(param) == "" ? "NA" : request.getParameter(param);
                        System.out.println("resOptions : " + resOptions);
                        
                          if (!resOptions.equals("NA") && resOptions != null) {
                            posInvResult = mgr.addPosInvResult(resOptions);

                            if (posInvResult == null) {
                                session.setAttribute("lasterror", "possible result not saved please try again");
                                response.sendRedirect("../addmaininv.jsp");
                                return;
                            }

                            // if successful associate this possible result with detailed investigation
                            detailedInvResult = mgr.addDetInvPosResult(p.getDetailedInvId(), posInvResult.getPosinvResultId());
                            if (detailedInvResult == null) {
                                session.setAttribute("lasterror", "detailed investigation result not saved please try again");
                                response.sendRedirect("../addmaininv.jsp");
                                return;
                            }
                        }
                    }
                }

            }

            session.setAttribute("succ", "Detailed Investigation Saved Successfully");
            session.setAttribute("class", "alert-success");
            session.setAttribute("patient", p);
            response.sendRedirect("../addmaininv.jsp");
            return;
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();

    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            // throw (ServletException) ex;
            session.setAttribute("lasterror", "An error occurred please try again later");
            response.sendRedirect("../addmaininv.jsp");
        } else {
            // throw new ServletException(ex);
            session.setAttribute("lasterror", "An error occurred please try again later");
            response.sendRedirect("../addmaininv.jsp");
        }
    }%>