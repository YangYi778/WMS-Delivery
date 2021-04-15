package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LocationRuleMapper;
import com.ruoyi.system.domain.LocationRule;
import com.ruoyi.system.service.ILocationRuleService;

/**
 * 定位规则Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@Service
public class LocationRuleServiceImpl implements ILocationRuleService 
{
    @Autowired
    private LocationRuleMapper locationRuleMapper;

    /**
     * 查询定位规则
     * 
     * @param id 定位规则ID
     * @return 定位规则
     */
    @Override
    public LocationRule selectLocationRuleById(Long id)
    {
        return locationRuleMapper.selectLocationRuleById(id);
    }

    /**
     * 查询定位规则列表
     * 
     * @param locationRule 定位规则
     * @return 定位规则
     */
    @Override
    public List<LocationRule> selectLocationRuleList(LocationRule locationRule)
    {
        return locationRuleMapper.selectLocationRuleList(locationRule);
    }

    /**
     * 新增定位规则
     * 
     * @param locationRule 定位规则
     * @return 结果
     */
    @Override
    public int insertLocationRule(LocationRule locationRule)
    {
        locationRule.setCreateTime(DateUtils.getNowDate());
        return locationRuleMapper.insertLocationRule(locationRule);
    }

    /**
     * 修改定位规则
     * 
     * @param locationRule 定位规则
     * @return 结果
     */
    @Override
    public int updateLocationRule(LocationRule locationRule)
    {
        locationRule.setUpdateTime(DateUtils.getNowDate());
        return locationRuleMapper.updateLocationRule(locationRule);
    }

    /**
     * 批量删除定位规则
     * 
     * @param ids 需要删除的定位规则ID
     * @return 结果
     */
    @Override
    public int deleteLocationRuleByIds(Long[] ids)
    {
        return locationRuleMapper.deleteLocationRuleByIds(ids);
    }

    /**
     * 删除定位规则信息
     * 
     * @param id 定位规则ID
     * @return 结果
     */
    @Override
    public int deleteLocationRuleById(Long id)
    {
        return locationRuleMapper.deleteLocationRuleById(id);
    }
}
