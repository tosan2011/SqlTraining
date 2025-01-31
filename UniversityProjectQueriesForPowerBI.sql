use emade_dev

select *
from university

select *
from University_year
order by university_id
select * 
from ranking_criteria


select *
from ranking_system


Create OR ALTER View vwUniversityScore AS
(select u.university_name, r.year, r.score
from university_ranking_year r 
Inner Join university u
ON r.university_id=u.id
where university_name='Harvard University'
order by r.year)



--where university_name='Brown University'


select university_name, score, max(score) as 'Max Score'
from vwUniversityScore
Group by University_name, score

select *
from university_ranking_year
order by university_id desc

select year, sum(score)
from university_ranking_year
group by year
order by year asc