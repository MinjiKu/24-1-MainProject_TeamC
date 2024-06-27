use route_stop_time_onoff;

select  노선번호, 노선명, 표준버스정류장ID, 버스정류장ARS번호, 역명, 교통수단타입코드, 교통수단타입명,
		avg(00시승차총승객수) as 00시승차총승객수,
		 avg(00시하차총승객수) as 00시하차총승객수,
		 avg(1시승차총승객수) as 1시승차총승객수,
		 avg(1시하차총승객수) as 1시하차총승객수,
		 avg(2시승차총승객수) as 2시승차총승객수,
		 avg(2시하차총승객수) as 2시하차총승객수,
		 avg(3시승차총승객수) as 3시승차총승객수,
		 avg(3시하차총승객수) as 3시하차총승객수,
		 avg(4시승차총승객수) as 4시승차총승객수,
		 avg(4시하차총승객수) as 4시하차총승객수,
		 avg(5시승차총승객수) as 5시승차총승객수,
		 avg(5시하차총승객수) as 5시하차총승객수,
		 avg(6시승차총승객수) as 6시승차총승객수,
		 avg(6시하차총승객수) as 6시하차총승객수,
		 avg(7시승차총승객수) as 7시승차총승객수,
		 avg(7시하차총승객수) as 7시하차총승객수,
		 avg(8시승차총승객수) as 8시승차총승객수,
		 avg(8시하차총승객수) as 8시하차총승객수,
		 avg(9시승차총승객수) as 9시승차총승객수,
		 avg(9시하차총승객수) as 9시하차총승객수,
		 avg(10시승차총승객수) as 10시승차총승객수,
		 avg(10시하차총승객수) as 10시하차총승객수,
		 avg(11시승차총승객수) as 11시승차총승객수,
		 avg(11시하차총승객수) as 11시하차총승객수,
		 avg(12시승차총승객수) as 12시승차총승객수,
		 avg(12시하차총승객수) as 12시하차총승객수,
		 avg(13시승차총승객수) as 13시승차총승객수,
		 avg(13시하차총승객수) as 13시하차총승객수,
		 avg(14시승차총승객수) as 14시승차총승객수,
		 avg(14시하차총승객수) as 14시하차총승객수,
		 avg(15시승차총승객수) as 15시승차총승객수,
		 avg(15시하차총승객수) as 15시하차총승객수,
		 avg(16시승차총승객수) as 16시승차총승객수,
		 avg(16시하차총승객수) as 16시하차총승객수,
		 avg(17시승차총승객수) as 17시승차총승객수,
		 avg(17시하차총승객수) as 17시하차총승객수,
		 avg(18시승차총승객수) as 18시승차총승객수,
		 avg(18시하차총승객수) as 18시하차총승객수,
		 avg(19시승차총승객수) as 19시승차총승객수,
		 avg(19시하차총승객수) as 19시하차총승객수,
		 avg(20시승차총승객수) as 20시승차총승객수,
		 avg(20시하차총승객수) as 20시하차총승객수,
		 avg(21시승차총승객수) as 21시승차총승객수,
		 avg(21시하차총승객수) as 21시하차총승객수,
		 avg(22시승차총승객수) as 22시승차총승객수,
		 avg(22시하차총승객수) as 22시하차총승객수,
		 avg(23시승차총승객수) as 23시승차총승객수,
		 avg(23시하차총승객수) as 23시하차총승객수

from (
	select * from 1월_route_stop_time_onoff
	union all
	select * from 2월_route_stop_time_onoff
	union all
    select * from 3월_route_stop_time_onoff
	union all
    select * from 4월_route_stop_time_onoff
	union all
    select * from 5월_route_stop_time_onoff
	union all
    select * from 6월_route_stop_time_onoff
	union all
    select * from 7월_route_stop_time_onoff
	union all
    select * from 8월_route_stop_time_onoff
	union all
    select * from 9월_route_stop_time_onoff
	union all
    select * from 10월_route_stop_time_onoff
	union all
    select * from 11월_route_stop_time_onoff
	union all
    select * from 12월_route_stop_time_onoff
) AS combined
where 교통수단타입명 = '서울간선버스' or 교통수단타입명 = '서울지선버스'
Group by 노선번호, 노선명, 표준버스정류장ID, 버스정류장ARS번호, 역명, 교통수단타입코드, 교통수단타입명;