package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 供应商信息对象 biz_supplier_info
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizSupplierInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 供应商ID */
    private Integer supplierId;

    /** 供应商编码 */
    @Excel(name = "供应商编码")
    private String supplierCode;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 供应商类型：1.自营，2.平台 */
    @Excel(name = "供应商类型：1.自营，2.平台")
    private Integer supplierType;

    /** 供应商联系人 */
    @Excel(name = "供应商联系人")
    private String linkMan;

    /** 供应商负责人 */
    @Excel(name = "供应商负责人")
    private String principalMan;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phoneNumber;

    /** 供应商开户银行名称 */
    @Excel(name = "供应商开户银行名称")
    private String bankName;

    /** 银行账号 */
    @Excel(name = "银行账号")
    private String bankAccount;

    /** 供应商地址 */
    @Excel(name = "供应商地址")
    private String address;

    /** 状态：0禁止，1启用 */
    @Excel(name = "状态：0禁止，1启用")
    private Integer supplierStatus;

    /** 最后修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifiedTime;

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
    public void setSupplierName(String supplierName) 
    {
        this.supplierName = supplierName;
    }

    public String getSupplierName() 
    {
        return supplierName;
    }
    public void setSupplierType(Integer supplierType) 
    {
        this.supplierType = supplierType;
    }

    public Integer getSupplierType() 
    {
        return supplierType;
    }
    public void setLinkMan(String linkMan) 
    {
        this.linkMan = linkMan;
    }

    public String getLinkMan() 
    {
        return linkMan;
    }
    public void setPrincipalMan(String principalMan) 
    {
        this.principalMan = principalMan;
    }

    public String getPrincipalMan() 
    {
        return principalMan;
    }
    public void setPhoneNumber(String phoneNumber) 
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() 
    {
        return phoneNumber;
    }
    public void setBankName(String bankName) 
    {
        this.bankName = bankName;
    }

    public String getBankName() 
    {
        return bankName;
    }
    public void setBankAccount(String bankAccount) 
    {
        this.bankAccount = bankAccount;
    }

    public String getBankAccount() 
    {
        return bankAccount;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setSupplierStatus(Integer supplierStatus) 
    {
        this.supplierStatus = supplierStatus;
    }

    public Integer getSupplierStatus() 
    {
        return supplierStatus;
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
            .append("supplierId", getSupplierId())
            .append("supplierCode", getSupplierCode())
            .append("supplierName", getSupplierName())
            .append("supplierType", getSupplierType())
            .append("linkMan", getLinkMan())
            .append("principalMan", getPrincipalMan())
            .append("phoneNumber", getPhoneNumber())
            .append("bankName", getBankName())
            .append("bankAccount", getBankAccount())
            .append("address", getAddress())
            .append("supplierStatus", getSupplierStatus())
            .append("modifiedTime", getModifiedTime())
            .toString();
    }
}
