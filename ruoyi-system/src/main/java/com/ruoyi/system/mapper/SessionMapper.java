package com.ruoyi.system.mapper;

import com.ruoyi.common.utils.res2map.MapResultHandler;
import com.ruoyi.system.domain.OrderStatus;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by 万恶de亚撒西 on 2021/3/31.
 */
@Repository
public class SessionMapper extends SqlSessionDaoSupport {

    @Override
    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }

    @SuppressWarnings("unchecked")
    public Map<Integer,Integer> getOrdersGroupByStatus() {
        MapResultHandler handler = new MapResultHandler();
        // this.getSqlSession().select(namespace+".methodName", handler);
        // namespace: xxxdao.xml文件中mapper的namespace值
        // methodName:xxxdao.xml文件中定义的方法名queryNameAge
        this.getSqlSession().select(IndexInfoMapper.class.getName() +".getOrdersGroupByStatus", handler);
        Map<Integer,Integer> map = handler.getMappedResults();
        return map;
    }
}
