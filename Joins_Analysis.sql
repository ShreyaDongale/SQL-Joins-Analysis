--1
select venue_name,city,Play_date from soccer_venue v join soccer_city c
on v.city_id=c.city_id join match_mast m on m.venue_id=v.venue_id where play_stage='F'
--2
select match_no,country_name,goal_score from match_mast m join referee_mast r on m.referee_id=r.referee_id
join soccer_country s on r.country_id=s.country_id  where decided_by='N'
--3
select player_name,country_name,count(*) as Goals from player_mast p join goal_details g
on p.player_id=g.player_id join soccer_country s on p.team_id=s.country_id where goal_type='N'
group by player_name,country_name
order by Goals desc
--4
select top 1  player_name,country_name,count(*) as Goals from player_mast p join goal_details g
on p.player_id=g.player_id join soccer_country s on p.team_id=s.country_id
group by player_name,country_name
order by Goals desc
--5
Select p.player_name,p.jersey_no,c.country_name From goal_details g join player_mast p
On g.player_id=p.player_id join soccer_country c on p.team_id=c.country_id
join match_mast m on g.match_no=m.match_no
where m.play_stage='F'
--6
select distinct country_name as Host_country from soccer_country c join soccer_city s 
on c.country_id=s.country_id
--7
select top 1 player_name,jersey_no,country_name,goal_time,play_stage,goal_schedule,goal_half
from player_mast p join goal_details g on p.player_id=g.player_id
join soccer_country s on p.team_id=s.country_id 
order by match_no,goal_time
--8
select top 1 referee_name,country_name from referee_mast r join soccer_country s on r.country_id=s.country_id
join match_mast m on r.referee_id=m.referee_id 
order by play_date,stop2_sec
--9
select top 1 referee_name,country_name from referee_mast r join soccer_country s on r.country_id=s.country_id
join match_mast m on r.referee_id=m.referee_id 
where play_stage='F'
--10
select top 1 ass_ref_name,country_name from asst_referee_mast a join soccer_country s 
on a.country_id=s.country_id join referee_mast r on s.country_id=r.country_id
join match_mast m on m.referee_id=r.referee_id
order by play_date,stop2_sec
--11
select ass_ref_name,country_name from asst_referee_mast a join soccer_country s 
on a.country_id=s.country_id join referee_mast r on s.country_id=r.country_id
join match_mast m on m.referee_id=r.referee_id
where play_stage='F'
--12
select top 1 venue_name,city from soccer_venue v join soccer_city c on v.city_id=c.city_id
join match_mast m on v.venue_id=m.venue_id
order by play_date,stop2_sec
--13
select venue_name,city,aud_capacity,audence from soccer_venue v join soccer_city c on v.city_id=c.city_id
join match_mast m on v.venue_id=m.venue_id
where play_stage='F'
--14
select venue_name,city,count(*) as No_of_matches from match_mast m join soccer_venue v
on m.venue_id=v.venue_id join soccer_city c on v.city_id=c.city_id
group by venue_name,city
--15
select top 1 match_no,country_name,player_name from player_booked b join player_mast m 
on b.player_id=m.player_id join soccer_country c on m.team_id=c.country_id
where sent_off='Y'
--16
select country_name as Team,team_group,goal_for from soccer_country c join soccer_team t
on c.country_id=t.team_id where goal_for=1
--18
select country_name,sent_off from soccer_country s join player_booked p
on s.country_id=p.team_id
--19
select d.match_no,country_name from match_mast m join match_details d 
on m.match_no=d.match_no join soccer_country c on d.team_id=c.country_id
where stop1_sec=0
--20
select top 1 country_name,team_group,match_played from soccer_country c join soccer_team t
on c.country_id=t.team_id order by goal_for desc
--21
select venue_name,count(g.goal_id) as No_of_goals from goal_details g join match_mast m
on g.match_no=m.match_no join soccer_venue v on v.venue_id=m.venue_id
group by venue_name
--22
select top 1 m.match_no,country_name,stop2_sec from match_details m join soccer_country s
on m.team_id=s.country_id join match_mast a on m.match_no=a.match_no
order by stop2_sec desc
--24
select m.match_no,country_name from match_details d join match_mast m 
on d.match_no=m.match_no join soccer_country s on d.team_id=s.country_id
where results='DRAW' and d.play_stage='G' or d.goal_score=0
--25
select top 3 m.match_no,country_name,stop2_sec from match_details m join soccer_country s
on m.team_id=s.country_id join match_mast a on m.match_no=a.match_no
order by stop2_sec desc 
--26
select country_name,player_name,count(match_no) as No_of_matches
from match_details d join player_mast p on d.team_id=p.team_id
join soccer_country s on p.team_id=s.country_id
where posi_to_play='GK'
group by country_name,player_name
--27
select top 1 venue_name,count(d.goal_score) as No_of_goals
from match_mast m join match_details d 
on m.match_no=d.match_no join soccer_venue s on s.venue_id=m.venue_id
group by venue_name
order by No_of_goals desc
--28
select top 1 country_name,player_name,jersey_no,age from soccer_country s join player_mast p
on s.country_id=p.team_id order by age desc
--29
select top 2 country_name,match_no from soccer_country s join match_details d 
on s.country_id=d.team_id where goal_score=3
--30
select country_name,team_group,match_played from soccer_team t join soccer_country s
on t.team_id=s.country_id
where goal_agnst=4 and group_position=4
--31
select player_name,jersey_no,posi_to_play,age,country_name 
from player_mast p join soccer_country s
on p.team_id=s.country_id join match_details m on p.team_id=m.team_id
where playing_club='Lyon' and play_stage='F'
--32
select distinct country_name from soccer_country s join match_details m
on s.country_id=m.team_id
where play_stage='S' or play_stage='F'
--33
select country_name,player_name,jersey_no,posi_to_play from soccer_country s join player_mast p
on s.country_id=p.team_id join match_captain m on p.player_id=m.player_captain 
where match_no in (48,49)
--34
select distinct m.match_no,country_name,player_name,jersey_no,posi_to_play from soccer_country s join player_mast p
on s.country_id=p.team_id join match_captain m on p.player_id=m.player_captain 
--35
select distinct m.match_no,country_name,gk.posi_to_play,pm.player_name as captain,gk.player_name as Goalkkeper
from soccer_country s join player_mast pm
on s.country_id=pm.team_id join match_captain m on pm.player_id=m.player_captain join match_details d 
on s.country_id=d.team_id
join player_mast gk on d.player_gk=gk.player_id
--36
select player_name,country_name from soccer_country s join player_mast p
on s.country_id=p.team_id join match_mast m on p.player_id=m.plr_of_match
--37
select match_no,country_name,player_name,jersey_no,time_in_out 
from soccer_country s join player_mast p on s.country_id=p.team_id
join player_in_out o on p.player_id=o.player_id
where play_half=1 and play_schedule='NT'
--39
select match_no,play_date,player_name as Plr_of_match,country_name,jersey_no from soccer_country s join player_mast p
on s.country_id=p.team_id join match_mast m on p.player_id=m.plr_of_match
--40
select match_no,country_name,player_name from penalty_shootout p join player_mast m
on p.player_id=m.player_id join soccer_country s on s.country_id=m.team_id
where kick_id=26
--41
select distinct count(m.match_no) as No_of_captains from soccer_country s join player_mast p
on s.country_id=p.team_id join match_captain m on p.player_id=m.player_captain
where posi_to_play='GK'
--42
select p.player_name,count(match_no) as No_of_booking_time from player_mast p join player_booked b
on p.player_id=b.player_id group by player_name order by No_of_booking_time desc
--43
select country_name,player_name,booking_time from player_mast p join soccer_country s
on p.team_id=s.country_id join player_booked b on p.player_id=b.player_id
order by booking_time desc
--45
select country_name,count(p.player_id) as No_of_players_booked from player_mast p join soccer_country s
on p.team_id=s.country_id join player_booked b on p.player_id=b.player_id
group by p.team_id,country_name
--46
select match_no,country_name,ass_ref_name from soccer_country s join asst_referee_mast a
on s.country_id=a.country_id join match_details m on a.ass_ref_id=m.ass_ref
--47
select country_name,count(match_no) as No_of_matches from asst_referee_mast a join match_details m
on a.ass_ref_id=m.ass_ref join soccer_country s on m.team_id=s.country_id group by country_name
order by No_of_matches desc
--48
select country_name,count(m.match_no) as No_of_matches from soccer_country s join match_details m
on s.country_id=m.team_id join asst_referee_mast a on a.ass_ref_id=m.ass_ref
--49
select m.match_no,country_name,referee_name from soccer_country s join referee_mast r 
on s.country_id=r.country_id join match_mast m on r.referee_id=m.referee_id
order by m.match_no
--50
select country_name,count(m.match_no) as No_of_matches from match_mast m join referee_mast r
on m.referee_id=r.referee_id join soccer_country s on s.country_id=r.country_id
group by country_name,r.referee_id
--51
select country_name,referee_name,count(r.referee_id)as No_of_matches from match_mast m join referee_mast r
on m.referee_id=r.referee_id join soccer_country s on s.country_id=r.country_id
group by country_name,r.referee_id,referee_name
--52
select country_name,referee_name,venue_name,count(match_no) as No_of_matches from soccer_country s 
join referee_mast r on s.country_id=r.country_id join match_mast m on r.referee_id=m.referee_id
join soccer_venue v on m.venue_id=v.venue_id
group by country_name,referee_name,venue_name
--53
select distinct country_name,referee_name,venue_name,count(match_no) as No_of_matches from soccer_country s 
join referee_mast r on s.country_id=r.country_id join match_mast m on r.referee_id=m.referee_id
join soccer_venue v on m.venue_id=v.venue_id
group by country_name,referee_name,venue_name
--54
select referee_name,count(booking_time) as No_of_matches from soccer_country s join referee_mast r
on s.country_id=r.country_id join player_booked p on r.country_id=p.team_id
group by referee_name
--55
select referee_name,count(player_id)as No_of_matches from referee_mast r join player_booked p
on r.country_id=p.team_id
group by referee_name
--56
select country_name,player_name,posi_to_play,age,playing_club from soccer_country s join player_mast p
on s.country_id=p.team_id where jersey_no=10
--57
select country_name,player_name,jersey_no,age,playing_club from soccer_country s join player_mast p
on s.country_id=p.team_id join goal_details g on p.player_id=g.player_id where
posi_to_play='DF' and goal_half>0
--58
select country_name,player_name,posi_to_play,age,playing_club,jersey_no from soccer_country s 
join player_mast p join goal_details g on p.player_id=g.player_id
on s.country_id=p.team_id where goal_type='O'
--59
select match_no,play_stage,country_name,penalty_score from soccer_country s join match_details d
on s.country_id=d.team_id where decided_by='P'
--60
select country_name,player_name,posi_to_play,goal_half as No_of_goals
from soccer_country s join player_mast p on s.country_id=p.team_id
join goal_details d on p.player_id=d.player_id
group by country_name,player_name,posi_to_play,goal_half
--61
select match_no,country_name,player_name,jersey_no,time_in_out
from soccer_country s join player_mast p on s.country_id=p.team_id
join player_in_out o on p.player_id=o.player_id
where in_out='I' and play_schedule='ET'
order by time_in_out desc


