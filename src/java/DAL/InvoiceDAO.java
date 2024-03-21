/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Book;
import Model.Cart;
import Model.Invoice;
import Model.InvoiceDetails;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DPV
 */
public class InvoiceDAO extends BaseDAO<Invoice> {

    public Map<String, Cart> getCartBook(String InvoiceID) {
        Map<String, Cart> carts = new LinkedHashMap<>();
        try {
            String sql = "SELECT Bookid FROM InvoiceDetails WHERE InvoiceID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                BookDAO daoBook = new BookDAO();
                Book book = daoBook.getBookToEdit(rs.getString("BookID"));
                Cart newCart = new Cart(book);
                carts.put(rs.getString("BookID"), newCart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return carts;
    }

    public ArrayList<Invoice> getListInvoiceUnPaid() {
        ArrayList<Invoice> listInvoiceUnPaid = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT(a.InvoiceID), ReaderID, AccountID,BorrowDate FROM Invoice as a INNER JOIN InvoiceDetails as b ON a.InvoiceID = b.InvoiceID WHERE Paid = 0 ORDER BY BorrowDate DESC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Invoice s = new Invoice();
                s.setInvoiceID(rs.getString("InvoiceID"));
                s.setReaderID(rs.getString("ReaderID"));
                s.setAccountID(rs.getInt("AccountID"));
                s.setBorrowDate(rs.getDate("BorrowDate"));
                listInvoiceUnPaid.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listInvoiceUnPaid;
    }

    public Invoice getInvoiceUnPaid(String InvoiceID) {
        try {
            String sql = "SELECT DISTINCT(a.InvoiceID), ReaderID, AccountID,BorrowDate FROM Invoice as a INNER JOIN InvoiceDetails as b ON a.InvoiceID = b.InvoiceID WHERE Paid = 0 and a.InvoiceID =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Invoice s = new Invoice();
                s.setInvoiceID(rs.getString("InvoiceID"));
                s.setReaderID(rs.getString("ReaderID"));
                s.setAccountID(rs.getInt("AccountID"));
                s.setBorrowDate(rs.getDate("BorrowDate"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Invoice getInvoice(String InvoiceID) {
        try {
            String sql = "SELECT * FROM Invoice WHERE InvoiceID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Invoice s = new Invoice();
                s.setInvoiceID(rs.getString("InvoiceID"));
                s.setReaderID(rs.getString("ReaderID"));
                s.setAccountID(rs.getInt("AccountID"));
                s.setBorrowDate(rs.getDate("BorrowDate"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<InvoiceDetails> getListInvoiceDetailsUnPaid(String InvoiceID) {
        ArrayList<InvoiceDetails> listInvoiceDetailsUnPaid = new ArrayList<>();
        try {
            String sql = "SELECT a.InvoiceID, BookID, Note, Paid, PaidDate FROM Invoice as a INNER JOIN InvoiceDetails as b on a.InvoiceID = b.InvoiceID WHERE a.InvoiceID =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                InvoiceDetails s = new InvoiceDetails();
                s.setInvoiceID(rs.getString("InvoiceID"));
                s.setBookID(rs.getString("BookID"));
                s.setNote(rs.getString("Note"));
                s.setPaid(rs.getInt("Paid"));
                s.setPaidDate(rs.getDate("PaidDate"));
                listInvoiceDetailsUnPaid.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listInvoiceDetailsUnPaid;
    }

    public void createInvoice(String InvoiceID, String ReaderID, int AccountID, String BorrowDate) {
        try {
            String sql = "INSERT INTO Invoice (InvoiceID, ReaderID, AccountID, BorrowDate) VALUES(?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            statement.setString(2, ReaderID);
            statement.setInt(3, AccountID);
            statement.setString(4, BorrowDate);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createInvoiceDetails(String InvoiceID, Map<String, Cart> carts) {
        try {
            String sql = "INSERT INTO InvoiceDetails(InvoiceID, BookID, Paid) VALUES (?,?,0)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            for (Map.Entry<String, Cart> entry : carts.entrySet()) {
                String key = entry.getKey();
                Cart value = entry.getValue();

                statement.setString(2, value.getBook().getBookID());
                statement.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        InvoiceDAO dao = new InvoiceDAO();
        System.out.println(dao.getListInvoiceDetailsUnPaid("IN1650993352846"));
    }

    public void returnBook(String InvoiceID) {
        try {
            String sql = "UPDATE InvoiceDetails SET Paid = 1, PaidDate = GETDATE() WHERE InvoiceID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteInvoice(String InvoiceID) {
        try {
            String sql = "DELETE Invoice WHERE InvoiceID= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteInvoiceDetails(String InvoiceID) {
        try {
            String sql = "DELETE InvoiceDetails WHERE InvoiceID= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateInvoice(String InvoiceID, String ReaderID, int AccountID, String BorrowDate) {
        try {
            String sql = "UPDATE Invoice SET ReaderID = ?, AccountID = ?, BorrowDate = ? WHERE InvoiceID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, ReaderID);
            statement.setInt(2, AccountID);
            statement.setString(3, BorrowDate);
            statement.setString(4, InvoiceID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
