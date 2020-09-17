package com.unknown.drawboard.entity;

public class SocketData {
    //对话ID
    String sessionId;
    //对话密码，拥有此密码可编辑画布
    String password;
    //数据
    String Data;
    //发送对话的客户端随机ID，用于广播时排除自身
    String senderId;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getData() {
        return Data;
    }

    public void setData(String data) {
        Data = data;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }
}