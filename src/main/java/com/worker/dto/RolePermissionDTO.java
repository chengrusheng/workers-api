package com.worker.dto;

import lombok.Data;

import java.util.List;

@Data
public class RolePermissionDTO {

    private Long roleId;//角色编号
    private List<Long> list;//权限菜单ID集合
}
