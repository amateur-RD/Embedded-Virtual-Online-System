# Embedded-Virtual-Online-System

Embedded-Virtual-Online-System(嵌入式虚拟在线实验系统)，该系统支持批量用户同时进行嵌入式在线实验，并能够实现观测到嵌入式开发板的状态。

## 需求描述
* 服务器虚拟化为多个独立的虚拟机操作系统，用户可通过注册，获取账号密码，并获得自动分配的虚拟机，用户可以通过web访问到自己的系统。
* 服务器通过USB转多路串口连接内网里的开发板，通过网线直连摄像头观察开发板。
* 开发板ip地址固定，服务器虚拟机可以通过telnet远程登录到开发板。
* 用户可以对操作进行管理，存储。设备可以对虚拟机进行管理，提供CPU、内存限制、系统快照，自动分配用户帐号密码。

## 技术路线
* 虚拟化
  * Docker工具实现服务器虚拟化
* Web访问
  * [noVNC](https://github.com/novnc/noVNC)工具实现在线Web访问虚拟机
* 系统实现
  * Java ssh2(Struts2 + Spring + Hibernate)实现整个系统的构建
* 体系结构<br>
  ![系统体系结构](https://github.com/amateur-RD/Embedded-Virtual-Online-System/raw/master/系统截图/体系结构.png)

## 功能实现
* 使用Docker实现服务器虚拟化后，我们选取了桌面版的[Docker镜像](https://github.com/fcwu/docker-ubuntu-vnc-desktop)，在此基础上根据实验室需求构建了自己的桌面版的Docker镜像。
* 使用开源工具noVNC实现Web在线访问虚拟机时，根据自身需求对noVNC源码进行了相关修改。具体实现方法可参考：[教程](https://blog.csdn.net/u012829611/article/details/72576493)

## 系统截图
![登录系统](https://github.com/amateur-RD/Embedded-Virtual-Online-System/raw/master/系统截图/login.jpg)
图1 登录系统

![系统主页面](https://github.com/amateur-RD/Embedded-Virtual-Online-System/raw/master/系统截图/main.jpg)
图2 系统主页面

![测试LED灯亮](https://github.com/amateur-RD/Embedded-Virtual-Online-System/raw/master/系统截图/ledapp_on.jpg)
图3 测试LED灯亮

![做笔记](https://github.com/amateur-RD/Embedded-Virtual-Online-System/raw/master/系统截图/note.png)
图4 做笔记
