package com.xznu.edu.leave.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
@Entity
@Table(name="primer_info")
public class PrimeInfo implements Serializable {
    private Integer id;

    //实验室名称
    @Id
    @GeneratedValue

    public Integer getId() {
        return id;
    }
    public void setId(Integer id){
        this.id=id;
    }
    public String title;
    public void setTitle(String title){
        this.title=title;
    }
    public String getTitle(){return title;}
    public String description;
    public void setDescription(String description){
        this.description=description;
    }
    public String getDescription(){return description;}
    public String url;
    public void setUrl(String url){
        this.url=url;
    }
    public String getUrl(){return url;}
    public String createtime;
    public void setCreatetime(String createtime){
        this.createtime=createtime;
    }
    public String getCreatetime(){return createtime;}




}
