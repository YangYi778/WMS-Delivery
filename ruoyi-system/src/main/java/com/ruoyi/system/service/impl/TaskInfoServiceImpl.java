package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.constant.TaskConstants;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TaskInfoMapper;
import com.ruoyi.system.domain.TaskInfo;
import com.ruoyi.system.service.ITaskInfoService;

/**
 * 任务管理Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
@Service
public class TaskInfoServiceImpl implements ITaskInfoService 
{
    @Autowired
    private TaskInfoMapper taskInfoMapper;

    /**
     * 查询任务管理
     * 
     * @param id 任务管理ID
     * @return 任务管理
     */
    @Override
    public TaskInfo selectTaskInfoById(Long id)
    {
        return taskInfoMapper.selectTaskInfoById(id);
    }

    /**
     * 查询任务管理列表
     * 
     * @param taskInfo 任务管理
     * @return 任务管理
     */
    @Override
    public List<TaskInfo> selectTaskInfoList(TaskInfo taskInfo)
    {
        return taskInfoMapper.selectTaskInfoList(taskInfo);
    }

    /**
     * 新增任务管理
     * 
     * @param taskInfo 任务管理
     * @return 结果
     */
    @Override
    public int insertTaskInfo(TaskInfo taskInfo)
    {
        taskInfo.setCreateTime(DateUtils.getNowDate());
        return taskInfoMapper.insertTaskInfo(taskInfo);
    }

    /**
     * 修改任务管理
     * 
     * @param taskInfo 任务管理
     * @return 结果
     */
    @Override
    public int updateTaskInfo(TaskInfo taskInfo)
    {
        taskInfo.setUpdateTime(DateUtils.getNowDate());
        return taskInfoMapper.updateTaskInfo(taskInfo);
    }

    /**
     * 批量删除任务管理
     * 
     * @param ids 需要删除的任务管理ID
     * @return 结果
     */
    @Override
    public int deleteTaskInfoByIds(Long[] ids)
    {
        return taskInfoMapper.deleteTaskInfoByIds(ids);
    }

    /**
     * 删除任务管理信息
     * 
     * @param id 任务管理ID
     * @return 结果
     */
    @Override
    public int deleteTaskInfoById(Long id)
    {
        return taskInfoMapper.deleteTaskInfoById(id);
    }

    @Override
    public List<String> selectRelatedInfo(Integer taskModel) {
        List<String> relatedInfo = null;
        if(TaskConstants.TASK_MODEL_BATCH == taskModel){
            List<String> list = taskInfoMapper.selectRelatedInfoBatch();
            System.out.println(list.toString());
            return list;
        }else {
            relatedInfo = taskInfoMapper.selectRelatedInfoOrder();
            System.out.println(relatedInfo.toString());
            if(TaskConstants.TASK_MODEL_SKU == taskModel){
                return taskInfoMapper.selectRelatedInfoSKU(relatedInfo);
            }
            return relatedInfo;

        }
    }
}
