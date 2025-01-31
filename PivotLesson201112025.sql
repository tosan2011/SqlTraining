use emade_dev

select *
from amazondata

select *
from InsuranceClaims

SELECT *
FROM
(
SELECT RecKey, PolD, PolNumber, EffectiveDate, DocID, DocName, Submitted
FROM InsuranceClaims
GROUP BY RecKey,PolD, PolNumber, EffectiveDate, DocID, DocName, Submitted
)SOURCE_TABLE
PIVOT (COUNT([DocName])
FOR DocName IN([DocA], [DocB], [DocC], [DocD], [DocE],[DocF])) AS TARGET

SELECT *
FROM
(
SELECT CATEGORY,SYSTEM,DESCRIPTION
FROM allergies
GROUP BY CATEGORY,SYSTEM,DESCRIPTION
)SOURCE_TABLE
PIVOT (COUNT([CATEGORY])
FOR CATEGORY IN([environment],[food],[medication])) AS TARGET

-- Using the AVG aggregation for submitted

SELECT *
FROM
(
SELECT RecKey, PolD, PolNumber, EffectiveDate, DocID, DocName, Submitted
FROM InsuranceClaims
GROUP BY RecKey,PolD, PolNumber, EffectiveDate, DocID, DocName, Submitted
)SOURCE_TABLE
PIVOT (AVG([Submitted])
FOR Submitted IN([0], [1])) AS TARGET

 SELECT *
FROM
(
SELECT RecKey, PolD, PolNumber, EffectiveDate, DocID, DocName, Submitted
FROM InsuranceClaims
GROUP BY RecKey,PolD, PolNumber, EffectiveDate, DocID, DocName, Submitted
)SOURCE_TABLE
PIVOT (COUNT([EffectiveDate])
FOR EffectiveDate IN([2007-10-01], [2007-11-01])) AS TARGET

select *
from insuranceclaims
order by 'effectivedate'

use emade_dev


select *
from CarePlans

SELECT *
FROM
(
select COALESCE(REASONDESCRIPTION,'Missing Reason Description') REASONDESCRIPTION, description
FROM CarePlans
WHERE description IN ('Burn care', 'Fracture care', 'Cancer care plan', 'Respiratory Therapy', 'Wound care')
) SOURCE_TABLE

PIVOT(COUNT([description])
  FOR description IN ([Burn care], [Fracture care], [Cancer care plan], [Respiratory Therapy], [Wound care])) AS TARGET