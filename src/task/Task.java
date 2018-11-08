package task;

import org.springframework.web.socket.WebSocketSession;

/**
 * 
 * @author Zhangweican
 *
 */
public abstract class Task {
	/**
	 * 执行指定动作，并且打印记过给session
	 * @param session
	 * @param params
	 */
	public abstract void doingAndPrint(WebSocketSession session,String params);
}
