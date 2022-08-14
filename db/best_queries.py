

sql1 = ('''
        
SELECT u.RegionID, s.Uncode, s.FacultyShifr, s.langID, s.mode  FROM Selections s 
INNER JOIN Universities u ON s.Uncode=u.code ORDER BY u.regionID;

    ''',
    "tanlanadigan yo'nalishlar tillar kesimida"
)


sql2 = ('''
        
SELECT a.abtID, a.name, a.langID, a.grantpriority, a.ball, s.blok1, s.blok2, s.blok3, s.blok4, s.blok5
FROM Abiturients a LEFT JOIN Scores s ON a.abtID=s.abtID WHERE s.abtID IS NULL AND a.ball IS NOT NULL;

        ''',
        """Abiturients jadvalida bor bali chiqqan 
        lekin Scoresga va boshqa jadvallarga to'liq ma'lumoti 
        kiritilmagan abituriyentlar ro'yxatini olishga"""
)





