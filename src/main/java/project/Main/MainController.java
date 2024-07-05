package project.Main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/")
public class MainController {

//    @Autowired
//    private BookDaoImpl bookDao;
//    
//    @Autowired
//    private BookOrderDaoImpl bookOrderDao;
//    
//    @Autowired
//    private CartDaoImpl cartDao;
//
//    @Autowired
//    private UserDaoImpl userDao;
//    

	@Autowired
	private BookService bookService;
	
	@Autowired
    private IBookDao bookDao;
    
    @Autowired
    private IBookOrderDao bookOrderDao;
    
    @Autowired
    private ICartDao cartDao;

    @Autowired
    private IUserDao userDao;
    
    @GetMapping("/viewBookDetails")
    public String viewBooks(Model model) {
        
        List<BookDetails> books = bookDao.getAllBooks();
        model.addAttribute("books", books);
        return "view_books"; 
    }

   @GetMapping("/all_new_book")
    public String showNewBooks(Model model) {
        
        List<BookDetails> newBooks = bookDao.getNewBooks();
        model.addAttribute("newBooks", newBooks);
        return "all_new_book"; 
    }

   @GetMapping("/all_old_book")
   public String showOldBooks(Model model) {
       
       List<BookDetails> oldBooks = bookDao.getOldBooks();
       model.addAttribute("oldBooks", oldBooks);
       return "all_old_book"; 
   }
   
   @GetMapping("/sell-books")
   public String sellOldBooks(Model model) {
       
       return "sell_book"; 
   }

   
   @GetMapping("/edit-profile")
   public String editProfile(Model model) {
       
       return "edit_profile"; 
   }

   
   @GetMapping("/my-orders")
   public String viewOrders(Model model) {
       
       return "order"; 
   }

  
   @GetMapping("/help-center")
   public String helpCenter(Model model) {
      
       return "helpline"; 
   }
   
   @GetMapping("/setting")
   public String SettingPage(Model model) {
	   return "setting";
   }
   @GetMapping("/loginPage")
   public String LoginPage(Model model) {
	   return "login";
   }
   
   @GetMapping("/registerPage")
   public String RegisterPage(Model model) {
	   return "register";
   }
   
   @GetMapping("/home")
   public String HomePage(Model model) {
	   return "home";
   }
   
   @GetMapping("/addBooks")
   public String AddBook(Model model) {
	   return "add_books";
   }
   
   @GetMapping("/allBooks")
   public String AllBooksPage(Model model) {
	   return "all_books";
   }
   
   @GetMapping("/orders")
   public String AllOrdersPage(Model model) {
	   return "orders";
   }
   @GetMapping("/index")
   public String IndexPage(Model model) {
	   return "index";
   }
   @PostMapping("/search")
   public String SearchPage(Model model) {
	   return "search";
   }
   
   @GetMapping("/checkout")
   public String CheckoutPage(Model model) {
	   return "checkout";
   }
   
   @GetMapping("/edit_books")
   public String Edit_BookPage(Model model) {
	   return "edit_books";
   }
   
   @PostMapping("/add_old_books")
   public String addOldBook(@RequestParam("bname") String bookName,
                            @RequestParam("author") String author,
                            @RequestParam("price") Double price,
                            @RequestParam("bimg") MultipartFile bimg,
                            @RequestParam("user") String userEmail,
                            HttpSession session,
                            Model model) {
       try {
           if (bimg.isEmpty()) {
               session.setAttribute("failMsg", "Please select a file to upload.");
               return "sell_book";
           }

           String fileName = bimg.getOriginalFilename();
           BookDetails bd = new BookDetails(bookName, author, price, "Old Book", "Active", fileName, userEmail);
           boolean msg = bookDao.addBook(bd);

           if (msg) {
               String path = session.getServletContext().getRealPath("") + "book"; 
               File file = new File(path);
               if (!file.exists()) {
                   file.mkdirs();
               }
               bimg.transferTo(new File(file.getAbsolutePath() + File.separator + fileName));

               session.setAttribute("succMsg", "Book Successfully Added");
           } else {
               session.setAttribute("failMsg", "Book Can't be Added");
           }
       } catch (IOException e) {
           session.setAttribute("failMsg", "File upload failed: " + e.getMessage());
       }

       return "sell_book";
   }


