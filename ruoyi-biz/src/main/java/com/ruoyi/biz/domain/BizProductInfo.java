package com.ruoyi.biz.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品信息对象 biz_product_info
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizProductInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品ID */
    private Integer id;

    /** 商品编码 */
    @Excel(name = "商品编码")
    private String productCode;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String productName;

    /** 国条码 */
    @Excel(name = "国条码")
    private String barCode;

    /** 一级分类ID */
    @Excel(name = "一级分类ID")
    private Integer oneCategoryId;

    /** 二级分类ID */
    @Excel(name = "二级分类ID")
    private Integer twoCategoryId;

    /** 三级分类ID */
    @Excel(name = "三级分类ID")
    private Integer threeCategoryId;

    /** 商品的供应商ID */
    @Excel(name = "商品的供应商ID")
    private Integer supplierId;

    /** 供应商编码 */
    @Excel(name = "供应商编码")
    private String supplierCode;

    /** 上下架状态：0下架1上架 */
    @Excel(name = "上下架状态：0下架1上架")
    private Integer publishStatus;

    /** 审核状态：0未审核，1已审核 */
    @Excel(name = "审核状态：0未审核，1已审核")
    private Integer auditStatus;

    /** 商品重量 */
    @Excel(name = "商品重量")
    private Long weight;

    /** 商品长度 */
    @Excel(name = "商品长度")
    private Long length;

    /** 商品高度 */
    @Excel(name = "商品高度")
    private Long height;

    /** 商品宽度 */
    @Excel(name = "商品宽度")
    private Long width;

    /** 产品型号 */
    @Excel(name = "产品型号")
    private String productModels;

    /** 商品默认出厂成本 */
    @Excel(name = "商品默认出厂成本")
    private BigDecimal defaultCost;

    /** 商品有效期 */
    @Excel(name = "商品有效期")
    private Long shelfLife;

    /** 商品描述 */
    @Excel(name = "商品描述")
    private String descript;

    /** 商品提醒 */
    @Excel(name = "商品提醒")
    private String remind;

    /** 拥有多型号：0否1是 */
    @Excel(name = "拥有多型号：0否1是")
    private Integer manyModels;

    /** 商品录入时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "商品录入时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date indate;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remark2;

    /** 备注3 */
    @Excel(name = "备注3")
    private String remark3;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
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
    public void setBarCode(String barCode) 
    {
        this.barCode = barCode;
    }

    public String getBarCode() 
    {
        return barCode;
    }
    public void setOneCategoryId(Integer oneCategoryId) 
    {
        this.oneCategoryId = oneCategoryId;
    }

    public Integer getOneCategoryId() 
    {
        return oneCategoryId;
    }
    public void setTwoCategoryId(Integer twoCategoryId) 
    {
        this.twoCategoryId = twoCategoryId;
    }

    public Integer getTwoCategoryId() 
    {
        return twoCategoryId;
    }
    public void setThreeCategoryId(Integer threeCategoryId) 
    {
        this.threeCategoryId = threeCategoryId;
    }

    public Integer getThreeCategoryId() 
    {
        return threeCategoryId;
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
    public void setPublishStatus(Integer publishStatus) 
    {
        this.publishStatus = publishStatus;
    }

    public Integer getPublishStatus() 
    {
        return publishStatus;
    }
    public void setAuditStatus(Integer auditStatus) 
    {
        this.auditStatus = auditStatus;
    }

    public Integer getAuditStatus() 
    {
        return auditStatus;
    }
    public void setWeight(Long weight) 
    {
        this.weight = weight;
    }

    public Long getWeight() 
    {
        return weight;
    }
    public void setLength(Long length) 
    {
        this.length = length;
    }

    public Long getLength() 
    {
        return length;
    }
    public void setHeight(Long height) 
    {
        this.height = height;
    }

    public Long getHeight() 
    {
        return height;
    }
    public void setWidth(Long width) 
    {
        this.width = width;
    }

    public Long getWidth() 
    {
        return width;
    }
    public void setProductModels(String productModels) 
    {
        this.productModels = productModels;
    }

    public String getProductModels() 
    {
        return productModels;
    }
    public void setDefaultCost(BigDecimal defaultCost) 
    {
        this.defaultCost = defaultCost;
    }

    public BigDecimal getDefaultCost() 
    {
        return defaultCost;
    }
    public void setShelfLife(Long shelfLife) 
    {
        this.shelfLife = shelfLife;
    }

    public Long getShelfLife() 
    {
        return shelfLife;
    }
    public void setDescript(String descript) 
    {
        this.descript = descript;
    }

    public String getDescript() 
    {
        return descript;
    }
    public void setRemind(String remind) 
    {
        this.remind = remind;
    }

    public String getRemind() 
    {
        return remind;
    }
    public void setManyModels(Integer manyModels) 
    {
        this.manyModels = manyModels;
    }

    public Integer getManyModels() 
    {
        return manyModels;
    }
    public void setIndate(Date indate) 
    {
        this.indate = indate;
    }

    public Date getIndate() 
    {
        return indate;
    }
    public void setRemark2(String remark2) 
    {
        this.remark2 = remark2;
    }

    public String getRemark2() 
    {
        return remark2;
    }
    public void setRemark3(String remark3) 
    {
        this.remark3 = remark3;
    }

    public String getRemark3() 
    {
        return remark3;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("productCode", getProductCode())
            .append("productName", getProductName())
            .append("barCode", getBarCode())
            .append("oneCategoryId", getOneCategoryId())
            .append("twoCategoryId", getTwoCategoryId())
            .append("threeCategoryId", getThreeCategoryId())
            .append("supplierId", getSupplierId())
            .append("supplierCode", getSupplierCode())
            .append("publishStatus", getPublishStatus())
            .append("auditStatus", getAuditStatus())
            .append("weight", getWeight())
            .append("length", getLength())
            .append("height", getHeight())
            .append("width", getWidth())
            .append("productModels", getProductModels())
            .append("defaultCost", getDefaultCost())
            .append("shelfLife", getShelfLife())
            .append("descript", getDescript())
            .append("remind", getRemind())
            .append("manyModels", getManyModels())
            .append("indate", getIndate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("remark2", getRemark2())
            .append("remark3", getRemark3())
            .toString();
    }
}
