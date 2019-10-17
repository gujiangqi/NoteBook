# 简介
multiMap就是它的一个键值可以对应多个**value**

应用场景：**数据存储**

# 查找某个key对应的value

```C++
    multimap<string, Person>::size_type count = map2.count("development");
    multimap<string, Person>::iterator myIt = map2.find("development");
    for (multimap<string, Person>::size_type it = 0; it < count; it++,myIt++)
    {
        int age;
        cout << myIt->second.age << " ";
    }
```