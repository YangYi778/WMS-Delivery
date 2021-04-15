package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BatchRule;

/**
 * 批次规则Service接口
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public interface IBatchRuleService 
{
    /**
     * 查询批次规则
     * 
     * @param id 批次规则ID
     * @return 批次规则
     */
    public BatchRule selectBatchRuleById(Long id);

    /**
     * 查询批次规则列表
     * 
     * @param batchRule 批次规则
     * @return 批次规则集合
     */
    public List<BatchRule> selectBatchRuleList(BatchRule batchRule);

    /**
     * 新增批次规则
     * 
     * @param batchRule 批次规则
     * @return 结果
     */
    public int insertBatchRule(BatchRule batchRule);

    /**
     * 修改批次规则
     * 
     * @param batchRule 批次规则
     * @return 结果
     */
    public int updateBatchRule(BatchRule batchRule);

    /**
     * 批量删除批次规则
     * 
     * @param ids 需要删除的批次规则ID
     * @return 结果
     */
    public int deleteBatchRuleByIds(Long[] ids);

    /**
     * 删除批次规则信息
     * 
     * @param id 批次规则ID
     * @return 结果
     */
    public int deleteBatchRuleById(Long id);
}
