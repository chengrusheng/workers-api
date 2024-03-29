package com.worker.vo.query;

import com.worker.entity.Role;
import lombok.Data;

/**
 * 角色查询条件
 * @author chengrusheng
 */
@Data
public class RoleQueryVo extends Role {

    /**
     * 当前页码
     */
    private Long pageNo = 1L;

    /**
     * 每页显示数量
     */
    private Long pageSize = 10L;

    /**
     * 用户ID
     */
    private Long userId;
}
