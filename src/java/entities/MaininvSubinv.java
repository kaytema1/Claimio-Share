package entities;
// Generated Sep 24, 2012 7:21:11 PM by Hibernate Tools 3.2.1.GA



/**
 * MaininvSubinv generated by hbm2java
 */
public class MaininvSubinv  implements java.io.Serializable {


     private Integer maininvSubinvId;
     private int maininvId;
     private int subinvId;

    public MaininvSubinv() {
    }

    public MaininvSubinv(int maininvId, int subinvId) {
       this.maininvId = maininvId;
       this.subinvId = subinvId;
    }
   
    public Integer getMaininvSubinvId() {
        return this.maininvSubinvId;
    }
    
    public void setMaininvSubinvId(Integer maininvSubinvId) {
        this.maininvSubinvId = maininvSubinvId;
    }
    public int getMaininvId() {
        return this.maininvId;
    }
    
    public void setMaininvId(int maininvId) {
        this.maininvId = maininvId;
    }
    public int getSubinvId() {
        return this.subinvId;
    }
    
    public void setSubinvId(int subinvId) {
        this.subinvId = subinvId;
    }




}


