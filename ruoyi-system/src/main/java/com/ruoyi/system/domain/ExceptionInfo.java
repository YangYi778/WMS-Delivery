package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 异常信息对象 exception_info
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public class ExceptionInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增主键 */
    private Long id;

    /** 异常代码 */
    @Excel(name = "异常代码")
    private String exceptionCode;

    /** 异常批次 */
    @Excel(name = "异常批次")
    private String exceptionBatch;

    /** 异常订单号 */
    @Excel(name = "异常订单号")
    private String exceptionOrder;

    /** 异常任务号 */
    @Excel(name = "异常任务号")
    private String exceptionTask;

    /** 处理方法 */
    @Excel(name = "处理方法")
    private String processMethod;

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
    public void setExceptionCode(String exceptionCode) 
    {
        this.exceptionCode = exceptionCode;
    }

    public String getExceptionCode() 
    {
        return exceptionCode;
    }
    public void setExceptionBatch(String exceptionBatch) 
    {
        this.exceptionBatch = exceptionBatch;
    }

    public String getExceptionBatch() 
    {
        return exceptionBatch;
    }
    public void setExceptionOrder(String exceptionOrder) 
    {
        this.exceptionOrder = exceptionOrder;
    }

    public String getExceptionOrder() 
    {
        return exceptionOrder;
    }
    public void setExceptionTask(String exceptionTask) 
    {
        this.exceptionTask = exceptionTask;
    }

    public String getExceptionTask() 
    {
        return exceptionTask;
    }
    public void setProcessMethod(String processMethod) 
    {
        this.processMethod = processMethod;
    }

    public String getProcessMethod() 
    {
        return processMethod;
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
            .append("exceptionCode", getExceptionCode())
            .append("exceptionBatch", getExceptionBatch())
            .append("exceptionOrder", getExceptionOrder())
            .append("exceptionTask", getExceptionTask())
            .append("remark", getRemark())
            .append("processMethod", getProcessMethod())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("yn", getYn())
            .append("ts", getTs())
            .toString();
    }
}
