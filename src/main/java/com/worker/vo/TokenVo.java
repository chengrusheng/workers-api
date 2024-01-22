package com.worker.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * tokenVo
 * @author HP-PC
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TokenVo {

    /**
     * 过期时间
     */
    private Long expireTime;

    /**
     * token
     */
    private String token;
}
