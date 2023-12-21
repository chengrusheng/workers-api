package com.worker.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 职工表
 * </p>
 *
 * @author chengrusheng
 * @since 2023-12-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("worker")
//@ApiModel("职工信息")
public class Worker implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 职工ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    @JSONField(serializeUsing = ToStringSerializer.class)
//    @ApiModelProperty("id")
    private Long id;

    /**
     * 职员姓名
     */
    @Excel(name = "姓名", orderNum = "0")
//    @ApiModelProperty("姓名")
    private String empName;

    /**
     * 性别
     */
    @Excel(name = "性别", orderNum = "1")
//    @ApiModelProperty("性别")
    private String sex;

    /**
     * 年龄
     */
    @Excel(name = "年龄", orderNum = "2")
//    @ApiModelProperty("年龄")
    private Integer age;

    /**
     * 部门名称
     */
    @Excel(name = "部门名称", orderNum = "3")
//    @ApiModelProperty("部门名称")
    private String deptName;

    /**
     * 学历
     */
    @Excel(name = "学历", orderNum = "4")
//    @ApiModelProperty("学历")
    private String empDegreeName;


}
