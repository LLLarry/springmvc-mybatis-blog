package com.larry.service;

import com.larry.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-05 13:43
 */
public interface UserService {

    User queryUserById(int id);

    List<Map<String, Object>> queryUser(String id, String username, String avatar, String email, String sortTime, String sortCount, String limit, String page);

    int updateUserById(User user);

    int deleteUserById(int id);

    int updateAvatarById(int uid, String avatar);

    User checkLogin(User user);

    int queryUserCount();
}
