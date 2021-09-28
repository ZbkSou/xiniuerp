package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 仓库信息对象 biz_warehouse_info
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizWarehouseInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 仓库ID */
    private Integer wId;

    /** 仓库编码 */
    @Excel(name = "仓库编码")
    private String warehouseSn;

    /** 仓库名称 */
    @Excel(name = "仓库名称")
    private String warehoustName;

    /** 仓库电话 */
    @Excel(name = "仓库电话")
    private String warehousePhone;

    /** 仓库联系人 */
    @Excel(name = "仓库联系人")
    private String contact;

    /** 省 */
    @Excel(name = "省")
    private String province;

    /** 市 */
    @Excel(name = "市")
    private String city;

    /** 区 */
    @Excel(name = "区")
    private String distrct;

    /** 仓库地址 */
    @Excel(name = "仓库地址")
    private String address;

    /** 仓库状态：0禁用，1启用 */
    @Excel(name = "仓库状态：0禁用，1启用")
    private Integer warehouseStatus;

    /** 最后修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifiedTime;

    public void setwId(Integer wId) 
    {
        this.wId = wId;
    }

    public Integer getwId() 
    {
        return wId;
    }
    public void setWarehouseSn(String warehouseSn) 
    {
        this.warehouseSn = warehouseSn;
    }

    public String getWarehouseSn() 
    {
        return warehouseSn;
    }
    public void setWarehoustName(String warehoustName) 
    {
        this.warehoustName = warehoustName;
    }

    public String getWarehoustName() 
    {
        return warehoustName;
    }
    public void setWarehousePhone(String warehousePhone) 
    {
        this.warehousePhone = warehousePhone;
    }

    public String getWarehousePhone() 
    {
        return warehousePhone;
    }
    public void setContact(String contact) 
    {
        this.contact = contact;
    }

    public String getContact() 
    {
        return contact;
    }
    public void setProvince(String province)
    {
        this.province = province;
    }

    public String getProvince()
    {
        return province;
    }
    public void setCity(String city)
    {
        this.city = city;
    }

    public String getCity()
    {
        return city;
    }
    public void setDistrct(String distrct)
    {
        this.distrct = distrct;
    }

    public String getDistrct()
    {
        return distrct;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setWarehouseStatus(Integer warehouseStatus) 
    {
        this.warehouseStatus = warehouseStatus;
    }

    public Integer getWarehouseStatus() 
    {
        return warehouseStatus;
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
            .append("wId", getwId())
            .append("warehouseSn", getWarehouseSn())
            .append("warehoustName", getWarehoustName())
            .append("warehousePhone", getWarehousePhone())
            .append("contact", getContact())
            .append("province", getProvince())
            .append("city", getCity())
            .append("distrct", getDistrct())
            .append("address", getAddress())
            .append("warehouseStatus", getWarehouseStatus())
            .append("modifiedTime", getModifiedTime())
            .toString();
    }
}
