package entities;
// Generated Sep 23, 2012 9:25:44 AM by Hibernate Tools 3.2.1.GA



/**
 * Patientclerking generated by hbm2java
 */
public class Patientclerking  implements java.io.Serializable {


     private Integer id;
     private int visitid;
     private int questionid;
     private int answerid;

    public Patientclerking() {
    }

    public Patientclerking(int visitid, int questionid, int answerid) {
       this.visitid = visitid;
       this.questionid = questionid;
       this.answerid = answerid;
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
    public int getQuestionid() {
        return this.questionid;
    }
    
    public void setQuestionid(int questionid) {
        this.questionid = questionid;
    }
    public int getAnswerid() {
        return this.answerid;
    }
    
    public void setAnswerid(int answerid) {
        this.answerid = answerid;
    }




}


