package com.larry.controller;

import com.larry.pojo.Article;
import com.larry.pojo.User;
import com.larry.utils.WebUtils;
import com.larry.service.ArticleServerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-03 13:13
 */
@Controller
public class ArticleController {
    @Autowired
    private ArticleServerImpl articleServerImpl;

    /**
     * 跳转 home页面
     * @param model
     * @return
     */
    @RequestMapping("/home")
    public String gotoHome(Model model, HttpSession session) {
        return  "home";
    }

    /**
     * 搜索 分頁查詢 文章列表
     * @param id 文章id
     * @param title 文章title
     * @param username 作者
     * @param type
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/getArticleList")
    @ResponseBody
    public Map<String, Object> getArticleList(String id, String title, String username, String type, String page, String limit, HttpSession session) {
        int intPage = WebUtils.parseInt(page, 1);
        int intLimit = WebUtils.parseInt(limit, 10);
        // 通过分页查询文章
        List<Map<String, Object>> articles = articleServerImpl.queryArticle(id, title, username, type,intPage, intLimit);
        // 查询文章总条数
        int count = articleServerImpl.queryArticleCount();

        HashMap hashMap = new HashMap();
        hashMap.put("code", 0);
        hashMap.put("data", articles);
        hashMap.put("count", count);
        return  hashMap;
    }

    /**
     * 编辑文章
     * @param model
     * @return
     */
    @RequestMapping("/edit/{articleId}")
    public String edit(@PathVariable("articleId") String id, Model model) {
        int articleId = WebUtils.parseInt(id, 0);
        Map<String, Object> article = articleServerImpl.queryArticleById(articleId);
        List<Map<String, Object>> articleTypeList = articleServerImpl.articleTypeList();
        model.addAttribute("articleTypeList", articleTypeList);
        model.addAttribute("article", article);
        model.addAttribute("type", "edit");
        return "edit";
    }

    /**
     * 添加文章
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String add(Model model) {
        List<Map<String, Object>> articleTypeList = articleServerImpl.articleTypeList();
        model.addAttribute("articleTypeList", articleTypeList);
        model.addAttribute("type", "add");
        return "edit";
    }

    @RequestMapping("/addArticle")
    @ResponseBody
    public Map<String, Object> addArticle(Article article) {
        System.err.println("插入前=="+article);
        int i = articleServerImpl.insertArticle(article);
        System.err.println("插后前=="+article);
        HashMap<String, Object> map = new HashMap<>();
        if (i >= 1) {
            map.put("code", 200);
            map.put("msg", "插入成功");
            map.put("id", article.getId());
        } else {
            map.put("code", "插入失败");
        }
        return map;
    }

    @RequestMapping("/editArticle")
    @ResponseBody
    public Map<String, Object> editArticle(Article article) {
        int i = articleServerImpl.updateArticle(article);
        HashMap<String, Object> map = new HashMap<>();
        if (i >= 1) {
            map.put("code", 200);
            map.put("msg", "修改成功");
        } else {
            map.put("code", "修改失败");
        }
        return map;
    }

    @RequestMapping("/deleteArticle")
    @ResponseBody
    public Map<String, Object> deleteArticle(String id) {
        int articleId = WebUtils.parseInt(id, 0);
        int i = articleServerImpl.deleteArticleById(articleId);
        HashMap<String, Object> map = new HashMap<>();
        if (i >= 1) {
            map.put("code", 200);
            map.put("msg", "删除成功");
        } else {
            map.put("code", "删除失败");
        }
        return map;
    }
}
