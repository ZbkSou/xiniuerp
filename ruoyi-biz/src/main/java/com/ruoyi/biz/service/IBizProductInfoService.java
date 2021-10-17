package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizProductInfo;

/**
 * 商品信息Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizProductInfoService 
{
    /**
     * 查询商品信息
     * 
     * @param id 商品信息主键
     * @return 商品信息
     */
    public BizProductInfo selectBizProductInfoById(Integer id);
    /**
     * 查询商品
     *
     * @param id 商品信息主键
     * @return 商品信息
     */
    public BizProductInfo selectBizProductInfoByCode(String id);
    /**
     * 查询商品信息列表
     * 
     * @param bizProductInfo 商品信息
     * @return 商品信息集合
     */
    public List<BizProductInfo> selectBizProductInfoList(BizProductInfo bizProductInfo);

    /**
     * 新增商品信息
     * 
     * @param bizProductInfo 商品信息
     * @return 结果
     */
    public int insertBizProductInfo(BizProductInfo bizProductInfo);

    /**
     * 修改商品信息
     * 
     * @param bizProductInfo 商品信息
     * @return 结果
     */
    public int updateBizProductInfo(BizProductInfo bizProductInfo);

    /**
     * 批量删除商品信息
     * 
     * @param ids 需要删除的商品信息主键集合
     * @return 结果
     */
    public int deleteBizProductInfoByIds(Integer[] ids);

    /**
     * 删除商品信息信息
     * 
     * @param id 商品信息主键
     * @return 结果
     */
    public int deleteBizProductInfoById(Integer id);
}
