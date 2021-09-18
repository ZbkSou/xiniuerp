package com.ruoyi.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizSupplierInfoMapper;
import com.ruoyi.biz.domain.BizSupplierInfo;
import com.ruoyi.biz.service.IBizSupplierInfoService;

/**
 * 供应商信息Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizSupplierInfoServiceImpl implements IBizSupplierInfoService 
{
    @Autowired
    private BizSupplierInfoMapper bizSupplierInfoMapper;

    /**
     * 查询供应商信息
     * 
     * @param supplierId 供应商信息主键
     * @return 供应商信息
     */
    @Override
    public BizSupplierInfo selectBizSupplierInfoBySupplierId(Integer supplierId)
    {
        return bizSupplierInfoMapper.selectBizSupplierInfoBySupplierId(supplierId);
    }

    /**
     * 查询供应商信息列表
     * 
     * @param bizSupplierInfo 供应商信息
     * @return 供应商信息
     */
    @Override
    public List<BizSupplierInfo> selectBizSupplierInfoList(BizSupplierInfo bizSupplierInfo)
    {
        return bizSupplierInfoMapper.selectBizSupplierInfoList(bizSupplierInfo);
    }

    /**
     * 新增供应商信息
     * 
     * @param bizSupplierInfo 供应商信息
     * @return 结果
     */
    @Override
    public int insertBizSupplierInfo(BizSupplierInfo bizSupplierInfo)
    {
        return bizSupplierInfoMapper.insertBizSupplierInfo(bizSupplierInfo);
    }

    /**
     * 修改供应商信息
     * 
     * @param bizSupplierInfo 供应商信息
     * @return 结果
     */
    @Override
    public int updateBizSupplierInfo(BizSupplierInfo bizSupplierInfo)
    {
        return bizSupplierInfoMapper.updateBizSupplierInfo(bizSupplierInfo);
    }

    /**
     * 批量删除供应商信息
     * 
     * @param supplierIds 需要删除的供应商信息主键
     * @return 结果
     */
    @Override
    public int deleteBizSupplierInfoBySupplierIds(Integer[] supplierIds)
    {
        return bizSupplierInfoMapper.deleteBizSupplierInfoBySupplierIds(supplierIds);
    }

    /**
     * 删除供应商信息信息
     * 
     * @param supplierId 供应商信息主键
     * @return 结果
     */
    @Override
    public int deleteBizSupplierInfoBySupplierId(Integer supplierId)
    {
        return bizSupplierInfoMapper.deleteBizSupplierInfoBySupplierId(supplierId);
    }
}
