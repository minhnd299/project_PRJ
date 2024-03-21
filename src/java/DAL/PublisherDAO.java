/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Publisher;
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
public class PublisherDAO extends BaseDAO<Publisher> {

    public ArrayList<Publisher> getListPublisher() {
        ArrayList<Publisher> listPublisher = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Publisher ORDER BY PublisherID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Publisher s = new Publisher();
                s.setPublisherID(rs.getString("PublisherID"));
                s.setPublisherName(rs.getString("PublisherName"));
                s.setPublisherAddress(rs.getString("PublisherAddress"));
                s.setPublisherEmail(rs.getString("PublisherEmail"));
                listPublisher.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPublisher;
    }

    public void createPublisher(String PublisherID, String PublisherName, String PublisherAddress, String PublisherEmail) {
        try {
            String sql = "INSERT INTO Publisher (PublisherID, PublisherName, PublisherAddress, PublisherEmail) VALUES(?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, PublisherID);
            statement.setString(2, PublisherName);
            statement.setString(3, PublisherAddress);
            statement.setString(4, PublisherEmail);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePublisher(String PublisherID) {
        try {
            String sql = "DELETE Publisher WHERE PublisherID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, PublisherID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editPublisher(String PublisherID, String PublisherName, String PublisherAddress, String PublisherEmail) {
        try {
            String sql = "UPDATE Publisher SET PublisherName = ?, PublisherAddress = ?, PublisherEmail = ? WHERE PublisherID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, PublisherName);
            statement.setString(2, PublisherAddress);
            statement.setString(3, PublisherEmail);
            statement.setString(4, PublisherID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
