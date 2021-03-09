package com.larry.dao;

import com.larry.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author larry
 * @create 2021-03-01 8:58
 */
public interface BooksMapper {
    int insertBooks(Books books);

    int deleteById(@Param("bookID") int id);

    int updateBooks(Books books);

    Books queryBooksById(@Param("bookID") int id);

    List<Books> queryBooksByName(@Param("bookName") String bookName);

    List<Books> queryBooks();
}
