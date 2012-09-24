package entities;
// Generated Sep 19, 2012 1:13:50 PM by Hibernate Tools 3.2.1.GA



/**
 * Diagnosis generated by hbm2java
 */
public class Diagnosis  implements java.io.Serializable {


     private Integer id;
     private String diagnosisCode;
     private String diagnosis;
     private String gdrg;

    public Diagnosis() {
    }

	
    public Diagnosis(String diagnosisCode, String diagnosis) {
        this.diagnosisCode = diagnosisCode;
        this.diagnosis = diagnosis;
    }
    public Diagnosis(String diagnosisCode, String diagnosis, String gdrg) {
       this.diagnosisCode = diagnosisCode;
       this.diagnosis = diagnosis;
       this.gdrg = gdrg;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getDiagnosisCode() {
        return this.diagnosisCode;
    }
    
    public void setDiagnosisCode(String diagnosisCode) {
        this.diagnosisCode = diagnosisCode;
    }
    public String getDiagnosis() {
        return this.diagnosis;
    }
    
    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }
    public String getGdrg() {
        return this.gdrg;
    }
    
    public void setGdrg(String gdrg) {
        this.gdrg = gdrg;
    }




}


