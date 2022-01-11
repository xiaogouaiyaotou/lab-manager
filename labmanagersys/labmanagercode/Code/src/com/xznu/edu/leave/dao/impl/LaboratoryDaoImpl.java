package com.xznu.edu.leave.dao.impl;

import com.xznu.edu.leave.base.dao.impl.BaseDaoImpl;
import com.xznu.edu.leave.dao.LaboratoryDao;
import com.xznu.edu.leave.dao.UserDao;
import com.xznu.edu.leave.model.Laboratory;
import com.xznu.edu.leave.model.User;
import com.xznu.edu.leave.utils.Pager;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class LaboratoryDaoImpl extends BaseDaoImpl<Laboratory> implements LaboratoryDao {

    @Override
    public Pager<Laboratory> getList(Laboratory bean) {
        Map<String, Object> alias = new HashMap<String, Object>();
        StringBuffer sb = new StringBuffer();
        sb.append("from Laboratory");
        if (bean != null) {
            if (bean.getProductname() != null && !"".equals(bean.getProductname())) {
                sb.append(" and productname like :productname");
                alias.put("productname", "%" + bean.getProductname().trim() + "%");
            }
            if (bean.getApplicant() != null && !"".equals(bean.getApplicant())) {
                sb.append(" and applicant like :applicant");
                alias.put("applicant", "%" + bean.getApplicant().trim() + "%");
            }
            if (bean.getApplydate() != null && !"".equals(bean.getApplydate())) {
                sb.append(" and applydate like :applydate");
                alias.put("applydate", "%" + bean.getApplydate().trim() + "%");
            }
            if (bean.getPrice() != null && !"".equals(bean.getPrice())) {
                sb.append(" and price like :price");
                alias.put("price", "%" + bean.getPrice().trim() + "%");
            }
            if (bean.getActprice() != null && !"".equals(bean.getActprice())) {
                sb.append(" and actprice like :actprice");
                alias.put("actprice", "%" + bean.getActprice().trim() + "%");
            }
            if (bean.getNum() != null && !"".equals(bean.getNum())) {
                sb.append(" and num like :num");
                alias.put("num", "%" + bean.getNum().trim() + "%");
            }
            if (bean.getUnitprice() != null && !"".equals(bean.getUnitprice())) {
                sb.append(" and unitprice like :unitprice");
                alias.put("unitprice", "%" + bean.getUnitprice().trim() + "%");
            }
            if (bean.getProductnum() != null && !"".equals(bean.getProductnum())) {
                sb.append(" and productnum like :productnum");
                alias.put("productnum", "%" + bean.getProductnum().trim() + "%");
            }
            if (bean.getManufacturer() != null && !"".equals(bean.getManufacturer())) {
                sb.append(" and manufacturer like :manufacturer");
                alias.put("manufacturer", "%" + bean.getManufacturer().trim() + "%");
            }
            if (bean.getProvider() != null && !"".equals(bean.getProvider())) {
                sb.append(" and provider like :provider");
                alias.put("provider", "%" + bean.getProvider().trim() + "%");
            }
            if (bean.getReceiptdate() != null && !"".equals(bean.getReceiptdate())) {
                sb.append(" and receiptdate like :receiptdate");
                alias.put("receiptdate", "%" + bean.getReceiptdate().trim() + "%");
            }
            if (bean.getReceiptdate() != null && !"".equals(bean.getReceiptdate())) {
                sb.append(" and receiptdate like :receiptdate");
                alias.put("receiptdate", "%" + bean.getReceiptdate().trim() + "%");
            }
            if (bean.getPurpose() != null && !"".equals(bean.getPurpose())) {
                sb.append(" and purpose like :purpose");
                alias.put("purpose", "%" + bean.getPurpose().trim() + "%");
            }
            if (bean.getUmeasurement() != null && !"".equals(bean.getUmeasurement())) {
                sb.append(" and umeasurement like :umeasurement");
                alias.put("umeasurement", "%" + bean.getUmeasurement().trim() + "%");
            }
            if (bean.getExpurpose() != null && !"".equals(bean.getExpurpose())) {
                sb.append(" and expurpose like :expurpose");
                alias.put("expurpose", "%" + bean.getExpurpose().trim() + "%");
            }
            if (bean.getReceiptnum() != null && !"".equals(bean.getReceiptnum())) {
                sb.append(" and receiptnum like :receiptnum");
                alias.put("receiptnum", "%" + bean.getReceiptnum().trim() + "%");
            }
            if (bean.getStatus() != null && !"".equals(bean.getStatus())) {
                sb.append(" and status like :status");
                alias.put("status", "%" + bean.getStatus().trim() + "%");
            }
            if (bean.getLocation() != null && !"".equals(bean.getLocation())) {
                sb.append(" and location like :location");
                alias.put("location", "%" + bean.getLocation().trim() + "%");
            }
        }

        String tmp=sb.toString();
        System.out.println(alias);
        return findByAlias(sb.toString(), alias);
    }

    @Override
    public Laboratory findById(Integer id) {
        StringBuilder sb = new StringBuilder();
        sb.append("from Laboratory where id = :id");
        Query query = getSession().createQuery(sb.toString());
        query.setParameter("id", id);
        return (Laboratory) query.uniqueResult();
    }
}
