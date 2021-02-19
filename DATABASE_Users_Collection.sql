
USE [master]

DECLARE @srv_version VARCHAR(1)
DECLARE @cmd VARCHAR(4000)

SELECT @srv_version = LEFT(CAST(SERVERPROPERTY('ProductVersion') AS VARCHAR),1)
SET @cmd =
'
USE ?
IF DB_NAME() NOT IN(''master'',''msdb'',''tempdb'',''model'',''ReportServerTempDB'')
BEGIN

SELECT
	@@SERVERNAME AS ''��� SQL �������'',
	db_name() AS ''���� ������'',
	SUM([issqluser]) AS ''��� ����� SQL'',
	SUM([isntuser]) AS ''��� ����� Windows'',
	SUM([isntgroup]) AS ''������ Windows''
FROM
	dbo.sysusers
WHERE
	[sid] IS NOT NULL
	AND
	hasdbaccess = 1
	AND
	(
	islogin <> 0
	OR
	isntname <> 0
	OR
	isntgroup <> 0
	OR
	isntuser <> 0
	OR
	issqluser <> 0
	)
END
'	


IF @srv_version = '8'						/*MS SQL Server 2000*/
	EXECUTE [dbo].sp_MSforeachdb @cmd

ELSE										/*MS SQL Server 2005 and 2008*/
	EXECUTE [sys].sp_MSforeachdb @cmd

--select * from dbo.sysusers where isntgroup <> 0

SET NOCOUNT ON;
EXEC sp_MSforeachdb
	 '
	 USE [?];
	 IF DB_NAME() NOT IN(''master'',''msdb'',''tempdb'',''model'')
	 SELECT
		db_name(),
		*
	 FROM
		dbo.sysusers
	 WHERE
		isntgroup <> 0
	 '
SET NOCOUNT OFF;

--declare @cmd varchar(500)
--set @cmd='use [?];exec sp_spaceused '
--exec sp_MSforeachdb @cmd


--EXECUTE sp_msforeachdb
--	'
--	USE ?
--	IF DB_NAME() NOT IN(''master'',''msdb'',''tempdb'',''model'')
--	EXEC sp_spaceused
--	'


	
/*MS SQL Server 2005 and above*/	
--SELECT
--	@@SERVERNAME AS '��� SQL �������',
--	db_name() AS '���� ������',
--	COUNT(name) AS '���������� �������������',
--	CASE [type] 
--	WHEN 'S' THEN '��� ����� SQL'
--	WHEN 'U' THEN '��� ����� Windows'
--	WHEN 'G' THEN '������ Windows'
--	END  
--	AS '��� ������������'
--FROM
--	sys.database_principals
--WHERE
--	[TYPE] in ('S','U','G')
--GROUP BY
--	[TYPE]	


--SELECT
--	@@SERVERNAME AS '��� SQL �������',
--	db_name() AS '���� ������',
--	SUM([issqluser]) AS '��� ����� SQL',
--	SUM([isntuser]) AS '��� ����� Windows',
--	SUM([isntgroup]) AS '������ Windows'
--FROM
--	dbo.sysusers
--WHERE
--	[sid] IS NOT NULL
--	AND
--	hasdbaccess = 1
--	AND
--	(
--	islogin <> 0
--	OR
--	isntname <> 0
--	OR
--	isntgroup <> 0
--	OR
--	isntuser <> 0
--	OR
--	issqluser <> 0
--	)