package com.ruoyi.biz.service;

import java.util.List;
import com.ruoyi.biz.domain.BizWarehouseProduct;

/**
 * 商品库存Service接口
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public interface IBizWarehouseProductService 
{
    /**
     * 查询商品库存
     * 
     * @param id 商品库存主键
     * @return 商品库存
     */
    public BizWarehouseProduct selectBizWarehouseProductById(Integer id);

    /**
     * 查询商品库存列表
     * 
     * @param bizWarehouseProduct 商品库存
     * @return 商品库存集合
     */
    public List<BizWarehouseProduct> selectBizWarehouseProductList(BizWarehouseProduct bizWarehouseProduct);

    /**
     * 新增商品库存
     * 
     * @param bizWarehouseProduct 商品库存
     * @return 结果
     */
    public int insertBizWarehouseProduct(BizWarehouseProduct bizWarehouseProduct);

    /**
     * 修改商品库存
     * 
     * @param bizWarehouseProduct 商品库存
     * @return 结果
     */
    public int updateBizWarehouseProduct(BizWarehouseProduct bizWarehouseProduct);

    /**
     * 批量删除商品库存
     * 
     * @param ids 需要删除的商品库存主键集合
     * @return 结果
     */
    public int deleteBizWarehouseProductByIds(Integer[] ids);

    /**
     * 删除商品库存信息
     * 
     * @param id 商品库存主键
     * @return 结果
     */
    public int deleteBizWarehouseProductById(Integer id);
}
