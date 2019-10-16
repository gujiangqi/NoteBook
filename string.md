## 替换
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
## 区间删除和插入
```C++
    //插入字符串
    string & insert(int pos, const char *s);
    string & insert(int pos, string & s);
    string & insert(int pos, int n, char c);//在pos位置处插入n个c字符
    
    //删除
    string & erase(int pos = 0,int n = string::npos);//删除pos开始后的n个字符，返回删除后的字符串,默认删除s3的所有字符串
```