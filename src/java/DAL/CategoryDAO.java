/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DPV
 */
public class CategoryDAO extends BaseDAO<Category> {

    public ArrayList<Category> getListCategory() {
        ArrayList<Category> listCategory = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Category ORDER BY CategoryID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category s = new Category();
                s.setCategoryID(rs.getString("CategoryID"));
                s.setCategoryName(rs.getString("CategoryName"));
                listCategory.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCategory;
    }

    public void createCategory(String categoryid, String categoryname) {
        try {
            String sql = "INSERT INTO Category (CategoryID, CategoryName) VALUES(?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, categoryid);
            statement.setString(2, categoryname);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCategory(String CategoryID) {
        try {
            String sql = "DELETE Category WHERE CategoryID= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, CategoryID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editCategory(String categoryid, String categoryname) {
        try {
            String sql = "UPDATE Category SET CategoryName = ? WHERE CategoryID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, categoryname);
            statement.setString(2, categoryid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
