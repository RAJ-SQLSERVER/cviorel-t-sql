SELECT @@version AS [FULL Version Info];
---
SELECT SERVERPROPERTY('BuildClrVersion') AS BuildClrVersion	--������ ����� CLR Microsoft .NET Framework, ������� �������������� ��� ������ ���������� SQL Server. NULL = ������������ ����, ������ ��� �����������. ������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('Collation') AS Collation		 	--��� ���������� ���������� ��� �������, �������������� �� ���������. NULL = ������������ ���� ��� ��������� ������. ������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('CollationID') AS CollationID		--������������� ���������� ���������� SQL Server. ������� ��� ������: int
SELECT SERVERPROPERTY('ComparisonStyle') AS ComparisonStyle	--����� ��������� Windows ��� ���������� ����������.������� ��� ������: int
SELECT SERVERPROPERTY('ComputerNamePhysicalNetBIOS') AS ComputerNamePhysicalNetBIOS	--��� NetBIOS ��� ���������� ����������, �� ������� �������� ��������� SQL Server.
														--��� ����������������� ���������� SQL Server �� ���������������� �������� ��� �������� ����������, ����� ��������� SQL Server ������������� �� ������ ���� � ���������������� ��������.
														--��� �������������� ���������� SQL Server ��� �������� �������� ���������� � ��������� �� ���������, ������������ ��������� MachineName.
														--����������. ���� ��������� SQL Server ��������� � ���������������� �������� � ���������� �������� ��� ���������� ����������������� ��������, �������������� ��������� MachineName.
														--NULL = ������������ ����, ������ ��� �����������. ������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('Edition') AS Edition			--������������� ������ ���������� SQL Server. ����������� �������� ����� �������� ��� ����������� ������� � �����������, ����� ��� ����������� �������������� ������� ��� ������ �������� SQL Server. � 64-��������� ������� ���������� ��������� Database Engine � ����������� ������ ����������� �(64-��������� ������)�.

											--����������:
											--�Enterprise Edition�;
											--"Enterprise Edition": �������������� �� ����� ����;
											--������ �Enterprise Evaluation Edition�;
											--������ �Business Intelligence�;
											--������ �Developer Edition�;
											--������ �Express Edition�;
											--��������-������ � ��������������� ��������;
											--������ �Standard Edition�;
											--�Web Edition�.
											--"SQL Azure" �������� ���� ������ SQL ��� ��������� ������ SQL.
											--������� ��� ������: nvarchar(128)

SELECT SERVERPROPERTY('EditionID') EditionID			--EditionID ������������ ������������� ������ �������� ��� ���������� SQL Server. ����������� �������� ����� �������� ��� ����������� ������� � �����������, ����� ��� ����������� �������������� ������� ��� ������ �������� SQL Server.

											--	1804890536 = Enterprise
											--	1872460670 = Enterprise Edition: �������������� �� ����� ����
											--	610778273 = Enterprise Evaluation
											--	284895786 = Business Intelligence
											--	-2117995310 = Developer
											--	-1592396055 = Express
											--	-133711905= Express with Advanced Services
											--	-1534726760 = Standard
											--	1293598313 = Web
											--	1674378470 = ���� ������ SQL ��� ��������� ������ SQL
											--	������� ��� ������: bigint

SELECT SERVERPROPERTY('EngineEdition') EngineEdition		--	������ ���������� ��������� Database Engine ��� ���������� SQL Server, �������������� �� �������.

											--	1 = Personal ��� Desktop Engine (���������� ��� SQL Server 2005 � ����� ������� ������).
											--	2 = Standard (������������ ��� �������� Standard, Web � Business Intelligence).
											--	3 = Enterprise (��� �������� ������������ ��� �������� Evaluation Edition, Developer Edition � ����� ��������� Enterprise Edition).
											--	4 = Express (������������ ��� �������� Express, Express with Tools � Express with Advanced Services).
											--	5 = ���� ������ SQL
											--	6 � ��������� ������ SQL
											--	8 = ����������� ���������
											--	������� ��� ������: int

SELECT SERVERPROPERTY('HadrManagerStatus') HadrManagerStatus	--��������� �: � SQL Server 2012 (11.x) �� SQL Server 2017.

											--����������, ������� �� ��������� ������ ����������� AlwaysOn.
											--	0 = �� �������, ������� �����.
											--	1 = ������� � �����������.
											--	2 = �� ������� � ���������� ��������.
											--	NULL = ������������ ����, ������ ��� �����������.

SELECT SERVERPROPERTY('InstanceDefaultDataPath') InstanceDefaultDataPath	-- from SQL Server 2012 (11.x).��� ���� �� ��������� � ������ ������ ����������.
SELECT SERVERPROPERTY('InstanceDefaultLogPath') InstanceDefaultLogPath		-- from SQL Server 2012 (11.x).��� ���� �� ��������� � ������ �������� ����������.

