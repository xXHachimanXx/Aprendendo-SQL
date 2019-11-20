USE BD2;

SELECT * FROM ASSUNTO;

-- questao 03
select l.titulo, l.anopublic, count(*), avg(e.valoraquisicao) from livro as l
	join exemplar as e on l.codigo = e.codlivro 
	join assunto as a on a.descricao = "LITERATURA BRASILEIRA";
    
-- questao 04
select l.titulo, ie.multa, emp.dataemprest from livro as l	
	join exemplar as e on e.codlivro = l.codigo
    join itememprest as ie on ie.codexemplar = e.codlivro
    join emprestimo as emp on emp.codemprest = ie.codemprestitem
    join aluno a on a.nome = "bernardo valadares";

-- questao 05
select distinct nome from aluno as a, emprestimo as e 
where e.codaluno <> a.codigo;

-- questao 06 
select nome, count(codemprest) from aluno as a 
	left join emprestimo as e on e.codaluno = a.codigo
	group by a.nome;
    
-- questao 07
select nomeaut from autor as au
	join autoria as aut on au.codigo = aut.codautor
    join livro as l on l.codassunto = (select codigo from assunto where descricao = "LITERATURA BRASILEIRA");

-- questao 08 
select nome from aluno as a 
	left join emprestimo as e on e.codaluno = a.codigo
	group by a.nome
    having count(e.codemprest) >= 10;
    
-- questao 09
select distinct a.nomeaut from autor as a, autoria as au where au.codlivro = 
( select codlivro from autoria where codautor = (select codigo from autor where nomeaut = "NAVATHE") ) 
 and a.codigo = au.codautor and a.nomeaut <> "NAVATHE";

-- questao 10
select nomeaut from autor a0 where 
(select count(*) from autor a1 join autoria i on a1.codigo = i.codautor where a1.codigo = a0.codigo) > 
(select count(*) from autor a2 join autoria i on a2.codigo = i.codautor where a2.nomeaut = 'NAVATHE');

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
select l.titulo from livro l 
join exemplar ex 
join itememprest i on l.codigo = ex.codlivro and ex.codexemplar = i.codexemplar
where
(select count(*) from itememprest i2  
 join emprestimo em on em.codemprest = i2.codemprestitem 
 where i2.codexemplar = ex.codexemplar and year(em.dataemprest) = 2019)
 = 
(select max(qtd) from( 
	select count(*) as qtd from itememprest i2 
	join emprestimo em on em.codemprest = i2.codemprestitem	
	where year(em.dataemprest) = 2019
	group by i2.codexemplar) as tb0 );
    
-- questao 16
select distinct l.titulo, e.codexemplar from livro as l 
join exemplar as e
join editora as ed on e.codlivro = l.codigo and ed.codigo = l.codedit 
where e.valoraquisicao > (select av from (select avg(e.valoraquisicao) as av, ed.codigo as ed 
	from livro as l join exemplar as e join editora as ed on e.codlivro = l.codigo and ed.codigo = l.codedit group by ed.codigo) 
    as tb0 where ed = ed.codigo);

-- questao 17
set optimizer_switch = 'derived_merge=off'; 
set sql_safe_updates = 0; 
delete from aluno 
where codigo in (select a.codigo from (select * from aluno) as a 
left join emprestimo as e on a.codigo = e.codaluno where e.codemprest is null); 
set optimizer_switch = 'derived_merge=on'; 
set sql_safe_updates = 1;

-- questao 18
update livro as l
set l.codedit = (select codigo from editora where nomeedit = "PEARSON")
where l.codedit = (select codigo from editora where nomeedit = "MAKRON BOOKS");


    