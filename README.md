# Embedded-Virtual-Online-System

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

