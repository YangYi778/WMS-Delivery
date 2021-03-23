package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品管理对象 good_info
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
public class GoodInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 库区编号 */
    @Excel(name = "库区编号")
    private String storageNo;

    /** 库位编号 */
    @Excel(name = "库位编号")
    private String shelfNo;

    /** 波次号 */
    @Excel(name = "波次号")
    private String batchNo;

    /** 订单号 */
    @Excel(name = "订单号")
    private String orderNo;

    /** 商品编码 */
    @Excel(name = "商品编码")
    private String goodNo;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String goodName;

    /** 货架位置 */
    @Excel(name = "货架位置")
    private String shelfPosition;

    /** 库存总数 */
    @Excel(name = "库存总数")
    private Long inventoryNum;

    /** 残次数量 */
    @Excel(name = "残次数量")
    private Long defectNum;

    /** 冻结数量 */
    @Excel(name = "冻结数量")
    private Long frozenNum;

    /** 库存类型 */
    @Excel(name = "库存类型")
    private String inventoryType;

    /** 订单防重码 */
    @Excel(name = "订单防重码")
    private String uuid;

    /** 生产日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生产日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date productTime;

    /** 失效日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "失效日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expiryTime;

    /** 创建人 */
    private String createUser;

    /** 修改人 */
    private String updateUser;

    /** 删除标记位。0：无效，1：有效 */
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
    public void setStorageNo(String storageNo) 
    {
        this.storageNo = storageNo;
    }

    public String getStorageNo() 
    {
        return storageNo;
    }
    public void setShelfNo(String shelfNo) 
    {
        this.shelfNo = shelfNo;
    }

    public String getShelfNo() 
    {
        return shelfNo;
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
    public void setGoodNo(String goodNo) 
    {
        this.goodNo = goodNo;
    }

    public String getGoodNo() 
    {
        return goodNo;
    }
    public void setGoodName(String goodName) 
    {
        this.goodName = goodName;
    }

    public String getGoodName() 
    {
        return goodName;
    }
    public void setShelfPosition(String shelfPosition) 
    {
        this.shelfPosition = shelfPosition;
    }

    public String getShelfPosition() 
    {
        return shelfPosition;
    }
    public void setInventoryNum(Long inventoryNum) 
    {
        this.inventoryNum = inventoryNum;
    }

    public Long getInventoryNum() 
    {
        return inventoryNum;
    }
    public void setDefectNum(Long defectNum) 
    {
        this.defectNum = defectNum;
    }

    public Long getDefectNum() 
    {
        return defectNum;
    }
    public void setFrozenNum(Long frozenNum) 
    {
        this.frozenNum = frozenNum;
    }

    public Long getFrozenNum() 
    {
        return frozenNum;
    }
    public void setInventoryType(String inventoryType) 
    {
        this.inventoryType = inventoryType;
    }

    public String getInventoryType() 
    {
        return inventoryType;
    }
    public void setUuid(String uuid) 
    {
        this.uuid = uuid;
    }

    public String getUuid() 
    {
        return uuid;
    }
    public void setProductTime(Date productTime) 
    {
        this.productTime = productTime;
    }

    public Date getProductTime() 
    {
        return productTime;
    }
    public void setExpiryTime(Date expiryTime) 
    {
        this.expiryTime = expiryTime;
    }

    public Date getExpiryTime() 
    {
        return expiryTime;
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
            .append("storageNo", getStorageNo())
            .append("shelfNo", getShelfNo())
            .append("batchNo", getBatchNo())
            .append("orderNo", getOrderNo())
            .append("goodNo", getGoodNo())
            .append("goodName", getGoodName())
            .append("shelfPosition", getShelfPosition())
            .append("inventoryNum", getInventoryNum())
            .append("defectNum", getDefectNum())
            .append("frozenNum", getFrozenNum())
            .append("inventoryType", getInventoryType())
            .append("uuid", getUuid())
            .append("productTime", getProductTime())
            .append("expiryTime", getExpiryTime())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("yn", getYn())
            .append("ts", getTs())
            .toString();
    }
}
