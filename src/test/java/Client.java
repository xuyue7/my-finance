import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * 客户端
 * 
 * @author zun
 *
 */
public class Client {

	public static void main(String[] args) {
		try {
			// 1.创建客户端的socket，指定服务器地址和端口
			Socket socket = new Socket("localhost", 8888);
			// 2.获取输出流，用来向服务器端发送信息
			OutputStream os = socket.getOutputStream();// 字节输出流
			PrintWriter pw = new PrintWriter(os);// 将输出流包装为打印流
			pw.write("用户名：admin；密码：123456");
			pw.flush();
			socket.shutdownOutput();
			os.close();
			pw.close();
			socket.close();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
