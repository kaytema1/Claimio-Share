package entities;
// Generated Sep 24, 2012 7:21:11 PM by Hibernate Tools 3.2.1.GA



/**
 * Nhistreatment generated by hbm2java
 */
public class Nhistreatment  implements java.io.Serializable {


     private Integer treatmentid;
     private String treatment;
     private double price;
     private String icd10;
     private String gdrg;

    public Nhistreatment() {
    }

	
    public Nhistreatment(String treatment, double price) {
        this.treatment = treatment;
        this.price = price;
    }
    public Nhistreatment(String treatment, double price, String icd10, String gdrg) {
       this.treatment = treatment;
       this.price = price;
       this.icd10 = icd10;
       this.gdrg = gdrg;
    }
   
    public Integer getTreatmentid() {
        return this.treatmentid;
    }
    
    public void setTreatmentid(Integer treatmentid) {
        this.treatmentid = treatmentid;
    }
    public String getTreatment() {
        return this.treatment;
    }
    
    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    public String getIcd10() {
        return this.icd10;
    }
    
    public void setIcd10(String icd10) {
        this.icd10 = icd10;
    }
    public String getGdrg() {
        return this.gdrg;
    }
    
    public void setGdrg(String gdrg) {
        this.gdrg = gdrg;
    }




}


