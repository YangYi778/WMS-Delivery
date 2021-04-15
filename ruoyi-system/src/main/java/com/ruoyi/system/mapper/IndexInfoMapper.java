package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.IndexInfo;
import com.ruoyi.system.domain.OrderStatus;
import org.apache.ibatis.annotations.MapKey;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by 万恶de亚撒西 on 2021/3/29.
 */
@Repository
public interface IndexInfoMapper {



    public Map<Integer, Integer> getOrdersGroupByStatus();

    public Integer getGoodTypeQty();

    public Integer getOutboundGoodQty();

    public Integer getExpiryGoodQty();

    public Integer getNewInnerOrderQty(Integer day);

    public Integer getFinInnerOrderQty(Integer day);

    public Integer getNewOutboundOrderQty(Integer day);

    public Integer getFinOutboundOrderQty(Integer day);
}
