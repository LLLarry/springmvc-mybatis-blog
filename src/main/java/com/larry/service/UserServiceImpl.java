package com.larry.service;

import com.larry.dao.ArticleMapper;
import com.larry.dao.UserMapper;
import com.larry.pojo.User;
import com.larry.utils.JsonUtils;
import com.larry.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-05 13:43
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    @Qualifier("userMapper")
    private UserMapper userMapper;
    @Autowired
    @Qualifier("articleMapper")
    private ArticleMapper articleMapper;

    @Override
    public User queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public List<Map<String, Object>> queryUser(String id, String username, String avatar, String email, String sortTime, String sortCount, String limit, String page) {
        int limitInt = WebUtils.parseInt(limit, 10);
        int pageInt = WebUtils.parseInt(page, 1);
        int offset = (pageInt - 1) * limitInt;
        List<Map<String, Object>> users = userMapper.queryUser(id, username, avatar, email, sortTime, sortCount, limitInt, offset);
        for (Map<String, Object> user: users) {
            String timeStr = JsonUtils.getJson(user.get("create_time")).replaceAll("\"", "");
            /* 也可以这样写sql */
            /* SELECT *, count(article.id) count FROM `user` LEFT JOIN article ON `user`.id = article.user_id */;
            user.put("createTime", timeStr);
        }
        return users;
    }

    @Override
    public int updateUserById(User user) {
        return userMapper.updateUserById(user);
    }

    @Override
    public int deleteUserById(int id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public int updateAvatarById(int uid, String avatar) {
        return userMapper.updateAvatarById(uid, avatar);
    }

    @Override
    public User checkLogin(User user) {
        return userMapper.checkLogin(user);
    }

    @Override
    public int queryUserCount() {
        return userMapper.queryUserCount();
    }
}
