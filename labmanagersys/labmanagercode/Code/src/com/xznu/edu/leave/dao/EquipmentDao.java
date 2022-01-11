package com.xznu.edu.leave.dao;

import com.xznu.edu.leave.base.dao.BaseDao;
import com.xznu.edu.leave.model.Equipment;
import com.xznu.edu.leave.utils.Pager;

public interface EquipmentDao extends BaseDao<Equipment> {

    Pager<Equipment> getList(Equipment bean);
    Pager<Equipment> findid();

    void deletebystring(String id);
    Equipment findid(String id);
}
