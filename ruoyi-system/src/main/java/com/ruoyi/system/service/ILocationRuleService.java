package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LocationRule;

/**
 * 定位规则Service接口
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public interface ILocationRuleService 
{
    /**
     * 查询定位规则
     * 
     * @param id 定位规则ID
     * @return 定位规则
     */
    public LocationRule selectLocationRuleById(Long id);

    /**
     * 查询定位规则列表
     * 
     * @param locationRule 定位规则
     * @return 定位规则集合
     */
    public List<LocationRule> selectLocationRuleList(LocationRule locationRule);

    /**
     * 新增定位规则
     * 
     * @param locationRule 定位规则
     * @return 结果
     */
    public int insertLocationRule(LocationRule locationRule);

    /**
     * 修改定位规则
     * 
     * @param locationRule 定位规则
     * @return 结果
     */
    public int updateLocationRule(LocationRule locationRule);

    /**
     * 批量删除定位规则
     * 
     * @param ids 需要删除的定位规则ID
     * @return 结果
     */
    public int deleteLocationRuleByIds(Long[] ids);

    /**
     * 删除定位规则信息
     * 
     * @param id 定位规则ID
     * @return 结果
     */
    public int deleteLocationRuleById(Long id);
}
