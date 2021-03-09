package com.larry.service;

import com.larry.dao.BooksMapper;
import com.larry.pojo.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author larry
 * @create 2021-03-01 9:25
 */
@Service
public class BooksServerImpl implements BooksServer {
    @Autowired
    @Qualifier("booksMapper")
    private BooksMapper booksMapper;

    public void setBooksMapper(BooksMapper booksMapper) {
        this.booksMapper = booksMapper;
    }

    public int insertBooks(Books books) {
        return booksMapper.insertBooks(books);
    }

    public int deleteById(int id) {
        return booksMapper.deleteById(id);
    }

    public int updateBooks(Books books) {
        return booksMapper.updateBooks(books);
    }

    public Books queryBooksById(int id) {
        return booksMapper.queryBooksById(id);
    }

    public List<Books> queryBooksByName(String name) {
        return booksMapper.queryBooksByName(name);
    }

    public List<Books> queryBooks() {
        return booksMapper.queryBooks();
    }
}
