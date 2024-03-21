/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DPV
 */
public class Book {

    private String BookID;
    private String BookName;
    private String AuthorID;
    private String CategoryID;
    private String PublisherID;
    private String PublishYear;
    private int Quantity;
    private double Price;

    public Book() {
    }

    public Book(String BookID, String BookName, String AuthorID, String CategoryID, String PublisherID, String PublishYear, int Quantity, double Price) {
        this.BookID = BookID;
        this.BookName = BookName;
        this.AuthorID = AuthorID;
        this.CategoryID = CategoryID;
        this.PublisherID = PublisherID;
        this.PublishYear = PublishYear;
        this.Quantity = Quantity;
        this.Price = Price;
    }

    public String getBookID() {
        return BookID;
    }

    public void setBookID(String BookID) {
        this.BookID = BookID;
    }

    public String getBookName() {
        return BookName;
    }

    public void setBookName(String BookName) {
        this.BookName = BookName;
    }

    public String getAuthorID() {
        return AuthorID;
    }

    public void setAuthorID(String AuthorID) {
        this.AuthorID = AuthorID;
    }

    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getPublisherID() {
        return PublisherID;
    }

    public void setPublisherID(String PublisherID) {
        this.PublisherID = PublisherID;
    }

    public String getPublishYear() {
        return PublishYear;
    }

    public void setPublishYear(String PublishYear) {
        this.PublishYear = PublishYear;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "Book{" + "BookID=" + BookID + ", BookName=" + BookName + ", AuthorID=" + AuthorID + ", CategoryID=" + CategoryID + ", PublisherID=" + PublisherID + ", PublishYear=" + PublishYear + ", Quantity=" + Quantity + ", Price=" + Price + '}';
    }

}
