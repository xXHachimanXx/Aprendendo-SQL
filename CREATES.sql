-- Nome: Felipe Andrade Martins
-- Matrícula: 635093

drop database if exists BD2;
create database BD2;
use BD2;

-- Questão01
CREATE TABLE AUTOR (
    NOMEAUT VARCHAR(100) NOT NULL,
    CODIGO INT NOT NULL,
    PRIMARY KEY (CODIGO),
    UNIQUE (NOMEAUT)
);
    
CREATE TABLE EDITORA (
    NOMEEDIT VARCHAR(100) NOT NULL,
    CODIGO INT NOT NULL,
    PRIMARY KEY (CODIGO),
    UNIQUE (NOMEEDIT)
);

CREATE TABLE ASSUNTO (
    DESCRICAO VARCHAR(100) NOT NULL,
    CODIGO INT NOT NULL,
    PRIMARY KEY (CODIGO),
    UNIQUE (DESCRICAO)
);


CREATE TABLE LIVRO (
    CODIGO INT NOT NULL,
    TITULO VARCHAR(100) NOT NULL,
    ANOPUBLIC INT,
    CODEDIT INT NOT NULL,
    CODASSUNTO INT NOT NULL,
    PRIMARY KEY (CODIGO),
    FOREIGN KEY (CODEDIT)
        REFERENCES EDITORA (CODIGO),
    FOREIGN KEY (CODASSUNTO)
        REFERENCES ASSUNTO (CODIGO)
);

CREATE TABLE AUTORIA (
    CODLIVRO INT NOT NULL,
    CODAUTOR INT NOT NULL,
    PRIMARY KEY (CODAUTOR, CODLIVRO),
    FOREIGN KEY (CODLIVRO)
        REFERENCES LIVRO (CODIGO),
	FOREIGN KEY (CODAUTOR)
        REFERENCES AUTOR (CODIGO)
);

CREATE TABLE EXEMPLAR (
    CODEXEMPLAR INT NOT NULL,
    CODLIVRO INT NOT NULL,
    DATAAQUISICAO DATE NOT NULL,
    VALORAQUISICAO FLOAT,
    PRIMARY KEY (CODEXEMPLAR),
    FOREIGN KEY (CODLIVRO)
        REFERENCES LIVRO (CODIGO)
);

CREATE TABLE ALUNO (
    CODIGO INT NOT NULL,
    NOME TEXT NOT NULL,
    DATANASC DATE NOT NULL,
    CIDADE TEXT NOT NULL,
    PRIMARY KEY (CODIGO)
);

CREATE TABLE EMPRESTIMO (
    CODEMPREST INT NOT NULL,
    DATAEMPREST DATE,
    CODALUNO INT,
    PRIMARY KEY (CODEMPREST),    
    FOREIGN KEY (CODALUNO)
        REFERENCES ALUNO (CODIGO)
);

CREATE TABLE ITEMEMPREST (
    CODEMPRESTITEM INT NOT NULL,
    CODEXEMPLAR INT NOT NULL,
    DATADEVOLUCAO DATE NOT NULL,
    MULTA FLOAT,
    FOREIGN KEY (CODEMPRESTITEM)
        REFERENCES EMPRESTIMO (CODEMPREST),
	FOREIGN KEY (CODEXEMPLAR)
        REFERENCES EXEMPLAR (CODEXEMPLAR)
);

INSERT INTO AUTOR
    VALUES ("CLEITON VERGAS", 1);
    
INSERT INTO AUTOR
    VALUES ("MACHADO DE ASSIS", 2);
    
INSERT INTO AUTOR
    VALUES ("NILSON FREITAS", 3);
    
INSERT INTO AUTOR
    VALUES ("MILTON MOURÃO", 4);
    
INSERT INTO AUTOR
    VALUES ("NIKOLAI LESKOV", 5);
    
INSERT INTO AUTOR
    VALUES ("RUBINHO KERENINA", 6);
    
