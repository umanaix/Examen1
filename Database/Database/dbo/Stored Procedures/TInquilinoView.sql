CREATE PROCEDURE [dbo].[TInquilinoView]
      @Id_TipoInquilino int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
    I.Id_TipoInquilino,
    I.Descripcion,
    I.Estado
    FROM dbo.TipoInquilino I
    WHERE
    (@Id_TipoInquilino IS NULL OR Id_TipoInquilino=@Id_TipoInquilino)

END