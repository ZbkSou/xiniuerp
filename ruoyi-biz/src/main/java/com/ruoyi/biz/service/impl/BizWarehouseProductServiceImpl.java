package com.ruoyi.biz.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.biz.mapper.BizWarehouseProductMapper;
import com.ruoyi.biz.domain.BizWarehouseProduct;
import com.ruoyi.biz.service.IBizWarehouseProductService;

/**
 * 商品库存Service业务层处理
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@Service
public class BizWarehouseProductServiceImpl implements IBizWarehouseProductService 
{
    @Autowired
    private BizWarehouseProductMapper bizWarehouseProductMapper;

    /**
     * 查询商品库存
     * 
     * @param id 商品库存主键
     * @return 商品库存
     */
    @Override
    public BizWarehouseProduct selectBizWarehouseProductById(Integer id)
    {
        return bizWarehouseProductMapper.selectBizWarehouseProductById(id);
    }

    /**
     * 查询商品库存列表
     * 
     * @param bizWarehouseProduct 商品库存
     * @return 商品库存
     */
    @Override
    public List<BizWarehouseProduct> selectBizWarehouseProductList(BizWarehouseProduct bizWarehouseProduct)
    {
        return bizWarehouseProductMapper.selectBizWarehouseProductList(bizWarehouseProduct);
    }

    /**
     * 新增商品库存
     * 
     * @param bizWarehouseProduct 商品库存
     * @return 结果
     */
    @Override
    public int insertBizWarehouseProduct(BizWarehouseProduct bizWarehouseProduct)
    {
        bizWarehouseProduct.setCreateTime(DateUtils.getNowDate());
        return bizWarehouseProductMapper.insertBizWarehouseProduct(bizWarehouseProduct);
    }

    /**
     * 修改商品库存
     * 
     * @param bizWarehouseProduct 商品库存
     * @return 结果
     */
    @Override
    public int updateBizWarehouseProduct(BizWarehouseProduct bizWarehouseProduct)
    {
        bizWarehouseProduct.setUpdateTime(DateUtils.getNowDate());
        return bizWarehouseProductMapper.updateBizWarehouseProduct(bizWarehouseProduct);
    }

    /**
     * 批量删除商品库存
     * 
     * @param ids 需要删除的商品库存主键
     * @return 结果
     */
    @Override
    public int deleteBizWarehouseProductByIds(Integer[] ids)
    {
        return bizWarehouseProductMapper.deleteBizWarehouseProductByIds(ids);
    }

    /**
     * 删除商品库存信息
     * 
     * @param id 商品库存主键
     * @return 结果
     */
    @Override
    public int deleteBizWarehouseProductById(Integer id)
    {
        return bizWarehouseProductMapper.deleteBizWarehouseProductById(id);
    }
}
