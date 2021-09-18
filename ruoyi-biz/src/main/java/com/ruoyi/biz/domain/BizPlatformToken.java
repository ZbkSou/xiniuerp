package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 三方平台对象 biz_platform_token
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizPlatformToken extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 部门ID */
    @Excel(name = "部门ID")
    private Long deptId;

    /** $column.columnComment */
    @Excel(name = "部门ID")
    private String refreshToken;

    /** $column.columnComment */
    @Excel(name = "部门ID")
    private String accessToken;

    /** $column.columnComment */
    @Excel(name = "部门ID")
    private String code;

    /** 到期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "到期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expireTime;

    /** 平台类型 */
    @Excel(name = "平台类型")
    private String platform;

    /** 店铺名 */
    @Excel(name = "店铺名")
    private String storeName;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setRefreshToken(String refreshToken) 
    {
        this.refreshToken = refreshToken;
    }

    public String getRefreshToken() 
    {
        return refreshToken;
    }
    public void setAccessToken(String accessToken) 
    {
        this.accessToken = accessToken;
    }

    public String getAccessToken() 
    {
        return accessToken;
    }
    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setExpireTime(Date expireTime) 
    {
        this.expireTime = expireTime;
    }

    public Date getExpireTime() 
    {
        return expireTime;
    }
    public void setPlatform(String platform) 
    {
        this.platform = platform;
    }

    public String getPlatform() 
    {
        return platform;
    }
    public void setStoreName(String storeName) 
    {
        this.storeName = storeName;
    }

    public String getStoreName() 
    {
        return storeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deptId", getDeptId())
            .append("refreshToken", getRefreshToken())
            .append("accessToken", getAccessToken())
            .append("code", getCode())
            .append("expireTime", getExpireTime())
            .append("platform", getPlatform())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("storeName", getStoreName())
            .toString();
    }
}
