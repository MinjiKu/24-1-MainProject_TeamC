-- 23년 OD데이터를 주중, 주말로 분류하고 평균을 냄
select 노선명, 승차_정류장ARS, 하차_정류장ARS, avg(승객수) as 승객수
from(
	select * from OD_by_route_weekday.노선별OD_20231121
	union all
	select * from OD_by_route_weekday.노선별OD_20230117
	union all
	select * from OD_by_route_weekday.노선별OD_20230919
	union all
	select * from OD_by_route_weekday.노선별OD_20230516
	union all
	select * from OD_by_route_weekday.노선별OD_20231219
	union all
	select * from OD_by_route_weekday.노선별OD_20230718
	union all
	select * from OD_by_route_weekday.노선별OD_20231017
	union all
	select * from OD_by_route_weekday.노선별OD_20230321
	union all
	select * from OD_by_route_weekday.노선별OD_20230815
	union all
	select * from OD_by_route_weekday.노선별OD_20230418
	union all
	select * from OD_by_route_weekday.노선별OD_20230221
	union all
	select * from OD_by_route_weekday.노선별OD_20230620
) as combined
group by 노선명, 승차_정류장ARS, 하차_정류장ARS
