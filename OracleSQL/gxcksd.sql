select a.bmdm,a.name,a.ind,a.hjphsz,a.dgphsz,a.ndgck,a.dgbzj,a.dsck,a.zrndgck,a.zrdgbzj,a.zrdsck,b.ncndg,b.ncds,b.ncbzj
from ( select a.bmdm,a.name,a.ind,a.ndgck,a.dgbzj,a.dsck,a.zrndgck,a.zrdsck,a.zrdgbzj,hjphsz,dgphsz from 
( select a.bmdm,b.name,b.ind,
         sum(decode(a.rq,$P{pDate},decode(a.tjdm,'ndgck',a.kmye,'24301',a.kmye,0),0)) ndgck,
         sum(decode(a.rq,$P{pDate},decode(a.tjdm,'dgbzj',a.kmye,0),0)) dgbzj,
         sum(decode(a.rq,$P{pDate},decode(a.tjdm,'dsbzj',a.kmye,'ndsck',a.kmye,0),0)) dsck,
         sum(decode(a.rq,trunc($P{pDate}-1),decode(a.tjdm,'ndgck',a.kmye,'24301',a.kmye,0),0)) zrndgck,
         sum(decode(a.rq,trunc($P{pDate}-1),decode(a.tjdm,'dgbzj',a.kmye,0),0)) zrdgbzj,
         sum(decode(a.rq,trunc($P{pDate}-1),decode(a.tjdm,'dsbzj',a.kmye,'ndsck',a.kmye,0),0)) zrdsck
    from D_UNIT_SUB_SUM a, B_M_SYS_BRAN b
   where a.rq>=trunc($P{pDate}-1)
     and a.rq<=$P{pDate}
     and a.bmdm=b.code
     and (a.bmdm=decode($P{organid},'42069999',a.bmdm,$P{organid})
      or a.bmdm in (select code from b_m_sys_bran where parent_branch_id=decode($P{organid},'1','2','2','13','3','29','4','32','5','34',$P{organid})))
group by a.bmdm,b.name,b.ind) a
left outer join
(select dwdm,sum(decode(bz,'1',phsz,0)) hjphsz,sum(decode(bz,'2',phsz,0)) dgphsz 
   from D_NCJSPHB
  where ksrq<=$P{pDate}
    and jsrq>=$P{pDate}
group by dwdm ) b on(a.bmdm = b.dwdm)
) a
left outer join
(select bmdm,sum(ncndg) ncndg,sum(ncds) ncds,sum(ncbzj) ncbzj from (
 select bmdm,sum(decode(d.sjdm,'ndgck',ye,0)) ncndg,
              sum(decode(d.sjdm,'dgbzj',ye,0)) ncbzj,
              sum(decode(d.sjdm,'dsbzj',ye,'ndsck',ye,0)) ncds        
  from d_user_account_change a, d_user_change b,d_fhzxx c,d_sum_code_bak d
  where c.rq=trunc($P{pDate},'yyyy')-1
    and  a.zh=c.zh
    and c.kmdm=d.tjdm
    and a.zgbh=b.zgbh
    and a.ksrq<=$P{pDate}
    and a.jsrq>=$P{pDate}
    and b.ksrq<=$P{pDate}
    and b.jsrq>=$P{pDate}
and d.sjdm in('dgbzj','ndgck','dsbzj','ndsck')
group by bmdm
union all
select '119' bmdm, ye ncndg, 0 ncds ,0 ncbzj
from ckbb e
where e.rq =trunc($P{pDate},'yyyy')-1
and tjdm='2366'
and jgdm='42069999')
group by bmdm
) b on (a.bmdm=b.bmdm)
where ndgck>0 or dsck >0
order by  ind