package com.ruoyi.common.constant;

/**
 * Created by 万恶de亚撒西 on 2021/3/31.
 */
public class OrderConstants {


    /**
     * 订单创建
     */
    public static final Integer ORDER_CREATE_STATUS = 101;

    /**
     * 订单取消
     */
    public static final Integer ORDER_CANCEL_STATUS = 100;

    /**
     * 入库状态：受理、批次、分配
     * 订单受理
     */
    public static final Integer ORDER_OK_STATUS = 201;

    /**
     * 生成批次
     */
    public static final Integer ORDER_BATCH_STATUS = 202;

    /**
     * 任务分配
     */
    public static final Integer ORDER_ASSIGN_STATUS = 203;

    /**
     * 库存状态：进货上架、返库上架、拣货下架
     * 拣货下架
     */
    public static final Integer ORDER_PICKING_STATUS = 301;
    /**
     * 进货上架
     */
    public static final Integer ORDER_PURCHASE_STATUS = 303;
    /**
     * 返库上架
     */
    public static final Integer ORDER_RETURN_STATUS = 302;


    /**
     * 出库状态：复核、复核差异、打包、发货
     * 复核
     */
    public static final Integer ORDER_CHECK_STATUS = 401;

    /**
     * 复核差异
     */
    public static final Integer ORDER_DIFF_STATUS = 402;

    /**
     * 打包
     */
    public static final Integer ORDER_PACKAGE_STATUS = 403;

    /**
     * 发货
     */
    public static final Integer ORDER_SEND_STATUS = 404;

    /**
     * 订单完成
     */
    public static final Integer ORDER_FINISH_STATUS = 1;


}
