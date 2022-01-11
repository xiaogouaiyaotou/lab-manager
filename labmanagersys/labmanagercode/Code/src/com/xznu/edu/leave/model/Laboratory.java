package com.xznu.edu.leave.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="t_Laboratory")
public class Laboratory implements Serializable {

    private Integer id;
    //实验室名称
    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }
    private String productname;
    public void setProductname(String productname){
        this.productname=productname;
    }
    public String getProductname(){
        return productname;
    }
    private String applicant;
    public void setApplicant(String applicant){
        this.applicant=applicant;
    }
    public String getApplicant(){
        return applicant;
    }
    private String applydate;
    public void setApplydate(String applydate){
        this.applydate=applydate;
    }
    public String getApplydate(){
        return applydate;
    }
    private String price;
    public void setPrice(String price){
        this.price=price;
    }
    public String getPrice(){
        return price;
    }
    private String actprice;
    public void setActprice(String actprice){
        this.actprice=actprice;
    }
    public String getActprice(){
        return actprice;
    }
    private String num;
    public void setNum(String num){
        this.num=num;
    }
    public String getNum(){
        return num;
    }
    private String unitprice;
    public void setUnitprice(String unitprice){
        this.unitprice=unitprice;
    }
    public String getUnitprice(){
        return unitprice;
    }
    private String productnum;
    public void setProductnum(String productnum){
        this.productnum=productnum;
    }
    public String getProductnum(){
        return productnum;
    }
    private String manufacturer;
    public void setManufacturer(String manufacturer){
        this.manufacturer=manufacturer;
    }
    public String getManufacturer(){
        return manufacturer;
    }
    private String provider;
    public void setProvider(String provider){
        this.provider=provider;
    }
    public String getProvider(){
        return provider;
    }
    private String receiptdate;
    public void setReceiptdate(String receiptdate){
        this.receiptdate=receiptdate;
    }
    public String getReceiptdate(){
        return receiptdate;
    }
    private String purpose;
    public void setPurpose(String purpose){
        this.purpose=purpose;
    }
    public String getPurpose(){
        return purpose;
    }
    private String umeasurement;
    public void setUmeasurement(String umeasurement){
        this.umeasurement=umeasurement;
    }
    public String getUmeasurement(){
        return umeasurement;
    }
    private String expurpose;
    public void setExpurpose(String expurpose){
        this.expurpose=expurpose;
    }
    public String getExpurpose(){
        return expurpose;
    }
    private String receiptnum;
    public void setReceiptnum(String receiptnum){
        this.receiptnum=receiptnum;
    }
    public String getReceiptnum(){
        return receiptnum;
    }
    private String status;
    public void setStatus(String status){
        this.status=status;
    }
    public String getStatus(){
        return status;
    }
    private String location;
    public void setLocation(String location){
        this.location=location;
    }
    public String getLocation(){
        return location;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
