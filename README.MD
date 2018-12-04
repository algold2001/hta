Node para a HTS


--Rede (online)_libs do mysql para seu projeto funcionar...


npm install -S mysql

===================================================
--comentario (comandos mysql)

create database androiddb;
use androiddb;

create table produto(id int primary key auto_increment,
  nome varchar(50), preco float, promocao float);
 
 insert into produto values (null,'hiphone', 350, 50);
 insert into produto values (null,'chinaling', 550, 100);
 insert into produto values (null,'xanxung', 350, 40);

 select * from produto;







========================================================

Node precisa server.js
o do         package.json

---Estrutra do Node


server.json
package.json
README.MD


========================================

package.json


npm install

_package.json _ npm install (intala minha aplicacao)
 _ Instalando tudo que minha aplicacação precisa 
 _ para rodar com Node e mysql ....






=======================

node server.js



























