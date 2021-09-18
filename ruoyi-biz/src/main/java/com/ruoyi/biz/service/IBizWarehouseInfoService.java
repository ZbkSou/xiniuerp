package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizWarehouseInfo;

/**
 * 仓库信息Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizWarehouseInfoService 
{
    /**
     * 查询仓库信息
     * 
     * @param wId 仓库信息主键
     * @return 仓库信息
     */
    public BizWarehouseInfo selectBizWarehouseInfoByWId(Integer wId);

    /**
     * 查询仓库信息列表
     * 
     * @param bizWarehouseInfo 仓库信息
     * @return 仓库信息集合
     */
    public List<BizWarehouseInfo> selectBizWarehouseInfoList(BizWarehouseInfo bizWarehouseInfo);

    /**
     * 新增仓库信息
     * 
     * @param bizWarehouseInfo 仓库信息
     * @return 结果
     */
    public int insertBizWarehouseInfo(BizWarehouseInfo bizWarehouseInfo);

    /**
     * 修改仓库信息
     * 
     * @param bizWarehouseInfo 仓库信息
     * @return 结果
     */
    public int updateBizWarehouseInfo(BizWarehouseInfo bizWarehouseInfo);

    /**
     * 批量删除仓库信息
     * 
     * @param wIds 需要删除的仓库信息主键集合
     * @return 结果
     */
    public int deleteBizWarehouseInfoByWIds(Integer[] wIds);

    /**
     * 删除仓库信息信息
     * 
     * @param wId 仓库信息主键
     * @return 结果
     */
    public int deleteBizWarehouseInfoByWId(Integer wId);
}
