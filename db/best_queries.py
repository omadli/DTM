

sql1 = ('''
        
SELECT u.RegionID, s.Uncode, s.FacultyShifr, s.langID, s.mode  FROM Selections s 
INNER JOIN Universities u ON s.Uncode=u.code ORDER BY u.regionID;

    ''',
    "tanlanadigan yo'nalishlar tillar kesimida")





