package entities;
// Generated Sep 19, 2012 1:13:50 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Post generated by hbm2java
 */
public class Post  implements java.io.Serializable {


     private Integer id;
     private Date date;
     private String firstName;
     private String lastName;
     private String address;
     private String tellNumber;
     private String itemSupplied;
     private int quantity;

    public Post() {
    }

    public Post(Date date, String firstName, String lastName, String address, String tellNumber, String itemSupplied, int quantity) {
       this.date = date;
       this.firstName = firstName;
       this.lastName = lastName;
       this.address = address;
       this.tellNumber = tellNumber;
       this.itemSupplied = itemSupplied;
       this.quantity = quantity;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getTellNumber() {
        return this.tellNumber;
    }
    
    public void setTellNumber(String tellNumber) {
        this.tellNumber = tellNumber;
    }
    public String getItemSupplied() {
        return this.itemSupplied;
    }
    
    public void setItemSupplied(String itemSupplied) {
        this.itemSupplied = itemSupplied;
    }
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }




}


