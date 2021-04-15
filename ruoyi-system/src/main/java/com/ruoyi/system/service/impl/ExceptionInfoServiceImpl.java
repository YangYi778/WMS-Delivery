package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExceptionInfoMapper;
import com.ruoyi.system.domain.ExceptionInfo;
import com.ruoyi.system.service.IExceptionInfoService;

/**
 * 异常信息Service业务层处理
 * 
 * @author HelloWorld
 * @date 2021-03-25
 */
@Service
public class ExceptionInfoServiceImpl implements IExceptionInfoService 
{
    @Autowired
    private ExceptionInfoMapper exceptionInfoMapper;

    /**
     * 查询异常信息
     * 
     * @param id 异常信息ID
     * @return 异常信息
     */
    @Override
    public ExceptionInfo selectExceptionInfoById(Long id)
    {
        return exceptionInfoMapper.selectExceptionInfoById(id);
    }

    /**
     * 查询异常信息列表
     * 
     * @param exceptionInfo 异常信息
     * @return 异常信息
     */
    @Override
    public List<ExceptionInfo> selectExceptionInfoList(ExceptionInfo exceptionInfo)
    {
        return exceptionInfoMapper.selectExceptionInfoList(exceptionInfo);
    }

    /**
     * 新增异常信息
     * 
     * @param exceptionInfo 异常信息
     * @return 结果
     */
    @Override
    public int insertExceptionInfo(ExceptionInfo exceptionInfo)
    {
        exceptionInfo.setCreateTime(DateUtils.getNowDate());
        return exceptionInfoMapper.insertExceptionInfo(exceptionInfo);
    }

    /**
     * 修改异常信息
     * 
     * @param exceptionInfo 异常信息
     * @return 结果
     */
    @Override
    public int updateExceptionInfo(ExceptionInfo exceptionInfo)
    {
        exceptionInfo.setUpdateTime(DateUtils.getNowDate());
        return exceptionInfoMapper.updateExceptionInfo(exceptionInfo);
    }

    /**
     * 批量删除异常信息
     * 
     * @param ids 需要删除的异常信息ID
     * @return 结果
     */
    @Override
    public int deleteExceptionInfoByIds(Long[] ids)
    {
        return exceptionInfoMapper.deleteExceptionInfoByIds(ids);
    }

    /**
     * 删除异常信息信息
     * 
     * @param id 异常信息ID
     * @return 结果
     */
    @Override
    public int deleteExceptionInfoById(Long id)
    {
        return exceptionInfoMapper.deleteExceptionInfoById(id);
    }
}