SELECT SERVERPROPERTY('InstanceName') InstanceName				--��� ����������, � �������� ��������� ������������.���������� �������� NULL � ������, ���� ��� ���������� ����������� �� ���������, ��� ������������� ������ � � ������, ���� ������� ������ ����������� �����������.
													--NULL = ������������ ����, ������ ��� �����������. ������� ��� ������: nvarchar(128)

SELECT SERVERPROPERTY('IsAdvancedAnalyticsInstalled') IsAdvancedAnalyticsInstalled	--���������� �������� 1, ���� ��������� ����������� ��������� ��� ���������� �� ����� ��������� �������, ��� �������� 0, ���� ��������� ����������� ��������� �� ��� ����������.

SELECT SERVERPROPERTY('IsClustered') IsClustered	 		--��������� ������� �������� ��� ������ � ���������������� ��������.
												--1 = � ��������.
												--0 = �� � ��������.
												--NULL = ������������ ����, ������ ��� �����������.������� ��� ������: int

SELECT SERVERPROPERTY('IsFullTextInstalled') IsFullTextInstalled	--�� ������� ���������� SQL Server ����������� ���������� ��������������� � �������������� ��������������.
												--1 = ���������� ��������������� � �������������� �������������� �����������.
												--0 = ���������� ��������������� � �������������� �������������� �� �����������.
												--NULL = ������������ ����, ������ ��� �����������.������� ��� ������: int

SELECT SERVERPROPERTY('IsHadrEnabled') IsHadrEnabled			--��������� �: � SQL Server 2012 (11.x) �� SQL Server 2017.
												--������ ������ ����������� AlwaysOn �������� �� ���� ���������� �������.
												--0 = ��������� ������ ����������� AlwaysOn ��������.
												--1 = ��������� ������ ����������� AlwaysOn �������.
												--NULL = ������������ ����, ������ ��� �����������.������� ��� ������: int
												--��� ������ �����������, ����������� � ����������� �� ���������� SQL Server, �� ���������� ������� ������ ���� �������� ������ ������ ����������� AlwaysOn. �������������� �������� ��. � ������ ��������� � ���������� ����� ����������� AlwaysOn (SQL Server).
												--����������. �������� IsHadrEnabled ��������� ������ � ������ ����������� AlwaysOn. ������ ����������� �������� ������ ����������� ��� ���������� ��������������, ����� ��� ���������� ����������� ���� ������ ��� �������� ��������, �� ������������� ���� ��������� �������.

SELECT SERVERPROPERTY('IsIntegratedSecurityOnly') IsIntegratedSecurityOnly		--������ ������� �� ���������� ������ ������������.

														--1 = ���������� ������������ (�������� ����������� Windows)
														--0 = ��� ����������� ������ ������������. (��� �������� ����������� Windows, ��� � �������� ����������� SQL Server.)
														--NULL = ������������ ����, ������ ��� �����������.������� ��� ������: int

SELECT SERVERPROPERTY('IsLocalDB') IsLocalDB				--��������� �: � SQL Server 2012 (11.x) �� SQL Server 2017.������ �������� ����������� SQL Server Express LocalDB.NULL = ������������ ����, ������ ��� �����������.
SELECT SERVERPROPERTY('IsPolybaseInstalled') IsPolybaseInstalled	--��������� �: SQL Server 2017.

												--���������� ��������, ������������, ���������� �� ��������� PolyBase � ���������� �������.
												--0 = ��������� PolyBase �� ����������.
												--1 = ��������� PolyBase ����������.
												--������� ��� ������: int

SELECT SERVERPROPERTY('IsSingleUser') IsSingleUser			--Server ������� � �������������������� ������.
												--1 = �������������������� �����.
												--0 = �� �������������������� �����.
												--NULL = ������������ ����, ������ ��� �����������.������� ��� ������: int

SELECT SERVERPROPERTY('IsXTPSupported') IsXTPSupported			--��������� �: SQL Server (� SQL Server 2014 (12.x) �� SQL Server 2017), ���� ������ SQL.
												--������ ������������ ��������� In-Memory OLTP.
												--1 = ������ ������������ ��������� In-Memory OLTP.
												--0= ������ �� ������������ ��������� In-Memory OLTP.
												--NULL = ������������ ����, ������ ��� �����������.������� ��� ������: int

