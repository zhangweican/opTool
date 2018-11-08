package task;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 
 * @author Zhangweican
 *
 */
public abstract class TaskFactory {
	private final static Map<String,Task> tasks = new HashMap<String,Task>();
	
	static{
		tasks.put("shell", new ShellTask());
		tasks.put("sshShell", new SSHShellTask());
		tasks.put("cmd", new CmdTask());
	}
	
	/**
	 * 执行并且范围
	 * @param session
	 */
	public static Task get(String action){
		for(Entry<String, Task> e : tasks.entrySet()){
			if(e.getKey().equalsIgnoreCase(action)){
				return e.getValue();
			}
		}
		return null;
	}
}
