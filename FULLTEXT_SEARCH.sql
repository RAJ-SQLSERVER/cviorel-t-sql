-- Before you can create a full-text index on the Document table, ensure that the table has a unique, single-column, non-nullable index.

--USE [autodoc_parts]
--GO
--CREATE UNIQUE NONCLUSTERED INDEX [idx_cat_item2type_id_] ON [dbo].[cat_item2type]
--(
--	[id_] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

--GO
-----
--USE [autodoc_parts]
--ALTER FULLTEXT INDEX ON [dbo].[cat_item2type] START INCREMENTAL POPULATION

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
	id_,
	id_cat_item,
	id_cat_item_type,
	value_  
FROM
	autodoc_parts.dbo.cat_item2type
WHERE
	CONTAINS(value_, '���������� AND BOSCH');   -- ����������� ��� �����, ��� ����������� �� �������

SELECT
	id_, id_cat_item, id_cat_item_type, value_  
FROM
	autodoc_parts.dbo.cat_item2type
WHERE
	CONTAINS(value_, '���������� OR BOSCH');  -- ����������� ���� �� ���� �� ��������� ����

SELECT
	id_, id_cat_item, id_cat_item_type, value_  
FROM
	autodoc_parts.dbo.cat_item2type
WHERE
	CONTAINS(value_, '���������� NEAR BOSCH');  -- ����������� ��� �����, � ���������� ����� ������� �� ����� 50 ����.


SELECT
	id_, id_cat_item, id_cat_item_type, value_  
FROM
	autodoc_parts.dbo.cat_item2type
WHERE
	CONTAINS(value_, '��-�������;');  -- ����������� ��� ��������� ���� , ������������ � ���...

SELECT
	id_, id_cat_item, id_cat_item_type, value_  
FROM
	autodoc_parts.dbo.cat_item2type
WHERE FREETEXT (value_, '�� �������' );  -- ���� �������� ��������������� �������� ������, �� ����������� ������ ���������.

