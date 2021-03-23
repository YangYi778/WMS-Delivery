package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GoodInfo;

/**
 * 商品管理Service接口
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
public interface IGoodInfoService 
{
    /**
     * 查询商品管理
     * 
     * @param id 商品管理ID
     * @return 商品管理
     */
    public GoodInfo selectGoodInfoById(Long id);

    /**
     * 查询商品管理列表
     * 
     * @param goodInfo 商品管理
     * @return 商品管理集合
     */
    public List<GoodInfo> selectGoodInfoList(GoodInfo goodInfo);

    /**
     * 新增商品管理
     * 
     * @param goodInfo 商品管理
     * @return 结果
     */
    public int insertGoodInfo(GoodInfo goodInfo);

    /**
     * 修改商品管理
     * 
     * @param goodInfo 商品管理
     * @return 结果
     */
    public int updateGoodInfo(GoodInfo goodInfo);

    /**
     * 批量删除商品管理
     * 
     * @param ids 需要删除的商品管理ID
     * @return 结果
     */
    public int deleteGoodInfoByIds(Long[] ids);

    /**
     * 删除商品管理信息
     * 
     * @param id 商品管理ID
     * @return 结果
     */
    public int deleteGoodInfoById(Long id);
}
