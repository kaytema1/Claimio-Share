package entities;
// Generated Sep 23, 2012 9:25:44 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Dosagemonitor generated by hbm2java
 */
public class Dosagemonitor  implements java.io.Serializable {


     private Integer id;
     private int visitid;
     private int patienttreatmentid;
     private String morning;
     private String afternoon;
     private String evening;
     private Date givenday;

    public Dosagemonitor() {
    }

	
    public Dosagemonitor(int visitid, int patienttreatmentid) {
        this.visitid = visitid;
        this.patienttreatmentid = patienttreatmentid;
    }
    public Dosagemonitor(int visitid, int patienttreatmentid, String morning, String afternoon, String evening, Date givenday) {
       this.visitid = visitid;
       this.patienttreatmentid = patienttreatmentid;
       this.morning = morning;
       this.afternoon = afternoon;
       this.evening = evening;
       this.givenday = givenday;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public int getVisitid() {
        return this.visitid;
    }
    
    public void setVisitid(int visitid) {
        this.visitid = visitid;
    }
    public int getPatienttreatmentid() {
        return this.patienttreatmentid;
    }
    
    public void setPatienttreatmentid(int patienttreatmentid) {
        this.patienttreatmentid = patienttreatmentid;
    }
    public String getMorning() {
        return this.morning;
    }
    
    public void setMorning(String morning) {
        this.morning = morning;
    }
    public String getAfternoon() {
        return this.afternoon;
    }
    
    public void setAfternoon(String afternoon) {
        this.afternoon = afternoon;
    }
    public String getEvening() {
        return this.evening;
    }
    
    public void setEvening(String evening) {
        this.evening = evening;
    }
    public Date getGivenday() {
        return this.givenday;
    }
    
    public void setGivenday(Date givenday) {
        this.givenday = givenday;
    }




}


