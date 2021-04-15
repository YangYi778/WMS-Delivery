package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.OrderInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 订单管理Mapper接口
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@Repository
public interface OrderInfoMapper 
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
     * 删除订单管理
     * 
     * @param id 订单管理ID
     * @return 结果
     */
    public int deleteOrderInfoById(Long id);

    /**
     * 批量删除订单管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteOrderInfoByIds(Long[] ids);

    /**
     * 批量受理订单
     * @param orders 需要受理的数据ID
     * @return 结果
     */
    public int orderConfirm(String[] orders);


    public int orderBatchGenerate(@Param("batchNo")String batchNo, @Param("orders")String[] orders);

}
