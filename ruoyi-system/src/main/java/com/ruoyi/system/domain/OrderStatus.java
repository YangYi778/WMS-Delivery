package com.ruoyi.system.domain;

/**
 * Created by 万恶de亚撒西 on 2021/3/31.
 */
public class OrderStatus {

    private Integer orderStatus;

    private Integer orderNum;




    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return "OrderStatus{" +
                "orderStatus=" + orderStatus +
                ", orderNum=" + orderNum +
                '}';
    }
}
