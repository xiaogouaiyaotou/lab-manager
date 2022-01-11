package com.xznu.edu.leave.service;

import com.xznu.edu.leave.model.PrimeInfo;
import com.xznu.edu.leave.utils.Pager;

public interface PrimeInfoService extends BaseService<PrimeInfo> {

    Pager<PrimeInfo> getList(PrimeInfo bean);
    PrimeInfo findById(Integer id);
}
