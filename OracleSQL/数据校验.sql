﻿select count(*) from (select '20160520',
       ad10acno   zh,
       ab10ctid   khbh,
       ab10subj   kmh,
       ab10savcod jxbm,
       ab10amt2   ye,
       ab10amtlim xzje,
       ab10amtctl kzje,
       ab10amtodc tzkzje,
       ab10itrt   zclv,
       ab10itrm   tblv,
       ab10datopn khr,
       ab10dateit qxr,
       ab10datmtr dqr
  from ods.abpf10, ods.adpf10
 where ab10acid = ad10id
   and ((ab10stat = 1 and ab10amt2 > 0) or ab10stat = '0')
   and ab10dpnok like '12%' )t2;---420353

select count(t1.zh)  from rep.D_DS_FHZXX t1 where  to_char(rq,'yyyymmdd')='20160520';
----420353

select count(t1.zh)
  from (select '20160520',
               ad10acno   zh,
               aa10ctid   khbh,
               aa10subj   kmh,
               aa10baly   ye,
               aa10amtd   jfse,
               aa10amtc   dfse,
               aa10limtx  xded,
               aa10limtd  xzje,
               aa10limtt  tdqxe,
               aa10datec  khr,
               aa10datee  dqr,
               aa10subcod jxbm,
               aa10itrz   zclv,
               aa10itrm   yxlv,
               aa10itrf   tzlv
          from aapf10, adpf10
         where aa10acid = ad10id) t1 --72227


select count(t1.zh)from rep.d_dg_fhzxx t1 where  to_char(rq,'yyyymmdd')='20160520'; ---72227


select count(*) from rep.D_DK_GR_FHZXX where  to_char(rq,'yyyymmdd')='20160520';



select * from  rep.d_user_account_change;

select count(zh) from 
(select 
       a.SERIALNO zh,
       a.CUSTOMERID khbh,
       a.BUSINESSTYPE kmh,
       (a.NORMALBALANCE + a.OVERDUEBALANCE) ye,
       to_date(a.PUTOUTDATE, 'yyyymmdd') khr,
       to_date(a.MATURITYDATE, 'yyyymmdd') dqr,
       a.LOANSTATUS dkzt,
       a.BASERATETYPE jzlv,
       a.LOANRATEMODE lvmode,
       a.LOANRATEFLOATTYPE floatmode,
       a.LOANRATEFLOAT fdfd,
       a.LOANRATE dklv,
       a.FINERATETYPE,
       a.FINERATEMODE,
       a.FINERATEFLOATTYPE,
       a.FINERATEFLOAT,
       a.FINERATE,
       a.CLASSIFYRESULT
  from ods.ulns_acct_loan a
 where a.ORGID like '2004%'
   and a.LOANSTATUS in ('0', '1')) t1 --1321

select count(zh) from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20160519';

---
select count(zh) from rep.D_DK_GR_FHZXX where  to_char(rq,'yyyymmdd')='20160519'; --915

select count(zh) from 
(select 
       a.SERIALNO zh,
       a.CUSTOMERID khbh,
       a.BUSINESSTYPE kmh,
       (a.NORMALBALANCE + a.OVERDUEBALANCE) ye,
       to_date(a.PUTOUTDATE, 'yyyymmdd') khr,
       to_date(a.MATURITYDATE, 'yyyymmdd') dqr,
       a.LOANSTATUS dkzt,
       a.BASERATETYPE jzlv,
       a.LOANRATEMODE lvmode,
       a.LOANRATEFLOATTYPE floatmode,
       a.LOANRATEFLOAT fdfd,
       a.LOANRATE dklv,
       a.FINERATETYPE,
       a.FINERATEMODE,
       a.FINERATEFLOATTYPE,
       a.FINERATEFLOAT,
       a.FINERATE,
       a.CLASSIFYRESULT
  from ods.plns_acct_loan a
 where a.ORGID like '2004%'
   and a.LOANSTATUS in ('0', '1') )t1 ---915


select * from rep.d_user_account_change where zh='121800120100010406' and  zgbh='5028';
select distinct(tjdm) from D_UNIT_SUB_SUM t;

select t.rq,sum(t.kmye)/10000
  from D_UNIT_SUB_SUM t
 where to_char(rq, 'yyyymmdd') in ('20160519','20160520')
   and tjdm in ('dgbzj','dsbzj')
   group by t.rq  ;

select t.rq,sum(t.kmye)/10000
  from D_UNIT_SUB_SUM t
 where to_char(rq, 'yyyymmdd') in ('20160519','20160520')
   and tjdm in ('ndsck')
   group by t.rq  ;


select t.rq,sum(t.kmye)/10000
  from D_UNIT_SUB_SUM t
 where to_char(rq, 'yyyymmdd') in ('20160519','20160520')
   and tjdm in ('ndgck')
   group by t.rq  ; --5324812758.54+468725446.78 
--24301    

select t.rq, sum(t.kmye) / 10000
  from D_SUM_CODE t1
  LEFT JOIN D_UNIT_SUB_SUM t
    ON t.tjdm = t1.sjdm
 where to_char(rq, 'yyyymmdd') in ('20160519', '20160520')
      --- and tjdm in ('24301')
   AND substr(t1.tjdm, 1, 3) = '243'
   and t1.sjdm in ('ndgck', 'dghq')
   and t1.tjlx in ('2', '3')
 group by t.rq;

select 532481.275854+46872.544678+279.742757 from dual;


select distinct(bmdm) from D_UNIT_SUB_SUM t;
select * from B_M_SYS_BRAN t;
select distinct(tjdm) from D_UNIT_SUB_SUM t;


select rq,
       BMDM,
       a.tjdm,
       sum(kmye) kmye,
       sum(kmhs) kmhs,
       sum(ncye) ncye,
       sum(nchs) nchs
  from D_ACCMAN_SUB_SUM a, D_USER_CHANGE b, D_SUM_CODE c
 where to_char(rq, 'yyyymmdd') = '20151231'
   and a.zgbh = b.zgbh
   and a.tjdm = c.tjdm
   and c.tjlx in ('2', '3')
   and ksrq <= rq
   and rq <= jsrq
   and c.tjdm in ('ndgck',
                  'dgbzj',
                  'ndsck',
                  'dsbzj',
                  '24301',
                  'grdq',
                  'grhq',
                  'gsdk',
                  'grdk')
 group by rq, bmdm, a.tjdm; 



















