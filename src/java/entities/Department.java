package entities;
// Generated Sep 17, 2012 11:22:58 AM by Hibernate Tools 3.2.1.GA



/**
 * Department generated by hbm2java
 */
public class Department  implements java.io.Serializable {


     private Integer departmentid;
     private String department;

    public Department() {
    }

    public Department(String department) {
       this.department = department;
    }
   
    public Integer getDepartmentid() {
        return this.departmentid;
    }
    
    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }
    public String getDepartment() {
        return this.department;
    }
    
    public void setDepartment(String department) {
        this.department = department;
    }




}

