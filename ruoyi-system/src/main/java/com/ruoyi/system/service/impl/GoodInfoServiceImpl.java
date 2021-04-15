package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GoodInfoMapper;
import com.ruoyi.system.domain.GoodInfo;
import com.ruoyi.system.service.IGoodInfoService;

/**
 * 商品管理Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-28
 */
@Service
public class GoodInfoServiceImpl implements IGoodInfoService 
{
    @Autowired
    private GoodInfoMapper goodInfoMapper;

    /**
     * 查询商品管理
     * 
     * @param id 商品管理ID
     * @return 商品管理
     */
    @Override
    public GoodInfo selectGoodInfoById(Long id)
    {
        return goodInfoMapper.selectGoodInfoById(id);
    }

    /**
     * 查询商品管理列表
     * 
     * @param goodInfo 商品管理
     * @return 商品管理
     */
    @Override
    public List<GoodInfo> selectGoodInfoList(GoodInfo goodInfo)
    {
        return goodInfoMapper.selectGoodInfoList(goodInfo);
    }

    /**
     * 新增商品管理
     * 
     * @param goodInfo 商品管理
     * @return 结果
     */
    @Override
    public int insertGoodInfo(GoodInfo goodInfo)
    {
        goodInfo.setCreateTime(DateUtils.getNowDate());
        return goodInfoMapper.insertGoodInfo(goodInfo);
    }

    /**
     * 修改商品管理
     * 
     * @param goodInfo 商品管理
     * @return 结果
     */
    @Override
    public int updateGoodInfo(GoodInfo goodInfo)
    {
        goodInfo.setUpdateTime(DateUtils.getNowDate());
        return goodInfoMapper.updateGoodInfo(goodInfo);
    }

    /**
     * 批量删除商品管理
     * 
     * @param ids 需要删除的商品管理ID
     * @return 结果
     */
    @Override
    public int deleteGoodInfoByIds(Long[] ids)
    {
        return goodInfoMapper.deleteGoodInfoByIds(ids);
    }

    /**
     * 删除商品管理信息
     * 
     * @param id 商品管理ID
     * @return 结果
     */
    @Override
    public int deleteGoodInfoById(Long id)
    {
        return goodInfoMapper.deleteGoodInfoById(id);
    }
}
