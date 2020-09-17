package com.unknown.drawboard.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Table(name = "drawboard_record")
public class DrawboardRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "drawboard_id")
    private Integer drawboardId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDrawboardId() {
        return drawboardId;
    }

    public void setDrawboardId(Integer drawboardId) {
        this.drawboardId = drawboardId;
    }
}