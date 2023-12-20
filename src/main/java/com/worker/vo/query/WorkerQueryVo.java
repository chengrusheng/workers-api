package com.worker.vo.query;

import com.worker.entity.Worker;
import lombok.Data;

@Data
public class WorkerQueryVo extends Worker {

    private Long pageNo = 1L;//当前页码
    private Long pageSize = 10L;//每页显示数量
}
