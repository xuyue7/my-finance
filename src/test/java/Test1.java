import java.net.MalformedURLException;
import java.net.URL;

/**
 * 关于URL的常用方法
 * 
 * @author zun
 *
 */
public class Test1 {
	public static void main(String[] args) {
		try {
			URL baidu = new URL("http://www.ylcloudcastle.cn");
			URL url = new URL(baidu, "cloud/storelist.html?index=2#test1");// #锚点
			System.out.println("协议：" + url.getProtocol());
			System.out.println("输出主机:" + url.getHost());
			// 如果未指定端口号，使用默认端口号,此时getPort()方法返回值为-1
			System.out.println("端口号：" + url.getPort());
			System.out.println("文件路径:" + url.getPath());
			System.out.println("文件名：" + url.getFile());
			System.out.println("相对路径：" + url.getRef());
			System.out.println("查询字符串" + url.getQuery());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}

}
