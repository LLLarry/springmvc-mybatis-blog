package com.larry.service;

import com.larry.pojo.Article;

import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-03 13:10
 */
public interface ArticleServer {

    Map<String, Object> queryArticleById(int id);

    List<Map<String, Object>> queryArticle(
            String id,
            String title,
            String usernmae,
            String type,
            int page,
            int limit
    );

    int queryArticleCount();

    List<Map<String, Object>> articleTypeList();

    int insertArticle(Article article);

    int deleteArticleById(int id);

    int updateArticle(Article article);
}
