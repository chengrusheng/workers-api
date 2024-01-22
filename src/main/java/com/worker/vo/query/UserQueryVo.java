package com.worker.vo.query;

import com.worker.entity.User;
import lombok.Data;

/**
 * 用户查询vo
 * @author chengrusheng
 */
@Data
public class UserQueryVo extends User {

    /**
     * 当前页码
     */
    private Long pageNo = 1L;

    /**
     * 每页显示数量
     */
    private Long pageSize = 10L;
}
