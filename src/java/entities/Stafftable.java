package entities;
// Generated Sep 17, 2012 11:22:58 AM by Hibernate Tools 3.2.1.GA



/**
 * Stafftable generated by hbm2java
 */
public class Stafftable  implements java.io.Serializable {


     private String staffid;
     private String lastname;
     private String othername;
     private String ssn;
     private String gender;
     private String email;
     private String dob;
     private String placeofbirth;
     private String yearofemployment;
     private int role;
     private String extraduty;
     private String address;
     private String contact;
     private String nextofkin;
     private String nextofkincontact;
     private int unit;
     private String imglocation;
     private boolean active;

    public Stafftable() {
    }

	
    public Stafftable(String staffid, String lastname, int role, int unit, boolean active) {
        this.staffid = staffid;
        this.lastname = lastname;
        this.role = role;
        this.unit = unit;
        this.active = active;
    }
    public Stafftable(String staffid, String lastname, String othername, String ssn, String gender, String email, String dob, String placeofbirth, String yearofemployment, int role, String extraduty, String address, String contact, String nextofkin, String nextofkincontact, int unit, String imglocation, boolean active) {
       this.staffid = staffid;
       this.lastname = lastname;
       this.othername = othername;
       this.ssn = ssn;
       this.gender = gender;
       this.email = email;
       this.dob = dob;
       this.placeofbirth = placeofbirth;
       this.yearofemployment = yearofemployment;
       this.role = role;
       this.extraduty = extraduty;
       this.address = address;
       this.contact = contact;
       this.nextofkin = nextofkin;
       this.nextofkincontact = nextofkincontact;
       this.unit = unit;
       this.imglocation = imglocation;
       this.active = active;
    }
   
    public String getStaffid() {
        return this.staffid;
    }
    
    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }
    public String getLastname() {
        return this.lastname;
    }
    
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public String getOthername() {
        return this.othername;
    }
    
    public void setOthername(String othername) {
        this.othername = othername;
    }
    public String getSsn() {
        return this.ssn;
    }
    
    public void setSsn(String ssn) {
        this.ssn = ssn;
    }
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getDob() {
        return this.dob;
    }
    
    public void setDob(String dob) {
        this.dob = dob;
    }
    public String getPlaceofbirth() {
        return this.placeofbirth;
    }
    
    public void setPlaceofbirth(String placeofbirth) {
        this.placeofbirth = placeofbirth;
    }
    public String getYearofemployment() {
        return this.yearofemployment;
    }
    
    public void setYearofemployment(String yearofemployment) {
        this.yearofemployment = yearofemployment;
    }
    public int getRole() {
        return this.role;
    }
    
    public void setRole(int role) {
        this.role = role;
    }
    public String getExtraduty() {
        return this.extraduty;
    }
    
    public void setExtraduty(String extraduty) {
        this.extraduty = extraduty;
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
    public String getNextofkin() {
        return this.nextofkin;
    }
    
    public void setNextofkin(String nextofkin) {
        this.nextofkin = nextofkin;
    }
    public String getNextofkincontact() {
        return this.nextofkincontact;
    }
    
    public void setNextofkincontact(String nextofkincontact) {
        this.nextofkincontact = nextofkincontact;
    }
    public int getUnit() {
        return this.unit;
    }
    
    public void setUnit(int unit) {
        this.unit = unit;
    }
    public String getImglocation() {
        return this.imglocation;
    }
    
    public void setImglocation(String imglocation) {
        this.imglocation = imglocation;
    }
    public boolean isActive() {
        return this.active;
    }
    
    public void setActive(boolean active) {
        this.active = active;
    }




}


