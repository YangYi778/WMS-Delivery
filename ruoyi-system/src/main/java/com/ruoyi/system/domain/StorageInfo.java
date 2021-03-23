package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库区管理对象 storage_info
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
public class StorageInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增id */
    private Long id;

    /** 库区编号 */
    @Excel(name = "库区编号")
    private String storageNo;

    /** 库区名称 */
    @Excel(name = "库区名称")
    private String storageName;

    /** 库区类型 */
    @Excel(name = "库区类型")
    private String storageType;

    /** 库区状态 */
    @Excel(name = "库区状态")
    private Integer storageStatus;

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
    public void setStorageName(String storageName) 
    {
        this.storageName = storageName;
    }

    public String getStorageName() 
    {
        return storageName;
    }
    public void setStorageType(String storageType) 
    {
        this.storageType = storageType;
    }

    public String getStorageType() 
    {
        return storageType;
    }
    public void setStorageStatus(Integer storageStatus) 
    {
        this.storageStatus = storageStatus;
    }

    public Integer getStorageStatus() 
    {
        return storageStatus;
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
            .append("storageName", getStorageName())
            .append("storageType", getStorageType())
            .append("storageStatus", getStorageStatus())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("yn", getYn())
            .append("ts", getTs())
            .toString();
    }
}
