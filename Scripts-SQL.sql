/* Criando tavelas stage e final */
create table Camp_Br (
idx_name varchar(50),
Rodada varchar(50),	
Data varchar(50),
Horario	varchar(50),
Dia	varchar(50),
Mandante varchar(50),
Visitante varchar(50),	
Vencedor varchar(50),	
Arena varchar(50),
Mandante_Placar	varchar(50),
Visitante_Placar varchar(50),	
Estado_Mandante varchar(50),	
Estado_Visitante varchar(50),	
Estado_Vencedor varchar(50) 
)

select * from [dbo].[Camp_Br]

create table Camp_Br_Final (
Data date,
Horario	varchar(50),
Dia	varchar(50),
Mandante varchar(50),
Visitante varchar(50),	
Vencedor varchar(50),	
Arena varchar(50),
Mandante_Placar	int,
Visitante_Placar int,	
Estado_Mandante varchar(50),	
Estado_Visitante varchar(50),	
Estado_Vencedor varchar(50) 
)

/* Procedure */
create procedure transform_all
as
begin 

insert into [dbo].[Camp_Br_Final](Data,Horario,Dia,Mandante,Visitante,Vencedor,Arena,
Mandante_Placar,Visitante_Placar,Estado_Mandante,Estado_Visitante,Estado_Vencedor)
select cast(Data as date),Horario,Dia,Mandante,Visitante,Vencedor,Arena,
cast(Mandante_Placar as int),cast(Visitante_Placar as int),Estado_Mandante,Estado_Visitante,Estado_Vencedor 
from [dbo].[Camp_Br]

update [dbo].[Camp_Br_Final]
	set Vencedor = replace(Vencedor, '-', 'EMPATE')

update [dbo].[Camp_Br_Final]
	set Estado_Vencedor = replace(Estado_Vencedor, '-', 'EMPATE')

end;
   
exec transform_all;


select * from [dbo].[Camp_Br_Final]