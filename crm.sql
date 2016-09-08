create database ssh_crm;
use ssh_crm;
#�γ����ͱ�
create table crm_lessonType(
  lessonTypeID varchar(50) not null primary key,  #����ID
  lessonCost double null , #�γ̷���
  total int null, #�ܿ�ʱ
  lessonName varchar(500) ,#�γ�����
  remark varchar(5000) null # �γ̽���
);

#�༶��
create table crm_class(
  classID varchar(50) not null primary key , #����ID
  name varchar(50)  ,#�༶����
  beginTime datetime  , #����ʱ��
  endTime datetime  ,#��ҵʱ��
  state varchar(20) ,#״̬(δ���Ρ��ѿ��Ρ��ѽ���)
  totalCount int, #ѧ������
  goCount int , #��ѧ��
  leaveCount int, #������
  remark varchar(500),  # ��ע
  lessonTypeID varchar(50), #�����γ�ID (�γ̵����),
  uploadFileName varchar(100),	#�ϴ��α�����
  uploadPath varchar(200)	#�ϴ��α�λ��
);

### �༶����γ����ͱ�(���һ) �����Լ�� 
alter table crm_class add constraint foreign key(lessonTypeID) references crm_lessonType(lessonTypeID);


#���ű�
create table crm_department(
 depID varchar(50) not null primary key, #����
 depName varchar(50) # ��������
);

#ְ���
create table crm_post(
  postID varchar(50) not null primary key , # ����id
  name varchar(100) , # ְ������
  depID varchar(50) #����id
);

### ְ����벿�ű� (���һ) �����Լ��
alter table crm_post add constraint foreign key (depID) references crm_department(depID);

#Ա����
create table crm_staff(
  staffID varchar(50) not null primary key,
  staffCode varchar(50) , #Ա�����
  loginName varchar(100) , #��¼��
  loginPwd varchar(100),  #����
  staffName varchar(100) , #Ա������
  gender varchar(20) , # �Ա�
  birthday datetime ,#��������
  onDutyDate datetime , #��ְʱ��
  postID varchar(50) #ְ��ID �����
);

### Ա���� �� ְ��� (���һ) �������ϵ
alter table crm_staff add constraint foreign key(postID) references crm_post(postID);


insert into crm_department(depID,depName) values('1','Java���в�');
insert into crm_department(depID,depName) values('2','PHP���в�');
insert into crm_department(depID,depName) values('3','����');
insert into crm_department(depID,depName) values('4','ѧ����');
insert into crm_department(depID,depName) values('5','��ѯ��');


insert into crm_post(postID,name,depID) values('1','��ѧ�ܼ�','1');
insert into crm_post(postID,name,depID) values('2','��ʦ','1');



insert into crm_staff(staffID,loginName,loginPwd) values('1','jack',md5('1234'));

 















