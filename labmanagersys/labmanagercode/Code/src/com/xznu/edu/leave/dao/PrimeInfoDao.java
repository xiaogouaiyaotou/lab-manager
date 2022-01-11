package com.xznu.edu.leave.dao;

import com.xznu.edu.leave.base.dao.BaseDao;
import com.xznu.edu.leave.model.PrimeInfo;
import com.xznu.edu.leave.utils.Pager;

public interface PrimeInfoDao extends BaseDao<PrimeInfo> {

    Pager<PrimeInfo> getList(PrimeInfo bean);
}
