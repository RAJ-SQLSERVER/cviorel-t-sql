SET STATISTICS IO ON;
SET STATISTICS TIME ON;

DECLARE @top TINYINT = 50
INSERT INTO dbo.DBA_SQL_TopProcedureExecStat
(	DBName,
	ObjectName,
	SPText,
	ExecutionCount,
	TotalLogicalReads,
	LastLogicalReads,
	TotalLogicalWrites,
	LastLogicalWrites,
	TotalWorkerTimeS,
	LastWorkerTimeS,
	TotalElapsedTimeS,
	LastElapsedTimeS,
	MinElapsedTimeS,
	MaxElapsedTimeS,
	LastExecutionTime,
	QueryPlan)

SELECT TOP(@top)
	DB_NAME(ps.database_id) AS DBName,
	OBJECT_NAME(ps.object_id,ps.database_id) AS OBJECTName,
	qt.text, 
	ps.execution_count, --���������� ����������
	ps.total_logical_reads, -- ����� ���������� �������� ����������� ���������� ��� ���������� ����� � ������� ��� ����������.
	ps.last_logical_reads, -- ���������� �������� ����������� ���������� �� ����� ���������� ���������� �����.
	ps.total_logical_writes, -- ����� ���������� �������� ���������� ������ ��� ���������� ����� � ������� ��� ����������.
	ps.last_logical_writes, -- ���������� �������� ���������� ������ �� ����� ���������� ���������� �����.
	ps.total_worker_time/1000000 total_worker_time_in_S, -- ����� ����� ��, ����������� �� ���������� ����� � ������� ����������.
	ps.last_worker_time/1000000 last_worker_time_in_S, -- ����� ��, ����������� �� ��������� ���������� �����. *���� ����� ���������� �������*
	ps.total_elapsed_time/1000000 total_elapsed_time_in_S, -- ����� �����, ����������� �� ���������� �����.
	ps.last_elapsed_time/1000000 last_elapsed_time_in_S, -- �����, ����������� �� ��������� ���������� �����. *����� �������� ��� ��������+last_worker_time*
	ps.min_elapsed_time/1000000 min_elapsed_time_in_S,
	ps.max_elapsed_time/1000000 max_elapsed_time_in_S,
	ps.last_execution_time,
	qp.query_plan
FROM
	sys.dm_exec_procedure_stats ps
	CROSS APPLY
	sys.dm_exec_sql_text(ps.sql_handle) qt
	CROSS APPLY
	sys.dm_exec_query_plan(ps.plan_handle) qp
WHERE
	ps.execution_count > 1
	AND
	ps.last_execution_time >= DATEADD(DD,-1,GETDATE())
ORDER BY
   ps.last_worker_time DESC

