create table IES_OPM_RUSH_REPAIR_INFO (
id numeric(20) constraint pk_id primary key,														//表创建时添加主键约束
name varchar(64) NOT NULL,																			//非空约束只能创建时加入，不能创建后更改
origin_type numeric(10) constraint uk_origin_type unique,											//表创建时添加唯一性约束
energy_type numeric(20) constraint ck_energy_type check (energy<2),									//添加check（检查）约束（实现对字段的内容输入进行控制）
fault_time date default sysdate,																//添加默认值，默认系统时间
dev_id numeric(20),	
dev_type numeric(20),
org_id numeric(20) constraint fk_org foreign key references ies_pub_type(id),				//添加外键，需要引用的表及其主键																													//
fault_addr varchar(256),
fault_appearance varchar(128),
fault_judge numeric(20),
fault_type numeric(10),
fault_reason numeric(20),
process_status numeric(10),
declare_user varchar(32),
declare_time date,
phone_num varchar(32),
father_id numeric(20),
if_supply_cut numeric(10),
if_order numeric(10),
if_delete numeric(10));



//删除表
drop table table_name;																	//不但会删除表中的数据，连表结构也被删除
truncate table table_name;															//只是删除表中的数据，表结构不会被删除,相当于表数据清空，一次性删除数据释放空间
delete table_name;																			//一行一行地删除表中的数据，表结构不会被删除，效率低，不释放空间

//误删表恢复（能记住表名）
flashback table 原表名 to before drop;

//添加约束语句
alter table 表名 add constraint 约束名 约束类型(列)																									//表创建后添加约束

//表创建后添加主键(若要添加多个主键，只能在创表后用此方式添加，且只能有一个约束名)
alter table IES_OPM_RUSH_REPAIR_INFO add constraint pk_id primary key (id);
    
//表创建后添加唯一性约束
alter table IES_OPM_RUSH_REPAIR_INFO add constraint uk_name unique (name);

//添加外键约束，把IES_OPM_RUSH_REPAIR_INFO表的org_id字段设置为这个表的外键，引用自IES_OPM_ORG_INFO表的org_id字段
alter table IES_OPM_RUSH_REPAIR_INFO add constraint fk_org_id foreign key (org_id) references IES_OPM_ORG_INFO(org_id);

//添加check约束
alter table IES_OPM_RUSH_REPAIR_INFO add constraint ck_energy_type check (energy_type<2);

//添加默认值default
alter table IES_OPM_RUSH_REPAIR_INFO add fault_time date default sysdate;
alter table IES_OPM_RUSH_REPAIR_INFO add if_order numeric(10) default 0;

//删除约束（alter table 表名 drop constraint 约束名）
alter table IES_OPM_RUSH_REPAIR_INFO drop constraint uk_name;

//更改表字段的数据类型,修改列的长度（在修改列的长度时候,只能编辑比现有字段实际存的长度还要大）
alter table IES_OPM_RUSH_REPAIR_INFO modify (dev_id,numeric(30)); 

//增加一个列（放到最后一列，无法调整顺序）
alter table IES_OPM_RUSH_REPAIR_INFO add (age numeric(10) not null);

//给列改名
alter table IES_OPM_RUSH_REPAIR_INFO rename column dev_id to new_dev_id;

//删除一个列
alter table IES_OPM_RUSH_REPAIR_INFO drop column dev_id;

//给表改名
alter table IES_OPM_RUSH_REPAIR_INFO rename to NEW_IES_OPM_RUSH_REPAIR_INFO;

//更新记录
update IES_OPM_RUSH_REPAIR_INFO set name='Lily', dev_id='1234' where id='12345678';

//删除记录
delete IES_OPM_RUSH_REPAIR_INFO where id='123';

//oracle客户端更改数据,更改完提交
select * from IES_OPM_RUSH_REPAIR_INFO for update;


//添加注释
comment on table table_name is 'comments_on_tab_information';									//对表添加注释
comment on column table_name.column_name is 'comments_on_col_information';		//对表中列的说明 

//查看当前登录的用户的表:

select table_name from user_tables;

select * from dba_users; //查看数据库里面所有用户，前提是你是有dba权限的帐号，如sys,system
select * from all_users;  //查看你能管理的所有用户！
select * from user_users; //查看当前用户信息 ！


oracle中：
1、查询数据库名：
select name,dbid from v$database;或者show parameter db_name;
2、查询实例名：
select instance_name from v$instance;或者show parameter instance_name;
3、查询数据库域名：
select value from v$parameter where name='db_domain';或者show parameter domain;
4、查询数据库服务器：
select value from v$parameter where name='service_name';或者show parameter service;或者show parameter names;


drop user ×× cascade; 	//会删除此用户名下的所有表和视图