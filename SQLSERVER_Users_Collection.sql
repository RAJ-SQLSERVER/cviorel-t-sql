--8<--------------- ��� SQL ������� 2005  � ����: ---------------------
USE [master]
GO
SELECT
	@@SERVERNAME AS '��� SQL �������',
	COUNT(name) AS '���������� �������������',
	CASE [type] 
	WHEN 'S' THEN '��� ����� SQL'
	WHEN 'U' THEN '��� ����� Windows'
	WHEN 'G' THEN '������ Windows'
	END  
	AS '��� ������������'
FROM
	sys.server_principals
WHERE
	[TYPE] in ('S','U','G')
	AND
	is_disabled = 0
	AND [name] NOT LIKE '%NT SERVICE%'
	AND [name] NOT LIKE '%NT AUTHORITY%'
GROUP BY
	[TYPE]
--8<------------------------------------------------------	
	
	
USE [master]
GO
SELECT
	@@SERVERNAME AS '��� SQL �������',
	*
FROM
	sys.server_principals
WHERE
	--[TYPE] in ('S','U','G')
	[TYPE] = 'G'
	AND
	is_disabled = 0
	AND [name] NOT LIKE '%NT SERVICE%'
	AND [name] NOT LIKE '%NT AUTHORITY%'



-- select * from sys.server_principals
-- select * from sys.database_principals


--8<--------------- ��� SQL ������� 2000: ---------------------

SELECT
	@@SERVERNAME AS '��� SQL �������',
	'-----' AS '���� ������',
	(SUM(hasaccess) - SUM(isntgroup) - SUM(isntgroup)) AS '��� ����� SQL',
	SUM(isntuser) AS '��� ����� Windows',
	SUM(isntgroup) AS '������ Windows'
FROM
	dbo.syslogins
WHERE
	hasaccess = 1
	AND
	denylogin = 0
--8<-----------------------------------------------------------

select * from dbo.syslogins where isntgroup = 1