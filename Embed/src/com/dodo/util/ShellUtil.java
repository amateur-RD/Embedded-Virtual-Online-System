package com.dodo.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Arrays;

public class ShellUtil {
/**
 * 
 *@author dzy 
 *@date 2017年5月11日 下午2:43:45
 */
	public void run(String command) {
		InputStreamReader stdISR = null;
		InputStreamReader errISR = null;
		Process process = null;
		//String command = "/home/dodo/mytest/./mysh.sh";
		try {
			process = Runtime.getRuntime().exec(command);
			int exitValue = process.waitFor();
			String line = null;
			stdISR = new InputStreamReader(process.getInputStream());
			BufferedReader stdBR = new BufferedReader(stdISR);
			while ((line = stdBR.readLine()) != null) {
				System.out.println("STD line:" + line);
			}

			errISR = new InputStreamReader(process.getErrorStream());
			BufferedReader errBR = new BufferedReader(errISR);
			while ((line = errBR.readLine()) != null) {
				System.out.println("ERR line:" + line);
			}
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stdISR != null) {
					stdISR.close();
				}
				if (errISR != null) {
					errISR.close();
				}
				if (process != null) {
					process.destroy();
				}
			} catch (IOException e) {
				System.out.println("正式执行命令：" + command + "有IO异常");
			}
		}
	}

	public void run2() throws Exception {
		String cmd="/home/dodo/mytest/./mysh.sh";
		Process proc = Runtime.getRuntime().exec(cmd);
		StreamGobbler errorGobbler = new StreamGobbler(proc.getErrorStream(),
				"Error");
		StreamGobbler outputGobbler = new StreamGobbler(proc.getInputStream(),
				"Output");
		errorGobbler.start();
		outputGobbler.start();

		proc.waitFor();

	}

	class StreamGobbler extends Thread {
		InputStream is;

		String type;

		StreamGobbler(InputStream is, String type) {
			this.is = is;
			this.type = type;
		}

		public void run() {
			try {
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);
				String line = null;
				while ((line = br.readLine()) != null) {
					if (type.equals("Error"))
						System.out.println(line);
					else
						System.out.println(line);
				}
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
	}
}