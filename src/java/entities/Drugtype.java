package entities;
// Generated Sep 23, 2012 9:25:44 AM by Hibernate Tools 3.2.1.GA



/**
 * Drugtype generated by hbm2java
 */
public class Drugtype  implements java.io.Serializable {


     private int id;
     private String drugType;

    public Drugtype() {
    }

	
    public Drugtype(int id) {
        this.id = id;
    }
    public Drugtype(int id, String drugType) {
       this.id = id;
       this.drugType = drugType;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getDrugType() {
        return this.drugType;
    }
    
    public void setDrugType(String drugType) {
        this.drugType = drugType;
    }




}


