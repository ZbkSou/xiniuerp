package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 进货单详情对象 biz_purchasing_detail
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizPurchasingDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 进货表详情ID */
    private Integer id;

    /** 进货单ID */
    @Excel(name = "进货单ID")
    private Integer purchasingId;

    /** 商品编码 */
    @Excel(name = "商品编码")
    private String productCode;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String productName;

    /** 商品id */
    @Excel(name = "商品id")
    private Integer productId;
    /** 商品型号id */
    @Excel(name = "商品型号id")
    private String productModelsId;

    /** 数量 */
    @Excel(name = "数量")
    private Integer count;

    /** 单价 */
    @Excel(name = "单价")
    private Long pice;

    /** 商品的供应商ID */
    @Excel(name = "商品的供应商ID")
    private Integer supplierId;

    /** 供应商编码 */
    @Excel(name = "供应商编码")
    private String supplierCode;

    /** 仓库ID */
    @Excel(name = "仓库ID")
    private Integer wId;

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
    public void setPurchasingId(Integer purchasingId) 
    {
        this.purchasingId = purchasingId;
    }

    public Integer getPurchasingId() 
    {
        return purchasingId;
    }
    public void setProductCode(String productCode) 
    {
        this.productCode = productCode;
    }

    public String getProductCode() 
    {
        return productCode;
    }
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }
    public void setProductModelsId(String productModelsId) 
    {
        this.productModelsId = productModelsId;
    }

    public String getProductModelsId() 
    {
        return productModelsId;
    }
    public void setCount(Integer count) 
    {
        this.count = count;
    }

    public Integer getCount() 
    {
        return count;
    }
    public void setPice(Long pice) 
    {
        this.pice = pice;
    }

    public Long getPice() 
    {
        return pice;
    }
    public void setSupplierId(Integer supplierId) 
    {
        this.supplierId = supplierId;
    }

    public Integer getSupplierId() 
    {
        return supplierId;
    }
    public void setSupplierCode(String supplierCode) 
    {
        this.supplierCode = supplierCode;
    }

    public String getSupplierCode() 
    {
        return supplierCode;
    }
    public void setwId(Integer wId) 
    {
        this.wId = wId;
    }

    public Integer getwId() 
    {
        return wId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("purchasingId", getPurchasingId())
            .append("productCode", getProductCode())
            .append("productName", getProductName())
            .append("productModelsId", getProductModelsId())
            .append("count", getCount())
            .append("pice", getPice())
            .append("supplierId", getSupplierId())
            .append("supplierCode", getSupplierCode())
            .append("wId", getwId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