    @GetMapping("/delete")
    public String deleteBook(@RequestParam("id") int id, HttpSession session) {
        boolean msg = bookDao.deleteBooks(id);

        if (msg) {
            session.setAttribute("succMsg", "Book Deleted Successfully");
        } else {
            session.setAttribute("failMsg", "Book Can't be Deleted");
        }

        return "all_books";
    }

    @GetMapping("/cart")
    public String addToCart(@RequestParam("bid") int bid,
                            @RequestParam("uid") int uid,
                            HttpSession session) {
        try {
            BookDetails b = bookDao.getBookById(bid);

            if (b != null) {
                Cart c = new Cart();
                c.setBid(bid);
                c.setUserId(uid);
                c.setBookName(b.getBookName());
                c.setAuthor(b.getAuthor());
                c.setPrice(b.getPrice());
                c.setTotalPrice(b.getPrice());
                c.setCategory(b.getBookCategory());

                String status = cartDao.addCart(c);

                if (status.equals("New Book") || status.equals("Old Book")) {
                    session.setAttribute("addCart", "Book Added to Cart");
                } else {
                    session.setAttribute("addCart", "Book Added to Cart");
                }
            } else {
                session.setAttribute("failMsg", "Something went wrong in server");
            }
        } catch (Exception e) {
            session.setAttribute("failMsg", "Error adding to cart: " + e.getMessage());
        }

        return "all_new_book";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        HttpSession session) {
        if ("admin@gmail.com".equalsIgnoreCase(email) && "admin".equals(password)) {
            User user = new User();
            user.setName("Admin");
            session.setAttribute("userObj", user);
            return "home";
        } else {
            User us = userDao.login(email, password);
            if (us != null) {
                session.setAttribute("userObj", us);
                return "index";
            } else {
                session.setAttribute("failMsg", "Email and Password Invalid");
                return "login";
            }
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userObj");
        session.setAttribute("succMsg", "Logout Successfully");
        return "login";
    }

    @PostMapping("/order")
    public String placeOrder(@RequestParam("username") String name,
                             @RequestParam("email") String email,
                             @RequestParam("phno") String phno,
                             @RequestParam("address") String address,
                             @RequestParam("landmark") String landmark,
                             @RequestParam("city") String city,
                             @RequestParam("state") String state,
                             @RequestParam("pincode") String pincode,
                             @RequestParam("payment") String paymentType,
                             @RequestParam("id") int id,
                             HttpSession session) {
        try {
            String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pincode;
            List<Cart> blist = cartDao.getBookByUser(id);

            if (blist.isEmpty()) {
                session.setAttribute("failed", "Add Item");
                return "checkout";
            } else {
                List<Book_Order> orderList = new ArrayList<>();
                Random r = new Random();

                for (Cart c : blist) {
                    Book_Order o = new Book_Order();
                    o.setOrderId("BOOK-ORD-00" + r.nextInt(100));
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhno(phno);
                    o.setFulladd(fullAddress);
                    o.setBookName(c.getBookName());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(String.valueOf(c.getPrice()));
                    o.setPaymentType(paymentType);
                    orderList.add(o);
                }

                if ("noselect".equals(paymentType)) {
                    session.setAttribute("failed", "Please choose a payment method");
                    return "checkout";
                } else {
                    boolean status = bookOrderDao.saveOrder(orderList);
                    if (status) {
                        return "order_success";
                    } else {
                        session.setAttribute("failed", "Order failed.");
                        return "checkout";
                    }
                }
            }
        } catch (Exception e) {
            session.setAttribute("failed", "Order failed: " + e.getMessage());
            return "checkout";
        }
    }

    @PostMapping("/register")
    public String register(@RequestParam("fname") String name,
                           @RequestParam("email") String email,
                           @RequestParam("phno") String phno,
                           @RequestParam("password") String password,
                           @RequestParam(value = "check", required = false) String check,
                           HttpSession session) {
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhno(phno);

        if (check != null) {
            boolean usercheck = userDao.checkUser(email);
            if (!usercheck) {
                boolean status = userDao.userRegister(user);
                if (status) {
                    session.setAttribute("successMsg", "Registration Successful");
                } else {
                    session.setAttribute("failMsg", "Registration Unsuccessful");
                }
            } else {
                session.setAttribute("failMsg", "User Already Exists. Try another email.");
            }
        } else {
            session.setAttribute("failMsg", "Please agree to terms and conditions.");
        }

        return "register";
    }

    @GetMapping("/remove_book")
    public String removeFromCart(@RequestParam("bid") int bid,
                                 @RequestParam("cid") int cid,
                                 @RequestParam("uid") int uid,
                                 HttpSession session) {
        boolean status = cartDao.deleteBook(bid, cid, uid);

        if (status) {
            session.setAttribute("succMsg", "Book Removed from Cart");
        } else {
            session.setAttribute("failed", "Something went wrong with the server");
        }

        return "checkout";
    }

    @PostMapping("/update_profile")
    public String updateProfile(@RequestParam("id") int id,
                                @RequestParam("fname") String name,
                                @RequestParam("email") String email,
                                @RequestParam("phno") String phno,
                                @RequestParam("password") String password,
                                HttpSession session) {
        User us = new User();
        us.setId(id);
        us.setName(name);
        us.setEmail(email);
        us.setPhno(phno);
        us.setPassword(password);

        boolean status = userDao.checkpassword(id, password);

        if (status) {
            boolean msg = userDao.updateProfile(us);
            if (msg) {
                session.setAttribute("succMsg", "Profile Updated Successfully");
            } else {
                session.setAttribute("failMsg", "Server error");
            }
        } else {
            session.setAttribute("failMsg", "Password Incorrect");
        }

        return "edit_profile";
    }
    
    /*--ADMIN PART--*/
    @PostMapping("/add_books")
    public String addBooks(@RequestParam("bname") String bookName,
                           @RequestParam("author") String author,
                           @RequestParam("price") Double price,
                           @RequestParam("bimg") MultipartFile bimg,
                           HttpSession session,
                           Model model) {
        try {
            String fileName = bimg.getOriginalFilename();
            BookDetails bd = new BookDetails(bookName, author, price, "New Book", "Active", fileName, "admin");
            boolean msg = bookDao.addBook(bd);

            if (msg) {
                String path = session.getServletContext().getRealPath("/book");
                File file = new File(path);
                if (!file.exists()) {
                    file.mkdirs();
                }
                bimg.transferTo(new File(file.getAbsolutePath() + File.separator + fileName));

                session.setAttribute("succMsg", "Book Successfully Added");
            } else {
                session.setAttribute("failMsg", "Book Can't be Added");
            }
        } catch (IOException e) {
            session.setAttribute("failMsg", "File upload failed: " + e.getMessage());
        }

        return "add_books";
    }
    
    @PostMapping("/edit_books")
    public String editBooks(@RequestParam("id") int id,
                            @RequestParam("bname") String bookName,
                            @RequestParam("author") String author,
                            @RequestParam("price") Double price,
                            @RequestParam("status") String status,
                            HttpSession session) {
        try {
            BookDetails b = new BookDetails();
            b.setBookId(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setStatus(status);

            boolean msg = bookDao.updateEditBooks(b);
            if (msg) {
                session.setAttribute("succMsg", "Book Updated Successfully");
            } else {
                session.setAttribute("failMsg", "Book Can't be Updated");
            }
        } catch (Exception e) {
            session.setAttribute("failMsg", "Error: " + e.getMessage());
        }

        return "all_books";
    }
    
    
    /*For Image Fetching*/
    
    @GetMapping("/book/{photoName}")
    public void getBookImage(@PathVariable("photoName") String photoName, HttpServletResponse response) throws IOException {
        System.out.println("Fetching image for photoName: " + photoName);
        BookDetails book = bookService.getBookByPhotoName(photoName);
        if (book != null && book.getPhotoName() != null) {
            // Assuming photoName is a URL
            URL url = new URL(book.getPhotoName());
            URLConnection conn = url.openConnection();
            response.setContentType(conn.getContentType());
            try (InputStream inputStream = conn.getInputStream();
                 OutputStream outputStream = response.getOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

}