INSERT INTO AUTOR
    VALUES ("LIEV TOLSTOI", 7);

INSERT INTO AUTOR
	VALUES ("NAVATHE", 8);

INSERT INTO EDITORA
    VALUES ("VEJA", 1);

INSERT INTO EDITORA
    VALUES ("FUI", 2);
    
INSERT INTO EDITORA
    VALUES ("YOU", 3);
    
INSERT INTO EDITORA
    VALUES ("TOPS DOS TOPS", 4);

INSERT INTO EDITORA
    VALUES ("MAKRON BOOKS", 5);

INSERT INTO EDITORA
    VALUES ("PEARSON", 6);

INSERT INTO EDITORA
    VALUES ("CAMPUS", 7);
    
-- INSERT EM ASSUNTO
INSERT INTO ASSUNTO
    VALUES ("ROMANCE", 1);

INSERT INTO ASSUNTO
    VALUES ("LITERATURA BRASILEIRA", 2);
    
INSERT INTO ASSUNTO
    VALUES ("COMÉDIA", 3);
    
INSERT INTO ASSUNTO
    VALUES ("TERROR", 4);
    
INSERT INTO ASSUNTO
    VALUES ("ERÓTICO", 5);

-- INSERT EM LIVROS
INSERT INTO LIVRO
    VALUES (1, "MEMÓRIAS PÓSTUMAS DE UM ALUNO DA COMPUTAÇÃO", '2019', 1, 1);

INSERT INTO LIVRO
    VALUES (2, "MEMÓRIAS PÓSTUMAS DE BRAS CUBAS", '2019', 7, 2);

INSERT INTO LIVRO
    VALUES (3, "REI DO GADO", '2019', 7, 3);
    
INSERT INTO LIVRO
    VALUES (4, "BIBLIOGRAFIA DE CHIQUINHO SCARPA", '2019', 2, 2);

INSERT INTO LIVRO
    VALUES (5, "TROPA DE ELITE", '2019', 2, 2);

INSERT INTO LIVRO
    VALUES (6, "157", '2019', 1, 2);

INSERT INTO LIVRO
    VALUES (7, "CARNAVAL 2006", '2007', 5, 5);    
    
INSERT INTO LIVRO
    VALUES (8, "PAI DE FAMILIA", '2009', 5, 5);
    
INSERT INTO LIVRO
    VALUES (9, "UM PISTOLEIRO CHAMADO PAPACO", '2010', 5, 2);
    
-- INSERT EM EXEMPLAR
INSERT INTO EXEMPLAR
    VALUES (1, 1, '2019-11-11', 200);
    
INSERT INTO EXEMPLAR
    VALUES (2, 1, '2019-09-01', 200);    
    
INSERT INTO EXEMPLAR
    VALUES (3, 1, '2019-09-02', 200);
    
INSERT INTO EXEMPLAR
    VALUES (4, 1, '2019-09-01', 200);
    
INSERT INTO EXEMPLAR
    VALUES (5, 2, '2011-01-11', 200);
    
INSERT INTO EXEMPLAR
    VALUES (6, 2, '2019-09-01', 200);
    
INSERT INTO EXEMPLAR
    VALUES (7, 2, '2019-01-11', 200);    
    
INSERT INTO EXEMPLAR
    VALUES (8, 2, '2019-01-07', 200);
    
INSERT INTO EXEMPLAR
    VALUES (9, 2, '2011-01-07', 200);

INSERT INTO EXEMPLAR
    VALUES (10, 2, '2011-01-07', 200);

INSERT INTO EXEMPLAR
    VALUES (11, 3, '2019-09-07', 200);
    
INSERT INTO EXEMPLAR
    VALUES (12, 4, '2019-09-01', 200);

INSERT INTO EXEMPLAR
    VALUES (13, 4, '2019-09-01', 200);

INSERT INTO EXEMPLAR
    VALUES (14, 5, '2019-04-04', 100);

