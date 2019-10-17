[TOC]
# 字符类函数
## ASCII('a')和char(i)
`select ascii('Z')Z,ascii('H')H,ascii(' ')space from dual`
上式中**Z**表示每个列的标题名称，dual是系统内部的一张表

## concat（s1,s2）
`select concat('hello','world')information from dual`
将两个字符串连接起来
## initcap(s)
首字母大写，并将每个单词用空格区分
`select initcap('hello world')information from dual`
## instr(s1,s2,[i],[j])
`select instr('oracle 11g','1',3,2)information from dual`
查找1在'oracle 11g'中从第3个字符开始，查询1第二次出现的位置，没有则返回0
## length(s)
返回s的长度
`length(str)`:返回str的数据长度
## lower(s)函数upper(s)
`where lower(first_name) like 'a%'`:限制条件，姓氏以a开头
返回字符串s的小写形式和大写形式，这两个函数通常出现在where语句中
## LTRIM(s1,s2),RTRIM(s1,s2)函数和TRIM(s1,s2)函数
分别去除s1中左边、右边、两边的字符串s2
## replace(s1,s2,s3)
使用s3替换s1中的s2
`select replace('hello world','l','a')information from dual`

## substr(s,i,j)
从字符串s的第i位置，截取j的长度，j缺省的情况下直接截取到尾部
`select substr('hello world',3,8)information from dual`

# 数字类函数
|函数|说明|
|:--|:--|
|ABS(n)|返回 n 的绝对值|
|CEIL(n)|返回大于或等于数值 n 的最小整数|
|COS(n)|返回 n 的余弦值， n 为弧度|
|EXP(n)|返回 e 的 n 次幂， e=2.71828183|
|FLORR(n)|返回小于或等于 n 的最大整数|
|LOG(n1,n2)|返回以 n1 为底 n2 的对数|
|MOD(n1,n2)|返回 n1 除以 n2 的余数|
|POWER(n1,n2) |返回 n1 的 n2 次方|
|ROUND(n1,n2)|返回舍入小数点右边 n2 位的 n1 的值， n2 的默认值为 0，这会返回小数点最接近的整数。如果 n2为负数，就舍入到小数点左边相应的位上， n2 必须是整数|
|SIGN(n)|若 n 为负数，则返回-1，若 n 为正数，则返回 1，若 n=0，则返回 0|
|SIN(n)|返回 n 的正弦值， n 为弧度|
|SQRT(n)|返回 n 的平方根， n 为弧度|
|TRUNC(n1,n2)|返回结尾到 n2 位小数的 n1 的值， n2 默认设置为 0，当 n2 为默认设置时，会将 n1 截尾为整数，如果 n2 为负值，就截尾在小数点左边相应的位上|
# 时间类函数
|函数|说明|
|:--|:--|
|ADD_MONTHS(d,i)|返回日期 d 加上 i 个月之后的结果。其中， i 为任意整数|
|LAST_DAY(d)|返回包含日期 d 月份的最后一天|
|MONTHS_BETWEEN(d1,d2)|返回 d1 和 d2 之间的数目，若 d1 和 d2 的日期都相同，或者都是该月的最后一天，则返回一个整数，否则返回的结果将包含一个小数|
|NEW_TIME(d1,t1,t2)|其中， d1 是一个日期数据类型，当时区 t1 中的日期和时间是 d1 时，返回时区 t2 中的日期和时间。 t1 和 t2 是字符串|
|SYSDATE()|返回系统当前的日期|
# 转换类函数
|函数|说明|
|:--|:--|
|CHARTORWIDA(s)| 该函数将字符串 s 转换为 RWID 数据类型|
|CONVERT(s,aset[,bset])| 该函数将字符串 s 由 bset 字符集转换为 aset 字符集|
|ROWIDTOCHAR() |该函数将 ROWID 数据类型转换为 CHAR 类型|
|TO_CHAR(x[,format]) |该函数实现将表达式转换为字符串， format 表示字符串格式|
|TO_DATE(s[,format[lan]])| 该函数将字符串 s 转换成 date 类型， format 表示字符串格式， lan 表示所使用的语言|
|TO_NUMBER(s[,format[lan]])|该函数将返回字符串 s 代表的数字，返回值按照 format 格式进行显示， format 表示字符串格式， lan 表示所使用的语言|
# 聚合类函数
聚合类函数是指对一组数据进行计算，并得到相应的结果，比如计算平均值、统计记录数、计算最大值
|函数|说明|
|:--|:--|
|AVG(x[DISTINCT|ALL])| 计算选择列表项的平均值，列表项目可以是一个列或多个列的表达式|
|COUNT(x[DISTINCT|ALL]) |返回查询结果中的记录数|
|MAX(x[DISTINCT|ALL])| 返回选择列表项目中的最大数，列表项目可以是一个列或多个列的表达式|
|MIN(x[DISTINCT|ALL])| 返回选择列表项目中的最小数，列表项目可以是一个列或多个列的表达式|
|SUM(x[DISTINCT|ALL]) |返回选择列表项目的数值总和，列表项目可以是一个列或多个列的表达式|
|VARIANCE(x[DISTINCT|ALL])| 返回选择列表项目的统计方差，列表项目可以是一个列或多个列的表达式|
|STDDEV(x[DISTINCT|ALL]) |返回选择列表项目的标准偏差，列表项目可以是一个列或多个列的表达式|