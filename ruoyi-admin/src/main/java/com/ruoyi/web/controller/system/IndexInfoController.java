package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.IndexInfo;
import com.ruoyi.system.domain.vo.IndexInfoVO;
import com.ruoyi.system.service.IIndexInfoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 万恶de亚撒西 on 2021/3/29.
 */

@RestController
@RequestMapping("/system/index")
public class IndexInfoController extends BaseController {



    @Autowired
    private IIndexInfoService iIndexInfoService;

    /*
     * 查询首页数据信息
     */
    @GetMapping("/{day}")
    public AjaxResult getIndexInfo(@PathVariable("day") Integer day){
        IndexInfoVO indexInfoVO = new IndexInfoVO();
        IndexInfo indexInfo = iIndexInfoService.getIndexInfo(day);
        System.out.println(indexInfo.toString());
        BeanUtils.copyProperties(indexInfo, indexInfoVO);
        System.out.println(indexInfoVO.toString());
        return AjaxResult.success(indexInfoVO);
    }

}
