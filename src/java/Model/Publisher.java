/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DPV
 */
public class Publisher {

    private String PublisherID;
    private String PublisherName;
    private String PublisherAddress;
    private String PublisherEmail;

    public Publisher() {
    }

    public Publisher(String PublisherID, String PublisherName, String PublisherAddress, String PublisherEmail) {
        this.PublisherID = PublisherID;
        this.PublisherName = PublisherName;
        this.PublisherAddress = PublisherAddress;
        this.PublisherEmail = PublisherEmail;
    }

    public String getPublisherID() {
        return PublisherID;
    }

    public void setPublisherID(String PublisherID) {
        this.PublisherID = PublisherID;
    }

    public String getPublisherName() {
        return PublisherName;
    }

    public void setPublisherName(String PublisherName) {
        this.PublisherName = PublisherName;
    }

    public String getPublisherAddress() {
        return PublisherAddress;
    }

    public void setPublisherAddress(String PublisherAddress) {
        this.PublisherAddress = PublisherAddress;
    }

    public String getPublisherEmail() {
        return PublisherEmail;
    }

    public void setPublisherEmail(String PublisherEmail) {
        this.PublisherEmail = PublisherEmail;
    }

    @Override
    public String toString() {
        return "Publisher{" + "PublisherID=" + PublisherID + ", PublisherName=" + PublisherName + ", PublisherAddress=" + PublisherAddress + ", PublisherEmail=" + PublisherEmail + '}';
    }

}
