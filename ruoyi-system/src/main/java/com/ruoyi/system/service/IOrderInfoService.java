package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.OrderInfo;

/**
 * 订单管理Service接口
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public interface IOrderInfoService 
{
    /**
     * 查询订单管理
     * 
     * @param id 订单管理ID
     * @return 订单管理
     */
    public OrderInfo selectOrderInfoById(Long id);

    /**
     * 查询订单管理列表
     * 
     * @param orderInfo 订单管理
     * @return 订单管理集合
     */
    public List<OrderInfo> selectOrderInfoList(OrderInfo orderInfo);

    /**
     * 新增订单管理
     * 
     * @param orderInfo 订单管理
     * @return 结果
     */
    public int insertOrderInfo(OrderInfo orderInfo);

    /**
     * 修改订单管理
     * 
     * @param orderInfo 订单管理
     * @return 结果
     */
    public int updateOrderInfo(OrderInfo orderInfo);

    /**
     * 批量删除订单管理
     * 
     * @param ids 需要删除的订单管理ID
     * @return 结果
     */
    public int deleteOrderInfoByIds(Long[] ids);

    /**
     * 删除订单管理信息
     * 
     * @param id 订单管理ID
     * @return 结果
     */
    public int deleteOrderInfoById(Long id);


    /**
     * 订单受理
     * @param orders 订单管理ID
     * @return 结果
     */
    public int orderConfirm(String[] orders);

    public int orderBatchGenerate(String[] orders);



}
