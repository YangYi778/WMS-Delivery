package com.ruoyi.system.domain.vo;

/**
 * Created by 万恶de亚撒西 on 2021/3/29.
 * 首页信息展示实体
 */
public class IndexInfoVO {

    /**
     * 待受理订单
     */
    private Integer waitOkOrder;
    /**
     * 待分配订单
     */
    private Integer waitAssignOrder;
    /**
     * 待拣货订单
     */
    private Integer waitPickingOrder;
    /**
     * 待复核订单
     */
    private Integer waitCheckOrder;
    /**
     * 待打包订单
     */
    private Integer waitPackageOrder;
    /**
     * 待发货订单
     */
    private Integer waitSendOrder;
    /**
     * 库存商品种类数
     */
    private Integer stockGoodType;
    /**
     * 出库商品总数
     */
    private Integer outboundGoodQty;
    /**
     * 临期产品数
     */
    private Integer expiryGoodQty;
    /**
     * 新增入库
     */
    private Integer newInnerOrder;
    /**
     * 入库完成
     */
    private Integer finInnerOrder;
    /**
     * 新增出库
     */
    private Integer newOutboundOrder;
    /**
     * 出库完成
     */
    private Integer finOutboundOrder;

    public Integer getWaitOkOrder() {
        return waitOkOrder;
    }

    public void setWaitOkOrder(Integer waitOkOrder) {
        this.waitOkOrder = waitOkOrder;
    }

    public Integer getWaitAssignOrder() {
        return waitAssignOrder;
    }

    public void setWaitAssignOrder(Integer waitAssignOrder) {
        this.waitAssignOrder = waitAssignOrder;
    }

    public Integer getWaitPickingOrder() {
        return waitPickingOrder;
    }

    public void setWaitPickingOrder(Integer waitPickingOrder) {
        this.waitPickingOrder = waitPickingOrder;
    }

    public Integer getWaitCheckOrder() {
        return waitCheckOrder;
    }

    public void setWaitCheckOrder(Integer waitCheckOrder) {
        this.waitCheckOrder = waitCheckOrder;
    }

    public Integer getWaitPackageOrder() {
        return waitPackageOrder;
    }

    public void setWaitPackageOrder(Integer waitPackageOrder) {
        this.waitPackageOrder = waitPackageOrder;
    }

    public Integer getWaitSendOrder() {
        return waitSendOrder;
    }

    public void setWaitSendOrder(Integer waitSendOrder) {
        this.waitSendOrder = waitSendOrder;
    }

    public Integer getStockGoodType() {
        return stockGoodType;
    }

    public void setStockGoodType(Integer stockGoodType) {
        this.stockGoodType = stockGoodType;
    }

    public Integer getOutboundGoodQty() {
        return outboundGoodQty;
    }

    public void setOutboundGoodQty(Integer outboundGoodQty) {
        this.outboundGoodQty = outboundGoodQty;
    }

    public Integer getExpiryGoodQty() {
        return expiryGoodQty;
    }

    public void setExpiryGoodQty(Integer expiryGoodQty) {
        this.expiryGoodQty = expiryGoodQty;
    }

    public Integer getNewInnerOrder() {
        return newInnerOrder;
    }

    public void setNewInnerOrder(Integer newInnerOrder) {
        this.newInnerOrder = newInnerOrder;
    }

    public Integer getFinInnerOrder() {
        return finInnerOrder;
    }

    public void setFinInnerOrder(Integer finInnerOrder) {
        this.finInnerOrder = finInnerOrder;
    }

    public Integer getNewOutboundOrder() {
        return newOutboundOrder;
    }

    public void setNewOutboundOrder(Integer newOutboundOrder) {
        this.newOutboundOrder = newOutboundOrder;
    }

    public Integer getFinOutboundOrder() {
        return finOutboundOrder;
    }

    public void setFinOutboundOrder(Integer finOutboundOrder) {
        this.finOutboundOrder = finOutboundOrder;
    }

    @Override
    public String toString() {
        return "IndexInfo{" +
                "waitOkOrder=" + waitOkOrder +
                ", waitAssignOrder=" + waitAssignOrder +
                ", waitPickingOrder=" + waitPickingOrder +
                ", waitCheckOrder=" + waitCheckOrder +
                ", waitPackageOrder=" + waitPackageOrder +
                ", waitSendOrder=" + waitSendOrder +
                ", stockGoodType=" + stockGoodType +
                ", stockGoodQty=" + outboundGoodQty +
                ", expiryGoodQty=" + expiryGoodQty +
                ", newInnerOrder=" + newInnerOrder +
                ", finInnerOrder=" + finInnerOrder +
                ", newOutboundOrder=" + newOutboundOrder +
                ", finOutboundOrder=" + finOutboundOrder +
                '}';
    }
}
