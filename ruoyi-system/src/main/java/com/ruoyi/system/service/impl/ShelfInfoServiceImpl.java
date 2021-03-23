package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ShelfInfoMapper;
import com.ruoyi.system.domain.ShelfInfo;
import com.ruoyi.system.service.IShelfInfoService;

/**
 * 货架管理Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
@Service
public class ShelfInfoServiceImpl implements IShelfInfoService 
{
    @Autowired
    private ShelfInfoMapper shelfInfoMapper;

    /**
     * 查询货架管理
     * 
     * @param id 货架管理ID
     * @return 货架管理
     */
    @Override
    public ShelfInfo selectShelfInfoById(Long id)
    {
        return shelfInfoMapper.selectShelfInfoById(id);
    }

    /**
     * 查询货架管理列表
     * 
     * @param shelfInfo 货架管理
     * @return 货架管理
     */
    @Override
    public List<ShelfInfo> selectShelfInfoList(ShelfInfo shelfInfo)
    {
        return shelfInfoMapper.selectShelfInfoList(shelfInfo);
    }

    /**
     * 新增货架管理
     * 
     * @param shelfInfo 货架管理
     * @return 结果
     */
    @Override
    public int insertShelfInfo(ShelfInfo shelfInfo)
    {
        shelfInfo.setCreateTime(DateUtils.getNowDate());
        return shelfInfoMapper.insertShelfInfo(shelfInfo);
    }

    /**
     * 修改货架管理
     * 
     * @param shelfInfo 货架管理
     * @return 结果
     */
    @Override
    public int updateShelfInfo(ShelfInfo shelfInfo)
    {
        shelfInfo.setUpdateTime(DateUtils.getNowDate());
        return shelfInfoMapper.updateShelfInfo(shelfInfo);
    }

    /**
     * 批量删除货架管理
     * 
     * @param ids 需要删除的货架管理ID
     * @return 结果
     */
    @Override
    public int deleteShelfInfoByIds(Long[] ids)
    {
        return shelfInfoMapper.deleteShelfInfoByIds(ids);
    }

    /**
     * 删除货架管理信息
     * 
     * @param id 货架管理ID
     * @return 结果
     */
    @Override
    public int deleteShelfInfoById(Long id)
    {
        return shelfInfoMapper.deleteShelfInfoById(id);
    }
}
