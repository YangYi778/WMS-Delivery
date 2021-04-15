package com.ruoyi.common.utils;

import com.ruoyi.common.config.BaseConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Created by 万恶de亚撒西 on 2021/4/2.
 */
@Component("autoGenerate")
public class AutoGenerate {

    @Autowired
    private BaseConfig baseConfig;

    /**
     * 自动生成批次号方法
     * @return
     */
    public String generateBatchNo(){
        //批次号格式——库房号（6）+时间戳后6位
        StringBuilder batchNo = new StringBuilder();
        batchNo.append(baseConfig.getOrgNo());
        batchNo.append(baseConfig.getWarehouseNo());
        String time = Long.toString(System.currentTimeMillis() / 1000);
        batchNo.append(time.substring(time.length() - 6, time.length()));
        return batchNo.toString();
    }
}
