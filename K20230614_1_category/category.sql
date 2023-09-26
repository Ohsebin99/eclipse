
 

delete from category;
drop sequence category_idx_seq;
create sequence category_idx_seq;

insert into category (idx, category, gup, lev, seq)
values (category_idx_seq.nextval, '≥Î∆Æ∫œ', category_idx_seq.currval, 0, 0);
commit;

select * from category order by gup desc, seq asc;


