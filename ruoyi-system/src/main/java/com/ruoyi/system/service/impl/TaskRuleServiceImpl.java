package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TaskRuleMapper;
import com.ruoyi.system.domain.TaskRule;
import com.ruoyi.system.service.ITaskRuleService;

/**
 * 任务规则Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@Service
public class TaskRuleServiceImpl implements ITaskRuleService 
{
    @Autowired
    private TaskRuleMapper taskRuleMapper;

    /**
     * 查询任务规则
     * 
     * @param id 任务规则ID
     * @return 任务规则
     */
    @Override
    public TaskRule selectTaskRuleById(Long id)
    {
        return taskRuleMapper.selectTaskRuleById(id);
    }

    /**
     * 查询任务规则列表
     * 
     * @param taskRule 任务规则
     * @return 任务规则
     */
    @Override
    public List<TaskRule> selectTaskRuleList(TaskRule taskRule)
    {
        return taskRuleMapper.selectTaskRuleList(taskRule);
    }

    /**
     * 新增任务规则
     * 
     * @param taskRule 任务规则
     * @return 结果
     */
    @Override
    public int insertTaskRule(TaskRule taskRule)
    {
        taskRule.setCreateTime(DateUtils.getNowDate());
        return taskRuleMapper.insertTaskRule(taskRule);
    }

    /**
     * 修改任务规则
     * 
     * @param taskRule 任务规则
     * @return 结果
     */
    @Override
    public int updateTaskRule(TaskRule taskRule)
    {
        taskRule.setUpdateTime(DateUtils.getNowDate());
        return taskRuleMapper.updateTaskRule(taskRule);
    }

    /**
     * 批量删除任务规则
     * 
     * @param ids 需要删除的任务规则ID
     * @return 结果
     */
    @Override
    public int deleteTaskRuleByIds(Long[] ids)
    {
        return taskRuleMapper.deleteTaskRuleByIds(ids);
    }

    /**
     * 删除任务规则信息
     * 
     * @param id 任务规则ID
     * @return 结果
     */
    @Override
    public int deleteTaskRuleById(Long id)
    {
        return taskRuleMapper.deleteTaskRuleById(id);
    }
}
