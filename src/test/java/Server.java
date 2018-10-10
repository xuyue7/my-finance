import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * 基于TCP协议的通信，实现用户登陆 服务器端
 * 
 * @author zun
 *
 */
public class Server {
	public static void main(String[] args) {
		try {
			// 1.创建服务器端的Socket，即ServerScoket,指定绑定此端口
			ServerSocket serverScoket = new ServerSocket(8888);
			// 2.调用accept()方法开始监听。等待客户端的链接
			System.out.println("****服务器即将启动，等待客户链接****");
			Socket socket = serverScoket.accept();
			// 3.获取输入流，读取客户端信息
			InputStream is = socket.getInputStream();// 字节输入流
			InputStreamReader isr = new InputStreamReader(is);// 将字节流转换为字符流
			BufferedReader br = new BufferedReader(isr);// 为输入流添加缓冲
			String info = null;
			while ((info = br.readLine()) != null) {// 循环读取客户端的信息
				System.out.println("我是服务器,客户端说" + info);
			}
			socket.shutdownInput();// 关闭输入流
			br.close();// 关闭资源
			isr.close();
			is.close();
			socket.close();
			serverScoket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
