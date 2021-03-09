package com.larry.service;

import com.larry.dao.ArticleMapper;
import com.larry.pojo.Article;
import com.larry.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-03 13:12
 */
@Service
public class ArticleServerImpl implements ArticleServer {
    @Autowired
    @Qualifier("articleMapper")
    private ArticleMapper articleMapper;

    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }

    @Override
    public Map<String, Object> queryArticleById(int id) {
        return articleMapper.queryArticleById(id);
    }

    @Override
    public List<Map<String, Object>> queryArticle(String id, String title, String username, String type,int page, int limit) {
        System.err.println("title==="+title);
        int offset = (page - 1) * limit ;
        List<Map<String, Object>> articleList = articleMapper.queryArticle(id, title, username,type, offset, limit);
        /* 由于jackjson会把时间类型的转化为时间戳，所以我们需要手动转为String类型的 */
        for (Map<String, Object> articleMap: articleList) {
            String create_time = JsonUtils.getJson(articleMap.get("create_time")).replaceAll("\"", "");
            articleMap.put("create_time", create_time);
        }
        return articleList;
    }

    @Override
    public int queryArticleCount() {
        return articleMapper.queryArticleCount();
    }

    @Override
    public List<Map<String, Object>> articleTypeList() {
        return articleMapper.articleTypeList();
    }

    @Override
    public int insertArticle(Article article) {
        return articleMapper.insertArticle(article);
    }

    @Override
    public int deleteArticleById(int id) {
        return articleMapper.deleteArticleById(id);
    }

    @Override
    public int updateArticle(Article article) {
        return articleMapper.updateArticle(article);
    }
}
