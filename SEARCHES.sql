USE BD2;

SELECT * FROM ASSUNTO;

-- questao 03
select l.titulo, l.anopublic, count(*), avg(e.valoraquisicao) from livro as l
	join exemplar as e on l.codigo = e.codlivro 
	join assunto as a on a.descricao = "LITERATURA BRASILEIRA";
    
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

-- questao 10
SELECT nomeaut FROM autor a0 WHERE 
(SELECT COUNT(*) FROM autor a1 JOIN autoria i ON a1.codigo = i.codautor WHERE a1.codigo = a0.codigo) > 
(SELECT COUNT(*) FROM autor a2 JOIN autoria i ON a2.codigo = i.codautor WHERE a2.nomeaut = 'NAVATHE');

-- questao 11
select nome, avg(multa) from aluno as a 
left join emprestimo as e on a.codigo = e.codaluno
left join itememprest as ie on ie.codemprestitem = e.codemprest
having avg(multa) > max( (select avg(multa) from aluno as a 
	left join emprestimo as e on a.codigo = e.codaluno
	left join itememprest as ie on ie.codemprestitem = e.codemprest and cidade = "Belo Horizonte" ) );

-- questao 12 
select nome, count(codemprest) from aluno as a
left join emprestimo as e on e.codaluno = a.codigo
group by nome
having count(codemprest) > (
	select count(codemprest) from autor as au
	left join autoria as aut on au.codigo = aut.codautor
	left join livro as l on aut.codlivro = l.codigo
	left join exemplar as ex on ex.codlivro = l.codigo
	left join itememprest as ie on ex.codexemplar = ie.codexemplar
	left join emprestimo as emp on emp.codemprest = ie.codemprestitem and nomeaut = "MACHADO DE ASSIS"
);

-- questao 13
select nomeedit, count(l.codigo) from editora as edt
left join livro as l on edt.codigo = l.codedit
group by edt.codigo
having count(l.codigo) > ( select count(l.codigo) from editora as edt
left join livro as l on edt.codigo = l.codedit and edt.nomeedit = "CAMPUS");

-- questao 14
select nome, titulo from aluno as a
join emprestimo as emp on emp.codaluno = a.codigo and month(emp.dataemprest) = 9
join itememprest as ie on ie.codemprestitem = emp.codemprest and (day(ie.datadevolucao) - day(emp.dataemprest)) <= 2
join exemplar as ex on ex.codexemplar = ie.codexemplar
join livro as l on l.codigo = ex.codlivro;

-- questao 15      
desc itememprest;

SELECT l.titulo FROM livro l 
JOIN exemplar ex 
JOIN itememprest i ON l.codigo = ex.codlivro AND ex.codexemplar = i.codexemplar
WHERE
(SELECT COUNT(*) FROM itememprest i2  
 JOIN emprestimo em ON em.codemprest = i2.codemprestitem 
 WHERE i2.codexemplar = ex.codexemplar AND year(em.dataemprest) = 2019)
 = 
(SELECT MAX(qtd) FROM( 
	SELECT COUNT(*) AS qtd FROM itememprest i2 
	JOIN emprestimo em ON em.codemprest = i2.codemprestitem	
	WHERE year(em.dataemprest) = 2019
	GROUP BY i2.codexemplar) AS tb0 );
    
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


    