package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ExceptionInfo;

/**
 * 异常信息Mapper接口
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
public interface ExceptionInfoMapper 
{
    /**
     * 查询异常信息
     * 
     * @param id 异常信息ID
     * @return 异常信息
     */
    public ExceptionInfo selectExceptionInfoById(Long id);

    /**
     * 查询异常信息列表
     * 
     * @param exceptionInfo 异常信息
     * @return 异常信息集合
     */
    public List<ExceptionInfo> selectExceptionInfoList(ExceptionInfo exceptionInfo);

    /**
     * 新增异常信息
     * 
     * @param exceptionInfo 异常信息
     * @return 结果
     */
    public int insertExceptionInfo(ExceptionInfo exceptionInfo);

    /**
     * 修改异常信息
     * 
     * @param exceptionInfo 异常信息
     * @return 结果
     */
    public int updateExceptionInfo(ExceptionInfo exceptionInfo);

    /**
     * 删除异常信息
     * 
     * @param id 异常信息ID
     * @return 结果
     */
    public int deleteExceptionInfoById(Long id);

    /**
     * 批量删除异常信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteExceptionInfoByIds(Long[] ids);
}
