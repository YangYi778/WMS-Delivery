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
import com.ruoyi.system.domain.GoodInfo;
import com.ruoyi.system.service.IGoodInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品管理Controller
 * 
 * @author HelloWorld
 * @date 2021-03-28
 */
@RestController
@RequestMapping("/system/goodMenu")
public class GoodInfoController extends BaseController
{
    @Autowired
    private IGoodInfoService goodInfoService;

    /**
     * 查询商品管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:goodMenu:list')")
    @GetMapping("/list")
    public TableDataInfo list(GoodInfo goodInfo)
    {
        startPage();
        List<GoodInfo> list = goodInfoService.selectGoodInfoList(goodInfo);
        return getDataTable(list);
    }

    /**
     * 导出商品管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:goodMenu:export')")
    @Log(title = "商品管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(GoodInfo goodInfo)
    {
        List<GoodInfo> list = goodInfoService.selectGoodInfoList(goodInfo);
        ExcelUtil<GoodInfo> util = new ExcelUtil<GoodInfo>(GoodInfo.class);
        return util.exportExcel(list, "goodMenu");
    }

    /**
     * 获取商品管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:goodMenu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(goodInfoService.selectGoodInfoById(id));
    }

    /**
     * 新增商品管理
     */
    @PreAuthorize("@ss.hasPermi('system:goodMenu:add')")
    @Log(title = "商品管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GoodInfo goodInfo)
    {
        return toAjax(goodInfoService.insertGoodInfo(goodInfo));
    }

    /**
     * 修改商品管理
     */
    @PreAuthorize("@ss.hasPermi('system:goodMenu:edit')")
    @Log(title = "商品管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GoodInfo goodInfo)
    {
        return toAjax(goodInfoService.updateGoodInfo(goodInfo));
    }

    /**
     * 删除商品管理
     */
    @PreAuthorize("@ss.hasPermi('system:goodMenu:remove')")
    @Log(title = "商品管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(goodInfoService.deleteGoodInfoByIds(ids));
    }
}
