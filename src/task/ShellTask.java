package task;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.log4j.Logger;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.test.controller.WebSocketPushHandler;

public class ShellTask extends Task {
	private static Logger log = Logger.getLogger(WebSocketPushHandler.class); 
	@Override
	public void doingAndPrint(WebSocketSession session, String params) {
     	try {
     		session.sendMessage(new TextMessage("正在发送远程处理...<br>"));
     		Process process = Runtime.getRuntime().exec(params);
     		InputStream inputStream = process.getInputStream();
     		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
     		String line = null;
            try {
                while((line = reader.readLine()) != null) {
                    // 将实时日志通过WebSocket发送给客户端，给每一行添加一个HTML换行
                    session.sendMessage(new TextMessage(line + "<br>"));
                }
            } catch (Exception e) {
                log.error("获取shell执行命令失败",e);
            }
            session.sendMessage(new TextMessage("<br>操作完成<br>"));
		} catch (Exception e1) {
			log.error("获取shell执行命令失败",e1);
			try {
				session.sendMessage(new TextMessage(e1.getMessage() + "<br>"));
			} catch (IOException e) {
			}
		}
		
	}
}