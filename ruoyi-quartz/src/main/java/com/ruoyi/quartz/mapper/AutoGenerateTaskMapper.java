package com.ruoyi.quartz.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by 万恶de亚撒西 on 2021/4/2.
 */
@Repository
public interface AutoGenerateTaskMapper {

    public List<String> getConfirmOrderQty();

    public Integer getConfirmGoodQty();

    public List<String> getMinuteRangeOrderQty(Integer minute);

    public int updateBatchNo(@Param("orderNoList") List<String> orderNoList, @Param("batchNo") String batchNo);

}
