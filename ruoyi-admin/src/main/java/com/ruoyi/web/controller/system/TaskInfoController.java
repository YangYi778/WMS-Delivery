package com.ruoyi.web.controller.system;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.TaskInfo;
import com.ruoyi.system.service.ITaskInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 任务管理Controller
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
@RestController
@RequestMapping("/system/taskMenu")
public class TaskInfoController extends BaseController
{
    @Autowired
    private ITaskInfoService taskInfoService;

    /**
     * 查询任务管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskMenu:list')")
    @GetMapping("/list")
    public TableDataInfo list(TaskInfo taskInfo)
    {
        startPage();
        List<TaskInfo> list = taskInfoService.selectTaskInfoList(taskInfo);
        return getDataTable(list);
    }

    /**
     * 导出任务管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskMenu:export')")
    @Log(title = "任务管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TaskInfo taskInfo)
    {
        List<TaskInfo> list = taskInfoService.selectTaskInfoList(taskInfo);
        ExcelUtil<TaskInfo> util = new ExcelUtil<TaskInfo>(TaskInfo.class);
        return util.exportExcel(list, "taskMenu");
    }

    /**
     * 获取任务管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:taskMenu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(taskInfoService.selectTaskInfoById(id));
    }
    @PreAuthorize("@ss.hasPermi('system:taskMenu:query')")
    @GetMapping("/relatedInfo/{taskModel}")
    public AjaxResult getRelatedInfo(@PathVariable("taskModel") Integer taskModel){
        System.out.println("后台方法：taskModel==" + taskModel);
        return AjaxResult.success(taskInfoService.selectRelatedInfo(taskModel));
    }

    /**
     * 新增任务管理
     */
    @PreAuthorize("@ss.hasPermi('system:taskMenu:add')")
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskInfo taskInfo)
    {
        return toAjax(taskInfoService.insertTaskInfo(taskInfo));
    }

    /**
     * 修改任务管理
     */
    @PreAuthorize("@ss.hasPermi('system:taskMenu:edit')")
    @Log(title = "任务管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskInfo taskInfo)
    {
        return toAjax(taskInfoService.updateTaskInfo(taskInfo));
    }

    /**
     * 删除任务管理
     */
    @PreAuthorize("@ss.hasPermi('system:taskMenu:remove')")
    @Log(title = "任务管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(taskInfoService.deleteTaskInfoByIds(ids));
    }
}
