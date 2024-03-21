/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author DPV
 */
public class Invoice {

    private String InvoiceID;
    private String ReaderID;
    private int AccountID;
    private Date BorrowDate;

    public Invoice() {
    }

    public Invoice(String InvoiceID, String ReaderID, int AccountID, Date BorrowDate) {
        this.InvoiceID = InvoiceID;
        this.ReaderID = ReaderID;
        this.AccountID = AccountID;
        this.BorrowDate = BorrowDate;
    }

    public String getInvoiceID() {
        return InvoiceID;
    }

    public void setInvoiceID(String InvoiceID) {
        this.InvoiceID = InvoiceID;
    }

    public String getReaderID() {
        return ReaderID;
    }

    public void setReaderID(String ReaderID) {
        this.ReaderID = ReaderID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public Date getBorrowDate() {
        return BorrowDate;
    }

    public void setBorrowDate(Date BorrowDate) {
        this.BorrowDate = BorrowDate;
    }

    @Override
    public String toString() {
        return "Invoice{" + "InvoiceID=" + InvoiceID + ", ReaderID=" + ReaderID + ", AccountID=" + AccountID + ", BorrowDate=" + BorrowDate + '}';
    }

}
