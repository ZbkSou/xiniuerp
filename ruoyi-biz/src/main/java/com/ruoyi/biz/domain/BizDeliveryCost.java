package com.ruoyi.biz.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 发货成本对象 biz_delivery_cost
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizDeliveryCost extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 发货成本表ID */
    private Integer id;

    /** 订单商品ID */
    @Excel(name = "订单商品ID")
    private Integer productId;

    /** 产品分类ID */
    @Excel(name = "产品分类ID")
    private Integer categoryId;

    /** 商品编号 */
    @Excel(name = "商品编号")
    private String productCode;

    /** 供货商编号 */
    @Excel(name = "供货商编号")
    private String supplierCode;

    /** 是否拆单 */
    @Excel(name = "是否拆单")
    private Long splitShipment;

    /** 包装盒商品id */
    @Excel(name = "包装盒商品id")
    private Long boxId;

    /** 包装盒数量 */
    @Excel(name = "包装盒数量")
    private Long boxCnt;

    /** 额外包装成本 */
    @Excel(name = "额外包装成本")
    private BigDecimal extraPackageCost;

    /** 打包人工成本需要单独支付 */
    @Excel(name = "打包人工成本需要单独支付")
    private BigDecimal packageCost;

    /** 仓库ID */
    @Excel(name = "仓库ID")
    private Integer wId;

    /** 单独支付给仓库快递费 */
    @Excel(name = "单独支付给仓库快递费")
    private BigDecimal unpayDeliveryCost;

    /** 统一结算快递费 */
    @Excel(name = "统一结算快递费")
    private BigDecimal deliveryCost;
    /** 统一结算快递费 */
    @Excel(name = "更新人")
    private String updateBy;
    /** 统一结算快递费 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateTime;
    /** 统一结算快递费 */
    @Excel(name = "备注")
    private String remark;
    /** 最后修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifiedTime;

    @Override
    public String getUpdateBy() {
        return updateBy;
    }

    @Override
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String getRemark() {
        return remark;
    }

    @Override
    public void setRemark(String remark) {
        this.remark = remark;
    }

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
    public void setCategoryId(Integer categoryId) 
    {
        this.categoryId = categoryId;
    }

    public Integer getCategoryId() 
    {
        return categoryId;
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
    public void setSplitShipment(Long splitShipment) 
    {
        this.splitShipment = splitShipment;
    }

    public Long getSplitShipment() 
    {
        return splitShipment;
    }
    public void setBoxId(Long boxId) 
    {
        this.boxId = boxId;
    }

    public Long getBoxId() 
    {
        return boxId;
    }
    public void setBoxCnt(Long boxCnt) 
    {
        this.boxCnt = boxCnt;
    }

    public Long getBoxCnt() 
    {
        return boxCnt;
    }
    public void setExtraPackageCost(BigDecimal extraPackageCost) 
    {
        this.extraPackageCost = extraPackageCost;
    }

    public BigDecimal getExtraPackageCost() 
    {
        return extraPackageCost;
    }
    public void setPackageCost(BigDecimal packageCost) 
    {
        this.packageCost = packageCost;
    }

    public BigDecimal getPackageCost() 
    {
        return packageCost;
    }
    public void setwId(Integer wId) 
    {
        this.wId = wId;
    }

    public Integer getwId() 
    {
        return wId;
    }
    public void setUnpayDeliveryCost(BigDecimal unpayDeliveryCost) 
    {
        this.unpayDeliveryCost = unpayDeliveryCost;
    }

    public BigDecimal getUnpayDeliveryCost() 
    {
        return unpayDeliveryCost;
    }
    public void setDeliveryCost(BigDecimal deliveryCost) 
    {
        this.deliveryCost = deliveryCost;
    }

    public BigDecimal getDeliveryCost() 
    {
        return deliveryCost;
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
            .append("productId", getProductId())
            .append("categoryId", getCategoryId())
            .append("productCode", getProductCode())
            .append("supplierCode", getSupplierCode())
            .append("splitShipment", getSplitShipment())
            .append("boxId", getBoxId())
            .append("boxCnt", getBoxCnt())
            .append("extraPackageCost", getExtraPackageCost())
            .append("packageCost", getPackageCost())
            .append("wId", getwId())
            .append("unpayDeliveryCost", getUnpayDeliveryCost())
            .append("deliveryCost", getDeliveryCost())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("modifiedTime", getModifiedTime())
            .toString();
    }
}
