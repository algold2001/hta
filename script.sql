create table Usuario(   CodUsu   int not null auto_increment comment 'Código do usuário.',
                        Nome     varchar(50) comment 'Nome do usuário.',
                        Senha    varchar(100) comment 'Senha de acesso do usuário',
                        primary key(CodUsu)
) comment 'Tabela com os usuários que podem cadastrar informações no sistema.';


create table Ritmos(    CodRitmo    int not null auto_increment comment 'Código do ritmo.',
                        Nome        varchar(50) comment 'Nome do ritmo.',
                        Descricao   text comment 'Descrição do ritmo.',
                        Foto        text comment 'Foto demonstrativa do ritmo.',
                        IndAtivo    boolean not null default 1 comment 'Indica se o ritmo está ativo ou não na escola.',
                        primary key(CodRitmo)
) comment 'Tabela com os ritmos musicais ensinados na escola.';


create table Professores(  CodProf     int not null auto_increment comment 'Código do professor.',
                           Nome        varchar(50) comment 'Nome do professor.',
                           Descricao   text comment 'Descrição do professor.',
                           Foto        text comment 'Foto do professor.',
                           IndAtivo    boolean not null default 1 comment 'Indica se o professor está ativo ou não na escola.',
                           primary key(CodProf)
) comment 'Tabela com os professores que ensinam na escola.';


create table Turmas(    CodTurma    int not null auto_increment comment 'Código da turma.',
                        Nome        varchar(50) comment 'Nome da turma.',
                        Descricao   text comment 'Descrição sobre a turma.',
                        Foto        text comment 'Foto do professor.',
                        CodProf     int not null comment 'Código do professor.',
                        IndAtivo    boolean not null default 1 comment 'Indica se a turma está ativa ou não na escola.',
                        primary key(CodTurma),
                        foreign key (CodProf) references Professores(CodProf)
) comment 'Tabela com as turmas disponíveis na escola.';


create table HorarioTurma(    CodTurma       int not null comment 'Código da turma.',
                              DiaSemana      int not null comment 'Dia da semana em que ocorre a aula da turma.',
                              HoraInicial    datetime comment 'Hora de início da aula no dia da semana em questão.',
                              HoraFinal      datetime comment 'Hora de término da aula no dia da semana em questão.',
                              primary key(CodTurma,DiaSemana),
                              foreign key (CodTurma) references Turmas(CodTurma)
) comment 'Tabela com os horários de aula das turmas disponíveis na escola.';


create table RitmosTurma(  CodTurma    int not null comment 'Código da turma.',
                           CodRitmo    int not null comment 'Dia da semana em que ocorre a aula da turma.',
                           primary key(CodTurma,CodRitmo),
                           foreign key (CodTurma) references Turmas(CodTurma),
                           foreign key (CodRitmo) references Ritmos(CodRitmo)
) comment 'Tabela com os ritmos ensinados na turma.';


create table Eventos(   CodEvento    int not null auto_increment comment 'Código do evento.',
                        Nome        varchar(50) comment 'Nome do evento.',
                        Descricao   text comment 'Descrição detalhada do evento.',
                        Data        datetime comment 'Data do evento.',
                        Valor       double comment 'Valor do evento.',
                        Foto        text comment 'Foto demonstrativa do evento.',
                        IndAtivo    boolean not null default 1 comment 'Indica se o evento está ativo ou não.',
                        primary key(CodEvento)
) comment 'Tabela com os eventos disponíveis na escola.';