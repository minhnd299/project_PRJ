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

/**
 *
 * @author DPV
 */
public class DashboardDAO extends BaseDAO<Object> {

    public int NumberOfAuthor() {
        try {
            int NumberOfAuthor = 0;
            String sql = "SELECT COUNT(AuthorID) AS NumberOfAuthor FROM Author";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                NumberOfAuthor = rs.getInt("NumberOfAuthor");
            }
            return NumberOfAuthor;
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int NumberOfPublisher() {
        try {
            int NumberOfPublisher = 0;
            String sql = "SELECT COUNT(PublisherID) AS NumberOfPublisher FROM Publisher";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                NumberOfPublisher = rs.getInt("NumberOfPublisher");
            }
            return NumberOfPublisher;
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int NumberOfBook() {
        try {
            int NumberOfBook = 0;
            String sql = "SELECT COUNT(BookID) AS NumberOfBook FROM Book";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                NumberOfBook = rs.getInt("NumberOfBook");
            }
            return NumberOfBook;
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int NumberOfReader() {
        try {
            int NumberOfReader = 0;
            String sql = "SELECT COUNT(ReaderID) AS NumberOfReader FROM Reader";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                NumberOfReader = rs.getInt("NumberOfReader");
            }
            return NumberOfReader;
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int NumberOfCategory() {
        try {
            int NumberOfCategory = 0;
            String sql = "SELECT COUNT(CategoryID) AS NumberOfCategory FROM Category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                NumberOfCategory = rs.getInt("NumberOfCategory");
            }
            return NumberOfCategory;
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
