<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="com.sun.xml.internal.ws.wsdl.writer.document.soap.Body"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,helper.HibernateUtil"%>
<!DOCTYPE html>
<% try {
    Users current = (Users) session.getAttribute("staff");
            if(current == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
        // HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
        sess.beginTransaction();
        HMSHelper mgr = new HMSHelper();
        if ("stafftable".equals(request.getParameter("action"))) {
            String employeeid = request.getParameter("employeeid") == "" ? "N/A" : request.getParameter("employeeid");

            String title = request.getParameter("title") == "" ? "N/A" : request.getParameter("title");
            String lname = request.getParameter("lname") == "" ? "N/A" : request.getParameter("lname");
            String othername = request.getParameter("othername") == "" ? "N/A" : request.getParameter("othername");
            String gender = request.getParameter("gender") == "" ? "N/A" : request.getParameter("gender");
            String ssn = request.getParameter("ssn") == "" ? "N/A" : request.getParameter("ssn");
            String email = request.getParameter("email") == "" ? "N/A" : request.getParameter("email");
            String pob = request.getParameter("pob") == "" ? "N/A" : request.getParameter("pob");
            String role = request.getParameter("role") == "" ? "R" : request.getParameter("role");
            String extrarole = request.getParameter("extrarole") == null ? "N/A" : request.getParameter("extrarole");

            String year = request.getParameter("year") == "Y" ? "0000-" : request.getParameter("year");
            String yearemployed = request.getParameter("yearemployed") == null ? "D" : request.getParameter("yearemployed");
            String month = request.getParameter("month") == "M" ? "00-" : request.getParameter("month");
            String day = request.getParameter("day") == "D" ? "00" : request.getParameter("day");
            String address = request.getParameter("address") == "" ? "N/A" : request.getParameter("address");

            String contact = request.getParameter("contact") == "" ? "N/A" : request.getParameter("contact");
            String nextofkin = request.getParameter("nextofkin") == "" ? "N/A" : request.getParameter("nextofkin");
            String kincontact = request.getParameter("kincontact") == "" ? "N/A" : request.getParameter("kincontact");
            String department = request.getParameter("departmentid") == "D" ? "D" : request.getParameter("departmentid");

            String shs = request.getParameter("shs") == "" ? "N/A" : request.getParameter("shs");
            String shsfrom = request.getParameter("shsfrom") == "" ? "0000" : request.getParameter("shsfrom");
            String shsto = request.getParameter("shsto") == "" ? "0000" : request.getParameter("shsto");
            String shsinstitution = request.getParameter("shsinstitution") == "" ? "N/A" : request.getParameter("shsinstitution");

            String hnd = request.getParameter("hnd") == "" ? "N/A" : request.getParameter("hnd");
            String hndfrom = request.getParameter("hndfrom") == "" ? "0000" : request.getParameter("hndfrom");
            String hndto = request.getParameter("hndto") == "" ? "0000" : request.getParameter("hndto");
            String hndinstitution = request.getParameter("hndinstitution") == "" ? "N/A" : request.getParameter("hndinstitution");

            String bachelors = request.getParameter("bachelors") == "" ? "N/A" : request.getParameter("bachelors");
            String bachelorsfrom = request.getParameter("bachelorsfrom") == "" ? "0000" : request.getParameter("bachelorsfrom");
            String bachelorsto = request.getParameter("bachelorsto") == "" ? "0000" : request.getParameter("bachelorsto");
            String bachelorsinstitution = request.getParameter("bachelorsinstitution") == "" ? "N/A" : request.getParameter("bachelorsinstitution");

            String masters = request.getParameter("masters") == "" ? "N/A" : request.getParameter("masters");
            String mastersfrom = request.getParameter("mastersfrom") == "" ? "0000" : request.getParameter("mastersfrom");
            String mastersto = request.getParameter("mastersto") == "" ? "0000" : request.getParameter("mastersto");
            String mastersinstitution = request.getParameter("mastersinstitution") == "" ? "N/A" : request.getParameter("mastersinstitution");

            String phd = request.getParameter("phd") == "" ? "N/A" : request.getParameter("phd");
            String phdfrom = request.getParameter("phdfrom") == "" ? "0000" : request.getParameter("phdfrom");
            String phdto = request.getParameter("phdto") == "" ? "0000" : request.getParameter("phdto");
            String phdinstitution = request.getParameter("phdinstitution") == "" ? "N/A" : request.getParameter("phdinstitution");



            int roleid = 0;
            int departmentid = 0;
            //String membershipID = request.getParameter("membershipid");
            String dob = year + "-" + month + "-" + day;
            String name = title + " " + lname;
            System.out.println("contac length :" + contact.length());
            System.out.println("test  :" + phdto + "-" + phdinstitution + "-" + dob + "-" + phdfrom);
            try {
                roleid = Integer.parseInt(role);
                departmentid = Integer.parseInt(department);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Role or Department fields cannot be empty");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (lname.equalsIgnoreCase("") || othername.equalsIgnoreCase("")) {
                session.setAttribute("lasterror", "Name fields cannot be empty");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (employeeid.equalsIgnoreCase("")) {
                session.setAttribute("lasterror", "Employee ID field cannot be empty");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (year.equalsIgnoreCase("D") || month.equalsIgnoreCase("M") || day.equalsIgnoreCase("Y")) {
                session.setAttribute("lasterror", "Date fields cannot be empty");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (contact.equals("N/A")) {
                session.setAttribute("lasterror", "Contact field cannot be empty");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (!contact.equals("N/A") && contact.length() > 10) {
                session.setAttribute("lasterror", "Telephone number length cannot be more than 10 digits");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (!contact.equals("N/A") && contact.length() < 10) {
                session.setAttribute("lasterror", "Telephone number length cannot be less then 10 digits");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (!kincontact.equals("N/A") && kincontact.length() > 10) {
                session.setAttribute("lasterror", "Emergency telephone number length cannot be more than 10 digits");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (!kincontact.equals("N/A") && kincontact.length() < 10) {
                session.setAttribute("lasterror", "Emergency telephone number length cannot be less than 10 digits");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (address.equalsIgnoreCase("N/A")) {
                session.setAttribute("lasterror", "Address field cannot be empty, please enter patient house number instead");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (gender.equalsIgnoreCase("N/A")) {
                session.setAttribute("lasterror", "Gender field cannot be empty, please enter patient house number instead");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (email.equalsIgnoreCase("N/A")) {
                session.setAttribute("lasterror", "Email field cannot be empty, please enter patient house number instead");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (yearemployed.equalsIgnoreCase("D")) {
                session.setAttribute("lasterror", "Year field cannot be empty, please enter patient house number instead");
                response.sendRedirect("../index.jsp");
                return;
            }


            Stafftable stafftable = null;
            Qualification qualification = null;

            stafftable = mgr.addStaff(employeeid, name, othername, ssn, dob, pob, yearemployed, email, gender, contact, address, nextofkin, kincontact, departmentid, roleid, extrarole, "");
            Users user = new Users();
            int num = mgr.listAllStaff().size();
            String username = lname + "" + num + 1;
            String psw = year + "_" + lname;
            String password = Password.getSaltedHash(psw);
            //user.setUsername(username);
            user.setPassword(password);
            user.setStaffid(stafftable.getStaffid());
            
            user.setUsername(username);
            user.setTemporal(Boolean.FALSE);
            mgr.addUser(user);

            if (!shs.equals("N/A")) {
                qualification = mgr.addStaffQualification(shs, shsfrom, shsto, shsinstitution, stafftable.getStaffid());
            }
            if (!hnd.equals("N/A")) {
                qualification = mgr.addStaffQualification(hnd, hndfrom, hndto, hndinstitution, stafftable.getStaffid());
            }
            if (!bachelors.equals("N/A")) {
                qualification = mgr.addStaffQualification(bachelors, bachelorsfrom, bachelorsto, bachelorsinstitution, stafftable.getStaffid());
            }
            if (!masters.equals("N/A")) {
                qualification = mgr.addStaffQualification(masters, mastersfrom, mastersto, mastersinstitution, stafftable.getStaffid());
            }
            if (!phd.equals("N/A")) {
                qualification = mgr.addStaffQualification(phd, phdfrom, phdto, phdinstitution, stafftable.getStaffid());
            }
            System.out.println("p p p p : " + stafftable);

            if (stafftable == null) {
                session.setAttribute("lasterror", "Staff details could not be saved please try again");
                response.sendRedirect("../index.jsp");
                return;
            }
            if (qualification == null) {
                session.setAttribute("lasterror", "Staff qualification could not be saved please try again");
                response.sendRedirect("../index.jsp");
                return;
            }

            session.setAttribute("lasterror", "Staff's details saved successfully user details\n Username: " + username + " and Password: " + psw);
            //session.setAttribute("patient", stafftable);
            response.sendRedirect("../addstaff.jsp");
            return;
        }
        if ("delete".equals(request.getParameter("action"))) {
            if (request.getParameter("id").equals("")) {
                out.print("Deletion was not Successfully");
            }
            String staffid = request.getParameter("id");
            String userid = request.getParameter("userid");
            mgr.deleteStaff(staffid);
            mgr.deleteUserByStaffid(staffid);
            mgr.deleteUser(userid);
            out.print("Deleted Successfully");
                
            //response.sendRedirect("../addstaff.jsp");
            //return;
        }
        if ("update".equals(request.getParameter("action"))) {
            String employeeid = request.getParameter("employeeid") == "" ? "N/A" : request.getParameter("employeeid");

            String title = request.getParameter("title") == "" ? "N/A" : request.getParameter("title");
            String lname = request.getParameter("lname") == "" ? "N/A" : request.getParameter("lname");
            String dob = request.getParameter("dob") == "" ? "N/A" : request.getParameter("dob");
            String othername = request.getParameter("othername") == "" ? "N/A" : request.getParameter("othername");
            String gender = request.getParameter("gender") == "" ? "N/A" : request.getParameter("gender");
            String ssn = request.getParameter("ssn") == "" ? "N/A" : request.getParameter("ssn");
            String email = request.getParameter("email") == "" ? "N/A" : request.getParameter("email");
            String pob = request.getParameter("pob") == "" ? "N/A" : request.getParameter("pob");
            String role = request.getParameter("role") == "" ? "R" : request.getParameter("role");
            String extrarole = request.getParameter("extrarole") == null ? "N/A" : request.getParameter("extrarole");

            String year = request.getParameter("year") == "Y" ? "0000-" : request.getParameter("year");
            String yearemployed = request.getParameter("yearemployed") == null ? "D" : request.getParameter("yearemployed");
            String month = request.getParameter("month") == "M" ? "00-" : request.getParameter("month");
            String day = request.getParameter("day") == "D" ? "00" : request.getParameter("day");
            String address = request.getParameter("address") == "" ? "N/A" : request.getParameter("address");

            String contact = request.getParameter("contact") == "" ? "N/A" : request.getParameter("contact");
            String nextofkin = request.getParameter("nextofkin") == "" ? "N/A" : request.getParameter("nextofkin");
            String kincontact = request.getParameter("kincontact") == "" ? "N/A" : request.getParameter("kincontact");
            String department = request.getParameter("departmentid") == "D" ? "D" : request.getParameter("departmentid");

            String shs = request.getParameter("shs") == "" ? "N/A" : request.getParameter("shs");
            String shsid = request.getParameter("shsid") == "" ? "N/A" : request.getParameter("shsid");
            String shsfrom = request.getParameter("shsfrom") == "" ? "0000" : request.getParameter("shsfrom");
            String shsto = request.getParameter("shsto") == "" ? "0000" : request.getParameter("shsto");
            String shsinstitution = request.getParameter("shsinstitution") == "" ? "N/A" : request.getParameter("shsinstitution");

            String hnd = request.getParameter("hnd") == "" ? "N/A" : request.getParameter("hnd");
            String hndid = request.getParameter("hndid") == "" ? "N/A" : request.getParameter("hndid");
            String hndfrom = request.getParameter("hndfrom") == "" ? "0000" : request.getParameter("hndfrom");
            String hndto = request.getParameter("hndto") == "" ? "0000" : request.getParameter("hndto");
            String hndinstitution = request.getParameter("hndinstitution") == "" ? "N/A" : request.getParameter("hndinstitution");

            String bachelors = request.getParameter("bachelors") == "" ? "N/A" : request.getParameter("bachelors");
            String bachelorsid = request.getParameter("bachelorsid") == "" ? "N/A" : request.getParameter("bachelorsid");
            String bachelorsfrom = request.getParameter("bachelorsfrom") == "" ? "0000" : request.getParameter("bachelorsfrom");
            String bachelorsto = request.getParameter("bachelorsto") == "" ? "0000" : request.getParameter("bachelorsto");
            String bachelorsinstitution = request.getParameter("bachelorsinstitution") == "" ? "N/A" : request.getParameter("bachelorsinstitution");

            String masters = request.getParameter("masters") == "" ? "N/A" : request.getParameter("masters");
            String mastersid = request.getParameter("mastersid") == "" ? "N/A" : request.getParameter("mastersid");
            String mastersfrom = request.getParameter("mastersfrom") == "" ? "0000" : request.getParameter("mastersfrom");
            String mastersto = request.getParameter("mastersto") == "" ? "0000" : request.getParameter("mastersto");
            String mastersinstitution = request.getParameter("mastersinstitution") == "" ? "N/A" : request.getParameter("mastersinstitution");

            String phd = request.getParameter("phd") == "" ? "N/A" : request.getParameter("phd");
            String phdid = request.getParameter("phdid") == "" ? "N/A" : request.getParameter("phdid");
            String phdfrom = request.getParameter("phdfrom") == "" ? "0000" : request.getParameter("phdfrom");
            String phdto = request.getParameter("phdto") == "" ? "0000" : request.getParameter("phdto");
            String phdinstitution = request.getParameter("phdinstitution") == "" ? "N/A" : request.getParameter("phdinstitution");

            int roleid = 0;
            int departmentid = 0;
            roleid = Integer.parseInt(role);
            departmentid = Integer.parseInt(department);
            //String membershipID = request.getParameter("membershipid");
            //String dob = year + "-" + month + "-" + day;
            Stafftable stafftable = null;
            Qualification qualification = null;
            stafftable = mgr.updateStaffDetails(employeeid, lname, othername, ssn, dob, pob, yearemployed, email, gender, contact, address, nextofkin, kincontact, departmentid, roleid, extrarole, "");
            if (!shs.equals("N/A")) {
                qualification = mgr.updateQualification(Integer.parseInt(shsid), shs, shsfrom, shsto, shsinstitution);
            }
            if (!hnd.equals("N/A")) {
                qualification = mgr.updateQualification(Integer.parseInt(hndid), hnd, hndfrom, hndto, hndinstitution);
            }
            if (!bachelors.equals("N/A")) {
                qualification = mgr.updateQualification(Integer.parseInt(bachelorsid), bachelors, bachelorsfrom, bachelorsto, bachelorsinstitution);
            }
            if (!masters.equals("N/A")) {
                qualification = mgr.updateQualification(Integer.parseInt(mastersid), masters, mastersfrom, mastersto, mastersinstitution);
            }
            if (!phd.equals("N/A")) {
                qualification = mgr.updateQualification(Integer.parseInt(phdid), phd, phdfrom, phdto, phdinstitution);
            }

            session.setAttribute("lasterror", "Staff's details updated successfully");
            //session.setAttribute("patient", stafftable);
            response.sendRedirect("../addstaff.jsp");
            return;
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        session.setAttribute("lasterror", "An error occurred please try again later");
        //session.setAttribute("patient", stafftable);
        response.sendRedirect("../addstaff.jsp");

    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            // throw (ServletException) ex;
            session.setAttribute("lasterror", "An error occurred please try again later");
            response.sendRedirect("../addstaff.jsp");
        } else {
            // throw new ServletException(ex);
            session.setAttribute("lasterror", "An error occurred please try again later");
            response.sendRedirect("../addstaff.jsp");
        }
    }
%>