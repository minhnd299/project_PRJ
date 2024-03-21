/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Account;

/**
 *
 * @author MyPC
 */
public class AccountDAO extends BaseDAO<Account> {

    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT * FROM Account where Username = ? and Password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setAccountID(rs.getInt("AccountID"));
                s.setName(rs.getString("Name"));
                s.setDOB(rs.getDate("DOB"));
                s.setAddress(rs.getString("Address"));
                s.setEmail(rs.getString("Email"));
                s.setPhoneNumber(rs.getString("PhoneNumber"));
                s.setUsername(rs.getString("Username"));
                s.setPassword(rs.getString("Password"));
                s.setRole(rs.getInt("Role"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account CheckUsername(String username) {
        try {
            String sql = "SELECT * FROM Account where Username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setAccountID(rs.getInt("AccountID"));
                s.setName(rs.getString("Name"));
                s.setDOB(rs.getDate("DOB"));
                s.setAddress(rs.getString("Address"));
                s.setEmail(rs.getString("Email"));
                s.setPhoneNumber(rs.getString("PhoneNumber"));
                s.setUsername(rs.getString("Username"));
                s.setPassword(rs.getString("Password"));
                s.setRole(rs.getInt("Role"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountToEdit(String AccountID) {
        try {
            String sql = "SELECT * FROM Account where AccountID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, AccountID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setAccountID(rs.getInt("AccountID"));
                s.setName(rs.getString("Name"));
                s.setDOB(rs.getDate("DOB"));
                s.setAddress(rs.getString("Address"));
                s.setEmail(rs.getString("Email"));
                s.setPhoneNumber(rs.getString("PhoneNumber"));
                s.setUsername(rs.getString("Username"));
                s.setPassword(rs.getString("Password"));
                s.setRole(rs.getInt("Role"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Account> getListAccount() {
        ArrayList<Account> listAccount = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account ORDER BY AccountID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setAccountID(rs.getInt("AccountID"));
                s.setUsername(rs.getString("Username"));
                s.setPassword(rs.getString("Password"));
                s.setName(rs.getString("Name"));
                s.setEmail(rs.getString("Email"));
                s.setAddress(rs.getString("Address"));
                s.setDOB(rs.getDate("DOB"));
                s.setPhoneNumber(rs.getString("PhoneNumber"));
                s.setRole(rs.getInt("Role"));
                listAccount.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }

    public void createAccount(String username, String password, String name, String role, String dob, String address, String phonenumber, String email) {
        try {
            String sql = "INSERT INTO Account (Username, Password, Name, Role, DOB, Address, PhoneNumber, Email) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, role);
            statement.setString(5, dob);
            statement.setString(6, address);
            statement.setString(7, phonenumber);
            statement.setString(8, email);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccount(String AccountId) {
        try {
            String sql = "DELETE Account WHERE AccountId= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, AccountId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editAccount(String username, String password, String name, String role, String dob, String address, String phonenumber, String email, String AccountID) {
        try {
            String sql = "UPDATE Account SET Username = ?, Password = ?, Name = ?, Role = ?, DOB = ?, Address = ?, PhoneNumber = ?, Email = ? WHERE AccountID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, role);
            statement.setString(5, dob);
            statement.setString(6, address);
            statement.setString(7, phonenumber);
            statement.setString(8, email);
            statement.setString(9, AccountID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
