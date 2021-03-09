package com.larry.dao;

import com.larry.pojo.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-03 11:49
 */
public interface ArticleMapper {
    /**
     * 通过id查询文章
     * @param id
     * @return
     */
    Map<String, Object> queryArticleById(@Param("id") int id);

    /**
     * 分页查询文章
     * @param offset
     * @param limit
     * @return
     */
    List<Map<String, Object>> queryArticle(
            @Param("id") String id,
            @Param("title") String title,
            @Param("username") String username,
            @Param("type") String type,
            @Param("offset") int offset,
            @Param("limit") int limit
    );

    /**
     * 查询文章总条数
     * @return
     */
    int queryArticleCount();

    /**
     * 查询文章数量通过用户id
     * @param uid
     * @return
     */
    int queryArticleCountByUid(@Param("uid") int uid);

    /**
     * 查询文章类型数据
     * @return
     */
    List<Map<String, Object>> articleTypeList();

    /**
     * 插入文章
     * @param article
     * @return
     */
    int insertArticle(Article article);

    /**
     * 通过id删除文章
     * @param id
     * @return
     */
    int deleteArticleById(@Param("id") int id);

    /**
     * 更新文章通过id
     * @param article
     * @return
     */
    int updateArticle(Article article);
}
