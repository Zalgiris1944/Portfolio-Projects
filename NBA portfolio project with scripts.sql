																	--Got rid of 2 blank columns from the season stats dataset
 --alter table dbo.Seasons_Stats
 --drop column blanl, blank2
					
																	
																	--Wanted to find out how many players that were the age of 30 or over, have scored over 2000 points in a year this century



--select  player, Year, age, pts as total_points, (pts/g) as points_per_game
--from dbo.Seasons_Stats
--where age >= 30 and pts >= 2000 and Year >= 2000

																		--Wanted to find out how many nba players were born in Lithuania
--select *
--from dbo.Players
--Where birth_state like '%Lithuania%'

																		--Playing around with combining multiple datasets

--select *
--from dbo.Seasons_Stats
--full outer join dbo.player_data
--on Seasons_Stats.pos = player_data.position


												--Wanted to asses Los Angeles Lakers players shooting ability from the three point line using case statements
												--First I rated the shooting ability based off 3 pointers made in a year, however I was not satisfied with the results, therefore I ran a second query using the 3p% where I had to change 3p% from nvarchar to float (because the data consists of decimal points) 
												--And got better results



--select tm, Year, player, [3P], [3PA], [3P%],
--case
--when [3p] >= 100 then 'elite_shooter'
--when [3p] between 50 and 99 then 'average_shooter'
--else 'mediocre_shooter'
--end
--as 'shooting_capability'
--from dbo.Seasons_Stats
--where [3p] is not null and Tm= 'lal'
--order by [3P] desc

--select tm, Year, player, [3P], [3PA], [3P%],
--case
--when [3P%] >= 0.4 then 'elite_shooter'
--when [3P%] between 0.3 and 0.399 then 'average_shooter'
--else 'mediocre_shooter'
--end
--as 'shooting_capability'
--from dbo.Seasons_Stats1
--where [3p] is not null and [3p] >= 50 and Tm= 'lal'
--order by [3P%] desc

															--Looked at the players with the longest NBA CAREERS

--select name, year_start, year_end, (year_end-year_start) as NumberOfSeasonsPlayed
--from dbo.player_data
--order by NumberOfSeasonsPlayed desc

--Looking at years that kobe bryant won a championship and evaluating his season performance based off the PER stat (Player efficiency rating)

--select *
--from dbo.Seasons_Stats
--where (year in ('2000','2001', '2002', '2009', '2010'))
--and (Player like '%kobe bryant%')
--order by PER desc


																--Wanted to select players from generation X while combining a different table and ordering the players by a created column called points per game (minimum 41 games played)


--select pla.born, sta.year, sta.Player, sta.PTS, (sta.PTS/sta.G) as points_per_game, sta.G
--from dbo.seasons_stats sta
--join dbo.players pla
----on pla.F1 = sta.F1
--on sta.Player = pla.Player
--where (pla.born between '1965' and '1980')
--and (sta.PTS/sta.G >= 20)
--and (g >=41)
--order by 4 desc


                                                                --Looked at the top 5 highest total points scorers by player in nba history as of 2017 - Note, as of June 2023, Lebron James is the league's top scorer with 38652 career points

--select top 5 sum(PTS) as total_points, player
--from dbo.Seasons_Stats
--group by Player
--order by total_points desc

                                                             