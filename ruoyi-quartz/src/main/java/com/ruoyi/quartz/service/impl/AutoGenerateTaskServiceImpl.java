package com.ruoyi.quartz.service.impl;

import com.ruoyi.quartz.mapper.AutoGenerateTaskMapper;
import com.ruoyi.quartz.service.AutoGenerateTaskService;
import com.ruoyi.common.utils.AutoGenerate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 万恶de亚撒西 on 2021/4/2.
 */
@Service("autoGenerateTaskService")
public class AutoGenerateTaskServiceImpl implements AutoGenerateTaskService {

    @Autowired
    private AutoGenerateTaskMapper autoGenerateTaskMapper;

    @Autowired
    private AutoGenerate autoGenerate;

    @Override
    public void autoGenerateBatch(Integer orderQty, Integer goodQty, Integer minuteRange) {
        //生成规则判断——订单数、商品数、时间范围（判断条件优先级依次下降）
        //订单数判断————查询已受理的订单数
        List<String> confirmOrderNoList = autoGenerateTaskMapper.getConfirmOrderQty();
        Integer confirmGoodQty = autoGenerateTaskMapper.getConfirmGoodQty();
        List<String> minuteOrderNoList = autoGenerateTaskMapper.getMinuteRangeOrderQty(minuteRange);


        /**
         * 第一条件满足，后续判断是否会更新前者生成批次？？——串行判断
         */
        //订单数量和商品数量阈值为第一判定条件
        if(confirmOrderNoList.size() >= orderQty || confirmGoodQty >= goodQty){
            //将查到的订单编号批量插入批次号，生成批次，更新状态
            String batchNo = autoGenerate.generateBatchNo();
            autoGenerateTaskMapper.updateBatchNo(confirmOrderNoList, batchNo);
        } else if(minuteOrderNoList.size() > 0) {
            //时间阈值为第二判定条件
            //时间范围判断————查询已受理，且更新时间大于给定时间范围的订单
            autoGenerateTaskMapper.updateBatchNo(minuteOrderNoList, autoGenerate.generateBatchNo());
        }
    }
}
