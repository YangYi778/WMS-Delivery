package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.StorageInfoMapper;
import com.ruoyi.system.domain.StorageInfo;
import com.ruoyi.system.service.IStorageInfoService;

/**
 * 库区管理Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
@Service
public class StorageInfoServiceImpl implements IStorageInfoService 
{
    @Autowired
    private StorageInfoMapper storageInfoMapper;

    /**
     * 查询库区管理
     * 
     * @param id 库区管理ID
     * @return 库区管理
     */
    @Override
    public StorageInfo selectStorageInfoById(Long id)
    {
        return storageInfoMapper.selectStorageInfoById(id);
    }

    /**
     * 查询库区管理列表
     * 
     * @param storageInfo 库区管理
     * @return 库区管理
     */
    @Override
    public List<StorageInfo> selectStorageInfoList(StorageInfo storageInfo)
    {
        return storageInfoMapper.selectStorageInfoList(storageInfo);
    }

    /**
     * 新增库区管理
     * 
     * @param storageInfo 库区管理
     * @return 结果
     */
    @Override
    public int insertStorageInfo(StorageInfo storageInfo)
    {
        storageInfo.setCreateTime(DateUtils.getNowDate());
        return storageInfoMapper.insertStorageInfo(storageInfo);
    }

    /**
     * 修改库区管理
     * 
     * @param storageInfo 库区管理
     * @return 结果
     */
    @Override
    public int updateStorageInfo(StorageInfo storageInfo)
    {
        storageInfo.setUpdateTime(DateUtils.getNowDate());
        return storageInfoMapper.updateStorageInfo(storageInfo);
    }

    /**
     * 批量删除库区管理
     * 
     * @param ids 需要删除的库区管理ID
     * @return 结果
     */
    @Override
    public int deleteStorageInfoByIds(Long[] ids)
    {
        return storageInfoMapper.deleteStorageInfoByIds(ids);
    }

    /**
     * 删除库区管理信息
     * 
     * @param id 库区管理ID
     * @return 结果
     */
    @Override
    public int deleteStorageInfoById(Long id)
    {
        return storageInfoMapper.deleteStorageInfoById(id);
    }
}
