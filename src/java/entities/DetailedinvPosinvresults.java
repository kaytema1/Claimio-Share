package entities;
// Generated Sep 23, 2012 9:25:44 AM by Hibernate Tools 3.2.1.GA



/**
 * DetailedinvPosinvresults generated by hbm2java
 */
public class DetailedinvPosinvresults  implements java.io.Serializable {


     private Integer detailedinvPosinvresultId;
     private int detailedinvId;
     private int posinvresultId;

    public DetailedinvPosinvresults() {
    }

    public DetailedinvPosinvresults(int detailedinvId, int posinvresultId) {
       this.detailedinvId = detailedinvId;
       this.posinvresultId = posinvresultId;
    }
   
    public Integer getDetailedinvPosinvresultId() {
        return this.detailedinvPosinvresultId;
    }
    
    public void setDetailedinvPosinvresultId(Integer detailedinvPosinvresultId) {
        this.detailedinvPosinvresultId = detailedinvPosinvresultId;
    }
    public int getDetailedinvId() {
        return this.detailedinvId;
    }
    
    public void setDetailedinvId(int detailedinvId) {
        this.detailedinvId = detailedinvId;
    }
    public int getPosinvresultId() {
        return this.posinvresultId;
    }
    
    public void setPosinvresultId(int posinvresultId) {
        this.posinvresultId = posinvresultId;
    }




}


