package com.worker.service;

import com.worker.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author chengrusheng
 * @since 2023-12-20
 */
public interface UserService extends IService<User> {

    /**
     * 根据用户名查询用户信息
     * @param userName
     * @return
     */
    User findUserByUserName(String userName);
}
