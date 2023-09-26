
delete from freeboard;
drop sequence freeboard_idx_seq;
create sequence freeboard_idx_seq;

select * from freeboard order by idx desc;
select count(*) from freeboard;


insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '�ڻ��', '1111', '1��', '1�� �Դϴ�.', 'NO', '192.168.100.101');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '������', '2222', '2��', '2�� �Դϴ�.', 'NO', '192.168.100.102');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '������', '3333', '3��', '3�� �Դϴ�.', 'NO', '192.168.100.103');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '���Ͽ�', '4444', '4��', '4�� �Դϴ�.', 'NO', '192.168.100.104');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '������', '5555', '5��', '5�� �Դϴ�.', 'NO', '192.168.100.105');

commit;



















