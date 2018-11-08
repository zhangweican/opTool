package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import task.Task;
import task.TaskFactory;

import com.alibaba.fastjson.JSONObject;

/**
 * 消息处理类
 * @author ts
 *
 */
public class WebSocketPushHandler implements WebSocketHandler{
	private static Logger log = Logger.getLogger(WebSocketPushHandler.class);
	private static final List<WebSocketSession> users = new ArrayList<>();
	
	//用户进入系统监听
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("成功进入了系统。。。");
		users.add(session);
	}

	//
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String content = (String) message.getPayload();
		String action = null;
		String params = null;
		try {
			JSONObject jo = JSONObject.parseObject(content);
			action = jo.getString("action");
			content = jo.getString("message");
			params = jo.getString("params");
		} catch (Exception e) {
			
		}
	    
	    //给指定用户群发消息
	    if(StringUtils.isNotEmpty(action)){
	    	Task task = TaskFactory.get(action);
	    	if(task == null){
	    		sendMessageToUser(session,new TextMessage("没有找到" + action + "的相关动作的Task<br>"));
	    	}else{
	    		task.doingAndPrint(session, params);
	    	}
	    }else{
	    	TextMessage msg = new TextMessage(content + "<br>");
	    	//给所有用户群发消息
	    	sendMessagesToUsers(msg);
	    }
	}
        
    //后台错误信息处理方法
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		 if(session.isOpen()){
		    	session.close();
		   }
		    users.remove(session);
	}

	//用户退出后的处理，不如退出之后，要将用户信息从websocket的session中remove掉，这样用户就处于离线状态了，也不会占用系统资源
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		if(session.isOpen()){
	    	session.close();
	    }
	    users.remove(session);
		System.out.println("安全退出了系统");
		
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}
	
	/**
	 * 给所有的用户发送消息
	 */
	public void sendMessagesToUsers(TextMessage message){
		for(WebSocketSession user : users){
			try {
			    //isOpen()在线就发送
				if(user.isOpen()){
					user.sendMessage(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 发送消息给指定的用户
	 */
	public void sendMessageToUser(WebSocketSession session,TextMessage message){
		try {
			if(session.isOpen()){
				session.sendMessage(message);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}