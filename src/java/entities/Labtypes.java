package entities;
// Generated Sep 24, 2012 7:21:11 PM by Hibernate Tools 3.2.1.GA



/**
 * Labtypes generated by hbm2java
 */
public class Labtypes  implements java.io.Serializable {


     private Integer labTypeId;
     private String labCode;
     private String labType;

    public Labtypes() {
    }

    public Labtypes(String labCode, String labType) {
       this.labCode = labCode;
       this.labType = labType;
    }
   
    public Integer getLabTypeId() {
        return this.labTypeId;
    }
    
    public void setLabTypeId(Integer labTypeId) {
        this.labTypeId = labTypeId;
    }
    public String getLabCode() {
        return this.labCode;
    }
    
    public void setLabCode(String labCode) {
        this.labCode = labCode;
    }
    public String getLabType() {
        return this.labType;
    }
    
    public void setLabType(String labType) {
        this.labType = labType;
    }




}


