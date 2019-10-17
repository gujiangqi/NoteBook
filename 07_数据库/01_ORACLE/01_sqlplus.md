# set 命令
1. `set time on`:命令行显示时间
2. `set pagesize + a`:设置当前每页显示地行数
   `show pagesize`:显示当前的pagesize值
3. `set newpage + value`:设置每页中显示地空行数
4. `set linesize + value`:设置每页每行显示地字符总数
5. `set pause on\off`:设置显示页是否滚动显示
   当页面不滚动显示地时候，每次摁Enter可以显示下一页，此时设置text可以设置每页显示完毕后的字符，设置语法为`set pause + '摁enter继续...'`
6. `set numformate + 掩码`：设置显示数值的默认格式
   |掩码|说明|
   |:--:|:--:|
   |9|查询结果中的数字替换格式中的掩码|
   |0|格式中的掩码屏蔽掉查询结果中的数字|
   |$|在查询结果中的数字前添加美元前缀|
   |，|在字符‘，’位置处添加逗号|
# help
1. `help index`:查询所有的命令
   ```sql
    10:59:13 SQL> help index

    Enter Help [topic] for help.

    @             COPY         PAUSE                    SHUTDOWN
    @@            DEFINE       PRINT                    SPOOL
    /             DEL          PROMPT                   SQLPLUS
    ACCEPT        DESCRIBE     QUIT                     START
    APPEND        DISCONNECT   RECOVER                  STARTUP
    ARCHIVE LOG   EDIT         REMARK                   STORE
    ATTRIBUTE     EXECUTE      REPFOOTER                TIMING
    BREAK         EXIT         REPHEADER                TTITLE
    BTITLE        GET          RESERVED WORDS (SQL)     UNDEFINE
    CHANGE        HELP         RESERVED WORDS (PL/SQL)  VARIABLE
    CLEAR         HOST         RUN                      WHENEVER OSERROR
    COLUMN        INPUT        SAVE                     WHENEVER SQLERROR
    COMPUTE       LIST         SET                      XQUERY
    CONNECT       PASSWORD     SHOW
    ```
# desc[ribe] object_name
  `desc dba_tablespace`:显示表的域信息，就是显示各个列的名称、是否为空、及类型属性
# SPOOL
  ```sql
  Spool c:\test.txt
  select ename from table_id where id='****'
  spool off(out)
  ```
  使用spool一定要**进行关闭操作**，不然数据不会写到文档里面去
# 其他常用命令
## define
`define [variable]|[variable = text]`:定义一个变量，并初始化变量
## show
`show option`：显示一些系统选项，常用的选项有ALL、PARAMETER [parameter_name]、SGA、SPOOL、USER等
## EDIT
sql语句被执行完毕后，会被存储在一个呗称为sql缓冲区的内存区域中，用户 可以从SQL 缓冲区中重新调用、编辑或运行那些最近输入的 SQL 语句。
`edit filename.txt`:就是在filename中打开并对最近的一个进行编辑
## save
`save filename`: 保存缓冲区
## GET命令
`GET [file] file_name[.txt] [LIST|NOLIST]`:命令实现把一个SQL脚本文件的内容放进SLQ缓冲区，其语法格式如下
* [x] file_name:要检索的文件名，如果省略了文件的扩展名，则默认文件的扩展名为".sql"
* [x] LIST: 指定文件的内容加载到缓冲区时显示文件的内容
* [ ] NOLIST：指定文件的内容加载到缓冲区时不显示文件的内容。
执行get命令时，如果file_name参数不包括被检索文件的路径，则SQL * Plus 工具会在ORACLE系统安装的主目录下检索指定文件。 在 SQL * Plus 找到指定文件后， 会把文件中的内容加载到 SQL*Plus缓冲区，并显示该文件的内容。
## start和@命令
这两个命令都可以用来执行一个SQL脚本文件，它们的语法格式如下：
```sql
STA[RT]{url|file_name[.ext]} [arg ...]}
@{url|file_name[.txt]}[arg ...]
```
* [x] url:表示要执行的SQL脚本文件的路径。
* [x] file_name：表示包含SQL脚本的文件名。
* [x] arg：其他参数
# column命令
`COL[UMN][column_name|alias|option]`
* [x] column_name:用于指定要设置的列的名称
* [x] alias: 用于指定列的别名，通过它可以把英文列标题设置为汉字
* [ ] option：用于指定某个列的显示格式，option选项的值及其说明如表所示

## formate选项
该选项用于格式化指定的列，需要在formate关键字的后面跟一个掩码格式
```sql
col sal format $999,999.00
select empno,ename,sal from scott emp
```
说明：会使得输出格式以一堆上面所显示的标准格式进行输出
## heading选项
该选项用于定义列标题，比如，许多数据表或视图的列名多为英文形式，可以使用此选项将英文形式的列标题显示为中文形式
```sql
col empno heading 雇员编号
col ename heading 雇员姓名
col sal   heading 雇员工资
select empno, ename, sal from scott.emp
```
## NULL选项
如果查询到的值为null，则用文本值代替
```sql
col empno null '空值'
select empno, ename, sal from scott.emp where comm is null; 
```
上述中的查询结果中的空值则全部用空值代替

## on|off
该选项用于控制定义的显示属性，OFF 表示定义的所有显示属性都不起作用，默认为 ON。
```sql
SQL> col sal format $999,999.00
SQL> col sal off
SQL> select empno,ename,sal from scott.emp;
```
上述代码运行结果会使得第一行所设置的格式失效

## wrappede/word_wrapped选项
这两个选项都用于实现拆行的，wrapped选项按照指定长度拆行，word_wrapped选项按照完整字符串拆行
## Ttitle和BTITLE
这两个命令分别用来设置打印每页的顶部和底部标题。
`TITLE [printspec [text|variable]...]|[OFF|ON]`
* `title left '销售情况排行榜'`设置打印的标题
* `btitle left '打印日期：2019年9月19日' 打印人：顾江其`：设置打印的文章最后一行文字