package com.worker.dao;

import com.worker.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author chengrusheng
 * @since 2023-12-20
 */
public interface UserMapper extends BaseMapper<User> {

    /**
     * 删除用户角色关系
     * @param userId
     * @return
     */
    @Delete("delete from sys_user_role where user_id=#{userId}")
    int deleteUserRole(Long userId);

    /**
     * 保存用户角色关系
     * @param userId
     * @param roleIds
     * @return
     */
    int saveUserRole(Long userId, List<Long> roleIds);

}
