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

-- questao 15	
select titulo, max(count(*)) from livro as l
join exemplar as ex on ex.codlivro = l.codigo
join itememprest as ie on ie.codexemplar = ex.codexemplar
join emprestimo as emp on emp.codemprest = ie.codemprestitem ;

-- questao 16 valor exemplar > this.edit.avg(valorexemplar)
-- select l.titulo, ex.codexemplar from (exemplar as ex
-- join livro as l on l.codigo = ex.codlivro
-- join editora as ed on l.codedit = ed.codigo)
-- where ;

select avg(valoraquisicao) from exemplar as ex
join livro as l on l.codigo = ex.codlivro
join editora as ed on l.codedit = ed.codigo;

select l.titulo, ex.codexemplar from livro as l, editora as ed, exemplar as ex
where ex.valorexemplar > (select avg(valorexemplar) from editora where l.codedit = codigo and ex.codlivro = l.codigo);

select avg(valoraquisicao) from exemplar as e where e.codlivro = (select codigo from livro)

-- e.valorexemplar > avg(select valorexemplar from exemplar where ed.cod = l.codeditora);
-- questao 17
select distinct codigo from aluno as a, emprestimo as e where e.codaluno <> a.codigo;


-- questao 18
update livro as l
set l.codedit = (select codigo from editora where nomeedit = "PEARSON")
where l.codedit = (select codigo from editora where nomeedit = "MAKRON BOOKS");


    