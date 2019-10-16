[TOC]
# 简介
1. vector是将元素置于一个**动态数组**中加以管理的容器。
2. vector尾部添加或移除元素非常快速。但是在**中部或头部插入元素或移除元素比较费时**

# vector对象的默认构造
vector采用模板类实现，vector对象的默认构造函数
```C++
    //无参构造函数
    vector<int> vecInt;
    vector<float> vecFloat;
    vector<string> vecString;

    //带参数构造函数
    int iArray[] = {0, 1, 2, 3, 4};

    vector<int> vecIntA(iArray, iArray + 5); //左右参数，是左闭右开
    vector<int> vectorB(vecIntA.begin(), vecIntA.end());
    vector<int> vectorC(vecIntA.begin(), vecIntA.begin() + 3);

    vector<int> vectorD(3,9); //就是讲3个9放进vecIntD
    
    vector<int> vectorE(vectorC);
```

# vector的赋值操作
```C++
    //vector的赋值
    vecIntA.assign(iArray, iArray + 5);
    vectorB.assign(vecIntA.begin(), vecIntA.end());

    vectorC.assign(3, 9);

    vectorD = vectorC;

    vectorE.swap(vectorD); //vector的交换成员函数也没有返回值，与string类似
```

# vector的大小
```C++
    //vector鐨勫ぇ锟�?
    int iSize = vecInt.size();
    bool flag = vecInt.empty(); //锟叫讹拷falg锟角凤拷为锟秸ｏ拷锟秸的伙拷锟斤拷锟斤拷1锟斤拷锟斤拷为锟秸凤拷锟斤拷0锟斤拷
    cout << flag << endl;
    if (flag)
    {
        cout << "vecInt锟角匡拷元锟斤拷" << endl;
    }
    else
    {
        cout << "vecInt锟斤拷锟角空碉拷 " << endl;
    }
    cout << iSize << endl;
    vecInt.resize(10);  //重新设置扩容至10，并用默认值进行填充
    vecInt.resize(12,4);//重新设置扩容至12，并用4进行填充
```
# vector的移除与添加操作
```C++
    vecIntA.push_back(2);   //添加一个元素
    vecIntA.pop_back();     //移除一个元素
```
# vector元素的存取
```C++
    //vector数据的存取
    vecIntA[2] = 10;
    vecIntA.at(3) = 11;
    vecIntA.front(); //返回首元素的引用
    vecIntA.back();  //返回最后一个元素的引用
```
# vector的迭代器
```C++
    //正向遍历
    for (vector<int>::iterator i = vecIntB.begin(); i != vecIntB.end(); i++)
    {
        cout << *i << " ";
    }
    cout << endl;
    //反向遍历
    for (vector<int>::reverse_iterator i = vecIntB.rbegin(); i != vecIntB.rend(); i++)
    {
        int iltem = *i;
        cout << iltem << " ";
    }
```
注：
1. 这里的iterator只可以采用读取操作，不可以进行数据的修改
2. vec.begin()和vec.end()返回一个**iterator**的数据类型，分别指向第一个数值和最后一个数值
3. vec.rbegin()和vec.rend()返回一个**reverse_iterator**的数据类型，分别指向最后一个数值和第一个数值