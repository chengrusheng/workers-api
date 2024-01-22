package com.worker.vo.query;

import com.worker.entity.Worker;
import lombok.Data;

/**
 * 职工查询vo
 * @author chengrusheng
 */
@Data
public class WorkerQueryVo extends Worker {

    /**
     * 当前页码
     */
    private Long pageNo = 1L;

    /**
     * 每页显示数量
     */
    private Long pageSize = 10L;
}
