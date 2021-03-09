package com.larry.service;

import com.larry.pojo.Article;
import com.larry.pojo.Books;

import java.util.List;

/**
 * @author larry
 * @create 2021-03-01 9:25
 */
public interface BooksServer {
    int insertBooks(Books books);

    int deleteById(int id);

    int updateBooks(Books books);

    Books queryBooksById(int id);
    List<Books> queryBooksByName(String name);
    List<Books> queryBooks();
}
