package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TaskInfo;
import org.springframework.stereotype.Repository;

/**
 * 任务管理Mapper接口
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
@Repository
public interface TaskInfoMapper 
{
    /**
     * 查询任务管理
     * 
     * @param id 任务管理ID
     * @return 任务管理
     */
    public TaskInfo selectTaskInfoById(Long id);

    /**
     * 查询任务管理列表
     * 
     * @param taskInfo 任务管理
     * @return 任务管理集合
     */
    public List<TaskInfo> selectTaskInfoList(TaskInfo taskInfo);

    /**
     * 新增任务管理
     * 
     * @param taskInfo 任务管理
     * @return 结果
     */
    public int insertTaskInfo(TaskInfo taskInfo);

    /**
     * 修改任务管理
     * 
     * @param taskInfo 任务管理
     * @return 结果
     */
    public int updateTaskInfo(TaskInfo taskInfo);

    /**
     * 删除任务管理
     * 
     * @param id 任务管理ID
     * @return 结果
     */
    public int deleteTaskInfoById(Long id);

    /**
     * 批量删除任务管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTaskInfoByIds(Long[] ids);

    public List<String> selectRelatedInfoBatch();

    public List<String> selectRelatedInfoOrder();

    public List<String> selectRelatedInfoSKU(List<String> orderNo);
}
