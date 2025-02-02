package project.Main;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name = "book_details")
@NamedQueries({
    @NamedQuery(name = "BookDetails.findNewBooks", query = "SELECT b FROM BookDetails b WHERE b.bookCategory = :bookCategory AND b.status = :status ORDER BY b.bookId DESC"),
    @NamedQuery(name = "BookDetails.findOldBooks", query = "SELECT b FROM BookDetails b WHERE b.bookCategory = :bookCategory AND b.status = :status ORDER BY b.bookId DESC")
})
public class BookDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "BOOKID", nullable = false)
    private int bookId;

    @Column(name = "BOOKNAME", nullable = false)
    private String bookName;

    @Column(name = "AUTHOR")
    private String author;

    @Column(name = "PRICE")
    private Double price;

    @Column(name = "BOOKCATEGORY")
    private String bookCategory;

    @Column(name = "STATUS")
    private String status;

    @Column(name = "PHOTONAME")
    private String photoName;

    @Column(name = "EMAIL")
    private String email;

    // Getters and Setters
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

	
    public BookDetails() {}
	
	public BookDetails(String bookName, String author, Double price, String bookCategory, String status,
			String photoName, String email) {
	
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}
    
    
}
