package entities;
// Generated Sep 23, 2012 9:25:44 AM by Hibernate Tools 3.2.1.GA



/**
 * Clerkingquestion generated by hbm2java
 */
public class Clerkingquestion  implements java.io.Serializable {


     private Integer clerkid;
     private String question;
     private int frequecy;

    public Clerkingquestion() {
    }

    public Clerkingquestion(String question, int frequecy) {
       this.question = question;
       this.frequecy = frequecy;
    }
   
    public Integer getClerkid() {
        return this.clerkid;
    }
    
    public void setClerkid(Integer clerkid) {
        this.clerkid = clerkid;
    }
    public String getQuestion() {
        return this.question;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }
    public int getFrequecy() {
        return this.frequecy;
    }
    
    public void setFrequecy(int frequecy) {
        this.frequecy = frequecy;
    }




}


