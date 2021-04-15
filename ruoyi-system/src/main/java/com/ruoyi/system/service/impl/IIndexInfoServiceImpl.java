package com.ruoyi.system.service.impl;

import com.ruoyi.common.constant.OrderConstants;
import com.ruoyi.system.domain.IndexInfo;
import com.ruoyi.system.mapper.IndexInfoMapper;
import com.ruoyi.system.mapper.SessionMapper;
import com.ruoyi.system.service.IIndexInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Optional;

/**
 * Created by 万恶de亚撒西 on 2021/3/29.
 */
@Service
public class IIndexInfoServiceImpl implements IIndexInfoService {

    @Autowired
    private IndexInfoMapper indexInfoMapper;

    @Autowired
    private SessionMapper sessionMapper;

    /**
     * 查询首页显示数据
     * @return
     */
    @Override
    public IndexInfo getIndexInfo(Integer day) {
        //1.获取代办事项数据
        Map<Integer, Integer> waitTaskOrderList = sessionMapper.getOrdersGroupByStatus();
        //1.1统计map中主要状态的值
        IndexInfo indexInfo = new IndexInfo();
        indexInfo.setWaitOkOrder(
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_CREATE_STATUS)
                ).orElse(0)
        );
        indexInfo.setWaitAssignOrder(
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_OK_STATUS)
                ).orElse(0)
                +
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_BATCH_STATUS)
                ).orElse(0)
        );
        indexInfo.setWaitPickingOrder(
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_ASSIGN_STATUS)
                ).orElse(0)
        );
        //待复核包括进货上架和拣货下架
        indexInfo.setWaitCheckOrder(
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_PICKING_STATUS)
                ).orElse(0)
                +
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_RETURN_STATUS)
                ).orElse(0)
        );
        indexInfo.setWaitPackageOrder(
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_CHECK_STATUS)
                ).orElse(0)
        );
        indexInfo.setWaitSendOrder(
                Optional.ofNullable(
                        waitTaskOrderList.get(OrderConstants.ORDER_PACKAGE_STATUS)
                ).orElse(0)
        );
        //2.获取库存信息数据
        //2.1获取库存商品种类数
        Integer stockGoodTypeQty = indexInfoMapper.getGoodTypeQty();
        indexInfo.setStockGoodType(stockGoodTypeQty);
        //2.2 获取库存临期商品数
        Integer stockExpiryGoodQty = indexInfoMapper.getExpiryGoodQty();
        indexInfo.setExpiryGoodQty(stockExpiryGoodQty);
        //2.3 获取出库商品数量
        Integer outboundGoodQty = indexInfoMapper.getOutboundGoodQty();
        indexInfo.setOutboundGoodQty(outboundGoodQty);
        //3.获取订单统计数据
        //3.1获取入库新增
        Integer newInnerOrderQty = indexInfoMapper.getNewInnerOrderQty(day);
        indexInfo.setNewInnerOrder(newInnerOrderQty);
        //3.2获取入库完成
        Integer finInnerOrderQty = indexInfoMapper.getFinInnerOrderQty(day);
        indexInfo.setFinInnerOrder(finInnerOrderQty);
        //3.3获取出库新增
        Integer newOutboundOrderQty = indexInfoMapper.getNewOutboundOrderQty(day);
        indexInfo.setNewOutboundOrder(newOutboundOrderQty);
        //3.4获取出库完成
        Integer finOutboundOrderQty = indexInfoMapper.getFinOutboundOrderQty(day);
        indexInfo.setFinOutboundOrder(finOutboundOrderQty);

        return indexInfo;
    }
}
