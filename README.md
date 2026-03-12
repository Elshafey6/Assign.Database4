# Assign.Database4

Transaction Log Backup:- هو نوع من أنواع النسخ الاحتياطي في SQL Server بيتم فيه حفظ كل العمليات Transactions اللي حصلت في قاعدة البيانات من آخر Log Backup.
بمعنى هو بيحفظ التغييرات اللي حصلت في الداتا زي:INSERT-UPDATE-DELETE
مش نسخة كاملة من قاعدة البيانات.
لماذا نستخدم Transaction Log Backup

- استرجاع البيانات حتى آخر لحظة قبل المشكلة.
- تقليل فقدان البيانات.
- تقليل حجم النسخ الاحتياطي مقارنة بالـ Full Backup.
- التحكم في حجم ملف الـ Log.
  query:
BACKUP LOG MyDatabase
TO DISK = 'C:\Backup\MyDatabase_Log.bak';
^_^ <3
