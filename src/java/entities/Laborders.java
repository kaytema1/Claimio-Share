package entities;
// Generated Sep 23, 2012 9:25:44 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Laborders generated by hbm2java
 */
public class Laborders  implements java.io.Serializable {


     private Integer orderid;
     private String patientid;
     private String fromdoc;
     private String todoc;
     private Date orderdate;
     private Date donedate;
     private Boolean viewed;
     private int visitid;
     private boolean done;

    public Laborders() {
    }

	
    public Laborders(String patientid, String fromdoc, Date orderdate, int visitid, boolean done) {
        this.patientid = patientid;
        this.fromdoc = fromdoc;
        this.orderdate = orderdate;
        this.visitid = visitid;
        this.done = done;
    }
    public Laborders(String patientid, String fromdoc, String todoc, Date orderdate, Date donedate, Boolean viewed, int visitid, boolean done) {
       this.patientid = patientid;
       this.fromdoc = fromdoc;
       this.todoc = todoc;
       this.orderdate = orderdate;
       this.donedate = donedate;
       this.viewed = viewed;
       this.visitid = visitid;
       this.done = done;
    }
   
    public Integer getOrderid() {
        return this.orderid;
    }
    
    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }
    public String getPatientid() {
        return this.patientid;
    }
    
    public void setPatientid(String patientid) {
        this.patientid = patientid;
    }
    public String getFromdoc() {
        return this.fromdoc;
    }
    
    public void setFromdoc(String fromdoc) {
        this.fromdoc = fromdoc;
    }
    public String getTodoc() {
        return this.todoc;
    }
    
    public void setTodoc(String todoc) {
        this.todoc = todoc;
    }
    public Date getOrderdate() {
        return this.orderdate;
    }
    
    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }
    public Date getDonedate() {
        return this.donedate;
    }
    
    public void setDonedate(Date donedate) {
        this.donedate = donedate;
    }
    public Boolean getViewed() {
        return this.viewed;
    }
    
    public void setViewed(Boolean viewed) {
        this.viewed = viewed;
    }
    public int getVisitid() {
        return this.visitid;
    }
    
    public void setVisitid(int visitid) {
        this.visitid = visitid;
    }
    public boolean isDone() {
        return this.done;
    }
    
    public void setDone(boolean done) {
        this.done = done;
    }




}


