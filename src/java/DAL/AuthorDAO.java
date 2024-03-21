/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Author;
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
public class AuthorDAO extends BaseDAO<Author> {

    public ArrayList<Author> getListAuthor() {
        ArrayList<Author> listAuthor = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Author ORDER BY AuthorID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Author s = new Author();
                s.setAuthorID(rs.getString("AuthorID"));
                s.setAuthorName(rs.getString("AuthorName"));
                s.setNote(rs.getString("Note"));
                listAuthor.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAuthor;
    }

    public void createAuthor(String authorid, String authorname, String note) {
        try {
            String sql = "INSERT INTO Author (AuthorID, AuthorName, Note) VALUES(?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, authorid);
            statement.setString(2, authorname);
            statement.setString(3, note);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAuthor(String authorid) {
        try {
            String sql = "DELETE Author WHERE AuthorID= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, authorid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editAuthor(String authorid, String authorname, String note) {
        try {
            String sql = "UPDATE Author SET AuthorName = ?, Note = ? WHERE AuthorID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, authorname);
            statement.setString(2, note);
            statement.setString(3, authorid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
