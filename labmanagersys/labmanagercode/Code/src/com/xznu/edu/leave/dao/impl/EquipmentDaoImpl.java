package com.xznu.edu.leave.dao.impl;

import com.xznu.edu.leave.base.dao.impl.BaseDaoImpl;
import com.xznu.edu.leave.dao.EquipmentDao;
import com.xznu.edu.leave.dao.LaboratoryDao;
import com.xznu.edu.leave.model.Equipment;
import com.xznu.edu.leave.model.Laboratory;
import com.xznu.edu.leave.utils.Pager;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class EquipmentDaoImpl extends BaseDaoImpl<Equipment> implements EquipmentDao {
    Map<String, Object> tmp = new HashMap<String, Object>();

    @Override
    public Pager<Equipment> getList(Equipment bean) {
        Map<String, Object> alias = new HashMap<String, Object>();
        StringBuffer sb = new StringBuffer();
        sb.append("from Equipment");
        if (bean != null) {
            if (bean.getContruct_id() != null && !"".equals(bean.getContruct_id())) {
                sb.append(" and contruct_id like :contruct_id");
                alias.put("contruct_id", "%" + bean.getContruct_id().trim() + "%");
            }
            if (bean.getExpression_cassettes() != null && !"".equals(bean.getExpression_cassettes())) {
                sb.append(" and expression_cassettes = :expression_cassettes");
                alias.put("expression_cassettes", bean.getExpression_cassettes());
            }
            if (bean.getOriginal_id() != null && !"".equals(bean.getOriginal_id())) {
                sb.append(" and original_id like :original_id");
                alias.put("original_id", "%" + bean.getOriginal_id().trim() + "%");
            }
            if (bean.getVector_backbone() != null && !"".equals(bean.getVector_backbone())) {
                sb.append(" and vector_backbone like :vector_backbone");
                alias.put("vector_backbone", "%" + bean.getVector_backbone().trim() + "%");
            }
            if (bean.getTarget() != null && !"".equals(bean.getTarget())) {
                sb.append(" and target like :target");
                alias.put("target", "%" + bean.getTarget().trim() + "%");
            }
            if (bean.getBacterium_selection() != null && !"".equals(bean.getBacterium_selection())) {
                sb.append(" and bacterium_selection like :bacterium_selection");
                alias.put("bacterium_selection", "%" + bean.getBacterium_selection().trim() + "%");
            }
            if (bean.getPlant_selection() != null && !"".equals(bean.getPlant_selection())) {
                sb.append(" and plant_selection like :plant_selection");
                alias.put("plant_selection", "%" + bean.getPlant_selection().trim() + "%");
            }
            if (bean.getNote() != null && !"".equals(bean.getNote())) {
                sb.append(" and note like :note");
                alias.put("note", "%" + bean.getNote().trim() + "%");
            }
            if (bean.getBuilder_id() != null && !"".equals(bean.getBuilder_id())) {
                sb.append(" and builder_id like :builder_id");
                alias.put("builder_id", "%" + bean.getBuilder_id().trim() + "%");
            }
            if (bean.getRemark() != null && !"".equals(bean.getRemark())) {
                sb.append(" and remark like :remark");
                alias.put("remark", "%" + bean.getRemark().trim() + "%");
            }
            if (bean.getCreatetime() != null && !"".equals(bean.getCreatetime())) {
                sb.append(" and createtime like :createtime");
                alias.put("createtime", "%" + bean.getCreatetime().trim() + "%");
            }

        }
        tmp=alias;
        return findByAlias(sb.toString(), alias);
    }
    @Override
    public Pager<Equipment> findid() {
        return findlastestid();
    }

    public void deletebystring(String id){
        deletestring(id);
    }

    @Override
    public Equipment findid(String id){
        Object[] tmp=(Object[]) findbystringid(id);
        Equipment t=new Equipment();
        t.setContruct_id(String.valueOf(tmp[0]));
        t.setExpression_cassettes(String.valueOf(tmp[1]));
        t.setOriginal_id(String.valueOf(tmp[2]));
        t.setVector_backbone(String.valueOf(tmp[3]));
        t.setTarget(String.valueOf(tmp[4]));
        t.setBacterium_selection(String.valueOf(tmp[5]));
        t.setPlant_selection(String.valueOf(tmp[6]));
        t.setNote(String.valueOf(tmp[7]));
        t.setBuilder_id(String.valueOf(tmp[8]));
        t.setRemark(String.valueOf(tmp[9]));
        t.setCreatetime(String.valueOf(tmp[10]));
        return t;
    }
//    @Override
//    public Equipment findById(String contruct_id) {
//        StringBuilder sb = new StringBuilder();
//        sb.append("from Equipment where and contruct_id = :contruct_id");
//        Query query = getSession().createQuery(sb.toString());
//        query.setParameter("contruct_id", contruct_id);
//        return (Equipment) query.uniqueResult();
//    }
}
