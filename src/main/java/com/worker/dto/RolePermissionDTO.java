package com.worker.dto;

import lombok.Data;

import java.util.List;

/**
 * 角色菜单Dto
 * @author chengrusheng
 */
@Data
public class RolePermissionDTO {

    /**
     * //角色编号
     */
    private Long roleId;

    /**
     * 权限菜单ID集合
     */
    private List<Long> list;
}
