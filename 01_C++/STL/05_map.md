[TOC]	
# 基本概念
* map是标准的关联式容器，一个map是一个键值对序列，即(key,value)对。它提供基于key的快速检索能力。
* map中key值是唯一的。集合中的元素按一定的顺序排列。元素插入过程是按排序规则插入，所以不能指定插入位置。
* map的具体实现采用红黑树变体的平衡二叉树的数据结构。在插入操作和删除操作上比vector快。
* map可以直接存取key所对应的value，支持[ ]操作符，如map[ key ]=value。
* multimap与map的区别：map支持唯一键值，每个键只能出现一次；而multimap中相同键可以出现多次。multimap不支持[]操作符。
* map与unordered_map的区别
  * unordered_map内部实现了一个哈希表，因此其元素的排序是杂乱的，无序的
  * map：
    * 优点
    1. 有序性，其元素的有序性在很多应用中都会简化很多的操作
    2. 红黑树，内部实现一个红黑树使得map的很多操作在低时间复杂度下就可以实现，因此效率非常高
    * 缺点
    1. 空间占用率高，因为map内部实现了红黑树，虽然提高了运行效率，但是因为每一个节点都需要额外保存父节点，孩子节点以及红/黑性质，使得每一个节点都占用大量的空间
    2. 适用处，对于那些有顺序要求的问题，用map会更高效一些
  * unordered_map:
    * 优点
    1. 内部实现了哈希表，因此其查找速度非常的快
    * 缺点
    1. 哈希表的建立比较耗费时间
    2. 适用处，对于查找问题，unordered_map会高效一些，因此遇到查找问题，常会考虑一下用unordered_map

# 基本操作
```C++
    map.insert();//往容器中插入元素，返回pair<iterator,bool>
    map.insert(pair<int,string>(3,"小张"));

```
# map的构造
```C++
    map<int string> myMap = {{1, "顾江其"}, {2, "陈智"}, {3, "卢毅"}};
```
# map容器的操作
```C++
  //pair是C++空间中指定的一种结构体模板，有两个值组成
    map<int, string> myMap;
    pair<map<int, string>::iterator, bool> pairresult = myMap.insert(pair<int, string>(3, "小张"));
    //map的操作函数
    int iFirstFirst = pairresult.first->first;      //first 是一个map值，其中含有键与值，先读取键
    string iFirstSecond = pairresult.first->second; //first 是一个map值，其中含有键与值，后读取值
    bool iSecond = pairresult.second;               //读取结果的bool值

    myMap.insert(map<int, string>::value_type(1, "小李"));

    myMap[3] = "小刘";
    myMap[5] = "小王";

    string str1 = myMap[1];
    string str2 = myMap[2];

    //迭代器遍历
    for (map<int, string>::iterator it = myMap.begin(); it != myMap.end(); ++it)
    {
        pair<int, string> p = *it;
        int ikey = p.first;
        string ivalue = p.second;
        cout << ikey << endl;
        cout << ivalue << endl;
    }
```
# map的取值
```C++
    map[key]
```
如果能够插到key对应的value，则返回value，否则返回0；
# map容器的大小
```C++
    int iSize = myMap.size();
    bool iflag = myMap.empty(); //判断是否为空
```   
# map的删除
```
    myMap.erase(1);
    myMap.erase(myMap.begin(),myMap.end()-1);
```
# map的查找
```C++
    map<int,string>::iterator it = map.find(3);//返回主键为3的位置的迭代器，如果没有则返回myMap.end()
    int iCount = map.count(3);//返回主键为3的个数，通常只能是0或者1，对于multimap的个数可能大于1
    map.upper_bound(5);查找主键大于的第一个元素
    map.lower_bound(5);查找主键大于等于5的第一个元素
```