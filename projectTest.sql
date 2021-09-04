insert into project.chatroom
(chatidx, chatcontent, cridx, memidx)
 values(1, '안녕하세요 황철순캐리입니다..', 5, 1);

insert into project.chatlist values(2);

select * from chatroom;
select * from chatlist;
select * from carry;
select * from member;
select * from chatroom;
select * from chatlist;

delete from project.chatroom where messageidx=3;

create table project.chat(
    chatidx int,
    chatcontent varchar(2048)
);
insert into project.chat values (1, 'aaa');
select * from chat;

create table project.carry(
	cridx int auto_increment,
    crnick varchar(20),
    centername varchar(2048),
    constraint carry_cridx_pk primary key(cridx)
);

select * from carry;
insert into project.carry (crnick,centername) values('김종국', '라이프트휘트니스짐');
delete from project.carry where cridx=3;

select c.crnick, c.centername, m.chatcontent, m.chatdate
from project.carry c, project.chatroom m, project.chatlist l
where c.cridx=m.cridx and m.chatidx=l.chatidx;	

select *
from project.carry c, project.chatroom m, project.chatlist l
where c.cridx=m.cridx and m.chatidx=l.chatidx ;

select * from chatlist where memidx=1;

select *
from project.chatroom m, project.chatlist l
where m.chatidx=l.chatidx;

select m.chatcontent, m.chatdate
from project.chatroom m, project.chatlist l
where l.chatidx=1 and m.chatidx=l.chatidx;

select * from chatroom where chatidx=2;


select chatidx from chatlist;


create table project.center(
	centeridx int auto_increment,
    centername varchar(20),
    centeraddress varchar(100),
    constraint center_centeridx_pk primary key(centeridx)    
);
select * from project.center;
insert into project.center (centername, centeraddress) values ('짐캐리휘트니스','서울서대문구마포구');





CREATE TABLE `MEMBER` (
  `MEMIDX` int NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `MEMEMAIL` varchar(40) NOT NULL COMMENT '이메일',
  `MEMPW` varchar(30) NOT NULL COMMENT '비밀번호',
  `MEMNAME` varchar(50) NOT NULL COMMENT '이름',
  `MEMNICK` varchar(50) NOT NULL COMMENT '닉네임',
  PRIMARY KEY (`MEMIDX`)
);
insert into member(mememail, mempw, memname, memnick) values();
select * from member where MEMEMAIL='test@test.com' and mempw='1234';
select memidx from member where MEMEMAIL='test@test.com';

