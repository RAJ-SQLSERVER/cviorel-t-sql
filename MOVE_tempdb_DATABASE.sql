/*
����������� ���� ������ tempdb.
� ��������� ������� �������� ����������� ������ ���� ������ tempdb � ������� �� ����� ����� � ������ ���������������� �����������.
*/

/*
����������:
��� ��� ���� ������ tempdb ������ ��������� ��� ������ ������� ������ SQL Server,
��������� ���������� ����� ������ � �������� �� �����.
����� ��������� � ����� ����� �� ����� ������������ ������ �� ���� 3. 
�� ������������ ������ ���� ������ tempdb ���������� ������������ ����� ������ � �������� � ������� ������������. 
����� ����������� ������ SQL Server ����� ������������� ������� ������ ����� ������ � �������� tempdb �� ��������� ������������.
*/

/*
As a general rule, if the number of logical processors is less than or equal to 8,
use the same number of data files as logical processors.
If the number of logical processors is greater than 8, use 8 data files and then if contention continues,
increase the number of data files by multiples of 4 (up to the number of logical processors) 
until the contention is reduced to acceptable levels or make changes to the workload/code.
https://support.microsoft.com/en-us/kb/2154845
*/

--	1.	����������� ���������� ���� ������ ���� ������ tempdb � �� �������� �������������� �� �����.

	SELECT name, physical_name AS CurrentLocation
	FROM sys.master_files
	WHERE database_id = DB_ID(N'tempdb');
	GO

--	2.	�������� �������������� ������� ����� � ������� ���������� ALTER DATABASE.

	USE master;
	GO
	ALTER DATABASE tempdb 
	MODIFY FILE (NAME = tempdev, FILENAME = 'E:\SQLData\tempdb.mdf');
	GO
	ALTER DATABASE tempdb 
	MODIFY FILE (NAME = templog, FILENAME = 'F:\SQLLog\templog.ldf');
	GO

--	3.	���������� � ������������� ��������� SQL Server.

--	4.	��������� ��������� �����.
	
	SELECT name, physical_name AS CurrentLocation, state_desc
	FROM sys.master_files
	WHERE database_id = DB_ID(N'tempdb');
	
--	5.	������� ����� tempdb.mdf � templog.ldf �� ���������� ��������������.