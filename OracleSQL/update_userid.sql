update d_user_account_change set zgbh ='999999'  where zgbh not in  ( select zgbh from d_user_change  where   ksrq <=sysdate  and jsrq>=sysdate  )  and ksrq<=sysdate  and jsrq>=sysdate
update d_user_account_change set zgbh ='999999'  where zgbh not in  ( select zgbh from d_user_change  where   ksrq <=sysdate  and jsrq>=sysdate  )  and ksrq<=sysdate  and jsrq>=sysdate
update D_USER_ACCOUNT_CHANGE set zgbh='1453'     where zh='120200120500010525' and  zgbh='121453'
update D_USER_ACCOUNT_CHANGE set zgbh='1438'     where zh='121500120100010235' and  zgbh='999999'


update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-18','yyyy-mm-dd'),xgsj=to_date('2016-05-18','yyyy-mm-dd') ,xgyy='计财要求调整' where ZH='121500120100010235'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='120200120500010525' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='121800120100010281' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='121800120100010406' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='120100120500010344' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='121800120100010075' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='121800120100010059' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='121800125100010017' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='121800120100010018' and  zgbh='5028'
update D_USER_ACCOUNT_CHANGE set jsrq=to_date('2016-05-20','yyyy-mm-dd'),xgsj=to_date('2016-05-20','yyyy-mm-dd') ,xgyy='按需求调整' where zh='121800120100010091' and  zgbh='5028'


insert into D_USER_ACCOUNT_CHANGE values('121500120100010235','121438',to_date('2016-05-19','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd')   ,null,to_date('2016-05-18','yyyy-mm-dd'),null) 
insert into D_USER_ACCOUNT_CHANGE values('120100120500010344','1510',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('120200120500010525','121453',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('121800120100010018','1453',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('121800120100010059','1453',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('121800120100010075','1453',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('121800120100010091','1510',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('121800120100010281','1510',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('121800120100010406','1510',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 
insert into D_USER_ACCOUNT_CHANGE values('121800125100010017','1453',to_date('2016-05-21','yyyy-mm-dd'), to_date('2099-12-31','yyyy-mm-dd'),'admin',to_date('2016-05-20','yyyy-mm-dd'),'按需求调整') 


insert into "REP"."D_USER_ACCOUNT_CHANGE" ("ZH", "ZGBH", "KSRQ", "JSRQ", "XGR", "XGYY") values (:1, :2, :3, :4, :5, :6)
update "REP"."D_SYS_DATE" set "BBXT_DATE" = :1 where "BBXT_DATE" = :2 and "STATE" = :3
update d_sys_date set state='0'

insert into d_accman_sub_sum(rq,zgbh,tjdm,kmye,ncye,kmhs,nchs) select  ga20date, '999999', ga20subj, ga20balc, null, 1, 1  from ods.gapf20  where ga20date =to_date('20160523','yyyymmdd') and ga20subj='24301' and ga20dpno ='12999'
insert into d_accman_sub_sum(rq,zgbh,tjdm,kmye,ncye,kmhs,nchs) select  ga20date, '999999', ga20subj, ga20balc, null, 1, 1  from ods.gapf20  where ga20date =to_date('20160524','yyyymmdd') and ga20subj='24301' and ga20dpno ='12999'
insert into d_accman_sub_sum(rq,zgbh,tjdm,kmye,ncye,kmhs,nchs) select  ga20date, '999999', ga20subj, ga20balc, null, 1, 1  from ods.gapf20  where ga20date =to_date('20160525','yyyymmdd') and ga20subj='24301' and ga20dpno ='12999'
insert into d_accman_sub_sum(rq,zgbh,tjdm,kmye,ncye,kmhs,nchs) select  ga20date, '999999', ga20subj, ga20balc, null, 1, 1  from ods.gapf20  where ga20date =to_date('20160520','yyyymmdd') and ga20subj='24301' and ga20dpno ='12999'
insert into d_accman_sub_sum(rq,zgbh,tjdm,kmye,ncye,kmhs,nchs) select  ga20date, '999999', ga20subj, ga20balc, null, 1, 1  from ods.gapf20  where ga20date =to_date('20160521','yyyymmdd') and ga20subj='24301' and ga20dpno ='12999'
insert into d_accman_sub_sum(rq,zgbh,tjdm,kmye,ncye,kmhs,nchs) select  ga20date, '999999', ga20subj, ga20balc, null, 1, 1  from ods.gapf20  where ga20date =to_date('20160522','yyyymmdd') and ga20subj='24301' and ga20dpno ='12999'
insert into d_accman_sub_sum(rq,zgbh,tjdm,kmye,ncye,kmhs,nchs) select  ga20date, '999999', ga20subj, ga20balc, null, 1, 1  from ods.gapf20  where ga20date =to_date('20160519','yyyymmdd') and ga20subj='24301' and ga20dpno ='12999' 
