package com.ruoyi.common.utils.res2map;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 万恶de亚撒西 on 2021/3/31.
 */
public class MapResultHandler implements ResultHandler {

    @SuppressWarnings("rawtypes")
    private final Map mappedResults = new HashMap();

    @SuppressWarnings("unchecked")
    @Override
    public void handleResult(ResultContext context) {
        @SuppressWarnings("rawtypes")
        Map map = (Map) context.getResultObject();
        // xml配置里面的property的值，对应的列
        mappedResults.put(map.get("key"), map.get("value"));
    }

    @SuppressWarnings("rawtypes")
    public Map getMappedResults() {
        return mappedResults;
    }
}
