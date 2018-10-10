import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;



/**
 * InetAdress类
 * 
 * @author zun
 *
 */
public class Test {

	public static void main(String[] args) throws UnknownHostException {
		// 获取本机InetAdress实例
		InetAddress address = InetAddress.getLocalHost();
		System.out.println("计算机：" + address.getHostName());
		System.out.println("IP地址：" + address.getHostAddress());
		byte[] bytes = address.getAddress();//获取字节数组形式的IP地址
		System.out.println("字节数组形式的IP：" + Arrays.toString(bytes));
		System.out.println(address);//直接输出InetAddress对象
		
		//根据计算机名获取InetAddress实例
//		InetAddress address1 = InetAddress.getByName("DESKTOP-AVFFIJJ");
		InetAddress address1 = InetAddress.getByName("192.168.236.1");
		System.out.println("计算机：" + address1.getHostName());
		System.out.println("IP地址：" + address1.getHostAddress());
	}

}
