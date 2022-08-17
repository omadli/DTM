DELETE FROM BoyevoySelections WHERE id IN (SELECT bs.id FROM BoyevoySelections bs LEFT JOIN Selections s ON bs.selectionID=s.id 
LEFT JOIN Universities u ON s.unCode=u.code LEFT JOIN faculties f ON s.facultyID=f.id 
WHERE s.langID!=1 AND s.mode != 1);

DELETE FROM BoyevoySelections WHERE abts=0;