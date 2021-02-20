CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StoreKey123!@#';
SUBJECT = 'For Service Broker endpoint';

select

@sql += iif(pvt_key_encryption_type <> 'NA'

, 'BACKUP CERTIFICATE '+name+' TO FILE = '''+@Folder+'\'+name+''' WITH PRIVATE KEY (  FILE = '''+@Folder+'\'+name+'.KEY'' , ENCRYPTION BY PASSWORD = ''StoreKey123!@#'' )'+char(13)

 ,'BACKUP CERTIFICATE '+name+' TO FILE = '''+@Folder+'\'+name+''''+char(13))

from master.sys.certificates

print (@sql)


