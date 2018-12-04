create table Usuario(   CodUsu   int not null auto_increment comment 'C�digo do usu�rio.',
                        Nome     varchar(50) comment 'Nome do usu�rio.',
                        Senha    varchar(100) comment 'Senha de acesso do usu�rio',
                        primary key(CodUsu)
) comment 'Tabela com os usu�rios que podem cadastrar informa��es no sistema.';


create table Ritmos(    CodRitmo    int not null auto_increment comment 'C�digo do ritmo.',
                        Nome        varchar(50) comment 'Nome do ritmo.',
                        Descricao   text comment 'Descri��o do ritmo.',
                        Foto        text comment 'Foto demonstrativa do ritmo.',
                        IndAtivo    boolean not null default 1 comment 'Indica se o ritmo est� ativo ou n�o na escola.',
                        primary key(CodRitmo)
) comment 'Tabela com os ritmos musicais ensinados na escola.';


create table Professores(  CodProf     int not null auto_increment comment 'C�digo do professor.',
                           Nome        varchar(50) comment 'Nome do professor.',
                           Descricao   text comment 'Descri��o do professor.',
                           Foto        text comment 'Foto do professor.',
                           IndAtivo    boolean not null default 1 comment 'Indica se o professor est� ativo ou n�o na escola.',
                           primary key(CodProf)
) comment 'Tabela com os professores que ensinam na escola.';


create table Turmas(    CodTurma    int not null auto_increment comment 'C�digo da turma.',
                        Nome        varchar(50) comment 'Nome da turma.',
                        Descricao   text comment 'Descri��o sobre a turma.',
                        Foto        text comment 'Foto do professor.',
                        CodProf     int not null comment 'C�digo do professor.',
                        IndAtivo    boolean not null default 1 comment 'Indica se a turma est� ativa ou n�o na escola.',
                        primary key(CodTurma),
                        foreign key (CodProf) references Professores(CodProf)
) comment 'Tabela com as turmas dispon�veis na escola.';


create table HorarioTurma(    CodTurma       int not null comment 'C�digo da turma.',
                              DiaSemana      int not null comment 'Dia da semana em que ocorre a aula da turma.',
                              HoraInicial    datetime comment 'Hora de in�cio da aula no dia da semana em quest�o.',
                              HoraFinal      datetime comment 'Hora de t�rmino da aula no dia da semana em quest�o.',
                              primary key(CodTurma,DiaSemana),
                              foreign key (CodTurma) references Turmas(CodTurma)
) comment 'Tabela com os hor�rios de aula das turmas dispon�veis na escola.';


create table RitmosTurma(  CodTurma    int not null comment 'C�digo da turma.',
                           CodRitmo    int not null comment 'Dia da semana em que ocorre a aula da turma.',
                           primary key(CodTurma,CodRitmo),
                           foreign key (CodTurma) references Turmas(CodTurma),
                           foreign key (CodRitmo) references Ritmos(CodRitmo)
) comment 'Tabela com os ritmos ensinados na turma.';


create table Eventos(   CodEvento    int not null auto_increment comment 'C�digo do evento.',
                        Nome        varchar(50) comment 'Nome do evento.',
                        Descricao   text comment 'Descri��o detalhada do evento.',
                        Data        datetime comment 'Data do evento.',
                        Valor       double comment 'Valor do evento.',
                        Foto        text comment 'Foto demonstrativa do evento.',
                        IndAtivo    boolean not null default 1 comment 'Indica se o evento est� ativo ou n�o.',
                        primary key(CodEvento)
) comment 'Tabela com os eventos dispon�veis na escola.';