package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.HOrderDao;
import com.javaex.vo.ShoppingVo;
import com.javaex.vo.UserVo;

@Service
public class HOrderService {

    @Autowired
    private HOrderDao hOrderDao;

    public List<ShoppingVo> getSelectedShoppingItems(Map<String, Object> params) {
        return hOrderDao.getSelectedShoppingItems(params);
    }

    public UserVo exeUserOne(UserVo userVo) {
        return hOrderDao.getUserOne(userVo);
    }
}
