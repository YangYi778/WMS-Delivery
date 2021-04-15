package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BatchRuleMapper;
import com.ruoyi.system.domain.BatchRule;
import com.ruoyi.system.service.IBatchRuleService;

/**
 * 批次规则Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@Service
public class BatchRuleServiceImpl implements IBatchRuleService 
{
    @Autowired
    private BatchRuleMapper batchRuleMapper;

    /**
     * 查询批次规则
     * 
     * @param id 批次规则ID
     * @return 批次规则
     */
    @Override
    public BatchRule selectBatchRuleById(Long id)
    {
        return batchRuleMapper.selectBatchRuleById(id);
    }

    /**
     * 查询批次规则列表
     * 
     * @param batchRule 批次规则
     * @return 批次规则
     */
    @Override
    public List<BatchRule> selectBatchRuleList(BatchRule batchRule)
    {
        return batchRuleMapper.selectBatchRuleList(batchRule);
    }

    /**
     * 新增批次规则
     * 
     * @param batchRule 批次规则
     * @return 结果
     */
    @Override
    public int insertBatchRule(BatchRule batchRule)
    {
        batchRule.setCreateTime(DateUtils.getNowDate());
        return batchRuleMapper.insertBatchRule(batchRule);
    }

    /**
     * 修改批次规则
     * 
     * @param batchRule 批次规则
     * @return 结果
     */
    @Override
    public int updateBatchRule(BatchRule batchRule)
    {
        batchRule.setUpdateTime(DateUtils.getNowDate());
        return batchRuleMapper.updateBatchRule(batchRule);
    }

    /**
     * 批量删除批次规则
     * 
     * @param ids 需要删除的批次规则ID
     * @return 结果
     */
    @Override
    public int deleteBatchRuleByIds(Long[] ids)
    {
        return batchRuleMapper.deleteBatchRuleByIds(ids);
    }

    /**
     * 删除批次规则信息
     * 
     * @param id 批次规则ID
     * @return 结果
     */
    @Override
    public int deleteBatchRuleById(Long id)
    {
        return batchRuleMapper.deleteBatchRuleById(id);
    }
}
