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
import com.ruoyi.system.domain.ShelfInfo;
import com.ruoyi.system.service.IShelfInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 货架管理Controller
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
@RestController
@RequestMapping("/system/shelfMenu")
public class ShelfInfoController extends BaseController
{
    @Autowired
    private IShelfInfoService shelfInfoService;

    /**
     * 查询货架管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:shelfMenu:list')")
    @GetMapping("/list")
    public TableDataInfo list(ShelfInfo shelfInfo)
    {
        startPage();
        List<ShelfInfo> list = shelfInfoService.selectShelfInfoList(shelfInfo);
        return getDataTable(list);
    }

    /**
     * 导出货架管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:shelfMenu:export')")
    @Log(title = "货架管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ShelfInfo shelfInfo)
    {
        List<ShelfInfo> list = shelfInfoService.selectShelfInfoList(shelfInfo);
        ExcelUtil<ShelfInfo> util = new ExcelUtil<ShelfInfo>(ShelfInfo.class);
        return util.exportExcel(list, "shelfMenu");
    }

    /**
     * 获取货架管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:shelfMenu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(shelfInfoService.selectShelfInfoById(id));
    }

    /**
     * 新增货架管理
     */
    @PreAuthorize("@ss.hasPermi('system:shelfMenu:add')")
    @Log(title = "货架管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ShelfInfo shelfInfo)
    {
        return toAjax(shelfInfoService.insertShelfInfo(shelfInfo));
    }

    /**
     * 修改货架管理
     */
    @PreAuthorize("@ss.hasPermi('system:shelfMenu:edit')")
    @Log(title = "货架管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ShelfInfo shelfInfo)
    {
        return toAjax(shelfInfoService.updateShelfInfo(shelfInfo));
    }

    /**
     * 删除货架管理
     */
    @PreAuthorize("@ss.hasPermi('system:shelfMenu:remove')")
    @Log(title = "货架管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(shelfInfoService.deleteShelfInfoByIds(ids));
    }
}
