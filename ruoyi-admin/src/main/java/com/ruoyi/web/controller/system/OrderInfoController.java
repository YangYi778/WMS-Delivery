package com.ruoyi.web.controller.system;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.OrderInfo;
import com.ruoyi.system.service.IOrderInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单管理Controller
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@RestController
@RequestMapping("/system/orderMenu")
public class OrderInfoController extends BaseController
{
    @Autowired
    private IOrderInfoService orderInfoService;

    /**
     * 查询订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:orderMenu:list')")
    @GetMapping("/list")
    public TableDataInfo list(OrderInfo orderInfo)
    {
        startPage();
        List<OrderInfo> list = orderInfoService.selectOrderInfoList(orderInfo);
        return getDataTable(list);
    }

    /**
     * 导出订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:orderMenu:export')")
    @Log(title = "订单管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(OrderInfo orderInfo)
    {
        List<OrderInfo> list = orderInfoService.selectOrderInfoList(orderInfo);
        ExcelUtil<OrderInfo> util = new ExcelUtil<OrderInfo>(OrderInfo.class);
        return util.exportExcel(list, "orderMenu");
    }

    /**
     * 获取订单管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderMenu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(orderInfoService.selectOrderInfoById(id));
    }

    /**
     * 新增订单管理
     */
    @PreAuthorize("@ss.hasPermi('system:orderMenu:add')")
    @Log(title = "订单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OrderInfo orderInfo)
    {
        return toAjax(orderInfoService.insertOrderInfo(orderInfo));
    }

    /**
     * 修改订单管理
     */
    @PreAuthorize("@ss.hasPermi('system:orderMenu:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OrderInfo orderInfo)
    {
        return toAjax(orderInfoService.updateOrderInfo(orderInfo));
    }

    /**
     * 删除订单管理
     */
    @PreAuthorize("@ss.hasPermi('system:orderMenu:remove')")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(orderInfoService.deleteOrderInfoByIds(ids));
    }

    /**
     * 订单受理
     */
    @PreAuthorize("@ss.hasPermi('system:orderMenu:confirm')")
    @Log(title = "订单管理", businessType = BusinessType.OTHER)
    @PutMapping("/{orders}")
    public AjaxResult orderConfirm(@PathVariable String[] orders)
    {
        System.out.println("orders ----->> " + orders);
        return toAjax(orderInfoService.orderConfirm(orders));
    }

    @PreAuthorize("@ss.hasPermi('system:orderMenu:generate')")
    @Log(title = "绑定批次", businessType = BusinessType.OTHER)
    @PutMapping("/generate/{orders}")
    public AjaxResult orderBatchGenerate(@PathVariable String[] orders){
        System.out.println("orders ----->>" + orders);
        return toAjax(orderInfoService.orderBatchGenerate(orders));
    }
}
