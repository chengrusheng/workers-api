package com.worker.service.impl;

import com.worker.entity.Worker;
import com.worker.dao.WorkerMapper;
import com.worker.service.WorkerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 职工表 服务实现类
 * </p>
 *
 * @author chengrusheng
 * @since 2023-12-20
 */
@Service
public class WorkerServiceImpl extends ServiceImpl<WorkerMapper, Worker> implements WorkerService {

}
