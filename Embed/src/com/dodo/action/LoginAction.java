package com.dodo.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dodo.entity.TbUser;
import com.dodo.service.LoginService;
import com.dodo.service.SystemService;
import com.dodo.util.FileUtil;
import com.dodo.util.Page;
import com.dodo.util.PropertiesUtil;
import com.dodo.util.ShellUtil;

/**
 * 登陆。验证码，检测权限.... 首页的自动加载的一些信息
 * @author Administrator
 *
 */
public class LoginAction extends BaseAction {

	private LoginService loginService;
	private SystemService systemService;
	private TbUser tbUser;
	
	
	
	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}
	public TbUser getTbUser() {
		return tbUser;
	}
	
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}
	
	public void getCheckcode() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request =ServletActionContext.getRequest();
		String codeChars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

		int charsLength = codeChars.length();
        // 下面3条记录是关闭客户端浏览器的缓冲区

        // 这3条语句都可以关闭浏览器的缓冲区，但是由于浏览器的版本不同，对这3条语句的支持也不同

        // 因此，为了保险起见，同时使用这3条语句来关闭浏览器的缓冲区
        response.setHeader("ragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 设置图形验证码的长和宽
        int width = 90, height = 30;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        Random random = new Random();
        g.setColor(getRandomColor(180, 250));

        g.fillRect(0, 0, width, height);

        g.setFont(new Font("Times New Roman", Font.ITALIC, height));

        g.setColor(getRandomColor(120, 180));
        // 用户保存最后随机生成的验证码
        StringBuffer validationCode = new StringBuffer();
        // 验证码的随机字体
        String[] fontNames = { "Times New Roman", "Book antiqua", "Arial" };

        // 随机生成4个验证码
        for (int i = 0; i < 4; i++) {
            // 随机设置当前验证码的字符的字体
            g.setFont(new Font(fontNames[random.nextInt(3)], Font.ITALIC,
                    height));
            // 随机获得当前验证码的字符
            char codeChar = codeChars.charAt(random.nextInt(charsLength));
            validationCode.append(codeChar);
            // 随机设置当前验证码字符的颜色
            g.setColor(getRandomColor(10, 100));
            // 在图形上输出验证码字符，x和y都是随机生成的
            g.drawString(String.valueOf(codeChar), 16 * i + random.nextInt(7),
                    height - random.nextInt(6));
        }

       
        request.getSession().setAttribute("codevalidate", validationCode.toString());
         //关闭Graphics对象

        g.dispose();

        OutputStream outS = response.getOutputStream();

        ImageIO.write(image, "JPEG", outS);
    }

    private Color getRandomColor(int minColor, int maxColor) {
          Random random = new Random();
            if(minColor > 255){
                minColor = 255;
            }
            if(maxColor > 255){
                maxColor = 255;
            }
            //获得r的随机颜色值
            int red = minColor+random.nextInt(maxColor-minColor);
            int green = minColor + random.nextInt(maxColor-minColor);
            int blue = minColor + random.nextInt(maxColor-minColor);
            return new Color(red,green,blue);
    }

	
	
	public String login()throws Exception{
		HttpServletRequest req =ServletActionContext.getRequest();
		String id=loginService.findUser(tbUser);
//		System.out.println(req.getParameter("codevalidate"));
	if(null==req.getSession().getAttribute("codevalidate")){
		req.setAttribute("message","重新获取验证码");
		return FALSE;
	} 
	if(req.getSession().getAttribute("codevalidate").equals(req.getParameter("codevalidate"))){	
		if(null==id){
			req.setAttribute("message","用户名或密码错误");
			return FALSE;
		}else if("relogin"==id){
			req.setAttribute("message","请重新登陆");
			return FALSE;
		}
		else{
			req.setAttribute("username",tbUser.getUsername());
			req.setAttribute("userid",id);
			req.getSession().setAttribute("userid", id);
			
			PropertiesUtil p = new PropertiesUtil("config.properties");
			
			//初始化docker容器
			if(null==req.getSession().getAttribute("dockerid")){

				ShellUtil shUtil = new ShellUtil();
				shUtil.run(p.readProperty("startshell"));
				FileUtil fUtil = new FileUtil();
				String s=fUtil.readLog(p.readProperty("mylog"));
				String[] str=s.split(",");
				System.out.println("s[ip]"+str[0]);
				System.out.println("s[id]"+str[1]);
				
				req.getSession().setAttribute("dockerid", str[1]);
				fUtil.writeLog("host"+id+": "+str[0]+":5900", p.readProperty("vnctoken"));
				}
			
			System.out.println("sessionid"+req.getSession().getId());
			return SUCCESS;
			}
		}else{
			req.setAttribute("message","验证码错误");
			return FALSE;
			}
	
		}
	}
