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
import com.ruoyi.system.domain.TaskRule;
import com.ruoyi.system.service.ITaskRuleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 任务规则Controller
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@RestController
@RequestMapping("/system/taskRule")
public class TaskRuleController extends BaseController
{
    @Autowired
    private ITaskRuleService taskRuleService;

    /**
     * 查询任务规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskRule:list')")
    @GetMapping("/list")
    public TableDataInfo list(TaskRule taskRule)
    {
        startPage();
        List<TaskRule> list = taskRuleService.selectTaskRuleList(taskRule);
        return getDataTable(list);
    }

    /**
     * 导出任务规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:taskRule:export')")
    @Log(title = "任务规则", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TaskRule taskRule)
    {
        List<TaskRule> list = taskRuleService.selectTaskRuleList(taskRule);
        ExcelUtil<TaskRule> util = new ExcelUtil<TaskRule>(TaskRule.class);
        return util.exportExcel(list, "taskRule");
    }

    /**
     * 获取任务规则详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:taskRule:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(taskRuleService.selectTaskRuleById(id));
    }

    /**
     * 新增任务规则
     */
    @PreAuthorize("@ss.hasPermi('system:taskRule:add')")
    @Log(title = "任务规则", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskRule taskRule)
    {
        return toAjax(taskRuleService.insertTaskRule(taskRule));
    }

    /**
     * 修改任务规则
     */
    @PreAuthorize("@ss.hasPermi('system:taskRule:edit')")
    @Log(title = "任务规则", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskRule taskRule)
    {
        return toAjax(taskRuleService.updateTaskRule(taskRule));
    }

    /**
     * 删除任务规则
     */
    @PreAuthorize("@ss.hasPermi('system:taskRule:remove')")
    @Log(title = "任务规则", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(taskRuleService.deleteTaskRuleByIds(ids));
    }
}
