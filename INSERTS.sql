-- Questão 02
-- INSERT AUTOR
INSERT INTO AUTOR
    VALUES ("CLEITON VERGAS", 1);
    
INSERT INTO AUTOR
    VALUES ("CHICO TORRESMO", 2);
    
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
    VALUES (2, "MEMÓRIAS PÓSTUMAS DE BRAS CUBAS", '2019', 1, 2);

INSERT INTO LIVRO
    VALUES (3, "REI DO GADO", '2019', 2, 3);
    
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
    VALUES (1, 1, '2019', 200);
    
INSERT INTO EXEMPLAR
    VALUES (2, 1, '2019', 200);    
    
INSERT INTO EXEMPLAR
    VALUES (3, 1, '2019', 200);
    
INSERT INTO EXEMPLAR
    VALUES (4, 1, '2019', 200);
    
INSERT INTO EXEMPLAR
    VALUES (5, 2, '2011', 200);
    
INSERT INTO EXEMPLAR
    VALUES (6, 2, '2019', 200);
    
INSERT INTO EXEMPLAR
    VALUES (7, 2, '2019', 200);    
    
INSERT INTO EXEMPLAR
    VALUES (8, 2, '2019', 200);
    
INSERT INTO EXEMPLAR
    VALUES (9, 2, '2011', 200);

INSERT INTO EXEMPLAR
    VALUES (10, 2, '2011', 200);

INSERT INTO EXEMPLAR
    VALUES (11, 3, '2019', 200);
    
INSERT INTO EXEMPLAR
    VALUES (12, 4, '2019', 200);

INSERT INTO EXEMPLAR
    VALUES (13, 4, '2019', 200);

INSERT INTO EXEMPLAR
    VALUES (14, 5, '2019', 100);

INSERT INTO EXEMPLAR
    VALUES (15, 4, '2019', 2);

INSERT INTO EXEMPLAR
    VALUES (16, 4, '2019', 2);    

INSERT INTO EXEMPLAR
    VALUES (17, 4, '2019', 500);

INSERT INTO EXEMPLAR
    VALUES (18, 4, '2019', 2);
    
-- INSERT EM ALUNO
INSERT INTO ALUNO
	VALUES(1, "Bernardo Valadares", '2000-11-11', "BH");

INSERT INTO ALUNO
	VALUES(2, "GILSON MARMITA", '2000-11-11', "BH");

INSERT INTO ALUNO
	VALUES(3, "MILTINHO MÃO BOBA", '2000-11-11', "BH");
    
-- INSERT EM EMPRESTIMO
INSERT INTO EMPRESTIMO
    VALUES (1, '2011', 1);
INSERT INTO EMPRESTIMO
    VALUES (2, '2011', 1);
INSERT INTO EMPRESTIMO
    VALUES (3, '2011', 1);
INSERT INTO EMPRESTIMO
    VALUES (4, '2019', 1);    
INSERT INTO EMPRESTIMO
    VALUES (5, '2019', 1);
INSERT INTO EMPRESTIMO
    VALUES (6, '2019', 1);
 INSERT INTO EMPRESTIMO
    VALUES (7, '2019', 1);
INSERT INTO EMPRESTIMO
    VALUES (8, '2019', 1);
INSERT INTO EMPRESTIMO
    VALUES (9, '2019', 1);
INSERT INTO EMPRESTIMO
    VALUES (10, '2019', 1);  

-- insert em itememprest
insert into itememprest
	values(1, 2, '20199', 100.1);
insert into itememprest
	values(2, 1, '20199', 100.2);
insert into itememprest
	values(3, 3, '20199', 1.5);    
insert into itememprest
	values(4, 3, '20199', 1.5);    
  
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
