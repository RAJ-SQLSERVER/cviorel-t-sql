USE [msdb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DBA_InsertForProcedureExecStat]
	@koef DECIMAL(12,2)=0.0 --����������� �����,
	--����������� ����������������� ����� ��� ����� ������� �����,
	--� ����������� ������� ����� �������� 0.0,
	--���� ������� ������� ����� �� ����� ��������� 5 �����
	--�� �������� �������� ������ ������� ����� � ����������� �����
	--��� ���� ������ �����, ��� ������ ������ ����������� �����
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @AvgCPU_Time bigint
       ,@MaxAvgCPU_Time bigint
	   ,@AvgTotalWorkerTime bigint
	   ,@MaxTotalWorkerTime bigint
	   ,@AvgAvgElapsedTime bigint
	   ,@MaxAvgElapsedTime bigint
	   ,@AvgTotalElapsedTime bigint
	   ,@MaxTotalElapsedTime bigint;
	
	SELECT
		@AvgCPU_Time			= AVG(AvgCPU_Time),
		@MaxAvgCPU_Time			= max(AvgCPU_Time),
		@AvgTotalWorkerTime		= AVG(TotalWorkerTime),
		@MaxTotalWorkerTime		= max(TotalWorkerTime),
		@AvgAvgElapsedTime		= AVG(AvgElapsedTime),
		@MaxAvgElapsedTime		= max(AvgElapsedTime),
		@AvgTotalElapsedTime	= AVG(TotalElapsedTime),
		@MaxTotalElapsedTime	= max(TotalElapsedTime)
	FROM dbo.DBA_vProcedureExecInfo;
	
	INSERT INTO dbo.DBA_SQL_ProcedureExecStat
	(
		[InsertDate]
	   ,database_id
	   ,object_id
	   ,[ExecutionCount]
	   ,[TotalWorkerTime]
	   ,[TotalElapsedTime]
	   ,[TotalPhysicalReads]
	   ,[TotalLogicalReads]
	   ,[TotalLogicalWrites])
	SELECT
		getdate()
	   ,database_id
	   ,object_id
	   ,[ExecutionCount]
	   ,[TotalWorkerTime]
	   ,[TotalElapsedTime]
	   ,[TotalPhysicalReads]
	   ,[TotalLogicalReads]
	   ,[TotalLogicalWrites]
	FROM srv.DBA_vProcedureExecInfo
	WHERE(AvgCPU_Time      > @AvgCPU_Time		  + @koef * (@MaxAvgCPU_Time	  - @AvgCPU_Time))
	  or (TotalWorkerTime  > @AvgTotalWorkerTime  + @koef * (@MaxTotalWorkerTime  - @AvgTotalWorkerTime))
	  or (AvgElapsedTime   > @AvgAvgElapsedTime   + @koef * (@MaxAvgElapsedTime   - @AvgAvgElapsedTime))
	  or (TotalElapsedTime > @AvgTotalElapsedTime + @koef * (@MaxTotalElapsedTime - @AvgTotalElapsedTime));
END

GO