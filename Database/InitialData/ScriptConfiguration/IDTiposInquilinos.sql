DROP TABLE IF EXISTS #TipoInqTemp

SELECT 
Id_TipoInquilino, Descripcion, Estado INTO #TipoInqTemp
FROM (
VALUES
(1, 'Físico',1),
(2, 'Jurídico',1)
)AS TEMP (Id_TipoInquilino, Descripcion, Estado)


----ACTUALIZAR DATOS---
UPDATE I SET
  I.Descripcion = TM.Descripcion,
  I.Estado = TM.Estado
FROM dbo.TipoInquilino I
INNER JOIN #TipoInqTemp TM
    ON I.Id_TipoInquilino= TM.Id_TipoInquilino

----INSERTAR DATOS---

SET IDENTITY_INSERT dbo.TipoInquilino ON

INSERT INTO dbo.TipoInquilino(
Id_TipoInquilino, Descripcion, Estado)
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM #TipoInqTemp

EXCEPT
SELECT
Id_TipoInquilino,Descripcion,Estado
FROM dbo.TipoInquilino

SET IDENTITY_INSERT dbo.TipoInquilino OFF

GO