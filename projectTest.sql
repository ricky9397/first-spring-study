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
  `OUTCOUNT` INT DEFAULT 2 COMMENT '채팅방나감카운트',
  `OUTDATE` timestamp default current_timestamp on update current_timestamp COMMENT '채팅방 나간시간',
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

select * 
from chatlist l
join chatroom r
where l.chatidx in (select max(r.chatidx) from chatroom r) group by r.chatidx;

select * from chatroom order by chatdate desc;


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
  `CHATREAD` INT DEFAULT 0 COMMENT '멤버메세지=0, 캐리메세지=1, 모두읽으면 2',
  PRIMARY KEY (`MESSAGEIDX`),
  KEY `FK_CARRY_TO_CHATROOM` (`CRIDX`),
  KEY `FK_MEMBER_TO_CHATROOM` (`MEMIDX`),
  KEY `FK_CHATLIST_TO_CHATROOM` (`CHATIDX`),
  CONSTRAINT `FK_CARRY_TO_CHATROOM` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`),
  CONSTRAINT `FK_CHATLIST_TO_CHATROOM` FOREIGN KEY (`CHATIDX`) REFERENCES `CHATLIST` (`CHATIDX`) ON DELETE CASCADE,
  CONSTRAINT `FK_MEMBER_TO_CHATROOM` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`) 
);
insert into chatroom (chatidx, chatcontent, cridx, memidx) values(1, '안녕하세요', 1, 1);

select * from chatroom where chatidx=1;
select * from chatroom;
select * from chatlist where cridx=2 and memidx=1;
select count(*) from chatlist where chatidx=2;
select * from chatlist;

select chatcontent, chatdate from chatroom where chatidx=1 order by chatdate desc;

select *
from chatroom r, chatlist l, carry c, member m
where l.cridx=c.cridx and m.memidx=l.memidx and r.messageidx = (SELECT MAX(r.MESSAGEIDX) from chatroom r where r.chatidx = l.chatidx and m.memidx=1) group by r.chatidx;

delete from chatlist where chatidx=2 and outcount=0;

select max(chatidx) from chatlist where memidx=1;

select *, (select max(l.chatidx) from chatlist l where m.memidx=1) as chat
from chatroom r 
join chatlist l on r.chatidx=l.chatidx
join carry c on c.cridx=l.cridx 
join member m on m.memidx=l.memidx group by r.chatidx;

select * from chatroom where chatidx=1 and memidx=1 order by chatdate desc;

select l.chatidx, r.chatcontent, r.chatdate, c.cridx, c.crnick,  c.placename, m.memidx, m.memnick, r.chatread
from chatlist l 
join carry c on l.cridx=c.cridx 
join  member m on l.memidx=m.memidx and m.memidx=1
left outer join chatroom r on r.messageidx = (SELECT MAX(r.MESSAGEIDX) from chatroom r where r.chatidx = l.chatidx) group by r.chatidx;

select l.chatidx, r.chatcontent, r.chatdate, c.cridx, c.crnick,  c.placename, m.memidx, m.memnick, r.chatread
from chatlist l 
join carry c on l.cridx=c.cridx 
join  member m on l.memidx=m.memidx and m.memidx=1
left outer join chatroom r on r.messageidx = (SELECT MAX(r.MESSAGEIDX) from chatroom r where r.chatidx = l.chatidx);

select *
from chatlist l 
join carry c on l.cridx=c.cridx 
join  member m on l.memidx=m.memidx and m.memidx=1
left outer join chatroom r on r.messageidx = (SELECT MAX(r.MESSAGEIDX) from chatroom r where r.chatidx = l.chatidx)
where  r.CHATPOSITION=0 or r.chatposition=2;



select * from chatroom order by chatdate desc;
select l.chatidx, r.chatcontent, r.chatdate, c.cridx, c.crnick,  c.placename, m.memidx, m.memnick, r.chatread
from member m
join chatlist l on l.memidx=m.memidx 
join carry c on l.cridx=c.cridx and m.memidx=2
left outer join chatroom r on l.chatidx=r.chatidx and r.messageidx = (SELECT MAX(r.MESSAGEIDX) from chatroom r where r.chatidx = l.chatidx);


