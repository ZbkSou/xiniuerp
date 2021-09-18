package com.ruoyi.biz.mapper;

import java.util.List;
import com.ruoyi.biz.domain.BizSupplierInfo;

/**
 * 供应商信息Mapper接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface BizSupplierInfoMapper 
{
    /**
     * 查询供应商信息
     * 
     * @param supplierId 供应商信息主键
     * @return 供应商信息
     */
    public BizSupplierInfo selectBizSupplierInfoBySupplierId(Integer supplierId);

    /**
     * 查询供应商信息列表
     * 
     * @param bizSupplierInfo 供应商信息
     * @return 供应商信息集合
     */
    public List<BizSupplierInfo> selectBizSupplierInfoList(BizSupplierInfo bizSupplierInfo);

    /**
     * 新增供应商信息
     * 
     * @param bizSupplierInfo 供应商信息
     * @return 结果
     */
    public int insertBizSupplierInfo(BizSupplierInfo bizSupplierInfo);

    /**
     * 修改供应商信息
     * 
     * @param bizSupplierInfo 供应商信息
     * @return 结果
     */
    public int updateBizSupplierInfo(BizSupplierInfo bizSupplierInfo);

    /**
     * 删除供应商信息
     * 
     * @param supplierId 供应商信息主键
     * @return 结果
     */
    public int deleteBizSupplierInfoBySupplierId(Integer supplierId);

    /**
     * 批量删除供应商信息
     * 
     * @param supplierIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizSupplierInfoBySupplierIds(Integer[] supplierIds);
}
