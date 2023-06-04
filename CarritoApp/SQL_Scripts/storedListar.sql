
CREATE procedure [dbo].[storedListar] as 
	SELECT A.Id, A.Codigo, A.Nombre, A.Precio, 
	A.Descripcion, C.Descripcion as Categoria, M.Descripcion as Marca FROM ARTICULOS A, 
	MARCAS M, CATEGORIAS C WHERE A.IdCategoria = C.Id AND A.IdMarca = M.Id