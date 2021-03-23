package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单管理对象 order_info
 * 
 * @author ruoyi
 * @date 2021-03-22
 */
public class OrderInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增主键 */
    private Long id;

    /** 波次号 */
    @Excel(name = "波次号")
    private String batchNo;

    /** 订单号 */
    @Excel(name = "订单号")
    private String orderNo;

    /** 订单类型 */
    @Excel(name = "订单类型")
    private String orderType;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private Integer orderStatus;

    /** 订单来源 */
    @Excel(name = "订单来源")
    private String orderOrigin;

    /** 订单等级 */
    @Excel(name = "订单等级")
    private String orderLevel;

    /** 客户编码 */
    @Excel(name = "客户编码")
    private String custNo;

    /** 客户名称 */
    @Excel(name = "客户名称")
    private String custName;

    /** 订单总体积 */
    @Excel(name = "订单总体积")
    private BigDecimal totalVolume;

    /** 订单总重量 */
    @Excel(name = "订单总重量")
    private BigDecimal totalWeight;

    /** 防重码 */
    @Excel(name = "防重码")
    private String uuid;

    /** 收货人 */
    @Excel(name = "收货人")
    private String receName;

    /** 收货人联系电话 */
    @Excel(name = "收货人联系电话")
    private String recePhone;

    /** 收货人地址 */
    @Excel(name = "收货人地址")
    private String receAddress;

    /** 交接部门名称 */
    @Excel(name = "交接部门名称")
    private String hodeptName;

    /** 交接部门编码 */
    @Excel(name = "交接部门编码")
    private String hodeptNo;

    /** 交接人姓名 */
    @Excel(name = "交接人姓名")
    private String houserName;

    /** 创建人 */
    private String createUser;

    /** 修改人 */
    private String updateUser;

    /** 删除标记位 */
    private Integer yn;

    /** 时间戳 */
    private Date ts;

    /** 订单优先级 */
    @Excel(name = "订单优先级")
    private Long orderPriority;

    /** 计划出库时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划出库时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date planDeliveryTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setBatchNo(String batchNo) 
    {
        this.batchNo = batchNo;
    }

    public String getBatchNo() 
    {
        return batchNo;
    }
    public void setOrderNo(String orderNo) 
    {
        this.orderNo = orderNo;
    }

    public String getOrderNo() 
    {
        return orderNo;
    }
    public void setOrderType(String orderType) 
    {
        this.orderType = orderType;
    }

    public String getOrderType() 
    {
        return orderType;
    }
    public void setOrderStatus(Integer orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public Integer getOrderStatus() 
    {
        return orderStatus;
    }
    public void setOrderOrigin(String orderOrigin) 
    {
        this.orderOrigin = orderOrigin;
    }

    public String getOrderOrigin() 
    {
        return orderOrigin;
    }
    public void setOrderLevel(String orderLevel) 
    {
        this.orderLevel = orderLevel;
    }

    public String getOrderLevel() 
    {
        return orderLevel;
    }
    public void setCustNo(String custNo) 
    {
        this.custNo = custNo;
    }

    public String getCustNo() 
    {
        return custNo;
    }
    public void setCustName(String custName) 
    {
        this.custName = custName;
    }

    public String getCustName() 
    {
        return custName;
    }
    public void setTotalVolume(BigDecimal totalVolume) 
    {
        this.totalVolume = totalVolume;
    }

    public BigDecimal getTotalVolume() 
    {
        return totalVolume;
    }
    public void setTotalWeight(BigDecimal totalWeight) 
    {
        this.totalWeight = totalWeight;
    }

    public BigDecimal getTotalWeight() 
    {
        return totalWeight;
    }
    public void setUuid(String uuid) 
    {
        this.uuid = uuid;
    }

    public String getUuid() 
    {
        return uuid;
    }
    public void setReceName(String receName) 
    {
        this.receName = receName;
    }

    public String getReceName() 
    {
        return receName;
    }
    public void setRecePhone(String recePhone) 
    {
        this.recePhone = recePhone;
    }

    public String getRecePhone() 
    {
        return recePhone;
    }
    public void setReceAddress(String receAddress) 
    {
        this.receAddress = receAddress;
    }

    public String getReceAddress() 
    {
        return receAddress;
    }
    public void setHodeptName(String hodeptName) 
    {
        this.hodeptName = hodeptName;
    }

    public String getHodeptName() 
    {
        return hodeptName;
    }
    public void setHodeptNo(String hodeptNo) 
    {
        this.hodeptNo = hodeptNo;
    }

    public String getHodeptNo() 
    {
        return hodeptNo;
    }
    public void setHouserName(String houserName) 
    {
        this.houserName = houserName;
    }

    public String getHouserName() 
    {
        return houserName;
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
    public void setOrderPriority(Long orderPriority) 
    {
        this.orderPriority = orderPriority;
    }

    public Long getOrderPriority() 
    {
        return orderPriority;
    }
    public void setPlanDeliveryTime(Date planDeliveryTime) 
    {
        this.planDeliveryTime = planDeliveryTime;
    }

    public Date getPlanDeliveryTime() 
    {
        return planDeliveryTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("batchNo", getBatchNo())
            .append("orderNo", getOrderNo())
            .append("orderType", getOrderType())
            .append("orderStatus", getOrderStatus())
            .append("orderOrigin", getOrderOrigin())
            .append("orderLevel", getOrderLevel())
            .append("custNo", getCustNo())
            .append("custName", getCustName())
            .append("totalVolume", getTotalVolume())
            .append("totalWeight", getTotalWeight())
            .append("uuid", getUuid())
            .append("receName", getReceName())
            .append("recePhone", getRecePhone())
            .append("receAddress", getReceAddress())
            .append("hodeptName", getHodeptName())
            .append("hodeptNo", getHodeptNo())
            .append("houserName", getHouserName())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("yn", getYn())
            .append("ts", getTs())
            .append("orderPriority", getOrderPriority())
            .append("planDeliveryTime", getPlanDeliveryTime())
            .toString();
    }
}