INSERT INTO EXEMPLAR
    VALUES (15, 4, '2019-03-04', 2);

INSERT INTO EXEMPLAR
    VALUES (16, 4, '2019-03-07', 2);    

INSERT INTO EXEMPLAR
    VALUES (17, 4, '2019-08-09', 500);

INSERT INTO EXEMPLAR
    VALUES (18, 4, '2019-01-05', 2);
    
-- INSERT EM ALUNO
INSERT INTO ALUNO
	VALUES(1, "Bernardo Valadares", '2000-11-11', "Belo Horizonte");

INSERT INTO ALUNO
	VALUES(2, "GILSON MARMITA", '2006-11-11', "Ipatinga");

INSERT INTO ALUNO
	VALUES(3, "MILTINHO MÃO BOBA", '2000-11-11', "Belo Horizonte");
    
-- INSERT EM EMPRESTIMO
INSERT INTO EMPRESTIMO
    VALUES (1, '2011-01-01', 1);
INSERT INTO EMPRESTIMO
    VALUES (2, '2011-02-01', 1);
INSERT INTO EMPRESTIMO
    VALUES (3, '2011-03-01', 1);
INSERT INTO EMPRESTIMO
    VALUES (4, '2019-04-01', 1);    
INSERT INTO EMPRESTIMO
    VALUES (5, '2019-05-07', 1);
INSERT INTO EMPRESTIMO
    VALUES (6, '2019-06-07', 1);
 INSERT INTO EMPRESTIMO
    VALUES (7, '2019-07-07', 1);
INSERT INTO EMPRESTIMO
    VALUES (8, '2019-08-07', 1);
INSERT INTO EMPRESTIMO
    VALUES (9, '2019-09-07', 1);
INSERT INTO EMPRESTIMO
    VALUES (10, '2019-01-01', 1);
INSERT INTO EMPRESTIMO
    VALUES (11, '2017-09-02', 2);    
INSERT INTO EMPRESTIMO
    VALUES (12, '2017-09-03', 2);
INSERT INTO EMPRESTIMO
    VALUES (13, '2017-09-04', 2);
INSERT INTO EMPRESTIMO
    VALUES (14, '2012-09-05', 3);

-- insert em itememprest
insert into itememprest
	values(1, 2, '2011-01-01', 100.1);
insert into itememprest
	values(2, 1, '2011-02-01', 100.2);
insert into itememprest
	values(3, 3, '2011-03-11', 11.5);    
insert into itememprest
	values(4, 3, '2019-04-21', 112.5); 
insert into itememprest
	values(5, 3, '2019-05-17', 113.5);
insert into itememprest
	values(6, 3, '2019-06-27', 114.5);
insert into itememprest
	values(7, 3, '2019-07-17', 15);
insert into itememprest
	values(8, 3, '2019-08-27', 112.5);    
insert into itememprest
	values(9, 3, '2019-09-17', 11.5);
insert into itememprest
	values(10, 1, '2019-01-21', 11.5);
insert into itememprest
	values(11, 1, '2017-01-22', 122.5);
insert into itememprest
	values(12, 1, '2017-01-13', 10.5);
insert into itememprest
	values(13, 1, '2017-01-05', 172.5);
insert into itememprest
	values(14, 1, '2012-01-06', 19.5);    

-- INSERT EM AUTORIA
INSERT INTO AUTORIA
    VALUES (1, 1);
INSERT INTO AUTORIA
    VALUES (1, 8);
INSERT INTO AUTORIA
    VALUES (1, 4);
INSERT INTO AUTORIA
    VALUES (2, 2);
INSERT INTO AUTORIA
    VALUES (2, 1);    
INSERT INTO AUTORIA
    VALUES (3, 3);   
INSERT INTO AUTORIA
    VALUES (3, 1); 


/* ---------------------------------------------- CONSULTAS ---------------------------------------------- */
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


    

