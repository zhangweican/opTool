package task;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

public class CmdTask extends Task {

	@Override
	public void doingAndPrint(WebSocketSession session, String params) {
     	try {
     		Process process = Runtime.getRuntime().exec(params);
     		InputStream inputStream = process.getInputStream();
     		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream,"GB2312"));
     		String line = null;
            try {
                while((line = reader.readLine()) != null) {
                    // 将实时日志通过WebSocket发送给客户端，给每一行添加一个HTML换行
                    session.sendMessage(new TextMessage(line + "<br>"));
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
		} catch (IOException e1) {
			try {
				session.sendMessage(new TextMessage(e1.getMessage() + "<br>"));
			} catch (IOException e) {
			}
		}
		
	}
}