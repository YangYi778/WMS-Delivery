package com.ruoyi.common.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by 万恶de亚撒西 on 2021/4/2.
 */
@Component
@ConfigurationProperties(prefix = "auto")
public class AutoTaskConfig {

    /**
     * 自动生成任务订单数量阈值
     */
    @Value("${auto.orderQty}")
    private Integer orderQty;
    /**
     * 自动生成任务商品数量阈值
     */
    @Value("${auto.goodQty}")
    private Integer goodQty;
    /**
     * 自动生成任务时间阈值
     */
    @Value("${auto.minuteRange}")
    private Integer minuteRange;

    public Integer getOrderQty() {
        return orderQty;
    }

    public void setOrderQty(Integer orderQty) {
        this.orderQty = orderQty;
    }

    public Integer getGoodQty() {
        return goodQty;
    }

    public void setGoodQty(Integer goodQty) {
        this.goodQty = goodQty;
    }

    public Integer getMinuteRange() {
        return minuteRange;
    }

    public void setMinuteRange(Integer minuteRange) {
        this.minuteRange = minuteRange;
    }

    @Override
    public String toString() {
        return "AutoTaskConfig{" +
                "orderQty=" + orderQty +
                ", goodQty=" + goodQty +
                ", minuteRange=" + minuteRange +
                '}';
    }
}
