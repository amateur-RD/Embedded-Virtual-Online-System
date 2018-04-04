package com.dodo.util;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class FileUtil {
    //写文件，支持中文字符，在linux redhad下测试过
    public void writeLog(String str,String path)
    {
        try
        {
       // String path="/home/dodo/mytest/testfilelog.log";
        File file=new File(path);
        if(!file.exists())
            file.createNewFile();
       // SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        FileOutputStream out=new FileOutputStream(file,true); //如果追加方式用true        
        StringBuffer sb=new StringBuffer();
        sb.append(str+"\n");
        out.write(sb.toString().getBytes("utf-8"));//注意需要转换对应的字符集
        out.close();
        }
        catch(IOException ex)
        {
            System.out.println(ex.getStackTrace());
        }
    }    
    public String readLog(String path)
    {
        StringBuffer sb=new StringBuffer();
        String tempstr=null;
        try
        {
            //String path="/home/dodo/mytest/testfilelog.log";
            File file=new File(path);
            if(!file.exists())
                throw new FileNotFoundException();            
//            BufferedReader br=new BufferedReader(new FileReader(file));            
//            while((tempstr=br.readLine())!=null)
//                sb.append(tempstr);    
            //另一种读取方式
            FileInputStream fis=new FileInputStream(file);
            BufferedReader br=new BufferedReader(new InputStreamReader(fis));
            while((tempstr=br.readLine())!=null)
            { sb.append(tempstr);
            	sb.append(",");
            }
        }
        catch(IOException ex)
        {
            System.out.println(ex.getStackTrace());
        }
        return sb.toString();
    }
    public static void main(String[] args) {
        // TODO Auto-generated method stub
//        writeLog("this is a test log");
//        writeLog("中文测试看看");
//        System.out.println(readLog());
    }

}
