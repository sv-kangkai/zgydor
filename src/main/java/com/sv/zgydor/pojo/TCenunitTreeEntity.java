package com.sv.zgydor.pojo;

import javax.persistence.*;

@Entity
@Table(name = "T_CENUNIT_TREE", schema = "YHB", catalog = "")
public class TCenunitTreeEntity {
    private int rgid;
    private String name;
    private String code;
    private String parcode;
    private String subcode;
    private String regionlevel;
    private String smx;
    private String smy;
    private String rgmemo;
    private String status;

    @Id
    @Column(name = "RGID", nullable = false, precision = 0)
    public int getRgid() {
        return rgid;
    }

    public void setRgid(int rgid) {
        this.rgid = rgid;
    }

    @Basic
    @Column(name = "NAME", nullable = false, length = 56)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "CODE", nullable = false, length = 22)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "PARCODE", nullable = true, length = 12)
    public String getParcode() {
        return parcode;
    }

    public void setParcode(String parcode) {
        this.parcode = parcode;
    }

    @Basic
    @Column(name = "SUBCODE", nullable = true, length = 12)
    public String getSubcode() {
        return subcode;
    }

    public void setSubcode(String subcode) {
        this.subcode = subcode;
    }

    @Basic
    @Column(name = "REGIONLEVEL", nullable = true, length = 1)
    public String getRegionlevel() {
        return regionlevel;
    }

    public void setRegionlevel(String regionlevel) {
        this.regionlevel = regionlevel;
    }

    @Basic
    @Column(name = "SMX", nullable = true, length = 50)
    public String getSmx() {
        return smx;
    }

    public void setSmx(String smx) {
        this.smx = smx;
    }

    @Basic
    @Column(name = "SMY", nullable = true, length = 50)
    public String getSmy() {
        return smy;
    }

    public void setSmy(String smy) {
        this.smy = smy;
    }

    @Basic
    @Column(name = "RGMEMO", nullable = true, length = 200)
    public String getRgmemo() {
        return rgmemo;
    }

    public void setRgmemo(String rgmemo) {
        this.rgmemo = rgmemo;
    }

    @Basic
    @Column(name = "STATUS", nullable = true, length = 1)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TCenunitTreeEntity that = (TCenunitTreeEntity) o;

        if (rgid != that.rgid) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (code != null ? !code.equals(that.code) : that.code != null) return false;
        if (parcode != null ? !parcode.equals(that.parcode) : that.parcode != null) return false;
        if (subcode != null ? !subcode.equals(that.subcode) : that.subcode != null) return false;
        if (regionlevel != null ? !regionlevel.equals(that.regionlevel) : that.regionlevel != null) return false;
        if (smx != null ? !smx.equals(that.smx) : that.smx != null) return false;
        if (smy != null ? !smy.equals(that.smy) : that.smy != null) return false;
        if (rgmemo != null ? !rgmemo.equals(that.rgmemo) : that.rgmemo != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rgid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + (parcode != null ? parcode.hashCode() : 0);
        result = 31 * result + (subcode != null ? subcode.hashCode() : 0);
        result = 31 * result + (regionlevel != null ? regionlevel.hashCode() : 0);
        result = 31 * result + (smx != null ? smx.hashCode() : 0);
        result = 31 * result + (smy != null ? smy.hashCode() : 0);
        result = 31 * result + (rgmemo != null ? rgmemo.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
