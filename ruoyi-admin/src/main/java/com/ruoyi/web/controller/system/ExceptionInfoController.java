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
import com.ruoyi.system.domain.ExceptionInfo;
import com.ruoyi.system.service.IExceptionInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 异常信息Controller
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@RestController
@RequestMapping("/system/exception")
public class ExceptionInfoController extends BaseController
{
    @Autowired
    private IExceptionInfoService exceptionInfoService;

    /**
     * 查询异常信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:exception:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExceptionInfo exceptionInfo)
    {
        startPage();
        List<ExceptionInfo> list = exceptionInfoService.selectExceptionInfoList(exceptionInfo);
        return getDataTable(list);
    }

    /**
     * 导出异常信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:exception:export')")
    @Log(title = "异常信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExceptionInfo exceptionInfo)
    {
        List<ExceptionInfo> list = exceptionInfoService.selectExceptionInfoList(exceptionInfo);
        ExcelUtil<ExceptionInfo> util = new ExcelUtil<ExceptionInfo>(ExceptionInfo.class);
        return util.exportExcel(list, "exception");
    }

    /**
     * 获取异常信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:exception:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exceptionInfoService.selectExceptionInfoById(id));
    }

    /**
     * 新增异常信息
     */
    @PreAuthorize("@ss.hasPermi('system:exception:add')")
    @Log(title = "异常信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExceptionInfo exceptionInfo)
    {
        return toAjax(exceptionInfoService.insertExceptionInfo(exceptionInfo));
    }

    /**
     * 修改异常信息
     */
    @PreAuthorize("@ss.hasPermi('system:exception:edit')")
    @Log(title = "异常信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExceptionInfo exceptionInfo)
    {
        return toAjax(exceptionInfoService.updateExceptionInfo(exceptionInfo));
    }

    /**
     * 删除异常信息
     */
    @PreAuthorize("@ss.hasPermi('system:exception:remove')")
    @Log(title = "异常信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exceptionInfoService.deleteExceptionInfoByIds(ids));
    }
}
