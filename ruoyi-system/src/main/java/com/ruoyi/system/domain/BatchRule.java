package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 批次规则对象 batch_rule
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public class BatchRule extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增主键 */
    private Long id;

    /** 规则代码 */
    @Excel(name = "规则代码")
    private String ruleCode;

    /** 订单数下限 */
    @Excel(name = "订单数下限")
    private Integer orderNum;

    /** sku下限 */
    @Excel(name = "sku下限")
    private Integer goodQty;

    /** 时间阈值(分钟) */
    @Excel(name = "时间阈值(分钟)")
    private Integer timeRange;

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
    public void setOrderNum(Integer orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Integer getOrderNum() 
    {
        return orderNum;
    }
    public void setGoodQty(Integer goodQty) 
    {
        this.goodQty = goodQty;
    }

    public Integer getGoodQty() 
    {
        return goodQty;
    }
    public void setTimeRange(Integer timeRange) 
    {
        this.timeRange = timeRange;
    }

    public Integer getTimeRange() 
    {
        return timeRange;
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
            .append("orderNum", getOrderNum())
            .append("goodQty", getGoodQty())
            .append("timeRange", getTimeRange())
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