SELECT SERVERPROPERTY('LCID') [Windows locale identifier LCID]			--	��� ������ Windows ��� ���������� ����������.������� ��� ������: int
SELECT SERVERPROPERTY('LicenseType') LicenseType	--	�� ������������. � �������� SQL Server �� ����������� �������� � ��������. ������ ���������� DISABLED.������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('MachineName') MachineName	--	��� ���������� Windows, �� ������� ������� ��������� �������.
										--	��� ����������������� ���������� SQL Server, ����������� �� ����������� ������� ������ ��������� (����������), ������������ ��� ������������ �������.
										--	NULL = ������������ ����, ������ ��� �����������.������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('NumLicenses') NumLicenses	--	�� ������������. � �������� SQL Server �� ����������� �������� � ��������. ������ ���������� �������� NULL.������� ��� ������: int
SELECT SERVERPROPERTY('ProcessID') ProcessID		--	������������� �������� ������ SQL Server. � ������� �������� ProcessID ������ ����������, ����� ���� Sqlservr.exe ����������� ����� ����������.������� ��� ������: int
SELECT SERVERPROPERTY('ProductBuild') ProductBuild	--	��������� �: SQL Server 2014 (12.x) ������� � ������� 2015 �. ����� ������.
SELECT SERVERPROPERTY('ProductBuildType') ProductBuildType	-- ��������� �: � SQL Server 2012 (11.x) �� ������� ������ � �����������, ���������� ������� � ����� 2015 �. ��� ������� ������.
											--���������� ���� �� ��������� ��������.
											--OD = ������ �� ������� ��� ������������� �������.
											--GDR = ������ ��� ������ ��������������� ����������� ���������� Windows.
											--NULL = �����������.
SELECT SERVERPROPERTY('ProductLevel') ProductLevel	--������� ������ ���������� SQL Server.
										--���������� ���� �� ��������� ��������.
										--'RTM' = �������� ���������� ������
										--'SPn' = ������ ������ ����������
										--'CTPn', = ��������������� ������ ��� ����������
										--������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('ProductMajorVersion') ProductMajorVersion	--��������� �: � SQL Server 2012 (11.x) �� ������� ������ � �����������, ���������� ������� � ����� 2015 �. �������� ������.

SELECT SERVERPROPERTY('ProductMinorVersion') ProductMinorVersion	--��������� �: � SQL Server 2012 (11.x) �� ������� ������ � �����������, ���������� ������� � ����� 2015 �.�������������� ������.

SELECT SERVERPROPERTY('ProductUpdateLevel') ProductUpdateLevel		--��������� �: � SQL Server 2012 (11.x) �� ������� ������ � �����������, ���������� ������� � ����� 2015 �. ������� ���������� ������� ������. CU �������� ������������� ����� ����������.
												--���������� ���� �� ��������� ��������.
												--CUn = ������������� ����� ����������
												--NULL= �����������.

SELECT SERVERPROPERTY('ProductUpdateReference') ProductUpdateReference	--��������� �: � SQL Server 2012 (11.x) �� ������� ������ � �����������, ���������� ������� � ����� 2015 �.������ ���� ������ ��� ����� �������.
SELECT SERVERPROPERTY('ProductVersion')	ProductVersion		--������ ���������� SQL Server � ������� ��������_�����.��������������_�����.������.��������.������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('ResourceLastUpdateDateTime') ResourceLastUpdateDateTime	--	������������ ���� � ����� ���������� ��������� ���� ������ Resource. ������� ��� ������: datetime
SELECT SERVERPROPERTY('ResourceVersion') ResourceVersion		--���������� ������ ���� ������ Resource.������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('ServerName') ServerName			--�������� �� ���������� � ������� Windows, ��������� � ������������ ����������� SQL Server.NULL = ������������ ���� ��� ��������� ������.������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('SqlCharSet')	SqlCharSet	--������������� ��������� SQL �� �������������� ���������� ����������. ������� ��� ������: tinyint
SELECT SERVERPROPERTY('SqlCharSetName') SqlCharSetName	--��� ��������� SQL �� ���������� ����������.������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('SqlSortOrder') SqlSortOrder	--������������� ������� ���������� SQL �� ���������� ����������.������� ��� ������: tinyint
SELECT SERVERPROPERTY('SqlSortOrderName') SqlSortOrderName	--��� ������� ���������� SQL �� ���������� ����������.������� ��� ������: nvarchar(128)
SELECT SERVERPROPERTY('FilestreamShareName') FilestreamShareName	--��� ������ �������, ������������ FILESTREAM.
SELECT SERVERPROPERTY('FilestreamConfiguredLevel') FilestreamConfiguredLevel	--����������� ������� ������� FILESTREAM. �������������� �������� ��. � ������� ������� ������� � ��������� ������.
SELECT SERVERPROPERTY('FilestreamEffectiveLevel') FilestreamEffectiveLevel	--����������� ������� ������� FILESTREAM. ��� �������� ����� ���������� �� �������� FilestreamConfiguredLevel, ���� ������� ��� ������� � ��������� ���������� ���������� ��� ������������ ����������. �������������� �������� ��. � ������� ������� ������� � ��������� ������.
---