package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 定位规则对象 location_rule
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public class LocationRule extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增主键 */
    private Long id;

    /** 规则代码 */
    @Excel(name = "规则代码")
    private String ruleCode;

    /** 定位规则 */
    @Excel(name = "定位规则")
    private Integer locRule;

    /** 起始货架 */
    @Excel(name = "起始货架")
    private String startShelf;

    /** 终点货架 */
    @Excel(name = "终点货架")
    private String endShelf;

    /** 自动执行 */
    @Excel(name = "自动执行")
    private Integer isAuto;

    /** 启禁状态 */
    @Excel(name = "启禁状态")
    private Integer status;

    /** 规则描述 */
    @Excel(name = "规则描述")
    private String description;

    /** 创建人 */
    private String createUser;

    /** 修改人 */
    private String updateUser;

    /** 删除标记位 */
    private Integer yn;

    /** 时间戳 */
    private Date ts;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setRuleCode(String ruleCode) 
    {
        this.ruleCode = ruleCode;
    }

    public String getRuleCode() 
    {
        return ruleCode;
    }
    public void setLocRule(Integer locRule) 
    {
        this.locRule = locRule;
    }

    public Integer getLocRule() 
    {
        return locRule;
    }
    public void setStartShelf(String startShelf) 
    {
        this.startShelf = startShelf;
    }

    public String getStartShelf() 
    {
        return startShelf;
    }
    public void setEndShelf(String endShelf) 
    {
        this.endShelf = endShelf;
    }

    public String getEndShelf() 
    {
        return endShelf;
    }
    public void setIsAuto(Integer isAuto) 
    {
        this.isAuto = isAuto;
    }

    public Integer getIsAuto() 
    {
        return isAuto;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setCreateUser(String createUser) 
    {
        this.createUser = createUser;
    }

    public String getCreateUser() 
    {
        return createUser;
    }
    public void setUpdateUser(String updateUser) 
    {
        this.updateUser = updateUser;
    }

    public String getUpdateUser() 
    {
        return updateUser;
    }
    public void setYn(Integer yn) 
    {
        this.yn = yn;
    }

    public Integer getYn() 
    {
        return yn;
    }
    public void setTs(Date ts) 
    {
        this.ts = ts;
    }

    public Date getTs() 
    {
        return ts;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("ruleCode", getRuleCode())
            .append("locRule", getLocRule())
            .append("startShelf", getStartShelf())
            .append("endShelf", getEndShelf())
            .append("isAuto", getIsAuto())
            .append("status", getStatus())
            .append("description", getDescription())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("yn", getYn())
            .append("ts", getTs())
            .toString();
    }
}
