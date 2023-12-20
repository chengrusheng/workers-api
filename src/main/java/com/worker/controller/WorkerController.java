package com.worker.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.worker.entity.Role;
import com.worker.entity.Worker;
import com.worker.service.WorkerService;
import com.worker.utils.Result;
import com.worker.vo.query.WorkerQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

/**
 * <p>
 * 职工表 前端控制器
 * </p>
 *
 * @author chengrusheng
 * @since 2023-12-20
 */
@RestController
@RequestMapping("/api/worker")
public class WorkerController {

    @Autowired
    private WorkerService workerService;

    /**
     * 分页查询职工列表
     * @param workerQueryVo
     * @return
     */
    @GetMapping("/list")
    public Result list(WorkerQueryVo workerQueryVo) {
        //创建分页对象
        IPage<Worker> page = new Page<Worker>
                (workerQueryVo.getPageNo(),workerQueryVo.getPageSize());
        QueryWrapper<Worker> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotEmpty(workerQueryVo.getEmpName()), "emp_name", workerQueryVo.getEmpName())
                .eq(StringUtils.isNotEmpty(workerQueryVo.getDeptName()), "dept_name", workerQueryVo.getDeptName())
                .eq(StringUtils.isNotEmpty(workerQueryVo.getEmpDegreeName()), "emp_degree_name", workerQueryVo.getEmpDegreeName());
        return Result.ok(workerService.page(page, queryWrapper));
    }

    /**
     * 新增职工
     * @param worker
     * @return
     */
    @PostMapping("/add")
    public Result add(@RequestBody Worker worker){
        if(workerService.save(worker)){
            return Result.ok().message("新增成功");
        }
        return Result.error().message("新增失败");
    }

    /**
     * 修改职工
     * @param worker
     * @return
     */
    @PutMapping("/update")
    public Result update(@RequestBody Worker worker){
        if(workerService.updateById(worker)){
            return Result.ok().message("编辑成功");
        }
        return Result.error().message("编辑失败");
    }

    /**
     * 删除职工
     * @param id
     * @return
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Long id){
        if(workerService.removeById(id)){
            return Result.ok().message("删除成功");
        }
        return Result.error().message("删除失败");
    }

}

