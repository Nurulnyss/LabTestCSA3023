package com.model;
public class SessionBean implements java.io.Serializable{
    private int session_id;
    private String student_name;
    private String branch_location;
    private String type;
    private String status;
    
    public SessionBean(){}
    
    public SessionBean(String student_name, String branch_location, String type, String status){
        super();
        this.student_name = student_name;
        this.branch_location = branch_location;
        this.type = type;
        this.status = status;
    }
    
    public SessionBean(int session_id, String student_name, String branch_location, String type, String status) {
        super();
        this.session_id = session_id;
        this.student_name = student_name;
        this.branch_location = branch_location;
        this.type = type;
        this.status = status;
}

    public int getSession_id() {
        return session_id;
    }

    public void setSession_id(int session_id) {
        this.session_id = session_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getBranch_location() {
        return branch_location;
    }

    public void setBranch_location(String branch_location) {
        this.branch_location = branch_location;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    }

 

