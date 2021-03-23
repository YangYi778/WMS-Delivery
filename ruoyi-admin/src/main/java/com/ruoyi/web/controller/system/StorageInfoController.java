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
import com.ruoyi.system.domain.StorageInfo;
import com.ruoyi.system.service.IStorageInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库区管理Controller
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
@RestController
@RequestMapping("/system/storageMenu")
public class StorageInfoController extends BaseController
{
    @Autowired
    private IStorageInfoService storageInfoService;

    /**
     * 查询库区管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:storageMenu:list')")
    @GetMapping("/list")
    public TableDataInfo list(StorageInfo storageInfo)
    {
        startPage();
        List<StorageInfo> list = storageInfoService.selectStorageInfoList(storageInfo);
        return getDataTable(list);
    }

    /**
     * 导出库区管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:storageMenu:export')")
    @Log(title = "库区管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(StorageInfo storageInfo)
    {
        List<StorageInfo> list = storageInfoService.selectStorageInfoList(storageInfo);
        ExcelUtil<StorageInfo> util = new ExcelUtil<StorageInfo>(StorageInfo.class);
        return util.exportExcel(list, "storageMenu");
    }

    /**
     * 获取库区管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:storageMenu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(storageInfoService.selectStorageInfoById(id));
    }

    /**
     * 新增库区管理
     */
    @PreAuthorize("@ss.hasPermi('system:storageMenu:add')")
    @Log(title = "库区管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StorageInfo storageInfo)
    {
        return toAjax(storageInfoService.insertStorageInfo(storageInfo));
    }

    /**
     * 修改库区管理
     */
    @PreAuthorize("@ss.hasPermi('system:storageMenu:edit')")
    @Log(title = "库区管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StorageInfo storageInfo)
    {
        return toAjax(storageInfoService.updateStorageInfo(storageInfo));
    }

    /**
     * 删除库区管理
     */
    @PreAuthorize("@ss.hasPermi('system:storageMenu:remove')")
    @Log(title = "库区管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(storageInfoService.deleteStorageInfoByIds(ids));
    }
}
