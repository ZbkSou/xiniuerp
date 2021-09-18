package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizOrderMaster;

/**
 * 订单主Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizOrderMasterService 
{
    /**
     * 查询订单主
     * 
     * @param id 订单主主键
     * @return 订单主
     */
    public BizOrderMaster selectBizOrderMasterById(Integer id);

    /**
     * 查询订单主列表
     * 
     * @param bizOrderMaster 订单主
     * @return 订单主集合
     */
    public List<BizOrderMaster> selectBizOrderMasterList(BizOrderMaster bizOrderMaster);

    /**
     * 新增订单主
     * 
     * @param bizOrderMaster 订单主
     * @return 结果
     */
    public int insertBizOrderMaster(BizOrderMaster bizOrderMaster);

    /**
     * 修改订单主
     * 
     * @param bizOrderMaster 订单主
     * @return 结果
     */
    public int updateBizOrderMaster(BizOrderMaster bizOrderMaster);

    /**
     * 批量删除订单主
     * 
     * @param ids 需要删除的订单主主键集合
     * @return 结果
     */
    public int deleteBizOrderMasterByIds(Integer[] ids);

    /**
     * 删除订单主信息
     * 
     * @param id 订单主主键
     * @return 结果
     */
    public int deleteBizOrderMasterById(Integer id);
}
