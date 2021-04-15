package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TaskRule;

/**
 * 任务规则Mapper接口
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public interface TaskRuleMapper 
{
    /**
     * 查询任务规则
     * 
     * @param id 任务规则ID
     * @return 任务规则
     */
    public TaskRule selectTaskRuleById(Long id);

    /**
     * 查询任务规则列表
     * 
     * @param taskRule 任务规则
     * @return 任务规则集合
     */
    public List<TaskRule> selectTaskRuleList(TaskRule taskRule);

    /**
     * 新增任务规则
     * 
     * @param taskRule 任务规则
     * @return 结果
     */
    public int insertTaskRule(TaskRule taskRule);

    /**
     * 修改任务规则
     * 
     * @param taskRule 任务规则
     * @return 结果
     */
    public int updateTaskRule(TaskRule taskRule);

    /**
     * 删除任务规则
     * 
     * @param id 任务规则ID
     * @return 结果
     */
    public int deleteTaskRuleById(Long id);

    /**
     * 批量删除任务规则
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTaskRuleByIds(Long[] ids);
}
