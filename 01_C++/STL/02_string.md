[TOC]
# 概念
char * 和string都可以用来表示字符串
两者的区别是：
* char * :是一个指向字符的指针
* string：是一个类，string封装了char*，是一个char*的容器
* string：提供了一系列操作字符串的函数 
# 构造函数
```C++
#include <string>
#include <iostream>
using namespace std;

int main(int argc,char **argv)
{
    //构造函数
    string str0;         //默认构造函数
    string str = "world";//字符串初始化
    string str1(str);    //用str初始化
    string str2("hello");//用字符串初始化
    string str3(3,'a');  //用3个a进行初始化
    system("pause");
    return 0;
}
```
# 操作
## 存取字符操作
```C++
str2.at(2);  //at()(int n)
str2[2];     //operator[](int n)
```
**备注**：at()在越界时会抛出异常，[ ]在刚好越界时会返回(char)0，再继续越界时，编译器直接出错。如果你的程序希望可以通过try,catch捕获异常，**建议采用at()**
## 取的对应字符串的const char *首地址
```C++
const char *p = str2.c_str();
```
## 获取当前字符串的长度
```C++
string str2("hello");
int l = str2.length();
cout << l << endl;
```
## 其他操作
```C++
//连接操作

str2 += str; //将str连接到str2后面
str2.append(str, 1, 2);         //将str中 从第1个位置开始的2个字符连接到str后面
str2.append(str, 3);            //将str的前三个字符连接到str2后面
str2.append(2,'a');             //当前字符串后面添加2个a
str2.compare(str1);             //进行比较，小于则返回-1，相同则返回0，大于则返回1
```
# 取字符串操作
```C++
string str4 = str2.substr(1,4); //返回str2从第1个位置开始的4个字符
```
# 查找操作
```C++
str4.find('l', 0);              //从位置'0'开始查找字符 l ,在字符串中的位置 //其中0是默认位置
str4.rfind('l', str4.length()); //rfind是反向查找的意思


{
    //求itcast出现的次数
    string s1 = "wbm hello wbm 111 wbm 222 wbm 333";
    size_t offindex = s1.find("wbm", 0);
    while (offindex != string::npos) //npos的意思是啥？？？？？
    {
        cout << "在下标index: " << offindex << "找到wbm\n";
        offindex = offindex + 1;
        offindex = s1.find("wbm", offindex);
    }

}
```
# 替换操作
```C++
str4.replace(1,4,"nihao");      //从1位置开始，删除后面4个字符，然后用nihao替换
```
# 交换操作
```C++
str4.swap(str2);                //与str2交换位置，但是参数只能是容器string类
```
# 替换
```C++
/*
    npos等于-1，数据类型为size_t，表示不存在的意思
*/

int main()
{
    string s2 = "wbm hello wbm 111 wbm 222 wbm 333";
    s2.replace(0, 3, "wbm");
    cout << s2 << endl;

    //替换s2中的所有wbm
    size_t offindex = s2.find("wbm", 0);
    while (offindex != string::npos)
    {
        cout << "在下标index: " << offindex << "找到wbm" << endl;
        s2.replace(offindex, 3, "WBM");
        offindex += 1;
        offindex = s2.find("wbm", offindex);
    }
    cout << "替换后的s2为：" << s2 << endl;

    system("pause");
    return 0;
}
```
# 区间删除和插入
```C++
    //插入字符串
    string & insert(int pos, const char *s);
    string & insert(int pos, string & s);
    string & insert(int pos, int n, char c);//在pos位置处插入n个c字符
    
    //删除
    string & erase(int pos = 0,int n = string::npos);//删除pos开始后的n个字符，返回删除后的字符串,默认删除s3的所有字符串
```