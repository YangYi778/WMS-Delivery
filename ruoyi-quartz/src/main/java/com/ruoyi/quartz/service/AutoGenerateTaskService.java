package com.ruoyi.quartz.service;

/**
 * Created by 万恶de亚撒西 on 2021/4/2.
 */
public interface AutoGenerateTaskService {

    public void autoGenerateBatch(Integer orderQty, Integer goodQty, Integer minuteRange);
}
