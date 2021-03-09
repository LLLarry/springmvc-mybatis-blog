package com.larry.dao;

import com.larry.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-05 10:15
 */
public interface UserMapper {
    /**
     * 通过id查询作者
     * @param id
     * @return
     */
    User queryUserById(@Param("id") int id);

    /**
     * 查询所有的作者
     * @return
     */
    List<Map<String, Object>> queryUser(
            @Param("id") String id,
            @Param("username") String username,
            @Param("avatar") String avatar,
            @Param("email") String email,
            @Param("sortTime") String sortTime,
            @Param("sortCount") String sortCount,
            @Param("limit") int limit,
            @Param("offset") int offset
    );

    /**
     * 更新作者信息
     * @param user
     * @return
     */
    int updateUserById(User user);

    /**
     * 删除作者
     * @param id
     * @return
     */
    int deleteUserById(@Param("id") int id);

    /**
     * 通过用户id更新头像
     * @param uid
     * @param avatar
     * @return
     */
    int updateAvatarById(@Param("id") int uid, @Param("avatar") String avatar);

    /**
     *
     * 处理用户登录
     * @param user
     * @return
     */
    User checkLogin(User user);

    /**
     * 查询用户总条数
     * @return
     */
    int queryUserCount();
}
