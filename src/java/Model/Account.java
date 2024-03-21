/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author DPV
 */
public class Account {

    private int AccountID;
    private String Name;
    private Date DOB;
    private String PhoneNumber;
    private String Address;
    private String Email;
    private String Username;
    private String Password;
    private int Role;

    public Account() {
    }

    public Account(int AccountID, String Name, Date DOB, String PhoneNumber, String Address, String Email, String Username, String Password, int Role) {
        this.AccountID = AccountID;
        this.Name = Name;
        this.DOB = DOB;
        this.PhoneNumber = PhoneNumber;
        this.Address = Address;
        this.Email = Email;
        this.Username = Username;
        this.Password = Password;
        this.Role = Role;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }

    @Override
    public String toString() {
        return "Account{" + "AccountID=" + AccountID + ", Name=" + Name + ", DOB=" + DOB + ", PhoneNumber=" + PhoneNumber + ", Address=" + Address + ", Email=" + Email + ", Username=" + Username + ", Password=" + Password + ", Role=" + Role + '}';
    }

}
