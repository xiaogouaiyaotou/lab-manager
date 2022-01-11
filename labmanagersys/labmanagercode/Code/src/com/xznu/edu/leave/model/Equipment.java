package com.xznu.edu.leave.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="t_equipment")
public class Equipment implements Serializable {
    @Id
    private String contruct_id;
    public String getContruct_id() {
        return contruct_id;
    }
    public void setContruct_id(String contruct_id){
        this.contruct_id=contruct_id;
    }
    private String expression_cassettes;
    public String getExpression_cassettes() {
        return expression_cassettes;
    }
    public void setExpression_cassettes(String expression_cassettes){
        this.expression_cassettes=expression_cassettes;
    }
    private String original_id;
    public String getOriginal_id() {
        return original_id;
    }
    public void setOriginal_id(String original_id){
        this.original_id=original_id;
    }
    private String vector_backbone;
    public String getVector_backbone() {
        return vector_backbone;
    }
    public void setVector_backbone(String vector_backbone){
        this.vector_backbone=vector_backbone;
    }
    private String target;
    public String getTarget() {
        return target;
    }
    public void setTarget(String target){
        this.target=target;
    }
    private String bacterium_selection;
    public String getBacterium_selection() {
        return bacterium_selection;
    }
    public void setBacterium_selection(String bacterium_selection){
        this.bacterium_selection=bacterium_selection;
    }
    private String plant_selection;
    public String getPlant_selection() {
        return plant_selection;
    }
    public void setPlant_selection(String plant_selection){
        this.plant_selection=plant_selection;
    }
    private String note;
    public String getNote() {
        return note;
    }
    public void setNote(String note){
        this.note=note;
    }
    private String builder_id;
    public String getBuilder_id() {
        return builder_id;
    }
    public void setBuilder_id(String builder_id){
        this.builder_id=builder_id;
    }
    private String remark;
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
    private String createtime;
    public String getCreatetime() {
        return createtime;
    }
    public void setCreatetime(String createtime){
        this.createtime=createtime;
    }
}
