package project.Main;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name = "book_order")
@NamedQueries({
    @NamedQuery(name = "Book_Order.findByEmail", query = "FROM Book_Order WHERE email = :email")
})
public class Book_Order{

    

	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "order_seq")
    @SequenceGenerator(name = "order_seq", sequenceName = "ORDER_SEQ", allocationSize = 1)
    @Column(name = "ID") // Column name matches Oracle table
    private int id;

    @Column(name = "ORDERID") // Column name matches Oracle table
    private String orderId;

    @Column(name = "USERNAME") // Column name matches Oracle table
    private String userName;

    @Column(name = "EMAIL") // Column name matches Oracle table
    private String email;

    @Column(name = "PHNO") // Column name matches Oracle table
    private String phno;

    @Column(name = "FULLADD") // Column name matches Oracle table
    private String fulladd;

    @Column(name = "AUTHOR") // Column name matches Oracle table
    private String author;

    @Column(name = "PRICE") // Column name matches Oracle table
    private String price;

    @Column(name = "BOOKNAME") // Column name matches Oracle table
    private String bookName;

    @Column(name = "PAYMENTTYPE") // Column name matches Oracle table
    private String paymentType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getFulladd() {
        return fulladd;
    }

    public void setFulladd(String fulladd) {
        this.fulladd = fulladd;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public String toString() {
        return "Book_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
                + ", phno=" + phno + ", fulladd=" + fulladd + ", author=" + author + ", price=" + price + ", bookName="
                + bookName + ", paymentType=" + paymentType + "]";
    }
}
