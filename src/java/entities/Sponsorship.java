package entities;
// Generated Sep 24, 2012 7:21:11 PM by Hibernate Tools 3.2.1.GA



/**
 * Sponsorship generated by hbm2java
 */
public class Sponsorship  implements java.io.Serializable {


     private Integer sponshorshipid;
     private String sponsorname;
     private String type;
     private String address;
     private String contact;
     private String email;

    public Sponsorship() {
    }

    public Sponsorship(String sponsorname, String type, String address, String contact, String email) {
       this.sponsorname = sponsorname;
       this.type = type;
       this.address = address;
       this.contact = contact;
       this.email = email;
    }
   
    public Integer getSponshorshipid() {
        return this.sponshorshipid;
    }
    
    public void setSponshorshipid(Integer sponshorshipid) {
        this.sponshorshipid = sponshorshipid;
    }
    public String getSponsorname() {
        return this.sponsorname;
    }
    
    public void setSponsorname(String sponsorname) {
        this.sponsorname = sponsorname;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getContact() {
        return this.contact;
    }
    
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }




}


