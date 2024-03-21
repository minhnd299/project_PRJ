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
public class InvoiceDetails {

    private String InvoiceID;
    private String BookID;
    private String Note;
    private int Paid;
    private Date PaidDate;

    public InvoiceDetails() {
    }

    public InvoiceDetails(String InvoiceID, String BookID, String Note, int Paid, Date PaidDate) {
        this.InvoiceID = InvoiceID;
        this.BookID = BookID;
        this.Note = Note;
        this.Paid = Paid;
        this.PaidDate = PaidDate;
    }

    public String getInvoiceID() {
        return InvoiceID;
    }

    public void setInvoiceID(String InvoiceID) {
        this.InvoiceID = InvoiceID;
    }

    public String getBookID() {
        return BookID;
    }

    public void setBookID(String BookID) {
        this.BookID = BookID;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public int getPaid() {
        return Paid;
    }

    public void setPaid(int Paid) {
        this.Paid = Paid;
    }

    public Date getPaidDate() {
        return PaidDate;
    }

    public void setPaidDate(Date PaidDate) {
        this.PaidDate = PaidDate;
    }

    @Override
    public String toString() {
        return "InvoiceDetails{" + "InvoiceID=" + InvoiceID + ", BookID=" + BookID + ", Note=" + Note + ", Paid=" + Paid + ", PaidDate=" + PaidDate + '}';
    }

}
