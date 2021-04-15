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
import com.ruoyi.system.domain.BatchRule;
import com.ruoyi.system.service.IBatchRuleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 批次规则Controller
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@RestController
@RequestMapping("/system/batchRule")
public class BatchRuleController extends BaseController
{
    @Autowired
    private IBatchRuleService batchRuleService;

    /**
     * 查询批次规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:batchRule:list')")
    @GetMapping("/list")
    public TableDataInfo list(BatchRule batchRule)
    {
        startPage();
        List<BatchRule> list = batchRuleService.selectBatchRuleList(batchRule);
        return getDataTable(list);
    }

    /**
     * 导出批次规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:batchRule:export')")
    @Log(title = "批次规则", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BatchRule batchRule)
    {
        List<BatchRule> list = batchRuleService.selectBatchRuleList(batchRule);
        ExcelUtil<BatchRule> util = new ExcelUtil<BatchRule>(BatchRule.class);
        return util.exportExcel(list, "batchRule");
    }

    /**
     * 获取批次规则详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:batchRule:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(batchRuleService.selectBatchRuleById(id));
    }

    /**
     * 新增批次规则
     */
    @PreAuthorize("@ss.hasPermi('system:batchRule:add')")
    @Log(title = "批次规则", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BatchRule batchRule)
    {
        return toAjax(batchRuleService.insertBatchRule(batchRule));
    }

    /**
     * 修改批次规则
     */
    @PreAuthorize("@ss.hasPermi('system:batchRule:edit')")
    @Log(title = "批次规则", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BatchRule batchRule)
    {
        return toAjax(batchRuleService.updateBatchRule(batchRule));
    }

    /**
     * 删除批次规则
     */
    @PreAuthorize("@ss.hasPermi('system:batchRule:remove')")
    @Log(title = "批次规则", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(batchRuleService.deleteBatchRuleByIds(ids));
    }
}
