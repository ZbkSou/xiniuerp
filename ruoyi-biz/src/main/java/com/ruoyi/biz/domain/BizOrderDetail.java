package com.ruoyi.biz.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单详情对象 biz_order_detail
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizOrderDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单详情表ID */
    private Integer id;

    /** 订单表ID */
    @Excel(name = "订单表ID")
    private Integer orderId;

    /** 订单商品ID */
    @Excel(name = "订单商品ID")
    private Integer productId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String productName;

    /** 商品编号 */
    @Excel(name = "商品编号")
    private String productCode;

    /** 供货商编号 */
    @Excel(name = "供货商编号")
    private String supplierCode;

    /** 购买商品数量 */
    @Excel(name = "购买商品数量")
    private Long productCnt;

    /** 购买商品单价 */
    @Excel(name = "购买商品单价")
    private BigDecimal productPrice;

    /** 平均成本价格 */
    @Excel(name = "平均成本价格")
    private BigDecimal averageCost;

    /** 商品重量 */
    @Excel(name = "商品重量")
    private Long weight;

    /** 优惠分摊金额 */
    @Excel(name = "优惠分摊金额")
    private BigDecimal feeMoney;

    /** 仓库ID */
    @Excel(name = "仓库ID")
    private Integer wId;

    /** 最后修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifiedTime;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setOrderId(Integer orderId) 
    {
        this.orderId = orderId;
    }

    public Integer getOrderId() 
    {
        return orderId;
    }
    public void setProductId(Integer productId) 
    {
        this.productId = productId;
    }

    public Integer getProductId() 
    {
        return productId;
    }
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }
    public void setProductCode(String productCode) 
    {
        this.productCode = productCode;
    }

    public String getProductCode() 
    {
        return productCode;
    }
    public void setSupplierCode(String supplierCode) 
    {
        this.supplierCode = supplierCode;
    }

    public String getSupplierCode() 
    {
        return supplierCode;
    }
    public void setProductCnt(Long productCnt) 
    {
        this.productCnt = productCnt;
    }

    public Long getProductCnt() 
    {
        return productCnt;
    }
    public void setProductPrice(BigDecimal productPrice) 
    {
        this.productPrice = productPrice;
    }

    public BigDecimal getProductPrice() 
    {
        return productPrice;
    }
    public void setAverageCost(BigDecimal averageCost) 
    {
        this.averageCost = averageCost;
    }

    public BigDecimal getAverageCost() 
    {
        return averageCost;
    }
    public void setWeight(Long weight) 
    {
        this.weight = weight;
    }

    public Long getWeight() 
    {
        return weight;
    }
    public void setFeeMoney(BigDecimal feeMoney) 
    {
        this.feeMoney = feeMoney;
    }

    public BigDecimal getFeeMoney() 
    {
        return feeMoney;
    }
    public void setwId(Integer wId) 
    {
        this.wId = wId;
    }

    public Integer getwId() 
    {
        return wId;
    }
    public void setModifiedTime(Date modifiedTime) 
    {
        this.modifiedTime = modifiedTime;
    }

    public Date getModifiedTime() 
    {
        return modifiedTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("productId", getProductId())
            .append("productName", getProductName())
            .append("productCode", getProductCode())
            .append("supplierCode", getSupplierCode())
            .append("productCnt", getProductCnt())
            .append("productPrice", getProductPrice())
            .append("averageCost", getAverageCost())
            .append("weight", getWeight())
            .append("feeMoney", getFeeMoney())
            .append("wId", getwId())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("modifiedTime", getModifiedTime())
            .toString();
    }
}
