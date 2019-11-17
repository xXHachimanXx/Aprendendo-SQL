USE BD;

DROP TABLE EMPRESTIMO;

SELECT * FROM ASSUNTO;

-- questao 03 e fodase
SELECT L.TITULO, L.ANOPUBLIC, COUNT(*), AVG(E.VALORAQUISICAO) FROM LIVRO AS L
	JOIN EXEMPLAR AS E ON L.CODIGO = E.CODLLIVRO 
	JOIN ASSUNTO AS A ON A.DESCRICAO = "LITERATURA BRASILEIRA";
    
-- questao 04
SELECT L.TITULO, IE.MULTA FROM LIVRO AS L  e.codllivro = l.codigo
	JOIN exemplar AS E ON E.CODEXEMPLAR = IE.CODEXEMPLAR
    JOIN itememprest AS IE ON IE.CODEXEMPLAR = EMP.CODEMPREST
    JOIN emprestimo AS EMP 
    join aluno a on a.NOME = "Bernardo Valadares";
    
select * from livro as l
join exemplar as e on e.CODLLIVRO = l.CODIGO
join itememprest as ie on ie.CODEXEMPLAR = e.CODEXEMPLAR;

select * from emprestimo e  
join  aluno a on NOME = "Bernardo Valadares";
    