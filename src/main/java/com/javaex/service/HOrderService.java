package com.javaex.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.HOrderDao;
import com.javaex.vo.ItemVo;
import com.javaex.vo.ReceiptVo;
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
    

    // 영수증 저장
    public int saveReceipt(int userNo, String address, int totalPrice, String paymentMethod) {
        ReceiptVo receiptVo = new ReceiptVo();
        receiptVo.setUserNo(userNo);
        receiptVo.setAddress(address);
        receiptVo.setTotalPrice(totalPrice);
        receiptVo.setPayment(paymentMethod);
        receiptVo.setPaymentDate(new Date());
        receiptVo.setExp("주문완료");  // 배송 상태 초기값 설정
        
        hOrderDao.insertReceipt(receiptVo);

        return receiptVo.getReceiptNo();  // 저장된 영수증 번호 반환
    }

    // 아이템 저장
    public void saveItem(ShoppingVo item, int receiptNo) {
        ItemVo itemVo = new ItemVo();
        itemVo.setReceiptNo(receiptNo);
        itemVo.setAmount(item.getCount());
        itemVo.setEachPrice(item.getPrice());
        itemVo.setTaste(item.getTaste());
        itemVo.setOptionsNo(item.getOptionsNo());

        hOrderDao.insertItem(itemVo);  // DB에 저장
    }
}
