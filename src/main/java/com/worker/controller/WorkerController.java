package com.worker.controller;


import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.worker.entity.Worker;
import com.worker.service.WorkerService;
import com.worker.utils.Result;
import com.worker.vo.query.WorkerQueryVo;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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
//@Api(value = "职工接口", tags = {"职工接口"})
public class WorkerController {

    @Autowired
    private WorkerService workerService;

    /**
     * 分页查询职工列表
     * @param workerQueryVo
     * @return
     */
    @GetMapping("/list")
//    @ApiOperation("分页查询职工列表")
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
//    @ApiOperation("新增职工")
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
//    @ApiOperation("修改职工")
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
//    @ApiOperation("删除职工")
    public Result delete(@PathVariable Long id){
        if(workerService.removeById(id)){
            return Result.ok().message("删除成功");
        }
        return Result.error().message("删除失败");
    }

    @GetMapping("/export")
//    @ApiOperation("导出")
    public void exportExcel(HttpServletResponse response, Worker worker) throws Exception {
        List<Worker> workerList = workerService.list(new QueryWrapper<Worker>()
                .like(StringUtils.isNotEmpty(worker.getEmpName()), "emp_name", worker.getEmpName())
                .eq(StringUtils.isNotEmpty(worker.getDeptName()), "dept_name", worker.getDeptName())
                .eq(StringUtils.isNotEmpty(worker.getEmpDegreeName()), "emp_degree_name", worker.getEmpDegreeName()));
        // 创建Excel文档
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("职工数据", "职工数据"), Worker.class, workerList);

        // 设置响应头信息
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=职工数据.xlsx");

        // 将Excel文档写入响应流中
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

}

