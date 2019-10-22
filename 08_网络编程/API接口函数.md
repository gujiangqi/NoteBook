# WSAStartup函数（Windows Sockets synchronous，Windows异步套接字）
为了在应用程序当中调用任何一个Winsock API函数，首先第一件事情就是必须通过WSAStartup函数完成对Winsock服务的初始化，因此需要调用WSAStartup函数。使用Socket的程序在使用Socket之前必须调用WSAStartup函数。该函数的第一个参数指明程序请求使用的Socket版本，其中高位字节指明副版本、低位字节指明主版本；操作系统利用第二个参数返回请求的Socket的版本信息。当一个应用程序调用WSAStartup函数时，操作系统根据请求的Socket版本来搜索相应的Socket库，然后绑定找到的Socket库到该应用程序中。以后应用程序就可以调用所请求的Socket库中的其它Socket函数了。

```C++
int WSAStartup( WORD wVersionRequested, LPWSADATA lpWSAData);
```
* wVersionRequested：一个WORD（双字节）型数值，在最高版本的Windows Sockets支持调用者使用，高阶字节指定小版本(修订本)号,低位字节指定主版本号。
* lpWSAData 指向WSADATA数据结构的指针，用来接收Windows Sockets1  实现的细节。

```C++
#include <WinSock2.h>
#pragma comment(lib, "ws2_32.lib") //调用WinSock2必须调用动态库

int main()
{
    WSADATA wsaData;
    // WSAStartup的第一个变量是输入，指明版本号，第二个用于接收输出。
    WSAStartup(MAKEWORD(2, 2), &wsaData);

    return 0;
}