package com.worker.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.worker.dto.RolePermissionDTO;
import com.worker.entity.Role;
import com.worker.service.PermissionService;
import com.worker.service.RoleService;
import com.worker.utils.Result;
import com.worker.vo.RolePermissionVo;
import com.worker.vo.query.RoleQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 角色管理
 *
 * @author chengrusheng
 * @since 2023-12-20
 */
@RestController
@RequestMapping("/api/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    /**
     * 分页查询角色列表
     * @param roleQueryVo
     * @return
     */
    @GetMapping("/list")
    public Result list(RoleQueryVo roleQueryVo){
        //创建分页对象
        IPage<Role> page = new Page<Role>
                (roleQueryVo.getPageNo(),roleQueryVo.getPageSize());
        //调用分页查询方法
        roleService.findRoleListByUserId(page,roleQueryVo);
        //返回数据
        return Result.ok(page);
    }

    /**
     * 新增角色
     * @param role
     * @return
     */
    @PostMapping("/add")
    public Result add(@RequestBody Role role){
        if(roleService.save(role)){
            return Result.ok().message("角色添加成功");
        }
        return Result.error().message("角色添加失败");
    }

    /**
     * 修改角色
     * @param role
     * @return
     */
    @PutMapping("/update")
    public Result update(@RequestBody Role role){
        if(roleService.updateById(role)){
            return Result.ok().message("角色修改成功");
        }
        return Result.error().message("角色修改失败");
    }

    /**
     * 删除角色
     * @param id
     * @return
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Long id){
        if(roleService.deleteRoleById(id)){
            return Result.ok().message("角色删除成功");
        }
        return Result.error().message("角色删除失败");
    }

    @GetMapping("/getAssignPermissionTree")
    public Result getAssignPermissionTree(Long userId, Long roleId) {
        //调用查询权限树数据的方法
        RolePermissionVo permissionTree =
                permissionService.findPermissionTree(userId, roleId);
        //返回数据
        return Result.ok(permissionTree);
    }

    /**
     * 分配权限-保存权限数据
     *
     * @param rolePermissionDTO
     * @return
     */
    @PostMapping("/saveRoleAssign")
    public Result saveRoleAssign(@RequestBody RolePermissionDTO rolePermissionDTO) {
        if (roleService.saveRolePermission(rolePermissionDTO.getRoleId(),
                rolePermissionDTO.getList())) {
            return Result.ok().message("权限分配成功");
        } else {
            return Result.error().message("权限分配失败");
        }
    }

    @GetMapping("/check/{id}")
    public Result check(@PathVariable Long id){
        if(roleService.hashRoleCount(id)) {
            return Result.exist().message("该角色已被使用，无法删除");
        }
        return Result.ok();
    }
}

