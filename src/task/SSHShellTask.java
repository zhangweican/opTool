package task;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.log4j.Logger;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.test.controller.WebSocketPushHandler;

public class SSHShellTask extends Task {
	private static Logger log = Logger.getLogger(WebSocketPushHandler.class); 
	@Override
	public void doingAndPrint(WebSocketSession session, String params) {
     	try {
     		session.sendMessage(new TextMessage("正在发送远程处理...<br>"));
     		params = params.trim();
     		int i = params.indexOf(" ");
     		if(i == -1){
     			session.sendMessage(new TextMessage("没有包含请求IP地址...<br>"));
     			return;
     		}
     		String host = params.substring(0,i);
     		String cmd = params.substring(i);
     		String msg = exec(host, "username", "password", 22, cmd.trim());
     		msg = msg.replaceAll("\n\r", "<br>");
     		msg = msg.replaceAll("\n", "<br>");
     		session.sendMessage(new TextMessage(msg + "<br>操作完成<br>"));
		} catch (Exception e1) {
			log.error("获取shell执行命令失败",e1);
			try {
				session.sendMessage(new TextMessage(e1.getMessage() + "<br>"));
			} catch (IOException e) {
			}
		}
		
	}
	
	
    /**
     * 远程 执行命令并返回结果调用过程 是同步的（执行完才会返回）
     * @param host  主机名
     * @param user  用户名
     * @param psw   密码
     * @param port  端口
     * @param command   命令
     * @return
     */
    public static String exec(String host,String user,String psw,int port,String command){
        StringBuffer sb= new StringBuffer();
        Session session =null;
        ChannelExec openChannel =null;
        try {
            JSch jsch=new JSch();
            session = jsch.getSession(user, host, port);
            java.util.Properties config = new java.util.Properties();
            config.put("StrictHostKeyChecking", "no");//跳过公钥的询问
            session.setConfig(config);
            session.setPassword(psw);
            session.connect(10000);//设置连接的超时时间
            openChannel = (ChannelExec) session.openChannel("exec");
            openChannel.setCommand(command); //执行命令
            openChannel.setInputStream( null );
            openChannel.setErrStream( System.err );
            int exitStatus = openChannel.getExitStatus(); //退出状态为-1，直到通道关闭
            System.out.println(exitStatus);
            
            
            // 下面是得到输出的内容
            openChannel.connect();
            InputStream in = openChannel.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            
            byte[] tmp = new byte[1024];
            while (true) {
            	while (in.available() > 0) {
            		int i = in.read(tmp, 0, 1024);
            		if (i < 0) break;
            		sb.append(new String(tmp, 0, i));
            	}
            	if (openChannel.isClosed()) {
            		if (in.available() > 0) continue;
            		//sb.append("完成<br>");
            		break;
            	}
            	try {
            		Thread.sleep(1000);
            	} catch (Exception ee) {
            	}
            }
            
            
            /*String buf = null;
            while ((buf = reader.readLine()) != null) {
                sb.append(buf+"\n");
            }*/
        } catch (JSchException | IOException e) {
            sb.append(e.getMessage()+"\n");
        }finally{
            if(openChannel!=null&&!openChannel.isClosed()){
                openChannel.disconnect();
            }
            if(session!=null&&session.isConnected()){
                session.disconnect();
            }
        }
        return sb.toString();
    }	
}