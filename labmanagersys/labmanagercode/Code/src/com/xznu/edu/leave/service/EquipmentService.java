package com.xznu.edu.leave.service;

import com.xznu.edu.leave.model.Equipment;
import com.xznu.edu.leave.model.User;
import com.xznu.edu.leave.utils.Pager;

import java.util.List;

public interface EquipmentService extends BaseService<Equipment> {

    Pager<Equipment> getList(Equipment bean);
    Pager<Equipment> findid();
    Equipment findById(Integer id);
    Equipment findid(String id);
    void deletebystring(String id);
}
