package entities;
// Generated Sep 24, 2012 7:21:11 PM by Hibernate Tools 3.2.1.GA



/**
 * Patientconsultation generated by hbm2java
 */
public class Patientconsultation  implements java.io.Serializable {


     private Integer id;
     private int visitid;
     private int typeid;
     private Double amountpaid;
     private String status;

    public Patientconsultation() {
    }

	
    public Patientconsultation(int visitid, int typeid) {
        this.visitid = visitid;
        this.typeid = typeid;
    }
    public Patientconsultation(int visitid, int typeid, Double amountpaid, String status) {
       this.visitid = visitid;
       this.typeid = typeid;
       this.amountpaid = amountpaid;
       this.status = status;
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
    public int getTypeid() {
        return this.typeid;
    }
    
    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }
    public Double getAmountpaid() {
        return this.amountpaid;
    }
    
    public void setAmountpaid(Double amountpaid) {
        this.amountpaid = amountpaid;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


