USE BD2;

SELECT * FROM ASSUNTO;

-- questao 03
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
select distinct a.NOMEAUT from autor as a, autoria as au where au.CODLIVRO = 
( select CODLIVRO from autoria where codautor = (select CODIGO from autor where NOMEAUT = "NAVATHE") ) and a.codigo = au.codautor and a.nomeaut <> "NAVATHE";

-- questao 16
SELECT distinct l.titulo, e.codexemplar FROM livro AS l 
JOIN exemplar AS e
JOIN editora AS ed ON e.codlivro = l.codigo AND ed.codigo = l.codedit 
WHERE e.VALORAQUISICAO > (SELECT av FROM (SELECT AVG(e.valoraquisicao) AS av, ed.codigo AS ed 
	FROM livro AS l JOIN exemplar AS e JOIN editora AS ed ON e.codlivro = l.codigo AND ed.codigo = l.codedit GROUP BY ed.codigo) 
    AS tb0 WHERE ed = ed.codigo);

-- questao 17
SET optimizer_switch = 'derived_merge=off'; 
SET SQL_SAFE_UPDATES = 0; 
DELETE FROM aluno 
WHERE codigo IN (SELECT a.codigo FROM (SELECT * FROM aluno) AS a 
LEFT JOIN emprestimo AS e ON a.codigo = e.codaluno WHERE e.CODEMPREST IS NULL); 
SET optimizer_switch = 'derived_merge=on'; 
SET SQL_SAFE_UPDATES = 1;

select codigo from aluno;

-- questao 18
update livro as l
set l.codedit = (select codigo from editora where nomeedit = "PEARSON")
where l.codedit = (select codigo from editora where nomeedit = "MAKRON BOOKS");


    