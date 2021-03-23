package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ShelfInfo;

/**
 * 货架管理Mapper接口
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
public interface ShelfInfoMapper 
{
    /**
     * 查询货架管理
     * 
     * @param id 货架管理ID
     * @return 货架管理
     */
    public ShelfInfo selectShelfInfoById(Long id);

    /**
     * 查询货架管理列表
     * 
     * @param shelfInfo 货架管理
     * @return 货架管理集合
     */
    public List<ShelfInfo> selectShelfInfoList(ShelfInfo shelfInfo);

    /**
     * 新增货架管理
     * 
     * @param shelfInfo 货架管理
     * @return 结果
     */
    public int insertShelfInfo(ShelfInfo shelfInfo);

    /**
     * 修改货架管理
     * 
     * @param shelfInfo 货架管理
     * @return 结果
     */
    public int updateShelfInfo(ShelfInfo shelfInfo);

    /**
     * 删除货架管理
     * 
     * @param id 货架管理ID
     * @return 结果
     */
    public int deleteShelfInfoById(Long id);

    /**
     * 批量删除货架管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteShelfInfoByIds(Long[] ids);
}