select * 
from chatroom r
join likelist k on r.memidx=k.memidx 
where chatidx=1;

select * from chatroom where chatidx=1;

select * from chatlist;

delete from chatlist where chatidx=1;

select * from chatroom;
select * from likelist;
update chatroom set chatread=1 where chatidx=1 and csontenttype=0 and memidx=2;

select * from chatroom where memidx=1;

select * from member;
select * from LIKELIST;


select *
from chatlist l
left outer join chatroom r on
l.chatidx=r.chatidx
left outer join likelist k on k.memidx=l.memidx and
k.cridx=l.cridx
where l.chatidx=1;

select *
from chatlist l
left outer join chatroom r on l.chatidx=r.chatidx and r.chatdate < r.chatdate
left outer join likelist k on k.memidx=l.memidx and k.cridx=l.cridx
where l.chatidx=1;

select * from chatinout;
select * from chatlist;
select * from chatroom order by chatdate desc;

update chatlist set memposition=1 and outdate=1111 where
		chatidx=1;

select *
from chatlist l
left outer join chatroom r on
l.chatidx=r.chatidx
left outer join likelist k on k.memidx=l.memidx and
k.cridx=l.cridx
where l.chatidx=1;

select *
from chatlist l
left outer join chatroom r on
l.chatidx=r.chatidx
left outer join likelist k on k.memidx=l.memidx and k.cridx=l.cridx
where l.chatidx=1 and r.chatdate > l.outdate and l.memposition=2 or l.carryposition=2;

delete from r, l using chatroom r left join chatlist l on r.chatidx=l.chatidx 
where r.chatidx=2;

select l.*, r.* from chatlist l join chatroom r on l.chatidx=r.chatidx and r.chatidx=3;

select l.chatidx, r.outcount, r.chatcontent, r.chatdate, c.cridx, c.crnick,  c.placename, m.memidx, m.memnick, r.chatread
from member m
join chatlist l on l.memidx=m.memidx 
join carry c on l.cridx=c.cridx and m.memidx=1
left outer join chatroom r on l.chatidx=r.chatidx and r.messageidx = (SELECT MAX(r.MESSAGEIDX) from chatroom r where r.chatidx = l.chatidx and r.chatdate > l.outdate);

select *
from chatlist l
left outer join chatroom r on l.chatidx=r.chatidx and r.chatdate > l.outdate
left outer join likelist k on k.memidx=l.memidx and k.cridx=l.cridx 
where l.chatidx=1 and l.memposition=2 or l.carryposition=2;



select *
from chatlist l
left outer join chatroom r on l.chatidx=r.chatidx and r.chatdate >
l.outdate and l.memposition=2 or l.carryposition=2
left outer join likelist k on k.memidx=l.memidx and k.cridx=l.cridx
where l.chatidx=5;



select *
		from chatlist l
		left outer join chatroom r on
		l.chatidx=r.chatidx
		left outer join likelist k on k.memidx=l.memidx and
		k.cridx=l.cridx
		where l.chatidx=1 and r.chatdate > l.outdate
		and l.memposition=2 or
		l.carryposition=2;

select * from chatroom;
select * from chatlist;

delete from r, l 
using chatroom r 
left join chatlist l on r.chatidx=l.chatidx
where r.chatidx=1;

select * from chatlist;

update chatlist set outcount=outcount -1 where chatidx=1;

select * from carry;
select * from chatlist l 
left outer join chatinout o on l.chatidx=o.chatidx
where l.cridx=1 and l.memidx=1;

select count(*) from
		chatlist where chatidx=5;
        
        
select * from gymcarry.payment;

select sum(p.payprice) as total from payment p join carry c on c.cridx=p.cridx group by c.cridx, month(p.paydate) order by sum(p.payprice) desc limit 1;

