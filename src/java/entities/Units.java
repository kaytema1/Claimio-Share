package entities;
// Generated Sep 24, 2012 7:21:11 PM by Hibernate Tools 3.2.1.GA



/**
 * Units generated by hbm2java
 */
public class Units  implements java.io.Serializable {


     private Integer unitid;
     private String unitname;
     private String type;

    public Units() {
    }

    public Units(String unitname, String type) {
       this.unitname = unitname;
       this.type = type;
    }
   
    public Integer getUnitid() {
        return this.unitid;
    }
    
    public void setUnitid(Integer unitid) {
        this.unitid = unitid;
    }
    public String getUnitname() {
        return this.unitname;
    }
    
    public void setUnitname(String unitname) {
        this.unitname = unitname;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }




}


