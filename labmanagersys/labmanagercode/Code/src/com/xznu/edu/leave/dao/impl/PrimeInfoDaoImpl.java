package com.xznu.edu.leave.dao.impl;

import com.xznu.edu.leave.base.dao.impl.BaseDaoImpl;
import com.xznu.edu.leave.dao.PrimeInfoDao;
import com.xznu.edu.leave.model.PrimeInfo;
import com.xznu.edu.leave.utils.Pager;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class PrimeInfoDaoImpl extends BaseDaoImpl<PrimeInfo> implements PrimeInfoDao {
    Map<String, Object> tmp = new HashMap<String, Object>();

    @Override
    public Pager<PrimeInfo> getList(PrimeInfo bean) {
        Map<String, Object> alias = new HashMap<String, Object>();
        StringBuffer sb = new StringBuffer();
        sb.append("from PrimeInfo");
        if (bean != null) {
            if (bean.getId() != null && !"".equals(bean.getId())) {
                sb.append(" and id like :id");
                alias.put("id", "%" + bean.getId() + "%");
            }
            if (bean.getTitle() != null && !"".equals(bean.getTitle())) {
                sb.append(" and title like :title");
                alias.put("title", "%" + bean.getTitle().trim() + "%");
            }
            if (bean.getDescription() != null && !"".equals(bean.getDescription())) {
                sb.append(" and description = :description");
                alias.put("description", bean.getDescription());
            }
            if (bean.getUrl() != null && !"".equals(bean.getUrl())) {
                sb.append(" and url like :url");
                alias.put("url", "%" + bean.getUrl().trim() + "%");
            }
        }
        tmp=alias;
        return findByAlias(sb.toString(), alias);
    }


    @Override
    public PrimeInfo findById(Integer id) {
        StringBuilder sb = new StringBuilder();
        sb.append("from PrimeInfo where id = :id");
        Query query = getSession().createQuery(sb.toString());
        query.setParameter("id", id);
        return (PrimeInfo) query.uniqueResult();
    }
}