CREATE TABLE `CARRY` (
  `CRIDX` int NOT NULL AUTO_INCREMENT COMMENT '캐리IDX',
  `CRID` varchar(30) NOT NULL COMMENT '캐리아이디',
  `CRPW` varchar(30) NOT NULL COMMENT '비밀번호',
  `CRNAME` varchar(50) NOT NULL COMMENT '캐리실명',
  `CRNICK` varchar(50) COMMENT '캐리닉네임',
  `CRGENDER` varchar(5) COMMENT '성별',
  `CRPHONE` varchar(50) COMMENT '캐리연락처',
  `CRINTRO` mediumtext COMMENT '소갯말',
  `CRDEPART` mediumtext COMMENT '전문분야',
  `CRFIELD` mediumtext COMMENT '종목',
  `FACEORNOT` tinyint(1) NULL COMMENT '비대면&대면',
  `PLACENAME` varchar(255) DEFAULT NULL COMMENT '소속플레이스',
  `PLACEIDX` int DEFAULT NULL COMMENT '플레이스IDX',
  PRIMARY KEY (`CRIDX`),
  KEY `FK_PLACE_TO_CARRY` (`PLACEIDX`),
  CONSTRAINT `FK_PLACE_TO_CARRY` FOREIGN KEY (`PLACEIDX`) REFERENCES `PLACE` (`PLACEIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='캐리정보';

select * from carry;

insert into carry (crid, crpw, crname, crnick, placename) values ('test3', 1234, '핏블리', '핏블리', '핏블리짐');

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARRYREVIEW` (
  `REVIEWIDX` int NOT NULL AUTO_INCREMENT COMMENT '리뷰IDX',
  `REVIEWCONTENT` mediumtext COMMENT '리뷰내용',
  `CRIDX` int DEFAULT NULL COMMENT '캐리IDX',
  `MEMIDX` int DEFAULT NULL COMMENT '회원번호',
  PRIMARY KEY (`REVIEWIDX`),
  KEY `FK_CARRY_TO_CARRYREVIEW` (`CRIDX`),
  KEY `FK_MEMBER_TO_CARRYREVIEW` (`MEMIDX`),
  CONSTRAINT `FK_CARRY_TO_CARRYREVIEW` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`),
  CONSTRAINT `FK_MEMBER_TO_CARRYREVIEW` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='캐리상세페이지 리뷰댓글';
/*!40101 SET character_set_client = @saved_cs_client */;



select * from carry;
select * from carry where crid='test' and crpw="1111";

CREATE TABLE `CHATLIST` (
  `CHATIDX` int NOT NULL auto_increment COMMENT '채팅방번호',
  `CRIDX` int NOT NULL COMMENT '캐리번호',
  `MEMIDX` int NOT NULL COMMENT '회원번호',
  PRIMARY KEY (`CHATIDX`),
  KEY `FK_CARRY_TO_CHATLIST` (`CRIDX`),
  KEY `FK_MEMBER_TO_CHATLIST` (`MEMIDX`),
  CONSTRAINT `FK_CARRY_TO_CHATLIST` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`),
  CONSTRAINT `FK_MEMBER_TO_CHATLIST` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
);
select * from chatlist;
delete from chatlist where chatidx=1;
insert into chatlist(crnick,mememail) value('dd','dd');
select * from chatlist where crnick='황철순';

select c.crnick, c.placename, l.chatidx
from chatlist l
join carry c on l.cridx=c.cridx
join member m on l.memidx=m.memidx;

select c.crnick, c.placename, l.chatidx
from carry c, member m, chatlist l
where l.cridx=c.cridx and m.memidx=l.memidx;

CREATE TABLE `CHATROOM` (
  `MESSAGEIDX` int NOT NULL AUTO_INCREMENT COMMENT '메세지 번호',
  `CHATIDX` int NOT NULL COMMENT '채팅방번호',
  `CHATCONTENT` mediumtext NOT NULL COMMENT '대화내용',
  `CHATDATE` timestamp default current_timestamp COMMENT '대화시간',
  `CRIDX` int NOT NULL COMMENT '캐리번호',
  `MEMIDX` int NOT NULL COMMENT '회원번호',
  `CONTENTTYPE` INT DEFAULT 0 COMMENT '0=유저대화, 1=캐리대화',
  `CHATPOSITION` INT DEFAULT 0 COMMENT '0=방에서 안나감, 1=방에서나감',
  `CHATREAD` INT DEFAULT 0 COMMENT '0=읽지않음, 1=읽음',
  `CHATLIKE` INT DEFAULT 0 COMMENT '0=좋아여, 1=좋아요',
  PRIMARY KEY (`MESSAGEIDX`),
  KEY `FK_CARRY_TO_CHATROOM` (`CRIDX`),
  KEY `FK_MEMBER_TO_CHATROOM` (`MEMIDX`),
  KEY `FK_CHATLIST_TO_CHATROOM` (`CHATIDX`),
  CONSTRAINT `FK_CARRY_TO_CHATROOM` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`),
  CONSTRAINT `FK_CHATLIST_TO_CHATROOM` FOREIGN KEY (`CHATIDX`) REFERENCES `CHATLIST` (`CHATIDX`),
  CONSTRAINT `FK_MEMBER_TO_CHATROOM` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
);
insert into chatroom (chatidx, chatcontent, cridx, memidx) values(1, '안녕하세요', 1, 1);

select * from chatroom where chatidx=1;
select * from chatroom;
select * from chatlist where cridx=2 and memidx=1;
select count(*) from chatlist where chatidx=2;
select * from chatlist;

select chatcontent, chatdate from chatroom where chatidx=1 order by chatdate desc;

