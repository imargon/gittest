﻿select to_date(rq, 'yyyy/mm/dd') from rep.d_dg_fhzxx;
select rq from rep.d_dg_fhzxx;
select length(rq) from rep.d_dg_fhzxx;
select count(*)
  from rep.d_dg_fhzxx
 where rq = to_date('20150201', 'yyyy-mm-dd');

select * from rep.d_dg_fhzxx where to_char(rq, 'yyyymmdd') = '20160329';

select * from rep.D_DS_FHZXX where to_char(rq, 'yyyymmdd') = '20160329';
--D_DS_FHZXX
delete from rep.D_DS_FHZXX where to_char(rq, 'yyyymmdd') = '20150201';
---2
delete from rep.d_dg_fhzxx where to_char(rq, 'yyyymmdd') = '20150201';
---d_dg_fhzxx
delete from rep.d_dg_fhzxx where to_char(rq, 'yyyymmdd') = '20150201';

delete from rep.D_DS_FHZXX where to_char(rq, 'yyyymmdd') = '20151214';

---5 d_user_account_change
select *
  from rep.d_user_account_change
 where to_char(ksrq, 'yyyymmdd') = '20150201';
delete from rep.d_user_account_change
 where to_char(ksrq, 'yyyymmdd') = '20150201';
delete from rep.D_ACCMAN_SUB_SUM
 where to_char(rq, 'yyyymmdd') = '20150201';
---delete from rep.D_UNIT_SUB_SUM where to_char(rq, 'yyyymmdd') = '20150201';
 
 ---3 D_DK_GS_FHZXX
select * from rep.D_DK_GS_FHZXX;
----delete from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20150201';

select * from rep.D_DK_GR_FHZXX
---4
---delete from rep.D_DK_GR_FHZXX where  to_char(rq,'yyyymmdd')='20150201';

--- Kettle数据回滚
--- 1.select  count(*) from  rep.D_DS_FHZXX where  to_char(rq,'yyyymmdd')='20160228';

---delete from  rep.D_DS_FHZXX where  to_char(rq,'yyyymmdd')='20160405';

---2.d_dg_fhzxx
---delete  from rep.d_dg_fhzxx where  to_char(rq,'yyyymmdd')='20160405';

---3.D_DK_GR_FHZXX
---delete from rep.D_DK_GR_FHZXX where  to_char(rq,'yyyymmdd')='20160405';

---4.rep.d_user_account_change
---delete from rep.d_user_account_change where to_char(ksrq,'yyyymmdd')='20160405';

---5.rep.D_ACCMAN_SUB_SUM
---delete  from rep.D_ACCMAN_SUB_SUM where to_char(rq,'yyyymmdd')='20160405';

---6.rep.D_UNIT_SUB_SUM
---delete from rep.D_UNIT_SUB_SUM where to_char(rq,'yyyymmdd')='20160405';

---7.rep.D_DK_GS_FHZXX
--- select * from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20160228';
---delete from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20160405';

---8.
select * from ulns_t_fact_loan;
select * from rep.i_khxx_new;
select * from rep.d_user_account_change
select * from rep.d_accman_sub_sum where to_char(rq,'yyyymmdd')='20160405';

select * from rep.D_UNIT_SUB_SUM where to_char(rq,'yyyymmdd')='20160405';

