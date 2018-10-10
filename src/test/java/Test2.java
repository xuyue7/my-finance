import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * 使用URL读取页面内容
 * 
 * @author zun
 *
 */
public class Test2 {

	public static void main(String[] args) {
		// 创建一个URL实例
		try {
			URL url = new URL("http://www.baidu.com");
			// 通过URL的openStream方法，获取URL对象对象所表示的资源的字节输入流
			InputStream is = url.openStream();
			// 将字节输入流转换为字符输入流
			InputStreamReader isr = new InputStreamReader(is,"utf-8");
			// 为字符输入流添加缓冲
			BufferedReader br = new BufferedReader(isr);
			String data = br.readLine();// 读取数据
			while (data != null) {
				System.out.println(data);
				data = br.readLine();// 读取数据
			}
			br.close();// 关闭相应的资源
			isr.close();// 关闭字符输入流
			is.close();// 关闭字节输入流
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
