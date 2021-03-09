package com.larry.controller;

import com.larry.pojo.Books;
import com.larry.service.BooksServerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * @author larry
 * @create 2021-03-01 11:23
 */
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    @Qualifier("booksServerImpl")
    private BooksServerImpl booksServer;
    @RequestMapping("/allbooks")
    public String allBooks(Model model) {
        List<Books> books = booksServer.queryBooks();
        model.addAttribute("list", books);
        return "allBook";
    }

    @RequestMapping("/addBook")
    public String addBook() {
        return "addBook";
    }

    @RequestMapping("/addBookByBook")
    public String addBookByBook(Books books) {
        int i = booksServer.insertBooks(books);
        return "redirect:/book/allbooks";
    }

    /* 跳转编辑页面 */
    @RequestMapping("/editBookAnTo")
    public String editBookAnTo(int id, Model model) {
        Books books = booksServer.queryBooksById(id);
        model.addAttribute("book", books);
        return "editBook";
    }

    /* 编辑书籍 */
    @RequestMapping("/editBook")
    public String editBook(Books books) {
        int i = booksServer.updateBooks(books);
        return "redirect:/book/allbooks";
    }

    /* 删除图书通过id restFul*/
    @RequestMapping("/deleteBook/{bookID}")
    public String deleteBook(@PathVariable("bookID") int id) {
        int i = booksServer.deleteById(id);
        return "redirect:/book/allbooks";
    }

    @RequestMapping("/searchByName")
    public String searchByName(String bookName, Model model) {
        List<Books> books = booksServer.queryBooksByName(bookName);
        System.err.println("books==>"+books);
        model.addAttribute("list", books);
        model.addAttribute("bookName", bookName);
        return "allBook";
    }

    @ResponseBody
    @RequestMapping("/searchBooksByNameAndAjax")
    public HashMap<Object, Object> searchBooksByNameAndAjax(String bookName) {
        List<Books> books = booksServer.queryBooksByName(bookName);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("code", 200);
        map.put("books", books);
        map.put("msg","請求成功");
        return map;
    }
}
