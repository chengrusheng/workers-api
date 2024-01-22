package com.worker.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 登录结果
 * @author HP-PC
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginResult {

    /**
     * 用户编号
     */
    private Long id;

    /**
     * 用户名
     */
    private String username;
    /**
     * 状态码
     */
    private int code;

    /**
     * token令牌
     */
    private String token;

    /**
     * token过期时间
     */
    private Long expireTime;
}
