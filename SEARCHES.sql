USE BD2;

SELECT * FROM ASSUNTO;

-- questao 03 e fodase
SELECT L.TITULO, L.ANOPUBLIC, COUNT(*), AVG(E.VALORAQUISICAO) FROM LIVRO AS L
	JOIN EXEMPLAR AS E ON L.CODIGO = E.CODLIVRO 
	JOIN ASSUNTO AS A ON A.DESCRICAO = "LITERATURA BRASILEIRA";
    
-- questao 04
SELECT l.TITULO, ie.MULTA, emp.DATAEMPREST FROM LIVRO AS L	
	JOIN exemplar AS e ON e.codlivro = l.codigo
    JOIN itememprest AS ie ON ie.CODEXEMPLAR = e.codlivro
    JOIN emprestimo AS emp on emp.codemprest = ie.codemprestitem
    join aluno a on a.NOME = "Bernardo Valadares";

-- questao 05
select distinct nome from aluno as a, emprestimo as e 
where e.codaluno <> a.codigo;

-- questao 06 
select NOME, count(CODEMPREST) from aluno as a 
	left join emprestimo as e on e.CODALUNO = a.CODIGO
	group by a.nome;
    
-- questao 07
select nomeaut from autor as au
	join autoria as aut on au.CODIGO = aut.CODAUTOR
    join livro as l on l.CODASSUNTO = (select codigo from assunto where descricao = "LITERATURA BRASILEIRA");

-- questao 08 
select NOME from aluno as a 
	left join emprestimo as e on e.CODALUNO = a.CODIGO
	group by a.nome
    having count(e.CODEMPREST) >= 10;
    
-- questao 09





    