select a.bmdm,a.name,a.ind,a.hjphsz,a.dgphsz,a.dgck,a.dsck,a.zrdgck,a.zrdsck,b.ncdg,b.ncds
from 
(select a.bmdm,a.name,a.ind,a.dgck,a.dsck,a.zrdgck,a.zrdsck,hjphsz,dgphsz from 
(select a.bmdm,b.name,b.ind,sum(decode(a.rq,$P{pDate},decode(a.tjdm,'24301',a.kmye,'dgbzj',a.kmye,'ndgck',a.kmye,0),0)) dgck,
                            sum(decode(a.rq,$P{pDate},decode(a.tjdm,'dsbzj',a.kmye,'ndsck',a.kmye,0),0)) dsck,
                            sum(decode(a.rq,trunc($P{pDate}-1),decode(a.tjdm,'24301',a.kmye,'dgbzj',a.kmye,'ndgck',a.kmye,0),0)) zrdgck,
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
      group by dwdm ) 
      b on(a.bmdm = b.dwdm)) a
left outer join
    (select bmdm,sum(ncdg) ncdg,sum(ncds) ncds from 
    (select bmdm,sum(decode(d.sjdm,'dgbzj',ye,'ndgck',ye,0)) ncdg,sum(decode(d.sjdm,'dsbzj',ye,'ndsck',ye,0)) ncds        
      from d_user_account_change a, d_user_change b,d_fhzxx c,d_sum_code_bak d
     where c.rq=trunc($P{pDate},'yyyy')-1
       and  a.zh=c.zh
       and d.tjdm =c.kmdm
       and a.zgbh=b.zgbh
       and a.ksrq<=$P{pDate}
       and a.jsrq>=$P{pDate}
       and b.ksrq<=$P{pDate}
       and b.jsrq>=$P{pDate}
       and d.sjdm in('dgbzj','ndgck','dsbzj','ndsck')
     group by bmdm
union all
select '119' bmdm, ye ncdg, 0 ncds 
  from ckbb e
 where e.rq =trunc($P{pDate},'yyyy')-1
   and tjdm='2366'
   and jgdm='42069999')
group by bmdm
) b on (a.bmdm=b.bmdm)
where dgck>0 or dsck >0
order by  ind