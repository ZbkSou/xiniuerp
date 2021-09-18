package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品库存对象 biz_warehouse_product
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizWarehouseProduct extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 库存ID */
    private Integer id;

    /** 商品ID */
    @Excel(name = "商品ID")
    private Integer productId;

    /** 型号ID */
    @Excel(name = "型号ID")
    private Integer modelId;

    /** 仓库ID */
    @Excel(name = "仓库ID")
    private Integer wId;

    /** 位置 */
    @Excel(name = "位置")
    private String place;

    /** 当前商品数量 */
    @Excel(name = "当前商品数量")
    private Integer currentCnt;

    /** 当前占用数据 */
    @Excel(name = "当前占用数据")
    private Integer lockCnt;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setProductId(Integer productId) 
    {
        this.productId = productId;
    }

    public Integer getProductId() 
    {
        return productId;
    }
    public void setModelId(Integer modelId) 
    {
        this.modelId = modelId;
    }

    public Integer getModelId() 
    {
        return modelId;
    }
    public void setwId(Integer wId) 
    {
        this.wId = wId;
    }

    public Integer getwId() 
    {
        return wId;
    }
    public void setPlace(String place) 
    {
        this.place = place;
    }

    public String getPlace() 
    {
        return place;
    }
    public void setCurrentCnt(Integer currentCnt) 
    {
        this.currentCnt = currentCnt;
    }

    public Integer getCurrentCnt() 
    {
        return currentCnt;
    }
    public void setLockCnt(Integer lockCnt) 
    {
        this.lockCnt = lockCnt;
    }

    public Integer getLockCnt() 
    {
        return lockCnt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("productId", getProductId())
            .append("modelId", getModelId())
            .append("wId", getwId())
            .append("place", getPlace())
            .append("currentCnt", getCurrentCnt())
            .append("lockCnt", getLockCnt())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
