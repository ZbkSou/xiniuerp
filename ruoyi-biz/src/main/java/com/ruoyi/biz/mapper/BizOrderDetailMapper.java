package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.BizOrderDetail;

/**
 * 订单详情Mapper接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface BizOrderDetailMapper 
{
    /**
     * 查询订单详情
     * 
     * @param id 订单详情主键
     * @return 订单详情
     */
    public BizOrderDetail selectBizOrderDetailById(Integer id);

    /**
     * 查询订单详情列表
     * 
     * @param bizOrderDetail 订单详情
     * @return 订单详情集合
     */
    public List<BizOrderDetail> selectBizOrderDetailList(BizOrderDetail bizOrderDetail);

    /**
     * 新增订单详情
     * 
     * @param bizOrderDetail 订单详情
     * @return 结果
     */
    public int insertBizOrderDetail(BizOrderDetail bizOrderDetail);

    /**
     * 修改订单详情
     * 
     * @param bizOrderDetail 订单详情
     * @return 结果
     */
    public int updateBizOrderDetail(BizOrderDetail bizOrderDetail);

    /**
     * 删除订单详情
     * 
     * @param id 订单详情主键
     * @return 结果
     */
    public int deleteBizOrderDetailById(Integer id);

    /**
     * 批量删除订单详情
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizOrderDetailByIds(Integer[] ids);
}
