package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.StorageInfo;

/**
 * 库区管理Service接口
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
public interface IStorageInfoService 
{
    /**
     * 查询库区管理
     * 
     * @param id 库区管理ID
     * @return 库区管理
     */
    public StorageInfo selectStorageInfoById(Long id);

    /**
     * 查询库区管理列表
     * 
     * @param storageInfo 库区管理
     * @return 库区管理集合
     */
    public List<StorageInfo> selectStorageInfoList(StorageInfo storageInfo);

    /**
     * 新增库区管理
     * 
     * @param storageInfo 库区管理
     * @return 结果
     */
    public int insertStorageInfo(StorageInfo storageInfo);

    /**
     * 修改库区管理
     * 
     * @param storageInfo 库区管理
     * @return 结果
     */
    public int updateStorageInfo(StorageInfo storageInfo);

    /**
     * 批量删除库区管理
     * 
     * @param ids 需要删除的库区管理ID
     * @return 结果
     */
    public int deleteStorageInfoByIds(Long[] ids);

    /**
     * 删除库区管理信息
     * 
     * @param id 库区管理ID
     * @return 结果
     */
    public int deleteStorageInfoById(Long id);
}
