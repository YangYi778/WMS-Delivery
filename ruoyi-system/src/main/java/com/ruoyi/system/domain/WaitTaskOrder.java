package com.ruoyi.system.domain;

/**
 * Created by 万恶de亚撒西 on 2021/3/29.
 */

public class WaitTaskOrder {

    private Integer orderStatus;
    private Integer orderNum;


    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    @Override
    public String toString() {
        return "WaitTaskOrder{" +
                ", orderStatus=" + orderStatus +
                ", orderNum=" + orderNum +
                '}';
    }
}
