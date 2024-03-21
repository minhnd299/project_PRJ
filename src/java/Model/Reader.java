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
public class Reader {

    private String ReaderID;
    private String ReaderName;
    private String ReaderAddress;
    private Date ReaderDOB;
    private String ReaderEmail;
    private Date BeginDate;
    private Date ExpirationDate;

    public Reader() {
    }

    public Reader(String ReaderID, String ReaderName, String ReaderAddress, Date ReaderDOB, String ReaderEmail, Date BeginDate, Date ExpirationDate) {
        this.ReaderID = ReaderID;
        this.ReaderName = ReaderName;
        this.ReaderAddress = ReaderAddress;
        this.ReaderDOB = ReaderDOB;
        this.ReaderEmail = ReaderEmail;
        this.BeginDate = BeginDate;
        this.ExpirationDate = ExpirationDate;
    }

    public String getReaderID() {
        return ReaderID;
    }

    public void setReaderID(String ReaderID) {
        this.ReaderID = ReaderID;
    }

    public String getReaderName() {
        return ReaderName;
    }

    public void setReaderName(String ReaderName) {
        this.ReaderName = ReaderName;
    }

    public String getReaderAddress() {
        return ReaderAddress;
    }

    public void setReaderAddress(String ReaderAddress) {
        this.ReaderAddress = ReaderAddress;
    }

    public Date getReaderDOB() {
        return ReaderDOB;
    }

    public void setReaderDOB(Date ReaderDOB) {
        this.ReaderDOB = ReaderDOB;
    }

    public String getReaderEmail() {
        return ReaderEmail;
    }

    public void setReaderEmail(String ReaderEmail) {
        this.ReaderEmail = ReaderEmail;
    }

    public Date getBeginDate() {
        return BeginDate;
    }

    public void setBeginDate(Date BeginDate) {
        this.BeginDate = BeginDate;
    }

    public Date getExpirationDate() {
        return ExpirationDate;
    }

    public void setExpirationDate(Date ExpirationDate) {
        this.ExpirationDate = ExpirationDate;
    }

    @Override
    public String toString() {
        return "Reader{" + "ReaderID=" + ReaderID + ", ReaderName=" + ReaderName + ", ReaderAddress=" + ReaderAddress + ", ReaderDOB=" + ReaderDOB + ", ReaderEmail=" + ReaderEmail + ", BeginDate=" + BeginDate + ", ExpirationDate=" + ExpirationDate + '}';
    }

}
