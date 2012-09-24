package entities;
// Generated Sep 19, 2012 1:13:50 PM by Hibernate Tools 3.2.1.GA



/**
 * Investigation generated by hbm2java
 */
public class Investigation  implements java.io.Serializable {


     private Integer investigationId;
     private String investigation;
     private double price;
     private String icd10;
     private String gdrg;

    public Investigation() {
    }

	
    public Investigation(String investigation, double price) {
        this.investigation = investigation;
        this.price = price;
    }
    public Investigation(String investigation, double price, String icd10, String gdrg) {
       this.investigation = investigation;
       this.price = price;
       this.icd10 = icd10;
       this.gdrg = gdrg;
    }
   
    public Integer getInvestigationId() {
        return this.investigationId;
    }
    
    public void setInvestigationId(Integer investigationId) {
        this.investigationId = investigationId;
    }
    public String getInvestigation() {
        return this.investigation;
    }
    
    public void setInvestigation(String investigation) {
        this.investigation = investigation;
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


