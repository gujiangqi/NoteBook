[TOC]
# 基础概念
* deque是“double-ended queue”的缩写，和vector一样都是STL的容器，deque是双端数组，而vector是单端的。
  
# 与vector的区别
* 插入的时候可以指定从前面进行插入`dq.push_front`
* 插入的时候可以指定从后面进行插入`dq.push_back`
* 移除的时候可以指定从前面进行插入`dq.pop_front`
* 移除的时候可以指定从后面进行插入`dq.pop_back`