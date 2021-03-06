package pers.shayz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.bean.Orderdetails;
import pers.shayz.bean.OrderdetailsExample;
import pers.shayz.bean.Orderitem;
import pers.shayz.bean.OrderitemExample;
import pers.shayz.dao.OrderdetailsMapper;
import pers.shayz.dao.OrderitemMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class OrderItemService {

    @Autowired
    OrderitemMapper orderitemMapper;

    @Autowired
    OrderdetailsMapper orderdetailsMapper;

    public void Save(Orderitem orderitem) {
        orderitemMapper.insert(orderitem);
    }

    public List<Orderitem> getOrderItemByUserId(int id) {
        OrderitemExample orderitemExample = new OrderitemExample();
        OrderitemExample.Criteria criteria = orderitemExample.createCriteria();
        criteria.andUseridFkOrderitemEqualTo(id).andFlagEqualTo(1);

        return orderitemMapper.selectByExample(orderitemExample);

    }

    public String deleteOrderItemByOId(int id) {
        Orderitem orderitem = orderitemMapper.selectByPrimaryKey(id);
//        orderitem.setOrderitemid(id);
        orderitem.setFlag(0);
        System.out.println("deleteOrderItemByOId: "+orderitem);
        orderitemMapper.updateByPrimaryKeySelective(orderitem);

        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria criteria = orderdetailsExample.createCriteria();
        criteria.andOrderitemidFkOrderEqualTo(id).andFlagEqualTo(1);

        List<Orderdetails> list = orderdetailsMapper.selectByExample(orderdetailsExample);
        System.out.println("deleteOrderItemByOId: "+list);
        for (int i = 0; i < list.size(); i++) {
            Orderdetails orderdetails = list.get(i);
            orderdetails.setFlag(0);
            orderdetailsMapper.updateByPrimaryKeySelective(orderdetails);
        }

        return "delete success";
    }

    public Orderitem getOrderItemByOrderitemId(int id){
        return orderitemMapper.selectByPrimaryKey(id);
    }

}
