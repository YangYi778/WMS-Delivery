package com.ruoyi.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by 万恶de亚撒西 on 2021/4/2.
 */
@Component("baseConfig")
@ConfigurationProperties(prefix = "base")
public class BaseConfig {

    /**
     * 机构号
     */
    private Integer orgNo;
    /**
     * 库房号
     */
    private Integer warehouseNo;

    public Integer getOrgNo() {
        return orgNo;
    }

    public void setOrgNo(Integer orgNo) {
        this.orgNo = orgNo;
    }

    public Integer getWarehouseNo() {
        return warehouseNo;
    }

    public void setWarehouseNo(Integer warehouseNo) {
        this.warehouseNo = warehouseNo;
    }
}
