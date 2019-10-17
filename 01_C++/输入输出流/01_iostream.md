[TOC]
# cin
1. cin是**istream**类的对象，其中cin具有多个api函数
   * cin.get():一次只读一个字符
     ```C++
     #include <iostream>
     using namespace std;
     int main()
     {
	     char ch;
	     while ((ch = cin.get()) != EOF)
	     {
		     cout << ch << endl;
	     }
	     return 0;
     }
     ```
     终端输入的时候，输入的内容优先传入**缓冲区**，当摁下**回车键**的时候，程序开始读取缓冲区的数据，当遇到终止符(**ctrl+Z**) 的时候，程序退出
   * cin.get(a):一次只读一个参数，并给a赋值
     ```C++
     #include <iostream>
     using namespace std;
     int main()
     {
	    char a, b, c;

	    cout << "cin.get(a)如果缓冲区没有数据，则程序阻塞 \n";
	    cin.get(a);
	    cin.get(b);
	    cin.get(c);
	    cout << a << b << c;
	    cin.get(a).get(b).get(c);

	    cout << a << b << c;

	
	    return 0;

     }
     ```
     * cin(a)是**指从终端中读取一个参数赋值给a**，不能用于输出
     * cin.get()是从缓冲区按顺序进行获取
    * get.line() 
      ```C++
      int main()
      {
	    char buf1[256];
	    char buf2[256];
	    cout << "请输出一个字符串含有多个空格 aaa bbb"<<endl;
	    cin >> buf1;

	    cin.getline(buf2, 256);
	    cout << "buf1: " << buf1 << " buf2: " << buf2 << endl;
	    return 0;
      }
      ```
     getline:是能够**接受空格**。
    * cin.ignore()
      ```C++           
        int main()
        {
            char buf1[256];
            char buf2[256];
            cout << "请输出一个字符串含有多个空格 aa abbb" << endl;
            cin >> buf1;
            cin.ignore(2);//忽略2个空格

            cin.getline(buf2, 256);
            cout << "buf1: " << buf1 << "\nbuf2: " << buf2 << endl;
            return 0;
        }
      ```
      cin.ingore(2):**忽略2个空格**；
    * cin.peek()
      ```C++
        int main()
        {
            char buf1[256];
            char buf2[256];
            cout << "请输出一个字符串含有多个空格 aa abbb" << endl;
            cin >> buf1;
            cin.ignore(2);//忽略2个空格
            int myInt = cin.peek();
            cout << "myInt: " << myInt << endl;

            
            cin.getline(buf2, 256);
            cout << "buf1: " << buf1 << "\nbuf2: " << buf2 << endl;
            return 0;
        }
      ```
      cin.peek():获取下一个数值
    * cin.putback(c)
      ```C++
        int main()
        {
            cout << "Please enter a number or a word: ";
            char c = std::cin.get();

            if ((c>='0')&&(c<='9'))
            {
                int n;
                cin.putback(c);
                cin >> n;
                cout << "You entered a number: " << n << '\n';
            }
            else {
                char str[1024];
                cin.putback(c);
                cin.getline(str,1024);

                cout << "You enter a word: " << str << '\n';
            }
            return 0;
        }
      ``` 
      putback(c) 是将输入进来的c返回到缓冲区
2. cin输入char []时，==遇到空格==会终止接受数据。

# cout
## 重要注释
## API函数
### put()
```C++
int main()
{
	cout << "hello" << endl;
	cout.put('h').put('e').put('1');
	return 0;
}
```
put()函数与cin中get()函数类似，输出一个**字符**到终端中；
### write()
```C++
int main()
{
	char p[] = "hello,nihaoa";
	cout.write(p, strlen(p)) << endl;
	cout.write(p, strlen(p) - 1) << endl;
	cout.write(p, strlen(p) - 3) << endl;
	cout.write(p, strlen(p) - 4) << endl;
	return 0;
}
```
写入一定长度的字符串；
### width()/fill()/setf()
```C++
int main()
{
	cout << "start";
	cout.width(30);
	cout.fill('*');
	cout.setf(ios::showbase);
	//cout.setf(ios::internal);
	cout << hex << 123 << "<End>\n";
	
	//控制符
	cout << "start:"
		<< setw(30)
		<< setfill('*')
		<< endl;
	return 0;
}
```
