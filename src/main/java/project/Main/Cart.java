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
@Table(name = "cart")
@NamedQueries({
    @NamedQuery(name = "Cart.findByUserId", query = "FROM Cart WHERE userId = :userId")
})
public class Cart{

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cart_seq")
    @SequenceGenerator(name = "cart_seq", sequenceName = "CART_SEQ", allocationSize = 1)
    @Column(name = "CID")
    private int cid;

    @Column(name = "BID")
    private int bid;

    @Column(name = "USERID")
    private int userId;

    @Column(name = "BOOKNAME")
    private String bookName;

    @Column(name = "AUTHOR")
    private String author;

    @Column(name = "PRICE")
    private Double price;

    @Column(name = "TOTALPRICE")
    private Double totalPrice;

    @Column(name = "CATEGORY")
    private String category;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Cart [cid=" + cid + ", bid=" + bid + ", userId=" + userId + ", bookName=" + bookName + ", author=" + author
                + ", price=" + price + ", totalPrice=" + totalPrice + ", category=" + category + "]";
    }
}