select p.payname, p.payphone, p.paynum, c.crname, p.paydate, p.payprice
from gymcarry.payment p
join gymcarry.carry c on p.cridx=c.cridx;

select month(p.paydate) as month, c.crname, sum(p.payprice) as total
from gymcarry.payment p
join gymcarry.carry c on c.cridx=p.cridx
group by month
order by sum(p.payprice) desc;


select month(p.paydate) as month, c.crname, sum(p.payprice)
as total
from payment p
join carry c on c.cridx=p.cridx
where month(p.paydate)=6
group by c.cridx order by sum(p.payprice) desc limit 5;

select sum(p.payprice)as dd from gymcarry.payment p group by month(p.paydate) order by month(p.paydate);


select month(p.paydate) as month, c.crname, sum(p.payprice) as total
from gymcarry.payment p
join gymcarry.carry c on c.cridx=p.cridx
group by month, p.cridx
order by sum(p.payprice) desc;

select sum(p.payprice) from gymcarry.payment p where c.cridx=1 group by month(p.paydate);

select month(p.paydate) as month, c.crname
from gymcarry.payment p
join gymcarry.carry c
where c.cridx=p.cridx
group by p.cridx, day(p.paydate)
;

select month(paydate), sum(payprice)
from gymcarry.payment;

select month(paydate) as month, sum(payprice) as total, monthname(paydate) as engmonth
from gymcarry.payment group by month order by month;

select * from gymcarry.payment;

select day(paydate) as day, sum(payprice) as total, dayname(paydate) as engday
from gymcarry.payment	
where month(paydate)=1 group by day order by day;

select year(paydate) as year, sum(payprice) as total, monthname(paydate) as engmonth
from gymcarry.payment group by year; 

select month(p.paydate) as month, c.crname, monthname(p.paydate) as engmonth, sum(p.payprice) as aa
from gymcarry.payment p
join gymcarry.carry c on c.cridx=p.cridx 

group by month(p.paydate), p.cridx
order by month;

select *, month(p.paydate), count('남자'), count('여자')
from gymcarry.payment p
join gymcarry.carry c on p.cridx=c.cridx
group by month(p.paydate), p.cridx;


select max(aa) from (select month(p.paydate) as month, c.crname, monthname(p.paydate) as engmonth, sum(p.payprice) as aa
from gymcarry.payment p
join gymcarry.carry c on c.cridx=p.cridx 
group by month, p.cridx
order by month) group by month(p.paydate);

select *, month(p.paydate) as month, sum(p.payprice) from gymcarry.payment p where p.cridx=5 group by month order by month;

select month(p.paydate), sum(p.payprice) from gymcarry.payment p 
join gymcarry.carry c
group by month(p.paydate), p.cridx;

select month(p.paydate) as month, c.crname, sum(p.payprice)
from gymcarry.payment p 
join gymcarry.carry c on c.cridx=p.cridx 
group by c.cridx order by sum(p.payprice) desc;

select *
from (
select month(p.paydate) as month, c.crname, sum(p.payprice)as total, monthname(p.paydate) as engmonth
from payment p 
join carry c on c.cridx=p.cridx 
group by c.cridx,month(p.paydate) order by sum(p.payprice) desc) as ss
group by month;

select *,day(p.paydate) as day, sum(p.payprice) as total
from gymcarry.payment p
join gymcarry.carry c on c.cridx=p.cridx
where month(p.paydate)=9 group by day order by day;

select *
from payment p
join carry c on c.cridx=p.cridx
where month(p.paydate)=3
;


select month(p.paydate) as month, c.crgender, sum(c.crgender='남자') as men, sum(c.crgender='여자') as women
from gymcarry.payment p 
join gymcarry.carry c on c.cridx=p.cridx;

select month(p.paydate) as month, sum(c.crgender='남자') as men, sum(c.crgender='여자') as women, monthname(p.paydate) as engmonth
from gymcarry.payment p 
join gymcarry.carry c on c.cridx=p.cridx
group by month(p.paydate) order by month;

