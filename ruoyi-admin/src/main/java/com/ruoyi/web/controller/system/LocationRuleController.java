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
import com.ruoyi.system.domain.LocationRule;
import com.ruoyi.system.service.ILocationRuleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 定位规则Controller
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@RestController
@RequestMapping("/system/locationRule")
public class LocationRuleController extends BaseController
{
    @Autowired
    private ILocationRuleService locationRuleService;

    /**
     * 查询定位规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:locationRule:list')")
    @GetMapping("/list")
    public TableDataInfo list(LocationRule locationRule)
    {
        startPage();
        List<LocationRule> list = locationRuleService.selectLocationRuleList(locationRule);
        return getDataTable(list);
    }

    /**
     * 导出定位规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:locationRule:export')")
    @Log(title = "定位规则", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(LocationRule locationRule)
    {
        List<LocationRule> list = locationRuleService.selectLocationRuleList(locationRule);
        ExcelUtil<LocationRule> util = new ExcelUtil<LocationRule>(LocationRule.class);
        return util.exportExcel(list, "locationRule");
    }

    /**
     * 获取定位规则详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:locationRule:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(locationRuleService.selectLocationRuleById(id));
    }

    /**
     * 新增定位规则
     */
    @PreAuthorize("@ss.hasPermi('system:locationRule:add')")
    @Log(title = "定位规则", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LocationRule locationRule)
    {
        return toAjax(locationRuleService.insertLocationRule(locationRule));
    }

    /**
     * 修改定位规则
     */
    @PreAuthorize("@ss.hasPermi('system:locationRule:edit')")
    @Log(title = "定位规则", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LocationRule locationRule)
    {
        return toAjax(locationRuleService.updateLocationRule(locationRule));
    }

    /**
     * 删除定位规则
     */
    @PreAuthorize("@ss.hasPermi('system:locationRule:remove')")
    @Log(title = "定位规则", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(locationRuleService.deleteLocationRuleByIds(ids));
    }
}
