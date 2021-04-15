package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 任务管理对象 task_info
 * 
 * @author HelloWorld
 * @date 2021-03-23
 */
public class TaskInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增主键 */
    private Long id;

    /** 任务编号 */
    @Excel(name = "任务编号")
    private String taskNo;

    /** 任务类型 */
    @Excel(name = "任务类型")
    private Integer taskType;

    /** 任务状态 */
    @Excel(name = "任务状态")
    private Integer taskStatus;

    /** 发布人编号 */
    @Excel(name = "发布人编号")
    private String publisherNo;

    /** 发布人姓名 */
    @Excel(name = "发布人姓名")
    private String publisherName;

    /** 接收人编号 */
    @Excel(name = "接收人编号")
    private String recipientNo;

    /** 接收人姓名 */
    @Excel(name = "接收人姓名")
    private String recipientName;

    /** 任务等级 */
    @Excel(name = "任务等级")
    private Integer taskLevel;

    /** 任务描述 */
    @Excel(name = "任务描述")
    private String taskDesc;

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
    public void setTaskNo(String taskNo) 
    {
        this.taskNo = taskNo;
    }

    public String getTaskNo() 
    {
        return taskNo;
    }
    public void setTaskType(Integer taskType) 
    {
        this.taskType = taskType;
    }

    public Integer getTaskType() 
    {
        return taskType;
    }
    public void setTaskStatus(Integer taskStatus) 
    {
        this.taskStatus = taskStatus;
    }

    public Integer getTaskStatus() 
    {
        return taskStatus;
    }
    public void setPublisherNo(String publisherNo) 
    {
        this.publisherNo = publisherNo;
    }

    public String getPublisherNo() 
    {
        return publisherNo;
    }
    public void setPublisherName(String publisherName) 
    {
        this.publisherName = publisherName;
    }

    public String getPublisherName() 
    {
        return publisherName;
    }
    public void setRecipientNo(String recipientNo) 
    {
        this.recipientNo = recipientNo;
    }

    public String getRecipientNo() 
    {
        return recipientNo;
    }
    public void setRecipientName(String recipientName) 
    {
        this.recipientName = recipientName;
    }

    public String getRecipientName() 
    {
        return recipientName;
    }
    public void setTaskLevel(Integer taskLevel) 
    {
        this.taskLevel = taskLevel;
    }

    public Integer getTaskLevel() 
    {
        return taskLevel;
    }
    public void setTaskDesc(String taskDesc) 
    {
        this.taskDesc = taskDesc;
    }

    public String getTaskDesc() 
    {
        return taskDesc;
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
            .append("taskNo", getTaskNo())
            .append("taskType", getTaskType())
            .append("taskStatus", getTaskStatus())
            .append("publisherNo", getPublisherNo())
            .append("publisherName", getPublisherName())
            .append("recipientNo", getRecipientNo())
            .append("recipientName", getRecipientName())
            .append("taskLevel", getTaskLevel())
            .append("taskDesc", getTaskDesc())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("yn", getYn())
            .append("ts", getTs())
            .toString();
    }
}
