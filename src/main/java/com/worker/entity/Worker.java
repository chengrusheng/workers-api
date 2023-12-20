package com.worker.entity;

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
public class Worker implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 职工ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    @JSONField(serializeUsing = ToStringSerializer.class)
    private Long id;

    /**
     * 职员姓名
     */
    private String empName;

    /**
     * 性别
     */
    private String sex;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 学历
     */
    private String empDegreeName;


}
