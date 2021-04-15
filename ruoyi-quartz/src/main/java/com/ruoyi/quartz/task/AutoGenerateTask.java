package com.ruoyi.quartz.task;

import com.ruoyi.common.config.AutoTaskConfig;
import com.ruoyi.quartz.service.AutoGenerateTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;


/**
 * Created by 万恶de亚撒西 on 2021/4/2.
 */
@Component("autoGenerateTask")
public class AutoGenerateTask {

//    @Autowired
//    private AutoTaskConfig autoTaskConfig;

    @Autowired
    private AutoGenerateTaskService autoGenerateTaskService;

    private static AutoGenerateTaskService autoGenerateTaskService1;

    @PostConstruct
    public void init(){
        autoGenerateTaskService1 = this.autoGenerateTaskService;
    }

    /**
     * 自动生成批次任务
     */
    public void autoGenerateBatch(){
//        System.out.println("orderQty=" + autoTaskConfig.getOrderQty() + ",goodQty = " + autoTaskConfig.getGoodQty() + ", minuteRange = " + autoTaskConfig.getMinuteRange());
        autoGenerateTaskService1.autoGenerateBatch(5,10,10);
        System.out.println("test AutoGenerateBatchTask!!!");
    }
}
