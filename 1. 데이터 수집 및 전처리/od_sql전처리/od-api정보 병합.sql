use modified_data;

Select 	df.*, 
		api.direction as 방향,
        api.sectSpd as 구간속도
FROM od_weekday_temp2 as df
left JOIN api_station_by_route as api
ON df.승차_정류장ARS = api.arsId AND df.ROUTE_ID = api.busRouteId;