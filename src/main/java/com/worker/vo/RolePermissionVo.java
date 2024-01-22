package com.worker.vo;

import com.worker.entity.Permission;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 角色菜单vo
 * @author chengrusheng
 */
@Data
public class RolePermissionVo {

    /**
     * 菜单数据
     */
    private List<Permission> permissionList = new ArrayList<Permission>();
    /**
     * 该角色原有分配的菜单数据
     */
    private Object [] checkList;
}
