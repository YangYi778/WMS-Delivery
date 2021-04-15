package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.AutoGenerate;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.OrderInfo;
import com.ruoyi.system.mapper.InnerOrderMapper;
import com.ruoyi.system.mapper.OrderInfoMapper;
import com.ruoyi.system.service.IInnerOrderService;
import com.ruoyi.system.service.IOrderInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单管理Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@Service
public class InnerOrderServiceImpl implements IInnerOrderService
{

    private static final Logger log = LoggerFactory.getLogger(InnerOrderServiceImpl.class);

    @Autowired
    private InnerOrderMapper innerOrderMapper;

    @Autowired
    private AutoGenerate autoGenerate;




    /**
     * 查询订单管理
     * 
     * @param id 订单管理ID
     * @return 订单管理
     */
    @Override
    public OrderInfo selectOrderInfoById(Long id)
    {
        return innerOrderMapper.selectOrderInfoById(id);
    }

    /**
     * 查询订单管理列表
     * 
     * @param orderInfo 订单管理
     * @return 订单管理
     */
    @Override
    public List<OrderInfo> selectOrderInfoList(OrderInfo orderInfo)
    {
        return innerOrderMapper.selectOrderInfoList(orderInfo);
    }

    /**
     * 新增订单管理
     * 
     * @param orderInfo 订单管理
     * @return 结果
     */
    @Override
    public int insertOrderInfo(OrderInfo orderInfo)
    {
        orderInfo.setCreateTime(DateUtils.getNowDate());
        return innerOrderMapper.insertOrderInfo(orderInfo);
    }

    /**
     * 修改订单管理
     * 
     * @param orderInfo 订单管理
     * @return 结果
     */
    @Override
    public int updateOrderInfo(OrderInfo orderInfo)
    {
        orderInfo.setUpdateTime(DateUtils.getNowDate());
        return innerOrderMapper.updateOrderInfo(orderInfo);
    }

    /**
     * 批量删除订单管理
     * 
     * @param ids 需要删除的订单管理ID
     * @return 结果
     */
    @Override
    public int deleteOrderInfoByIds(Long[] ids)
    {
        return innerOrderMapper.deleteOrderInfoByIds(ids);
    }

    /**
     * 删除订单管理信息
     * 
     * @param id 订单管理ID
     * @return 结果
     */
    @Override
    public int deleteOrderInfoById(Long id)
    {
        return innerOrderMapper.deleteOrderInfoById(id);
    }

    @Override
    public int orderConfirm(String[] orders) {
        return innerOrderMapper.orderConfirm(orders);
    }

    @Override
    public int orderBatchGenerate(String[] orders) {
        //1. 生成批次号
        String batchNo = autoGenerate.generateBatchNo();
        log.info("batchNo -->> " + batchNo);
        //2. 绑定批次
        return innerOrderMapper.orderBatchGenerate(batchNo, orders);

    }


}