select month(paydate) as month, sum(payprice) as total, monthname(paydate) as engmonth
from gymcarry.payment 
where month(paydate)=1
group by month order by month;


select *,month(p.paydate) as month, sum(p.payprice) as total
		from gymcarry.payment p
		join gymcarry.carry c on c.cridx=p.cridx
		where month(p.paydate)=9 group by month order by month;

select *,day(p.paydate) as day, sum(p.payprice) as total
		from gymcarry.payment p
		join gymcarry.carry c on c.cridx=p.cridx
		where month(p.paydate)=1 group by day order by day;

select *
from gymcarry.payment p
join gymcarry.carry c on c.cridx=p.cridx
where year(p.paydate)=2021 order by month(p.paydate);
        
        
select year(paydate) as year, sum(payprice) as total
from gymcarry.payment group by year order by year;


select month(paydate) as month, sum(payprice) as total,
		monthname(paydate) as engmonth
		from gymcarry.payment 
        where year(paydate)=2021
        group by month
		order by month;
        
	select * from carry;
select month(p.paydate) as month, c.crname, sum(p.payprice)
		as total
		from payment p
		join carry c on c.cridx=p.cridx
		where month(p.paydate)=9 and year(p.paydate)=2022
		group by c.cridx order by sum(p.payprice)
		desc limit 4;
        
select * from payment;        
select day(paydate) as day, sum(payprice) as total
		from gymcarry.payment
		where month(paydate)=1 and year(paydate)=2021 group by day order by
		day;    
        
        
        
select *
		from (select month(p.paydate) as month, c.crname,
		sum(p.payprice) as total,
		monthname(p.paydate) as engmonth
		from payment p
		join carry c on c.cridx=p.cridx
        where year(p.paydate)=2021
		group by c.cridx,month(p.paydate) order by sum(p.payprice) desc) as ss
		group by month order by month;  
        
select * from chatroom;
        
select *
		from (select month(p.paydate) as month, c.crname,
		sum(p.payprice) as total,
		monthname(p.paydate) as engmonth
		from payment p
		join carry c on c.cridx=p.cridx
		where year(p.paydate)=2021
		group by c.cridx,month(p.paydate) order by sum(p.payprice) desc) as ss
		group by month order by month;        
        
select current_timestamp();       
select now();
select * from member;
select month(p.paydate) as month, c.crname, sum(p.paynum)as paynum, 
c.crfield, c.crgender, sum(p.payprice) as total,
monthname(p.paydate) as engmonth
from payment p
join carry c on c.cridx=p.cridxmember
where year(p.paydate)=2021
group by c.cridx,month(p.paydate) order by sum(p.payprice) desc;        

select * from member;
select * from gymcarry.chatlist;
select * from carry;
update chatlist set outcount=outcount +1 where
		chatidx=1;
        
select * from carry;        
select l.chatidx, l.outcount, l.outdate, r.chatcontent, r.chatdate, c.cridx, c.crnick, p.placename,
		m.memidx, m.memnick, r.chatread, m.memphoto
		from member m
		join chatlist l on l.memidx=m.memidx
		join carry c on l.cridx=c.cridx
		join place p on p.placeidx=c.placeidx and c.cridx=1
		left outer join chatroom r on l.chatidx=r.chatidx 
		and r.messageidx=(SELECT MAX(r.MESSAGEIDX) from chatroom r where r.chatidx=l.chatidx);        
        
        
select * from chatroom;
select * from carry;
select * from member;
select count(*) from member where memnick='김명호';


select * from chatroom where memidx=20 and cridx=19;
select * from chatlist where memidx=20 and cridx=19;
select * from member;

select *
		from chatlist l
		left outer join chatroom r on
		l.chatidx=r.chatidx
		where l.chatidx=7;
        
        select * from mypage;
select infocontent,infotype 
from mypage 
where memidx=20 and infodate = '2021년 09월 15일';        