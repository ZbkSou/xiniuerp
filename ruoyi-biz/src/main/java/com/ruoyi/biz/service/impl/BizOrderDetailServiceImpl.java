package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizOrderDetailMapper;
import com.ruoyi.biz.domain.BizOrderDetail;
import com.ruoyi.biz.service.IBizOrderDetailService;

/**
 * 订单详情Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizOrderDetailServiceImpl implements IBizOrderDetailService 
{
    @Autowired
    private BizOrderDetailMapper bizOrderDetailMapper;

    /**
     * 查询订单详情
     * 
     * @param id 订单详情主键
     * @return 订单详情
     */
    @Override
    public BizOrderDetail selectBizOrderDetailById(Integer id)
    {
        return bizOrderDetailMapper.selectBizOrderDetailById(id);
    }

    /**
     * 查询订单详情列表
     * 
     * @param bizOrderDetail 订单详情
     * @return 订单详情
     */
    @Override
    public List<BizOrderDetail> selectBizOrderDetailList(BizOrderDetail bizOrderDetail)
    {
        return bizOrderDetailMapper.selectBizOrderDetailList(bizOrderDetail);
    }

    /**
     * 新增订单详情
     * 
     * @param bizOrderDetail 订单详情
     * @return 结果
     */
    @Override
    public int insertBizOrderDetail(BizOrderDetail bizOrderDetail)
    {
        return bizOrderDetailMapper.insertBizOrderDetail(bizOrderDetail);
    }

    /**
     * 修改订单详情
     * 
     * @param bizOrderDetail 订单详情
     * @return 结果
     */
    @Override
    public int updateBizOrderDetail(BizOrderDetail bizOrderDetail)
    {
        bizOrderDetail.setUpdateTime(DateUtils.getNowDate());
        return bizOrderDetailMapper.updateBizOrderDetail(bizOrderDetail);
    }

    /**
     * 批量删除订单详情
     * 
     * @param ids 需要删除的订单详情主键
     * @return 结果
     */
    @Override
    public int deleteBizOrderDetailByIds(Integer[] ids)
    {
        return bizOrderDetailMapper.deleteBizOrderDetailByIds(ids);
    }

    /**
     * 删除订单详情信息
     * 
     * @param id 订单详情主键
     * @return 结果
     */
    @Override
    public int deleteBizOrderDetailById(Integer id)
    {
        return bizOrderDetailMapper.deleteBizOrderDetailById(id);
    }
}
