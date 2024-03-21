/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DPV
 */
public class Author {

    private String AuthorID;
    private String AuthorName;
    private String Note;

    public Author() {
    }

    public Author(String AuthorID, String AuthorName, String Note) {
        this.AuthorID = AuthorID;
        this.AuthorName = AuthorName;
        this.Note = Note;
    }

    public String getAuthorID() {
        return AuthorID;
    }

    public void setAuthorID(String AuthorID) {
        this.AuthorID = AuthorID;
    }

    public String getAuthorName() {
        return AuthorName;
    }

    public void setAuthorName(String AuthorName) {
        this.AuthorName = AuthorName;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    @Override
    public String toString() {
        return "Author{" + "AuthorID=" + AuthorID + ", AuthorName=" + AuthorName + ", Note=" + Note + '}';
    }

}
