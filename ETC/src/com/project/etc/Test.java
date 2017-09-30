package com.project.etc;

import java.io.IOException;
import java.net.MalformedURLException;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class Test {
	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		Test test = new Test();
		try {
			while (true) {
				test.getHomeTile();
			}
		} catch (FailingHttpStatusCodeException | IOException e) {
			e.printStackTrace();
		}
	}

	public static void getHomeTile() throws FailingHttpStatusCodeException,
			MalformedURLException, IOException {
		long start = System.currentTimeMillis();
		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		webClient.getOptions().setJavaScriptEnabled(true);
		webClient.getOptions().setCssEnabled(false);
		webClient.getOptions().setRedirectEnabled(true);
		webClient.getOptions().setThrowExceptionOnScriptError(false);
		webClient.getOptions().setTimeout(5000);
		HtmlPage rootPage = webClient.getPage("https://www.jubi.com/coin/etc/");
		webClient.waitForBackgroundJavaScript(5000);

		String price = rootPage.asText();
		price = price.replaceAll("\\s*", "");

		price = price.substring(price.indexOf("聚宝币JBC") + 6,
				price.indexOf("聚宝币JBC") + 13);
		System.out.println(price);
		float m;
		String falsePrice = new String();
		falsePrice = price.substring(2, 3);
		System.out.println(falsePrice);
		if (".".equals(falsePrice)) {
			falsePrice = price.substring(0, 5);
		} else {
			if (".".equals(price.substring(3, 4))) {
				falsePrice = price.substring(0, 6);
			}
			falsePrice = price.substring(0, 2);
			if (Integer.parseInt(falsePrice) < 50) {
				falsePrice = price.substring(0, 3);
			}
		}
		m = Float.parseFloat(falsePrice);
		System.out.println(m);
		webClient.close();
		long end = System.currentTimeMillis();

		System.out.println(end - start);
	}
}
