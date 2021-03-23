package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 货架管理对象 shelf_info
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
public class ShelfInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增主键 */
    private Long id;

    /** 库区编号 */
    @Excel(name = "库区编号")
    private String storageNo;

    /** 货架编号 */
    @Excel(name = "货架编号")
    private String shelfNo;

    /** 货架名称 */
    @Excel(name = "货架名称")
    private String shelfName;

    /** 货架类型 */
    @Excel(name = "货架类型")
    private Integer shelfType;

    /** 货架状态 */
    @Excel(name = "货架状态")
    private Integer shelfStatus;

    /** 货架层数 */
    @Excel(name = "货架层数")
    private Integer shelfRow;

    /** 货架列数 */
    @Excel(name = "货架列数")
    private Integer shelfCol;

    /** 货架规格 */
    @Excel(name = "货架规格")
    private String shelfSpec;

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
    public void setShelfName(String shelfName) 
    {
        this.shelfName = shelfName;
    }

    public String getShelfName() 
    {
        return shelfName;
    }
    public void setShelfType(Integer shelfType) 
    {
        this.shelfType = shelfType;
    }

    public Integer getShelfType() 
    {
        return shelfType;
    }
    public void setShelfStatus(Integer shelfStatus) 
    {
        this.shelfStatus = shelfStatus;
    }

    public Integer getShelfStatus() 
    {
        return shelfStatus;
    }
    public void setShelfRow(Integer shelfRow) 
    {
        this.shelfRow = shelfRow;
    }

    public Integer getShelfRow() 
    {
        return shelfRow;
    }
    public void setShelfCol(Integer shelfCol) 
    {
        this.shelfCol = shelfCol;
    }

    public Integer getShelfCol() 
    {
        return shelfCol;
    }
    public void setShelfSpec(String shelfSpec) 
    {
        this.shelfSpec = shelfSpec;
    }

    public String getShelfSpec() 
    {
        return shelfSpec;
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
            .append("shelfName", getShelfName())
            .append("shelfType", getShelfType())
            .append("shelfStatus", getShelfStatus())
            .append("shelfRow", getShelfRow())
            .append("shelfCol", getShelfCol())
            .append("shelfSpec", getShelfSpec())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("yn", getYn())
            .append("ts", getTs())
            .toString();
    }
}
