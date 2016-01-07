
package com.arpit.classes;

/**
 *
 * @author megha
 */
public class UserBean {
    private String firstName, lastName, email, password, id, gender, birthday;

    private boolean isValid = false;
    
    //Setter methods
    public void setFirstName(String firstName){
        this.firstName = firstName;
    }
    public void setLastName(String lastName){
        this.lastName = lastName;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public void setPassword(String password){
        this.password = password;
    }
    public void setIsValid(boolean isValid){
        this.isValid = isValid;
    }
    public void setId(String id){
        this.id = id;
    }
    public void setGender(String gender){
        this.gender = gender;
    }
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    
    //Getter methods
    public String getFirstName(){
        return firstName;
    }
    public String getLastName(){
        return lastName;
    }
    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }
    public boolean getIsValid(){
        return isValid;
    }
    public String getId(){
        return id;
    }
    public String getGender(){
        return gender;
    }
     public String getBirthday() {
        return birthday;
    }
}
