create database Bd_Consultorio;
use Bd_Consultorio;

create table Tb_Paciente(
	Id_Paciente int not null auto_increment, /*chave primaria*/
    Nome_Paciente varchar(100), /*aceita letras, n°, e caracteres especiais*/
    Data_Nasc_Pac date, /*mm/dd/aa*/
    Genero_Paciente enum('mulher cisgenero', 'homem cisgenero', 'homem transgenero', 'mulher transgenero', 'nao-binario'),/*campo aceita valores pré determinados*/
    Cpf_Paciente varchar(15),
    constraint pk_id_Paciente primary key (Id_Paciente) /*aviso de primary key*/
);

describe Tb_Paciente;

insert into Tb_Paciente (Nome_Paciente, Data_Nasc_Pac, Genero_Paciente, Cpf_Paciente) values
	('Roberto Carlos Braga ', '1941-04-19', 'homem cisgenero', '999.999.999-99'),
	('Matheus Brasileiro Aguiar', '1993-10-11', 'homem cisgenero', '555.555.555-55'),
	('Pedro Paulo Soares Pereira', '1970-04-22', 'homem cisgenero', '222.222.222-22'),
	('Clarice Franco de Abreu Falcão', '1989-10-23', 'mulher cisgenero', '333.333.333-33'),
	('Liniker de Barros Ferreira Campos ', '1995-07-03', 'mulher transgenero', '888.888.888-88'),
	('Nilcelaine Moretto Martins', '1980-08-31', 'mulher cisgenero', '111.111.111-11')
	; /*Insere dados nos campos da tabela*/

select * from Tb_Paciente;

create table Tb_Medico(
	Id_Medico int not null auto_increment,
	Nome_Medico varchar (100) not null,
	Data_Nascimento_Medico date not null,
	Crm_Medico varchar (13) not null,
	Genero_Medico enum ('mulher cisgenero','homem cisgenero','homem transgenero','mulher transgenero','nao-binario') not null,
	Cpf_Medico varchar (14) not null, 
	Especialidade_Medico varchar (30) not null,
	Turno_Medico enum ('manha','tarde','noite','madrugada') not null,
	Contato_Medico varchar (15) not null,
    constraint pk_id_Medico primary key (Id_Medico)
);

insert into Tb_Medico (Nome_Medico, Data_Nascimento_Medico, Crm_Medico, Genero_Medico, Cpf_Medico, Especialidade_Medico, Turno_Medico, Contato_Medico) values 
	('Alicia Rodrigues','1941-04-20','CRM/SP 555555','mulher cisgenero', '999.999.999-99', 'Ginicologista', 'manha', '11999999999'),
	('Francisco Dantas ', '1975-11-21','CRM/SP 777777','homem transgenero', '222.222.222-22', 'Fisioterapeuta', 'tarde', '11777777777'),
	('Robyn Rihanna Fenty ','1941-04-20','CRM/SP 555555','homem cisgenero', '999.999.999-99', 'Ginicologista', 'noite', '11666666666'),
	('Shaffer Chimere Smith', '1941-04-20','CRM/SP 555555','nao-binario', '999.999.999-99', 'Ginicologista', 'madrugada', '11888888888');
    
    select * from Tb_Medico;
    
create table Tb_Consulta(
	Id_Consulta int not null auto_increment,
    Data_Consulta date not null,
    Hora_Consulta timestamp not null,
    fk_id_Paciente int not null,
    fk_id_Medico int not null,
    
    constraint pk_id_Consulta primary key (Id_Consulta),   
    constraint fk_id_Paciente foreign key (fk_id_Paciente)
    references Tb_Paciente (Id_Paciente),
    constraint fk_id_Medico foreign key (fk_id_Medico)
    references Tb_Medico (Id_Medico)
    
    );
    
    describe Tb_Consulta;
    
alter table Tb_Paciente
add column convenio varchar (50); /*alteração na estrutura da tabela*/

describe Tb_Paciente;

select Nome_Paciente from Tb_Paciente;

describe Tb_Consulta;

describe Tb_Consulta;

use Bd_Consultorio;

describe Tb_Consulta;

insert into Tb_Consulta (Data_Consulta, fk_id_Paciente, fk_id_Medico, Hora_Consulta) values
('2024-11-12','1','1', '08:30:10'),
('2024-11-12','2','1', '09:30:10'),
('2024-11-12','3','1', '10:30:10'),
('2024-11-12','4','1', '11:30:10'),
('2024-11-12','5','2', '12:30:10');

describe Tb_Consulta;

drop table Tb_Consulta;

create table Tb_Consulta(
	Id_Consulta int not null auto_increment,
    Data_Consulta date not null,
    Hora_Consulta time not null,
    fk_id_Paciente int not null,
    fk_id_Medico int not null,
    
    constraint pk_id_Consulta primary key (Id_Consulta),   
    constraint fk_id_Paciente foreign key (fk_id_Paciente)
    references Tb_Paciente (Id_Paciente),
    constraint fk_id_Medico foreign key (fk_id_Medico)
    references Tb_Medico (Id_Medico)
    
    );

insert into Tb_Consulta (Data_Consulta, Hora_Consulta, fk_id_Paciente, fk_id_Medico) values
('2024-11-12','08:30:10','1','1'),
('2024-11-12','09:30:10','2','1'),
('2024-11-12','10:30:10','3','1'),
('2024-11-12','11:30:10','4','1'),
('2024-11-12','12:30:10','1','2');

describe Tb_Paciente;

describe Tb_Medico;

describe Tb_Medico;

select * from Tb_Medico;
    
select * from Tb_Consulta;

describe Tb_Paciente;

use Bd_Consultorio;

describe Tb_Consulta;

create table Tb_Receita(
	Id_Receita int not null auto_increment,
	constraint pk_id_Receita primary key (Id_Receita),
    Prescricao varchar (800) not null,
    Data_Receita date not null,
    CID varchar (13) not null
	);
