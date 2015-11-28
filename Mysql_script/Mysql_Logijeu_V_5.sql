create database if not exists  LogiJeu;

use LogiJeu;



#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: CLIENT
#------------------------------------------------------------


CREATE TABLE CLIENT(
        ID_Client       int  Auto_increment  NOT NULL ,
        prenom_client   Char (30) ,
        nom_client      Char (30) ,
        mail_client     Varchar (50) ,
        adresse_client  Varchar (50) ,
        ville_client    Char (50) ,
        pays_client     Char (100) ,
		profil  mediumblob,
        username_client Varchar (50) ,
        password_client Varchar (25) ,
        PRIMARY KEY (ID_Client )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CARTE_MERE
#------------------------------------------------------------

CREATE TABLE CARTE_MERE(
        ID_Carte_Mere   int Auto_increment  NOT NULL ,
        CPU_Name        Varchar (25) ,
        Chipset         Varchar (25) ,
        Total_RAM       Varchar (6) ,
        Total_USB       Int  ,
        Memory_Type     Varchar (25) ,
        Memory_Capacity Char (25) ,
        Memory_Total    Varchar (25) ,
        Memory_Speed    Varchar (500) ,
        GPU_Interface   Varchar (25) ,
        ID_Client       Int ,
        PRIMARY KEY (ID_Carte_Mere )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PROCESSEUR
#------------------------------------------------------------

CREATE TABLE PROCESSEUR(
        ID_Proc         int  Auto_increment  NOT NULL ,
        Name_Proc       Varchar (25) ,
        CPU_Speed       Varchar (25) ,
        Turbo_Speed     Varchar (6) ,
        Physical_Cores  Varchar (6) ,
        Threads         Char (7) ,
        CPU_Codename    Varchar (25) ,
        TDP__Power_     Varchar (10) ,
        CPU_socket      Varchar (25) ,
        Bit_Width       Varchar (6) ,
        Memory_Channels Int ,
        Maximum_memory  Varchar (25) ,
        ID_Carte_Mere   Int ,
        PRIMARY KEY (ID_Proc )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MEMOIRE
#------------------------------------------------------------

CREATE TABLE MEMOIRE(
        ID_Memoire   int Auto_increment  NOT NULL ,
        Constructeur Varchar (25) ,
        Capacite     Int ,
        Types        Varchar (25) ,
        Fraquences   Varchar (25) ,
        PRIMARY KEY (ID_Memoire )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CARTE_GRAPHIQUE
#------------------------------------------------------------

CREATE TABLE CARTE_GRAPHIQUE(
        ID_Carte_Graphique int  Auto_increment  NOT NULL ,
        Name_GPU           Varchar (25) ,
        Memory             Varchar (25) ,
        Pixel_Rate         Varchar (25) ,
        Direct_X           Varchar (25) ,
        Resolution__WxH_   Varchar (25) ,
        PRIMARY KEY (ID_Carte_Graphique )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: LOGICIELS
#----------------------------------------------------------

CREATE TABLE LOGICIELS(
        ID_Logiciels int  Auto_increment  NOT NULL ,
        Designation  Varchar (25) ,
        Marque       Char (25) ,
        Modele       Varchar (25) ,
        Compatiblite Char (25) ,
        PRIMARY KEY (ID_Logiciels )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: OS
#------------------------------------------------------------

CREATE TABLE OS(
        id_os         int  Auto_increment  NOT NULL ,
        type_os       varchar(70),
        ID_Carte_Mere Int ,
        PRIMARY KEY (id_os )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: JEUX
#------------------------------------------------------------

CREATE TABLE JEUX(
        ID_Jeux     int  Auto_increment  NOT NULL ,
        Designation Varchar (25) ,
        Marque      Char (25) ,
        Modele      Int ,
        Genre       Varchar (25) ,
        Multiplayer Bool ,
        PEGI        Int ,
        Type_Media  Char (25) ,
		Config_mim  mediumtext,
		Config_reco mediumtext,
        PRIMARY KEY (ID_Jeux )
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: Suggestion
#------------------------------------------------------------

CREATE TABLE Suggestion(
        ID_Client       int (11) Auto_increment  NOT NULL ,
        Processeur      Varchar (70) ,
        Carte_mere      Varchar (70) ,
        Carte_graphique Varchar (70) ,
        RAM_GB_         Varchar (15) ,
        OS              Varchar (50) ,
        Jeux            Varchar (70) ,
        Mail_Client     Varchar (50) ,
        Numero_Portable Varchar (70) ,
        PRIMARY KEY (ID_Client )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: determine
#------------------------------------------------------------

CREATE TABLE determine(
        ID_Logiciels Int NOT NULL ,
        id_os        Int NOT NULL ,
        PRIMARY KEY (ID_Logiciels ,id_os )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: detenir
#------------------------------------------------------------

CREATE TABLE detenir(
        ID_Memoire    Int NOT NULL ,
        ID_Carte_Mere Int NOT NULL ,
        PRIMARY KEY (ID_Memoire ,ID_Carte_Mere )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: detient
#------------------------------------------------------------

CREATE TABLE detient(
        ID_Carte_Graphique Int NOT NULL ,
        ID_Carte_Mere      Int NOT NULL ,
        PRIMARY KEY (ID_Carte_Graphique ,ID_Carte_Mere )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: afficher
#------------------------------------------------------------

CREATE TABLE afficher(
        ID_Carte_Graphique Int NOT NULL ,
        id_os              Int NOT NULL ,
        PRIMARY KEY (ID_Carte_Graphique ,id_os )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: regir
#------------------------------------------------------------

CREATE TABLE regir(
        ID_Carte_Graphique Int NOT NULL ,
        ID_Logiciels       Int NOT NULL ,
        PRIMARY KEY (ID_Carte_Graphique ,ID_Logiciels )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: (permet) jouer
#------------------------------------------------------------

CREATE TABLE _permet__jouer(
        ID_Jeux            Int NOT NULL ,
        ID_Carte_Graphique Int NOT NULL ,
        PRIMARY KEY (ID_Jeux ,ID_Carte_Graphique )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: etre compatible
#------------------------------------------------------------

CREATE TABLE etre_compatible(
        ID_Jeux Int NOT NULL ,
        id_os   Int NOT NULL ,
        PRIMARY KEY (ID_Jeux ,id_os )
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Faire
#------------------------------------------------------------
 
 
create table faire(
		ID int not null,
		ID_Client int not null, 
		PRIMARY KEY (ID, ID_client)
 )ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Result
#------------------------------------------------------------
 
 
 create table result 
(

Name_GPU varchar (70)
, CPU_Name varchar  (70)
, Name_Proc varchar (70)
, Capacite varchar (50)
, Designation_Logiciel varchar (50)
, Designation_Jeux varchar (50)
, Note int (10)
, Fidelite int
)ENGINE=InnoDB;
 
 
#------------------------------------------------------------
# Clef EtrangÃƒÆ’Ã‚Â¨res
#------------------------------------------------------------


ALTER TABLE CARTE_MERE ADD CONSTRAINT FK_CARTE_MERE_ID_Client FOREIGN KEY (ID_Client) REFERENCES CLIENT(ID_Client);
ALTER TABLE PROCESSEUR ADD CONSTRAINT FK_PROCESSEUR_ID_Carte_Mere FOREIGN KEY (ID_Carte_Mere) REFERENCES CARTE_MERE(ID_Carte_Mere);
ALTER TABLE OS ADD CONSTRAINT FK_OS_ID_Carte_Mere FOREIGN KEY (ID_Carte_Mere) REFERENCES CARTE_MERE(ID_Carte_Mere);
ALTER TABLE determine ADD CONSTRAINT FK_determine_ID_Logiciels FOREIGN KEY (ID_Logiciels) REFERENCES LOGICIELS(ID_Logiciels);
ALTER TABLE determine ADD CONSTRAINT FK_determine_id_os FOREIGN KEY (id_os) REFERENCES OS(id_os);
ALTER TABLE detenir ADD CONSTRAINT FK_detenir_ID_Memoire FOREIGN KEY (ID_Memoire) REFERENCES MEMOIRE(ID_Memoire);
ALTER TABLE detenir ADD CONSTRAINT FK_detenir_ID_Carte_Mere FOREIGN KEY (ID_Carte_Mere) REFERENCES CARTE_MERE(ID_Carte_Mere);
ALTER TABLE detient ADD CONSTRAINT FK_detient_ID_Carte_Graphique FOREIGN KEY (ID_Carte_Graphique) REFERENCES CARTE_GRAPHIQUE(ID_Carte_Graphique);
ALTER TABLE detient ADD CONSTRAINT FK_detient_ID_Carte_Mere FOREIGN KEY (ID_Carte_Mere) REFERENCES CARTE_MERE(ID_Carte_Mere);
ALTER TABLE afficher ADD CONSTRAINT FK_afficher_ID_Carte_Graphique FOREIGN KEY (ID_Carte_Graphique) REFERENCES CARTE_GRAPHIQUE(ID_Carte_Graphique);
ALTER TABLE afficher ADD CONSTRAINT FK_afficher_id_os FOREIGN KEY (id_os) REFERENCES OS(id_os);
ALTER TABLE regir ADD CONSTRAINT FK_regir_ID_Carte_Graphique FOREIGN KEY (ID_Carte_Graphique) REFERENCES CARTE_GRAPHIQUE(ID_Carte_Graphique);
ALTER TABLE regir ADD CONSTRAINT FK_regir_ID_Logiciels FOREIGN KEY (ID_Logiciels) REFERENCES LOGICIELS(ID_Logiciels);
ALTER TABLE _permet__jouer ADD CONSTRAINT FK__permet__jouer_ID_Jeux FOREIGN KEY (ID_Jeux) REFERENCES JEUX(ID_Jeux);
ALTER TABLE _permet__jouer ADD CONSTRAINT FK__permet__jouer_ID_Carte_Graphique FOREIGN KEY (ID_Carte_Graphique) REFERENCES CARTE_GRAPHIQUE(ID_Carte_Graphique);
ALTER TABLE etre_compatible ADD CONSTRAINT FK_etre_compatible_ID_Jeux FOREIGN KEY (ID_Jeux) REFERENCES JEUX(ID_Jeux);
ALTER TABLE etre_compatible ADD CONSTRAINT FK_etre_compatible_id_os FOREIGN KEY (id_os) REFERENCES OS(id_os);        



ALTER TABLE faire ADD CONSTRAINT FK_faire_ID FOREIGN KEY (ID_Client) REFERENCES CLIENT(ID_Client);
ALTER TABLE faire ADD CONSTRAINT FK_faire_ID_Client FOREIGN KEY (ID_Client) REFERENCES Suggestion(ID_Client);



#------------------------------------------------------------
# Insert valeur table Client 
#------------------------------------------------------------


 insert into client 
 (prenom_client , nom_client , mail_client , adresse_client , ville_client , pays_client, profil , username_client , password_client) 
 values 
 ("Valentin", "Bonnard", "valentinbonnard0303@gmail.com", "rue du general Patton", "Crouy", "France",
 'C:/Users/Bonnard_Valentin/Desktop/va.jpg', "Admin", "123");
 
 insert into client
 (prenom_client , nom_client , mail_client , adresse_client , ville_client , pays_client, profil , username_client , password_client)
 values
 ("Melanie", "Pchddu", "Nany@laposte.net", "Rue Tronchet", "Paris", "France",
 'C:/Users/Bonnard_Valentin/Desktop/me.jpg', "Nany", "password");
 
 insert into client
(prenom_client , nom_client , mail_client , adresse_client , ville_client , pays_client, profil , username_client , password_client)
 values 
 ("Remi", "Regnier", "batman@orange.com", "Rue des Templiers", "Reims", "France",
 'C:/Users/Bonnard_Valentin/Desktop/re.png',
 "Batman", "chevalierNoir");
 
 insert into client
(prenom_client , nom_client , mail_client , adresse_client , ville_client , pays_client, profil , username_client , password_client)
 values 
 ("Cynthia", "Costaux", "CynCos@live.com", "Akasakahitostugidoriyubinkyoku", "Tokyo", "Japon",
 'C:/Users/Bonnard_Valentin/Desktop/cy.jpg', "Kamen", "kekko");  
 
 
 select * from client; 
 


#------------------------------------------------------------
# Insert valeur table CARTE_MERE 
#------------------------------------------------------------



insert into carte_mere
 (CPU_Name, Chipset, Total_RAM, Total_USB, Memory_Type, Memory_Capacity, Memory_Total, Memory_Speed, GPU_Interface) 
 values 
 ("Gigabyte G1 Sniper Z97", "Intel 1150", "4", "13", "DDR3", "8Go", "32Go", 
 "PC3-10600 - DDR3 1333 MHz, PC3-12800 - DDR3 1600 MHz, PC3-14400 - DDR3 1800 MHz, PC3-16000 - DDR3 2000 MHz, PC3-17066 - DDR3 2133 MHz,
 PC3-14900 - DDR3 1866 MHz, PC3-17600 - DDR3 2200 MHz, PC3-19200 - DDR3 2400 MHz, PC3-20800 - DDR3 2600 MHz,
 PC3-21300 - DDR3 2666 MHz, PC3-22400 - DDR3 2800 MHz, PC3-23466 - DDR3 2933 MHz, PC3-24000 - DDR3 3000 MHz",  "2 x PCI Express 3.0 16x");
 
 insert into carte_mere
 (CPU_Name, Chipset, Total_RAM, Total_USB, Memory_Type, Memory_Capacity, Memory_Total, Memory_Speed, GPU_Interface) 
 values 
 ("Gigabyte G1.Sniper A88X", "AMD FM2+", "4", "12", "DDR3", "16Go", "64Go", 
 "PC3-10600 - DDR3 1333 MHz, PC3-12800 - DDR3 1600 MHz, PC3-17066 - DDR3 2133 MHz, PC3-14900 - DDR3 1866 MHz",  "2 x PCI Express 3.0 16x");
 
 insert into carte_mere
 (CPU_Name, Chipset, Total_RAM, Total_USB, Memory_Type, Memory_Capacity, Memory_Total, Memory_Speed, GPU_Interface) 
 values 
 ("MSI X99A MPOWER", "Intel 2011-v3", "8", "18", "DDR4", "16Go", "128Go", 
 "PC4-17000 - DDR4 2133 MHz, PC4-19200 - DDR4 2400 MHz, PC4-21300 - DDR4 2666 MHz, PC4-22400 - DDR4 2800 MHz, PC4-24000 - DDR4 3000 MHz, PC4-26600 - DDR4 3333 MHz",  "4 x PCI Express 3.0 16x");
 
 insert into carte_mere
 (CPU_Name, Chipset, Total_RAM, Total_USB, Memory_Type, Memory_Capacity, Memory_Total, Memory_Speed, GPU_Interface) 
 values 
 ("ASRock X99 Extreme4/3.1", "Intel 2011-v3", "8", "13", "DDR3", "8Go", "32Go", 
 "PC4-17000 - DDR4 2133 MHz, PC4-19200 - DDR4 2400 MHz, PC4-21300 - DDR4 2666 MHz, PC4-22400 - DDR4 2800 MHz",  "3 x PCI Express 3.0 16x");
 
 insert into carte_mere
 (CPU_Name, Chipset, Total_RAM, Total_USB, Memory_Type, Memory_Capacity, Memory_Total, Memory_Speed, GPU_Interface) 
 values 
 ("ASRock AM1B-M", "AMD AM1 (FS1b)", "2", "10", "DDR3", "8Go", "16Go", 
 "PC3-10600 - DDR3 1333 MHz, PC3-8500 - DDR3 1066 MHz, PC3-12800 - DDR3 1600 MHz",  "1 x PCI Express 2.0 16x");
 
 

 select * from carte_mere;



#------------------------------------------------------------
# Insert valeur table PROCESSEUR
#------------------------------------------------------------



insert into processeur 
 (Name_Proc , CPU_Speed , Turbo_Speed , Physical_Cores, Threads , CPU_Codename , TDP__Power_ , CPU_socket , Bit_Width , Memory_Channels , Maximum_memory)
 values
 ("i5-2500K" , "3.3GHz" , "3.7GHz" , "4 core" , "4 thr" , "Sandy Bridge" , "95W" , "1155" , "64 Bit" , "2" , "32GB"); 
 
insert into processeur 
 (Name_Proc , CPU_Speed , Turbo_Speed , Physical_Cores, Threads , CPU_Codename , TDP__Power_ , CPU_socket , Bit_Width , Memory_Channels , Maximum_memory)
  values
 ("i5-4460" , "3.2GHz" , "3.4GHz", "4 core" , "4 thr" ,  "Haswell" , "84W" , "1150" , "64 Bit" , "2" , "32GB"); 
 
 insert into processeur 
 (Name_Proc , CPU_Speed , Turbo_Speed , Physical_Cores, Threads , CPU_Codename , TDP__Power_ , CPU_socket , Bit_Width , Memory_Channels , Maximum_memory)
  values
 ("i7-3770" , "3.4Ghz" , "3.9GHz" , "4 core" , "8 thr" , "Ivy Bridge" , "77W" , "1155" , "64 Bit" , "2" , "32GB"); 
 
 insert into processeur 
 (Name_Proc , CPU_Speed , Turbo_Speed , Physical_Cores, Threads , CPU_Codename , TDP__Power_ , CPU_socket , Bit_Width , Memory_Channels , Maximum_memory)
  values
 ("Phenom II X4 940" , "3 GHz" , "" ,"4 core" , "4 thr" , "Deneb" , "125W" , "AM3" , "64 Bit" , "2" , "" ); 
 
 insert into processeur 
 (Name_Proc , CPU_Speed , Turbo_Speed , Physical_Cores, Threads , CPU_Codename , TDP__Power_ , CPU_socket , Bit_Width , Memory_Channels , Maximum_memory)
  values
 ("FX-8350" , "4 GHz" , "4.2GHz" , "8 core" , "8 thr" , "Vishera" , "125W" , "AM3+" , "64 Bit" , "2" , "" ); 
 

select * from processeur;



#------------------------------------------------------------
# Insert valeur table MEMOIRE
#------------------------------------------------------------



insert into memoire 
(Constructeur , Capacite , Types , Fraquences )
values 
("Corsair Dominator Platin" , "128" , "DDR4" , "2800 MHz CL14");

insert into memoire 
(Constructeur , Capacite , Types , Fraquences )
values 
("Crucial Ballistix Elite" , "16" , "DDR3" , "1866 MHz CL9");

insert into memoire 
(Constructeur , Capacite , Types , Fraquences )
values 
("Crucial Ballistix Tact", "8" ,  "DDR3" , "1600 MHz CL8");

insert into memoire 
(Constructeur , Capacite , Types , Fraquences )
values 
("G.Skill aegis" , "16" , "DDR3" , "1600 MHz CL11");

insert into memoire 
(Constructeur , Capacite , Types , Fraquences )
values 
("Kingston" , "1" ,  "DDR2"  , "533 MHz");



select * from memoire;


#------------------------------------------------------------
# Insert valeur table CARTE_GRAPHIQUE
#------------------------------------------------------------



insert into carte_graphique 
(Name_GPU , Memory , Pixel_Rate , Direct_X , Resolution__WxH_)
values
("GeForce GTX 660"  , "2048 MB" , "25 GPixel/s" , "DX 11.1", "4096x2160");

insert into carte_graphique 
(Name_GPU , Memory , Pixel_Rate , Direct_X , Resolution__WxH_)
values
("GeForce GTX 760" , "2048 MB" , "33 GPixel/s" , "DX 11.1" , "4096x2160");

insert into carte_graphique 
(Name_GPU , Memory , Pixel_Rate , Direct_X , Resolution__WxH_)
values
("Radeon R9 290" , "4096 MB" , "61 GPixel/s" , "DX 11.2" , "4096x2160");

insert into carte_graphique 
(Name_GPU , Memory , Pixel_Rate , Direct_X , Resolution__WxH_)
values
("Radeon HD 7870" , "2048 MB" , "32 GPixel/s" , "DX 11.1" , "4096x2160");


insert into carte_graphique 
(Name_GPU , Memory , Pixel_Rate , Direct_X , Resolution__WxH_)
values
("GeForce GTX 770" , "2048 MB" , "35 GPixel/s" , "DX 12" , "4096x2160");



select* from carte_graphique;


#------------------------------------------------------------
# Insert valeur table LOGICIELS
#------------------------------------------------------------



insert into logiciels
(Designation , Marque , Modele , Compatiblite)
values
("Win8 Pro 32 bits" , "Microsoft" , "FQC-05923" , "PC");

insert into logiciels
(Designation , Marque , Modele , Compatiblite)
values
("AutoCAD LT 2016", "Autodesk" , "057H1-G25111-1001" , "PC(w7, w8, w8.1)");

insert into logiciels
(Designation , Marque , Modele , Compatiblite)
values
("Mon Mariage 2013" , "Poinka" , "PKMM2013" , "PC(xp,winNT,vista, w7)");

insert into logiciels
(Designation , Marque , Modele , Compatiblite)
values
("Painter 15" , "Corel" , "PTR2015MLDP" , "PC, MAC");

insert into logiciels
(Designation , Marque , Modele , Compatiblite)
values
("Sony Vegas Pro 13"  , "Sony" , "" , "PC");




select * from logiciels;




#------------------------------------------------------------
# Insert valeur table OS
#------------------------------------------------------------


insert into os (type_os) values ("64-bit Windows 7");
insert into os (type_os) values ("64-bit Windows 8 (8.1)");

#------------------------------------------------------------
# Insert valeur table JEUX
#------------------------------------------------------------



insert into Jeux 
(Designation , Marque , Modele , Genre , Multiplayer , PEGI , Type_Media, Config_mim, Config_reco)
values
("Dark Souls 2" , "Bandai Namco Games" , NULL , "RPG" , FALSE ,  "16" , "DVD" ,'C:\Users\User\Desktop\LOGIJEU\logijeu\Dark Souls 2_mim.txt', 'C:\Users\User\Desktop\LOGIJEU\logijeu\Dark Souls 2_reco.txt');

insert into Jeux 
(Designation , Marque , Modele , Genre , Multiplayer , PEGI , Type_Media, Config_mim, Config_reco)
values
("COD Advanced Warfare" , "Activision" , NULL , "FPS" , TRUE , "18" , "DVD",'C:\Users\User\Desktop\LOGIJEU\logijeu\Cof_advance_warfare_mim.txt', 'C:\Users\User\Desktop\LOGIJEU\logijeu\Cof_advance_warfare_reco.txt');

insert into Jeux 
(Designation , Marque , Modele , Genre , Multiplayer , PEGI , Type_Media, Config_mim, Config_reco)
values
("The Crew" , "Ubisoft" , NULL ,  "Course" , TRUE ,  "12" , "DVD",'C:\Users\User\Desktop\LOGIJEU\logijeu\The Crew_mim.txt', 'C:\Users\User\Desktop\LOGIJEU\logijeu\The Crew_reco.txt');

insert into Jeux 
(Designation , Marque , Modele , Genre , Multiplayer , PEGI , Type_Media, Config_mim, Config_reco)
values
("Diablo III RPS" , "Blizzard Entertainment" , NULL , "RPG" , TRUE , "16", "DVD",'C:\Users\User\Desktop\LOGIJEU\logijeu\Diablo III RPS_mim.txt', 'C:\Users\User\Desktop\LOGIJEU\logijeu\Diablo III RPS_reco.txt');


select * from jeux;


#------------------------------------------------------------
# Procedure stockÃƒÆ’Ã‚Â©e select Table Client 
#------------------------------------------------------------

USE LogiJeu;

DELIMITER //

USE LogiJeu//

DROP PROCEDURE IF EXISTS ca_insrtclient//

CREATE PROCEDURE ca_insertclient 
(
     
     IN   prenom_clientparam   Char (30) 
    , IN   nom_clientparam      Char (30) 
    , IN   mail_clientparam     Varchar (50) 
    , IN   adresse_clientparam  Varchar (50) 
    , IN   ville_clientparam    Char (50) 
	, IN  pays_clientparam     Char (100) 
    , IN   username_clientparam Varchar (50) 
    , IN   password_clientparam Varchar (25)
)

BEGIN    

INSERT INTO client (

prenom_client
,nom_client 
, mail_client 
,adresse_client 
,ville_client
,pays_client 
,username_client
,password_client
)

	values 
(
    
    prenom_clientparam 
    ,nom_clientparam 
    ,mail_clientparam 
    ,adresse_clientparam 
    ,ville_clientparam 
	,pays_clientparam 
    ,username_clientparam
    ,password_clientparam 
) ;


COMMIT; 

END //






#------------------------------------------------------------
# Procedure stocké select Table Client 
#------------------------------------------------------------

USE LogiJeu;

DELIMITER //

USE LogiJeu//

DROP PROCEDURE IF EXISTS ca_insertsuggestion//

CREATE PROCEDURE ca_insertsuggestion
(
     IN    Processeurparam        Varchar (70) 
    , IN   Carte_mereparam   Varchar (70) 
    , IN   Carte_graphiqueparam      Varchar (70) 
    , IN   RAM_GB_param    Varchar (15) 
    , IN   OSparam  Varchar (50) 
    , IN   Jeuxparam    Varchar (70)  
	, IN   Mail_Clientparam    Varchar (50)  
    
    
)

BEGIN    

INSERT INTO Suggestion (
  Processeur
, Carte_mere 
, Carte_graphique 
, RAM_GB_  
, OS
, Jeux 
, Mail_Client 


)

	values 
(
         Processeurparam        
    ,    Carte_mereparam  
    ,    Carte_graphiqueparam 
    ,    RAM_GB_param    
    ,    OSparam 
    ,	 Jeuxparam
	,    Mail_Clientparam    
   
) ;


COMMIT; 

END //

#------------------------------------------------------------
# Procedure stocké INSERT Table Result(insert config) 
#------------------------------------------------------------

USE LogiJeu;

DELIMITER //

USE LogiJeu//

DROP PROCEDURE IF EXISTS ca_insertconfig//

CREATE PROCEDURE ca_insertconfig
(
     
  in _Name_GPU varchar (70)
, in _CPU_Name varchar  (70)
, in _Name_Proc varchar (70)
, in _Capacite varchar (50)
, in _Designation_Logiciel varchar (50)
, in _Designation_Jeux varchar (50)
, in _Note int (10)
, in _Fidelite int
)

BEGIN    

INSERT INTO result (

  Name_GPU 
, CPU_Name 
, Name_Proc 
, Capacite 
, Designation_Logiciel 
, Designation_Jeux 
, Note 
, Fidelite 
)

	values 
(
    
   _Name_GPU 
,  _CPU_Name 
,  _Name_Proc 
,  _Capacite
,  _Designation_Logiciel 
,  _Designation_Jeux  
,  _Note  
,  _Fidelite 
) ;


COMMIT;  

END //





#-------------------------------------
# Games insert stored procedure ca_insertconfig
#-------------------------------------



#-------------------------------------
# Advanced warfare
#-------------------------------------

#-------------------------------------
# 8GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'COD Advanced Warfare', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','', 'COD Advanced Warfare', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'COD Advanced Warfare', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'COD Advanced Warfare', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'COD Advanced Warfare', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'COD Advanced Warfare', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'COD Advanced Warfare', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'COD Advanced Warfare', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'COD Advanced Warfare', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'COD Advanced Warfare', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','', 'COD Advanced Warfare', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'COD Advanced Warfare', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'COD Advanced Warfare', '6', '5');

#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-128350', '128','', 'COD Advanced Warfare', '10', '10');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'COD Advanced Warfare', '10', '10');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'COD Advanced Warfare', '10', '10');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'COD Advanced Warfare', '10', '10');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'COD Advanced Warfare', '10', '10');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'COD Advanced Warfare', '10', '10');

#-------------------------------------
# 16GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'COD Advanced Warfare', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','', 'COD Advanced Warfare', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'COD Advanced Warfare', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'COD Advanced Warfare', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'COD Advanced Warfare', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'COD Advanced Warfare', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'COD Advanced Warfare', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'COD Advanced Warfare', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'COD Advanced Warfare', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'COD Advanced Warfare', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','', 'COD Advanced Warfare', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'COD Advanced Warfare', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'COD Advanced Warfare', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'COD Advanced Warfare', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','', 'COD Advanced Warfare', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'COD Advanced Warfare', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'COD Advanced Warfare', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'COD Advanced Warfare', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'COD Advanced Warfare', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'COD Advanced Warfare', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'COD Advanced Warfare', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','', 'COD Advanced Warfare', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'COD Advanced Warfare', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'COD Advanced Warfare', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'COD Advanced Warfare', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','', 'COD Advanced Warfare', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'COD Advanced Warfare', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'COD Advanced Warfare', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'COD Advanced Warfare', '6', '5');

#-------------------------------------
# Dark souls 2
#-------------------------------------

#-------------------------------------
# 8GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Dark Souls 2', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Dark Souls 2', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Dark Souls 2', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Dark Souls 2', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Dark Souls 2', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Dark Souls 2', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Dark Souls 2', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Dark Souls 2', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','', 'Dark Souls 2', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Dark Souls 2', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Dark Souls 2', '6', '5');

#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Dark Souls 2', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Dark Souls 2', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Dark Souls 2', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Dark Souls 2', '7', '6');

call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Dark Souls 2', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Dark Souls 2', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Dark Souls 2', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Dark Souls 2', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','', 'Dark Souls 2', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Dark Souls 2', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Dark Souls 2', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Dark Souls 2', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Dark Souls 2', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Dark Souls 2', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Dark Souls 2', '7', '6');

call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Dark Souls 2', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Dark Souls 2', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Dark Souls 2', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Dark Souls 2', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','', 'Dark Souls 2', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Dark Souls 2', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Dark Souls 2', '6', '5');

#-------------------------------------
# 16GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','', 'Dark Souls 2', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Dark Souls 2', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Dark Souls 2', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Dark Souls 2', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Dark Souls 2', '7', '6');

call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Dark Souls 2', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Dark Souls 2', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','', 'Dark Souls 2', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Dark Souls 2', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Dark Souls 2', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Dark Souls 2', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','', 'Dark Souls 2', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Dark Souls 2', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Dark Souls 2', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Dark Souls 2', '6', '5');

#-------------------------------------
# The Crew
#-------------------------------------

#-------------------------------------
# 8GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'The Crew', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'The Crew', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'The Crew', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'The Crew', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','', 'The Crew', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'The Crew', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'The Crew', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'The Crew', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'The Crew', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','', 'The Crew', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'The Crew', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'The Crew', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'The Crew', '6', '5');

#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'The Crew', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'The Crew', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'The Crew', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'The Crew', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','', 'The Crew', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'The Crew', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'The Crew', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'The Crew', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'The Crew', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','', 'The Crew', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'The Crew', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'The Crew', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'The Crew', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'The Crew', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'The Crew', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'The Crew', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'The Crew', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','', 'The Crew', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'The Crew', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'The Crew', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'The Crew', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'The Crew', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','', 'The Crew', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'The Crew', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'The Crew', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'The Crew', '6', '5');

#-------------------------------------
# 16GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','', 'The Crew', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'The Crew', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'The Crew', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'The Crew', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'The Crew', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','', 'The Crew', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'The Crew', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'The Crew', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'The Crew', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','', 'The Crew', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'The Crew', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'The Crew', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'The Crew', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'The Crew', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','', 'The Crew', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'The Crew', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'The Crew', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'The Crew', '6', '5');


#-------------------------------------
# Diablo III RPS
#-------------------------------------

#-------------------------------------
# 8GB
#-------------------------------------


call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Diablo III RPS', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Diablo III RPS', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Diablo III RPS', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Diablo III RPS', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Diablo III RPS', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Diablo III RPS', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Diablo III RPS', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','', 'Diablo III RPS', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','', 'Diablo III RPS', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','', 'Diablo III RPS', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','', 'Diablo III RPS', '6', '5');


#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Diablo III RPS', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Diablo III RPS', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Diablo III RPS', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Diablo III RPS', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Diablo III RPS', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Diablo III RPS', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Diablo III RPS', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','', 'Diablo III RPS', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','', 'Diablo III RPS', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','', 'Diablo III RPS', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','', 'Diablo III RPS', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Diablo III RPS', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Diablo III RPS', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Diablo III RPS', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Diablo III RPS', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Diablo III RPS', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Diablo III RPS', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Diablo III RPS', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','', 'Diablo III RPS', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','', 'Diablo III RPS', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','', 'Diablo III RPS', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','', 'Diablo III RPS', '6', '5');


#-------------------------------------
# 16GB
#-------------------------------------


call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','', 'Diablo III RPS', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Diablo III RPS', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Diablo III RPS', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Diablo III RPS', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Diablo III RPS', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Diablo III RPS', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Diablo III RPS', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','', 'Diablo III RPS', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Diablo III RPS', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Diablo III RPS', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','', 'Diablo III RPS', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','', 'Diablo III RPS', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','', 'Diablo III RPS', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','', 'Diablo III RPS', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','', 'Diablo III RPS', '6', '5');



#-------------------------------------
# Software insert stored procedure ca_insertconfig
#-------------------------------------




#-------------------------------------
# Sony Vegas Pro 13
#-------------------------------------

#-------------------------------------
# 8GB
#-------------------------------------


call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Sony Vegas Pro 13', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Sony Vegas Pro 13', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Sony Vegas Pro 13', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Sony Vegas Pro 13', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Sony Vegas Pro 13', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Sony Vegas Pro 13', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Sony Vegas Pro 13', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Sony Vegas Pro 13', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','Sony Vegas Pro 13', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Sony Vegas Pro 13', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Sony Vegas Pro 13', '', '6', '5');


#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Sony Vegas Pro 13', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Sony Vegas Pro 13', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Sony Vegas Pro 13', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Sony Vegas Pro 13', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Sony Vegas Pro 13', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Sony Vegas Pro 13', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Sony Vegas Pro 13', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Sony Vegas Pro 13', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','Sony Vegas Pro 13', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Sony Vegas Pro 13', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Sony Vegas Pro 13', '', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Sony Vegas Pro 13', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Sony Vegas Pro 13', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Sony Vegas Pro 13', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Sony Vegas Pro 13', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Sony Vegas Pro 13', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Sony Vegas Pro 13', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Sony Vegas Pro 13', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Sony Vegas Pro 13', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','Sony Vegas Pro 13', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Sony Vegas Pro 13', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Sony Vegas Pro 13', '', '6', '5');

#-------------------------------------
# 16GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','Sony Vegas Pro 13', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Sony Vegas Pro 13', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Sony Vegas Pro 13', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Sony Vegas Pro 13', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Sony Vegas Pro 13', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Sony Vegas Pro 13', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Sony Vegas Pro 13', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','Sony Vegas Pro 13', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Sony Vegas Pro 13', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Sony Vegas Pro 13', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Sony Vegas Pro 13', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','Sony Vegas Pro 13', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Sony Vegas Pro 13', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Sony Vegas Pro 13', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Sony Vegas Pro 13', '', '6', '5');


#-------------------------------------
# Mon Mariage 2013
#-------------------------------------


call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Mon Mariage 2013', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Mon Mariage 2013', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Mon Mariage 2013', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Mon Mariage 2013', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Mon Mariage 2013', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Mon Mariage 2013', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Mon Mariage 2013', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Mon Mariage 2013', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','Mon Mariage 2013', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Mon Mariage 2013', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Mon Mariage 2013', '', '6', '5');


#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Mon Mariage 2013', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Mon Mariage 2013', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Mon Mariage 2013', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Mon Mariage 2013', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Mon Mariage 2013', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Mon Mariage 2013', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Mon Mariage 2013', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Mon Mariage 2013', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','Mon Mariage 2013', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Mon Mariage 2013', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Mon Mariage 2013', '', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Mon Mariage 2013', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Mon Mariage 2013', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Mon Mariage 2013', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Mon Mariage 2013', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Mon Mariage 2013', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Mon Mariage 2013', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Mon Mariage 2013', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Mon Mariage 2013', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','Mon Mariage 2013', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Mon Mariage 2013', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Mon Mariage 2013', '', '6', '5');


#-------------------------------------
# 16GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','Mon Mariage 2013', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Mon Mariage 2013', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Mon Mariage 2013', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Mon Mariage 2013', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Mon Mariage 2013', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Mon Mariage 2013', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Mon Mariage 2013', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','Mon Mariage 2013', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Mon Mariage 2013', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Mon Mariage 2013', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Mon Mariage 2013', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','Mon Mariage 2013', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Mon Mariage 2013', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Mon Mariage 2013', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Mon Mariage 2013', '', '6', '5');


#-------------------------------------
# Painter 15
#-------------------------------------

#-------------------------------------
# 8GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Painter 15', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Painter 15', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Painter 15', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Painter 15', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','Painter 15', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Painter 15', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Painter 15', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Painter 15', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','Painter 15', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','Painter 15', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','Painter 15', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','Painter 15', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','Painter 15', '', '6', '5');


#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Painter 15', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Painter 15', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Painter 15', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Painter 15', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','Painter 15', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Painter 15', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Painter 15', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Painter 15', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','Painter 15', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','Painter 15', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','Painter 15', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','Painter 15', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','Painter 15', '', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Painter 15', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Painter 15', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Painter 15', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Painter 15', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','Painter 15', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Painter 15', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Painter 15', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Painter 15', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','Painter 15', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','Painter 15', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','Painter 15', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','Painter 15', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','Painter 15', '', '6', '5');

#-------------------------------------
# 16GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','Painter 15', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Painter 15', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Painter 15', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Painter 15', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Painter 15', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','Painter 15', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Painter 15', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Painter 15', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Painter 15', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','Painter 15', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Painter 15', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Painter 15', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Painter 15', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','Painter 15', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','Painter 15', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','Painter 15', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','Painter 15', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','Painter 15', '', '6', '5');

#-------------------------------------
# AutoCAD LT 2016
#-------------------------------------


#-------------------------------------
# 8GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '8','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','AutoCAD LT 2016', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','AutoCAD LT 2016', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','AutoCAD LT 2016', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '8','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','AutoCAD LT 2016', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '8','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','AutoCAD LT 2016', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','AutoCAD LT 2016', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '8','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','AutoCAD LT 2016', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '8','AutoCAD LT 2016', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '8','AutoCAD LT 2016', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '8','AutoCAD LT 2016', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '8','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '8','AutoCAD LT 2016', '', '6', '5');



#-------------------------------------
# 128GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '128','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','AutoCAD LT 2016', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','AutoCAD LT 2016', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','AutoCAD LT 2016', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '128','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','AutoCAD LT 2016', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '128','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','AutoCAD LT 2016', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','AutoCAD LT 2016', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '128','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','AutoCAD LT 2016', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '128','AutoCAD LT 2016', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '128','AutoCAD LT 2016', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '128','AutoCAD LT 2016', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '128','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '128','AutoCAD LT 2016', '', '6', '5');

#-------------------------------------
# 1GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '1','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','AutoCAD LT 2016', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','AutoCAD LT 2016', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','AutoCAD LT 2016', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '1','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','AutoCAD LT 2016', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '1','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','AutoCAD LT 2016', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','AutoCAD LT 2016', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '1','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','AutoCAD LT 2016', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '1','AutoCAD LT 2016', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '1','AutoCAD LT 2016', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '1','AutoCAD LT 2016', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '1','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '1','AutoCAD LT 2016', '', '6', '5');


#-------------------------------------
# 16GB
#-------------------------------------

call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock AM1B-M', 'i5-4460', '16','AutoCAD LT 2016', '', '7', '5');
call ca_insertconfig('GeForce GTX 660', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','AutoCAD LT 2016', '', '5', '5');
call ca_insertconfig('GeForce GTX 660', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','AutoCAD LT 2016', '', '4', '5');
call ca_insertconfig('GeForce GTX 660', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','AutoCAD LT 2016', '', '6', '5');

call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock AM1B-M', 'i5-4460', '16','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 770', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 770', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 770', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','AutoCAD LT 2016', '', '7', '6');


call ca_insertconfig('Radeon R9 290', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock AM1B-M', 'i5-4460', '16','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('Radeon R9 290', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('Radeon R9 290', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','AutoCAD LT 2016', '', '7', '9');
call ca_insertconfig('Radeon R9 290', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','AutoCAD LT 2016', '', '6', '8');

call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock AM1B-M', 'i5-4460', '16','AutoCAD LT 2016', '', '8', '6');
call ca_insertconfig('GeForce GTX 760', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','AutoCAD LT 2016', '', '6', '6');
call ca_insertconfig('GeForce GTX 760', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('GeForce GTX 760', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','AutoCAD LT 2016', '', '7', '6');

call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1 Sniper Z97', 'i5-2500K', '16','AutoCAD LT 2016', '', '4', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock AM1B-M', 'i5-4460', '16','AutoCAD LT 2016', '', '7', '6');
call ca_insertconfig('Radeon HD 7870', 'ASRock X99 Extreme4/3.1', 'i7-3770', '16','AutoCAD LT 2016', '', '6', '7');
call ca_insertconfig('Radeon HD 7870', 'MSI X99A MPOWER', 'Phenom II X4 940', '16','AutoCAD LT 2016', '', '5', '6');
call ca_insertconfig('Radeon HD 7870', 'Gigabyte G1.Sniper A88X', 'FX-8350', '16','AutoCAD LT 2016', '', '6', '5');




call ca_insertconfig ('NVIDIAGeForceGT630', 'GA-78LMT-S2P', 'AMD Athlon(tm) II X2 270 Processor (2 CPUs), ~3.4GHz', '8','', 'Dark Souls 2', '3', '3');
call ca_insertconfig ('NVIDIAGeForceGT630', 'GA-78LMT-S2P', 'AMD Athlon(tm) II X2 270 Processor (2 CPUs), ~3.4GHz', '8','', 'COD Advanced Warfare', '1', '3');
call ca_insertconfig ('NVIDIAGeForceGT630', 'GA-78LMT-S2P', 'AMD Athlon(tm) II X2 270 Processor (2 CPUs), ~3.4GHz', '8','', 'The Crew', '2', '1');
call ca_insertconfig ('NVIDIAGeForceGT630', 'GA-78LMT-S2P', 'AMD Athlon(tm) II X2 270 Processor (2 CPUs), ~3.4GHz', '8','', 'Diablo III RPS', '4', '7');

