CREATE DATABASE Cars;
USE Cars;

CREATE TABLE Continents 
( 
    ContID INT(5), 
    Continent NVARCHAR(15), 
    CONSTRAINT continent_id_pk PRIMARY KEY(ContID) 
);

CREATE TABLE Countries 
( 
    CountryID INT(5), 
    CountryName NVARCHAR(20), 
    Continent INT(5), 
    CONSTRAINT country_continent_id_fk FOREIGN KEY(Continent) REFERENCES Continents(ContID), 
    CONSTRAINT country_id_pk PRIMARY KEY(CountryID) 
);

CREATE TABLE Car_Makers 
( 
    ID INT(5), 
    Maker NVARCHAR(15), 
    FullName NVARCHAR(25), 
    Country INT(5), 
    CONSTRAINT car_maker_country_id_fk FOREIGN KEY(Country) REFERENCES Countries(CountryID), 
    CONSTRAINT car_maker_id PRIMARY KEY(ID) 
);

CREATE TABLE Model_Details 
( 
    ModelID INT(5), 
    Maker INT(5), 
    Model NVARCHAR(25), 
    CONSTRAINT model_unique UNIQUE(Model), 
    CONSTRAINT Model_Details_id_pk PRIMARY KEY(ModelID), 
    CONSTRAINT model_maker_fk FOREIGN KEY(Maker) REFERENCES Car_Makers(ID) 
);

CREATE TABLE Car_Names 
( 
    ID INT(5), 
    Model NVARCHAR(25), 
    Descr NVARCHAR(40), 
    CONSTRAINT Car_Names_id_pk PRIMARY KEY(ID), 
    CONSTRAINT Car_Names_model_fk FOREIGN KEY(Model) REFERENCES Model_Details(Model) 
);

CREATE TABLE Car_Details 
( 
    ID INT(5), 
    mpg FLOAT(5,2), 
    cylinders INT(5), 
    edispl INT(10), 
    horsepower INT(10), 
    weight INT(10), 
    accel FLOAT(10,2), 
    year INT(10), 
    CONSTRAINT Car_Details_id_pk PRIMARY KEY(ID), 
    CONSTRAINT Car_Details_id_fk FOREIGN KEY(ID) REFERENCES Car_Names(ID) 
);

INSERT INTO Continents VALUES(1,'america');

INSERT INTO Continents VALUES(2,'europe');

INSERT INTO Continents VALUES(3,'asia');

INSERT INTO Continents VALUES(4,'africa');

INSERT INTO Continents VALUES(5,'australia');

INSERT INTO Countries VALUES(1,'usa',1);

INSERT INTO Countries VALUES(2,'germany',2);

INSERT INTO Countries VALUES(3,'france',2);

INSERT INTO Countries VALUES(4,'japan',3);

INSERT INTO Countries VALUES(5,'italy',2);

INSERT INTO Countries VALUES(6,'sweden',2);

INSERT INTO Countries VALUES(7,'uk',2);

INSERT INTO Countries VALUES(8,'korea',3);

INSERT INTO Countries VALUES(9,'russia',2);

INSERT INTO Countries VALUES(10,'nigeria',4);

INSERT INTO Countries VALUES(11,'australia',5);

INSERT INTO Countries VALUES(12,'new zealand',5);

INSERT INTO Countries VALUES(13,'egypt',4);

INSERT INTO Countries VALUES(14,'mexico',1);

INSERT INTO Countries VALUES(15,'brazil',1);

INSERT INTO Car_Makers VALUES(1,'amc','American Motor Company',1);

INSERT INTO Car_Makers VALUES(2,'volkswagen','Volkswagen',2);

INSERT INTO Car_Makers VALUES(3,'bmw','BMW',2);

INSERT INTO Car_Makers VALUES(4,'gm','General Motors',1);

INSERT INTO Car_Makers VALUES(5,'ford','Ford Motor Company',1);

INSERT INTO Car_Makers VALUES(6,'chrysler','Chrysler',1);

INSERT INTO Car_Makers VALUES(7,'citroen','Citroen',3);

INSERT INTO Car_Makers VALUES(8,'nissan','Nissan Motors',4);

INSERT INTO Car_Makers VALUES(9,'fiat','Fiat',5);

INSERT INTO Car_Makers VALUES(10,'hi','hi',null);

INSERT INTO Car_Makers VALUES(11,'honda','Honda',4);

INSERT INTO Car_Makers VALUES(12,'mazda','Mazda',4);

INSERT INTO Car_Makers VALUES(13,'daimler benz','Daimler Benz',2);

INSERT INTO Car_Makers VALUES(14,'opel','Opel',2);

INSERT INTO Car_Makers VALUES(15,'peugeaut','Peugeaut',3);

INSERT INTO Car_Makers VALUES(16,'renault','Renault',3);

INSERT INTO Car_Makers VALUES(17,'saab','Saab',6);

INSERT INTO Car_Makers VALUES(18,'subaru','Subaru',4);

INSERT INTO Car_Makers VALUES(19,'toyota','Toyota',4);

INSERT INTO Car_Makers VALUES(20,'triumph','Triumph',7);

INSERT INTO Car_Makers VALUES(21,'volvo','Volvo',6);

INSERT INTO Car_Makers VALUES(22,'kia','Kia Motors',8);

INSERT INTO Car_Makers VALUES(23,'hyundai','Hyundai',8);

INSERT INTO Model_Details VALUES(1,1,'amc');

INSERT INTO Model_Details VALUES(2,2,'audi');

INSERT INTO Model_Details VALUES(3,3,'bmw');

INSERT INTO Model_Details VALUES(4,4,'buick');

INSERT INTO Model_Details VALUES(5,4,'cadillac');

INSERT INTO Model_Details VALUES(6,5,'capri');

INSERT INTO Model_Details VALUES(7,4,'chevrolet');

INSERT INTO Model_Details VALUES(8,6,'chrysler');

INSERT INTO Model_Details VALUES(9,7,'citroen');

INSERT INTO Model_Details VALUES(10,8,'datsun');

INSERT INTO Model_Details VALUES(11,6,'dodge');

INSERT INTO Model_Details VALUES(12,9,'fiat');

INSERT INTO Model_Details VALUES(13,5,'ford');

INSERT INTO Model_Details VALUES(14,10,'hi');

INSERT INTO Model_Details VALUES(15,11,'honda');

INSERT INTO Model_Details VALUES(16,12,'mazda');

INSERT INTO Model_Details VALUES(17,13,'mercedes');

INSERT INTO Model_Details VALUES(18,13,'mercedes-benz');

INSERT INTO Model_Details VALUES(19,5,'mercury');

INSERT INTO Model_Details VALUES(20,8,'nissan');

INSERT INTO Model_Details VALUES(21,4,'oldsmobile');

INSERT INTO Model_Details VALUES(22,14,'opel');

INSERT INTO Model_Details VALUES(23,15,'peugeot');

INSERT INTO Model_Details VALUES(24,6,'plymouth');

INSERT INTO Model_Details VALUES(25,4,'pontiac');

INSERT INTO Model_Details VALUES(26,16,'renault');

INSERT INTO Model_Details VALUES(27,17,'saab');

INSERT INTO Model_Details VALUES(28,18,'subaru');

INSERT INTO Model_Details VALUES(29,19,'toyota');

INSERT INTO Model_Details VALUES(30,20,'triumph');

INSERT INTO Model_Details VALUES(31,2,'volkswagen');

INSERT INTO Model_Details VALUES(32,21,'volvo');

INSERT INTO Model_Details VALUES(33,22,'kia');

INSERT INTO Model_Details VALUES(34,23,'hyundai');

INSERT INTO Model_Details VALUES(35,6,'jeep');

INSERT INTO Model_Details VALUES(36,19,'scion');

INSERT INTO Car_Names VALUES(1,'chevrolet','chevrolet chevelle malibu');

INSERT INTO Car_Names VALUES(2,'buick','buick skylark 320');

INSERT INTO Car_Names VALUES(3,'plymouth','plymouth satellite');

INSERT INTO Car_Names VALUES(4,'amc','amc rebel sst');

INSERT INTO Car_Names VALUES(5,'ford','ford torino');

INSERT INTO Car_Names VALUES(6,'ford','ford galaxie 500');

INSERT INTO Car_Names VALUES(7,'chevrolet','chevrolet impala');

INSERT INTO Car_Names VALUES(8,'plymouth','plymouth fury iii');

INSERT INTO Car_Names VALUES(9,'pontiac','pontiac catalina');

INSERT INTO Car_Names VALUES(10,'amc','amc ambassador dpl');

INSERT INTO Car_Names VALUES(11,'citroen','citroen ds-21 pallas');

INSERT INTO Car_Names VALUES(12,'chevrolet','chevrolet chevelle concours (sw)');

INSERT INTO Car_Names VALUES(13,'ford','ford torino (sw)');

INSERT INTO Car_Names VALUES(14,'plymouth','plymouth satellite (sw)');

INSERT INTO Car_Names VALUES(15,'amc','amc rebel sst (sw)');

INSERT INTO Car_Names VALUES(16,'dodge','dodge challenger se');

INSERT INTO Car_Names VALUES(17,'plymouth','plymouth cuda 340');

INSERT INTO Car_Names VALUES(18,'ford','ford mustang boss 302');

INSERT INTO Car_Names VALUES(19,'chevrolet','chevrolet monte carlo');

INSERT INTO Car_Names VALUES(20,'buick','buick estate wagon (sw)');

INSERT INTO Car_Names VALUES(21,'toyota','toyota corona mark ii');

INSERT INTO Car_Names VALUES(22,'plymouth','plymouth duster');

INSERT INTO Car_Names VALUES(23,'amc','amc hornet');

INSERT INTO Car_Names VALUES(24,'ford','ford maverick');

INSERT INTO Car_Names VALUES(25,'datsun','datsun pl510');

INSERT INTO Car_Names VALUES(26,'volkswagen','volkswagen 1131 deluxe sedan');

INSERT INTO Car_Names VALUES(27,'peugeot','peugeot 504');

INSERT INTO Car_Names VALUES(28,'audi','audi 100 ls');

INSERT INTO Car_Names VALUES(29,'saab','saab 99e');

INSERT INTO Car_Names VALUES(30,'bmw','bmw 2002');

INSERT INTO Car_Names VALUES(31,'amc','amc gremlin');

INSERT INTO Car_Names VALUES(32,'ford','ford f250');

INSERT INTO Car_Names VALUES(33,'chevrolet','chevy c20');

INSERT INTO Car_Names VALUES(34,'dodge','dodge d200');

INSERT INTO Car_Names VALUES(35,'hi','hi 1200d');

INSERT INTO Car_Names VALUES(36,'datsun','datsun pl510');

INSERT INTO Car_Names VALUES(37,'chevrolet','chevrolet vega 2300');

INSERT INTO Car_Names VALUES(38,'toyota','toyota corona');

INSERT INTO Car_Names VALUES(39,'ford','ford pinto');

INSERT INTO Car_Names VALUES(40,'volkswagen','volkswagen super beetle 117');

INSERT INTO Car_Names VALUES(41,'amc','amc gremlin');

INSERT INTO Car_Names VALUES(42,'plymouth','plymouth satellite custom');

INSERT INTO Car_Names VALUES(43,'chevrolet','chevrolet chevelle malibu');

INSERT INTO Car_Names VALUES(44,'ford','ford torino 500');

INSERT INTO Car_Names VALUES(45,'amc','amc matador');

INSERT INTO Car_Names VALUES(46,'chevrolet','chevrolet impala');

INSERT INTO Car_Names VALUES(47,'pontiac','pontiac catalina brougham');

INSERT INTO Car_Names VALUES(48,'ford','ford galaxie 500');

INSERT INTO Car_Names VALUES(49,'plymouth','plymouth fury iii');

INSERT INTO Car_Names VALUES(50,'dodge','dodge monaco (sw)');

INSERT INTO Car_Names VALUES(51,'ford','ford country squire (sw)');

INSERT INTO Car_Names VALUES(52,'pontiac','pontiac safari (sw)');

INSERT INTO Car_Names VALUES(53,'amc','amc hornet sportabout (sw)');

INSERT INTO Car_Names VALUES(54,'chevrolet','chevrolet vega (sw)');

INSERT INTO Car_Names VALUES(55,'pontiac','pontiac firebird');

INSERT INTO Car_Names VALUES(56,'ford','ford mustang');

INSERT INTO Car_Names VALUES(57,'mercury','mercury capri 2000');

INSERT INTO Car_Names VALUES(58,'opel','opel 1900');

INSERT INTO Car_Names VALUES(59,'peugeot','peugeot 304');

INSERT INTO Car_Names VALUES(60,'fiat','fiat 124b');

INSERT INTO Car_Names VALUES(61,'toyota','toyota corolla 1200');

INSERT INTO Car_Names VALUES(62,'datsun','datsun 1200');

INSERT INTO Car_Names VALUES(63,'volkswagen','volkswagen model 111');

INSERT INTO Car_Names VALUES(64,'plymouth','plymouth cricket');

INSERT INTO Car_Names VALUES(65,'toyota','toyota corona hardtop');

INSERT INTO Car_Names VALUES(66,'dodge','dodge colt hardtop');

INSERT INTO Car_Names VALUES(67,'volkswagen','volkswagen type 3');

INSERT INTO Car_Names VALUES(68,'chevrolet','chevrolet vega');

INSERT INTO Car_Names VALUES(69,'ford','ford pinto runabout');

INSERT INTO Car_Names VALUES(70,'chevrolet','chevrolet impala');

INSERT INTO Car_Names VALUES(71,'pontiac','pontiac catalina');

INSERT INTO Car_Names VALUES(72,'plymouth','plymouth fury iii');

INSERT INTO Car_Names VALUES(73,'ford','ford galaxie 500');

INSERT INTO Car_Names VALUES(74,'amc','amc ambassador sst');

INSERT INTO Car_Names VALUES(75,'mercury','mercury marquis');

INSERT INTO Car_Names VALUES(76,'buick','buick lesabre custom');

INSERT INTO Car_Names VALUES(77,'oldsmobile','oldsmobile delta 88 royale');

INSERT INTO Car_Names VALUES(78,'chrysler','chrysler newport royal');

INSERT INTO Car_Names VALUES(79,'mazda','mazda rx2 coupe');

INSERT INTO Car_Names VALUES(80,'amc','amc matador (sw)');

INSERT INTO Car_Names VALUES(81,'chevrolet','chevrolet chevelle concours (sw)');

INSERT INTO Car_Names VALUES(82,'ford','ford gran torino (sw)');

INSERT INTO Car_Names VALUES(83,'plymouth','plymouth satellite custom (sw)');

INSERT INTO Car_Names VALUES(84,'volvo','volvo 145e (sw)');

INSERT INTO Car_Names VALUES(85,'volkswagen','volkswagen 411 (sw)');

INSERT INTO Car_Names VALUES(86,'peugeot','peugeot 504 (sw)');

INSERT INTO Car_Names VALUES(87,'renault','renault 12 (sw)');

INSERT INTO Car_Names VALUES(88,'ford','ford pinto (sw)');

INSERT INTO Car_Names VALUES(89,'datsun','datsun 510 (sw)');

INSERT INTO Car_Names VALUES(90,'toyota','toyota corona mark ii (sw)');

INSERT INTO Car_Names VALUES(91,'dodge','dodge colt (sw)');

INSERT INTO Car_Names VALUES(92,'toyota','toyota corolla 1600 (sw)');

INSERT INTO Car_Names VALUES(93,'buick','buick century 350');

INSERT INTO Car_Names VALUES(94,'amc','amc matador');

INSERT INTO Car_Names VALUES(95,'chevrolet','chevrolet malibu');

INSERT INTO Car_Names VALUES(96,'ford','ford gran torino');

INSERT INTO Car_Names VALUES(97,'dodge','dodge coronet custom');

INSERT INTO Car_Names VALUES(98,'mercury','mercury marquis brougham');

INSERT INTO Car_Names VALUES(99,'chevrolet','chevrolet caprice classic');

INSERT INTO Car_Names VALUES(100,'ford','ford ltd');

INSERT INTO Car_Names VALUES(101,'plymouth','plymouth fury gran sedan');

INSERT INTO Car_Names VALUES(102,'chrysler','chrysler new yorker brougham');

INSERT INTO Car_Names VALUES(103,'buick','buick electra 225 custom');

INSERT INTO Car_Names VALUES(104,'amc','amc ambassador brougham');

INSERT INTO Car_Names VALUES(105,'plymouth','plymouth valiant');

INSERT INTO Car_Names VALUES(106,'chevrolet','chevrolet nova custom');

INSERT INTO Car_Names VALUES(107,'amc','amc hornet');

INSERT INTO Car_Names VALUES(108,'ford','ford maverick');

INSERT INTO Car_Names VALUES(109,'plymouth','plymouth duster');

INSERT INTO Car_Names VALUES(110,'volkswagen','volkswagen super beetle');

INSERT INTO Car_Names VALUES(111,'chevrolet','chevrolet impala');

INSERT INTO Car_Names VALUES(112,'ford','ford country');

INSERT INTO Car_Names VALUES(113,'plymouth','plymouth custom suburb');

INSERT INTO Car_Names VALUES(114,'oldsmobile','oldsmobile vista cruiser');

INSERT INTO Car_Names VALUES(115,'amc','amc gremlin');

INSERT INTO Car_Names VALUES(116,'toyota','toyota carina');

INSERT INTO Car_Names VALUES(117,'chevrolet','chevrolet vega');

INSERT INTO Car_Names VALUES(118,'datsun','datsun 610');

INSERT INTO Car_Names VALUES(119,'mazda','mazda rx3');

INSERT INTO Car_Names VALUES(120,'ford','ford pinto');

INSERT INTO Car_Names VALUES(121,'mercury','mercury capri v6');

INSERT INTO Car_Names VALUES(122,'fiat','fiat 124 sport coupe');

INSERT INTO Car_Names VALUES(123,'chevrolet','chevrolet monte carlo s');

INSERT INTO Car_Names VALUES(124,'pontiac','pontiac grand prix');

INSERT INTO Car_Names VALUES(125,'fiat','fiat 128');

INSERT INTO Car_Names VALUES(126,'opel','opel manta');

INSERT INTO Car_Names VALUES(127,'audi','audi 100ls');

INSERT INTO Car_Names VALUES(128,'volvo','volvo 144ea');

INSERT INTO Car_Names VALUES(129,'dodge','dodge dart custom');

INSERT INTO Car_Names VALUES(130,'saab','saab 99le');

INSERT INTO Car_Names VALUES(131,'toyota','toyota mark ii');

INSERT INTO Car_Names VALUES(132,'oldsmobile','oldsmobile omega');

INSERT INTO Car_Names VALUES(133,'plymouth','plymouth duster');

INSERT INTO Car_Names VALUES(134,'ford','ford maverick');

INSERT INTO Car_Names VALUES(135,'amc','amc hornet');

INSERT INTO Car_Names VALUES(136,'chevrolet','chevrolet nova');

INSERT INTO Car_Names VALUES(137,'datsun','datsun b210');

INSERT INTO Car_Names VALUES(138,'ford','ford pinto');

INSERT INTO Car_Names VALUES(139,'toyota','toyota corolla 1200');

INSERT INTO Car_Names VALUES(140,'chevrolet','chevrolet vega');

INSERT INTO Car_Names VALUES(141,'chevrolet','chevrolet chevelle malibu classic');

INSERT INTO Car_Names VALUES(142,'amc','amc matador');

INSERT INTO Car_Names VALUES(143,'plymouth','plymouth satellite sebring');

INSERT INTO Car_Names VALUES(144,'ford','ford gran torino');

INSERT INTO Car_Names VALUES(145,'buick','buick century luxus (sw)');

INSERT INTO Car_Names VALUES(146,'dodge','dodge coronet custom (sw)');

INSERT INTO Car_Names VALUES(147,'ford','ford gran torino (sw)');

INSERT INTO Car_Names VALUES(148,'amc','amc matador (sw)');

INSERT INTO Car_Names VALUES(149,'audi','audi fox');

INSERT INTO Car_Names VALUES(150,'volkswagen','volkswagen dasher');

INSERT INTO Car_Names VALUES(151,'opel','opel manta');

INSERT INTO Car_Names VALUES(152,'toyota','toyota corona');

INSERT INTO Car_Names VALUES(153,'datsun','datsun 710');

INSERT INTO Car_Names VALUES(154,'dodge','dodge colt');

INSERT INTO Car_Names VALUES(155,'fiat','fiat 128');

INSERT INTO Car_Names VALUES(156,'fiat','fiat 124 tc');

INSERT INTO Car_Names VALUES(157,'honda','honda civic');

INSERT INTO Car_Names VALUES(158,'subaru','subaru');

INSERT INTO Car_Names VALUES(159,'fiat','fiat x1.9');

INSERT INTO Car_Names VALUES(160,'plymouth','plymouth valiant custom');

INSERT INTO Car_Names VALUES(161,'chevrolet','chevrolet nova');

INSERT INTO Car_Names VALUES(162,'mercury','mercury monarch');

INSERT INTO Car_Names VALUES(163,'ford','ford maverick');

INSERT INTO Car_Names VALUES(164,'pontiac','pontiac catalina');

INSERT INTO Car_Names VALUES(165,'chevrolet','chevrolet bel air');

INSERT INTO Car_Names VALUES(166,'plymouth','plymouth grand fury');

INSERT INTO Car_Names VALUES(167,'ford','ford ltd');

INSERT INTO Car_Names VALUES(168,'buick','buick century');

INSERT INTO Car_Names VALUES(169,'chevrolet','chevrolet chevelle malibu');

INSERT INTO Car_Names VALUES(170,'amc','amc matador');

INSERT INTO Car_Names VALUES(171,'plymouth','plymouth fury');

INSERT INTO Car_Names VALUES(172,'buick','buick skyhawk');

INSERT INTO Car_Names VALUES(173,'chevrolet','chevrolet monza 2+2');

INSERT INTO Car_Names VALUES(174,'ford','ford mustang ii');

INSERT INTO Car_Names VALUES(175,'toyota','toyota corolla');

INSERT INTO Car_Names VALUES(176,'ford','ford pinto');

INSERT INTO Car_Names VALUES(177,'amc','amc gremlin');

INSERT INTO Car_Names VALUES(178,'pontiac','pontiac astro');

INSERT INTO Car_Names VALUES(179,'toyota','toyota corona');

INSERT INTO Car_Names VALUES(180,'volkswagen','volkswagen dasher');

INSERT INTO Car_Names VALUES(181,'datsun','datsun 710');

INSERT INTO Car_Names VALUES(182,'ford','ford pinto');

INSERT INTO Car_Names VALUES(183,'volkswagen','volkswagen rabbit');

INSERT INTO Car_Names VALUES(184,'amc','amc pacer');

INSERT INTO Car_Names VALUES(185,'audi','audi 100ls');

INSERT INTO Car_Names VALUES(186,'peugeot','peugeot 504');

INSERT INTO Car_Names VALUES(187,'volvo','volvo 244dl');

INSERT INTO Car_Names VALUES(188,'saab','saab 99le');

INSERT INTO Car_Names VALUES(189,'honda','honda civic cvcc');

INSERT INTO Car_Names VALUES(190,'fiat','fiat 131');

INSERT INTO Car_Names VALUES(191,'opel','opel 1900');

INSERT INTO Car_Names VALUES(192,'capri','capri ii');

INSERT INTO Car_Names VALUES(193,'dodge','dodge colt');

INSERT INTO Car_Names VALUES(194,'renault','renault 12tl');

INSERT INTO Car_Names VALUES(195,'chevrolet','chevrolet chevelle malibu classic');

INSERT INTO Car_Names VALUES(196,'dodge','dodge coronet brougham');

INSERT INTO Car_Names VALUES(197,'amc','amc matador');

INSERT INTO Car_Names VALUES(198,'ford','ford gran torino');

INSERT INTO Car_Names VALUES(199,'plymouth','plymouth valiant');

INSERT INTO Car_Names VALUES(200,'chevrolet','chevrolet nova');

INSERT INTO Car_Names VALUES(201,'ford','ford maverick');

INSERT INTO Car_Names VALUES(202,'amc','amc hornet');

INSERT INTO Car_Names VALUES(203,'chevrolet','chevrolet chevette');

INSERT INTO Car_Names VALUES(204,'chevrolet','chevrolet woody');

INSERT INTO Car_Names VALUES(205,'volkswagen','vw rabbit');

INSERT INTO Car_Names VALUES(206,'honda','honda civic');

INSERT INTO Car_Names VALUES(207,'dodge','dodge aspen se');

INSERT INTO Car_Names VALUES(208,'ford','ford granada ghia');

INSERT INTO Car_Names VALUES(209,'pontiac','pontiac ventura sj');

INSERT INTO Car_Names VALUES(210,'amc','amc pacer d/l');

INSERT INTO Car_Names VALUES(211,'volkswagen','volkswagen rabbit');

INSERT INTO Car_Names VALUES(212,'datsun','datsun b-210');

INSERT INTO Car_Names VALUES(213,'toyota','toyota corolla');

INSERT INTO Car_Names VALUES(214,'ford','ford pinto');

INSERT INTO Car_Names VALUES(215,'volvo','volvo 245');

INSERT INTO Car_Names VALUES(216,'plymouth','plymouth volare premier v8');

INSERT INTO Car_Names VALUES(217,'peugeot','peugeot 504');

INSERT INTO Car_Names VALUES(218,'toyota','toyota mark ii');

INSERT INTO Car_Names VALUES(219,'mercedes-benz','mercedes-benz 280s');

INSERT INTO Car_Names VALUES(220,'cadillac','cadillac seville');

INSERT INTO Car_Names VALUES(221,'chevrolet','chevy c10');

INSERT INTO Car_Names VALUES(222,'ford','ford f108');

INSERT INTO Car_Names VALUES(223,'dodge','dodge d100');

INSERT INTO Car_Names VALUES(224,'honda','honda accord cvcc');

INSERT INTO Car_Names VALUES(225,'buick','buick opel isuzu deluxe');

INSERT INTO Car_Names VALUES(226,'renault','renault 5 gtl');

INSERT INTO Car_Names VALUES(227,'plymouth','plymouth arrow gs');

INSERT INTO Car_Names VALUES(228,'datsun','datsun f-10 hatchback');

INSERT INTO Car_Names VALUES(229,'chevrolet','chevrolet caprice classic');

INSERT INTO Car_Names VALUES(230,'oldsmobile','oldsmobile cutlass supreme');

INSERT INTO Car_Names VALUES(231,'dodge','dodge monaco brougham');

INSERT INTO Car_Names VALUES(232,'mercury','mercury cougar brougham');

INSERT INTO Car_Names VALUES(233,'chevrolet','chevrolet concours');

INSERT INTO Car_Names VALUES(234,'buick','buick skylark');

INSERT INTO Car_Names VALUES(235,'plymouth','plymouth volare custom');

INSERT INTO Car_Names VALUES(236,'ford','ford granada');

INSERT INTO Car_Names VALUES(237,'pontiac','pontiac grand prix lj');

INSERT INTO Car_Names VALUES(238,'chevrolet','chevrolet monte carlo landau');

INSERT INTO Car_Names VALUES(239,'chrysler','chrysler cordoba');

INSERT INTO Car_Names VALUES(240,'ford','ford thunderbird');

INSERT INTO Car_Names VALUES(241,'volkswagen','volkswagen rabbit custom');

INSERT INTO Car_Names VALUES(242,'pontiac','pontiac sunbird coupe');

INSERT INTO Car_Names VALUES(243,'toyota','toyota corolla liftback');

INSERT INTO Car_Names VALUES(244,'ford','ford mustang ii 2+2');

INSERT INTO Car_Names VALUES(245,'chevrolet','chevrolet chevette');

INSERT INTO Car_Names VALUES(246,'dodge','dodge colt m/m');

INSERT INTO Car_Names VALUES(247,'subaru','subaru dl');

INSERT INTO Car_Names VALUES(248,'volkswagen','volkswagen dasher');

INSERT INTO Car_Names VALUES(249,'datsun','datsun 810');

INSERT INTO Car_Names VALUES(250,'bmw','bmw 320i');

INSERT INTO Car_Names VALUES(251,'mazda','mazda rx-4');

INSERT INTO Car_Names VALUES(252,'volkswagen','volkswagen rabbit custom diesel');

INSERT INTO Car_Names VALUES(253,'ford','ford fiesta');

INSERT INTO Car_Names VALUES(254,'mazda','mazda glc deluxe');

INSERT INTO Car_Names VALUES(255,'datsun','datsun b210 gx');

INSERT INTO Car_Names VALUES(256,'honda','honda civic cvcc');

INSERT INTO Car_Names VALUES(257,'oldsmobile','oldsmobile cutlass salon brougham');

INSERT INTO Car_Names VALUES(258,'dodge','dodge diplomat');

INSERT INTO Car_Names VALUES(259,'mercury','mercury monarch ghia');

INSERT INTO Car_Names VALUES(260,'pontiac','pontiac phoenix lj');

INSERT INTO Car_Names VALUES(261,'chevrolet','chevrolet malibu');

INSERT INTO Car_Names VALUES(262,'ford','ford fairmont (auto)');

INSERT INTO Car_Names VALUES(263,'ford','ford fairmont (man)');

INSERT INTO Car_Names VALUES(264,'plymouth','plymouth volare');

INSERT INTO Car_Names VALUES(265,'amc','amc concord');

INSERT INTO Car_Names VALUES(266,'buick','buick century special');

INSERT INTO Car_Names VALUES(267,'mercury','mercury zephyr');

INSERT INTO Car_Names VALUES(268,'dodge','dodge aspen');

INSERT INTO Car_Names VALUES(269,'amc','amc concord d/l');

INSERT INTO Car_Names VALUES(270,'chevrolet','chevrolet monte carlo landau');

INSERT INTO Car_Names VALUES(271,'buick','buick regal sport coupe (turbo)');

INSERT INTO Car_Names VALUES(272,'ford','ford futura');

INSERT INTO Car_Names VALUES(273,'dodge','dodge magnum xe');

INSERT INTO Car_Names VALUES(274,'chevrolet','chevrolet chevette');

INSERT INTO Car_Names VALUES(275,'toyota','toyota corona');

INSERT INTO Car_Names VALUES(276,'datsun','datsun 510');

INSERT INTO Car_Names VALUES(277,'dodge','dodge omni');

INSERT INTO Car_Names VALUES(278,'toyota','toyota celica gt liftback');

INSERT INTO Car_Names VALUES(279,'plymouth','plymouth sapporo');

INSERT INTO Car_Names VALUES(280,'oldsmobile','oldsmobile starfire sx');

INSERT INTO Car_Names VALUES(281,'datsun','datsun 200-sx');

INSERT INTO Car_Names VALUES(282,'audi','audi 5000');

INSERT INTO Car_Names VALUES(283,'volvo','volvo 264gl');

INSERT INTO Car_Names VALUES(284,'saab','saab 99gle');

INSERT INTO Car_Names VALUES(285,'peugeot','peugeot 604sl');

INSERT INTO Car_Names VALUES(286,'volkswagen','volkswagen scirocco');

INSERT INTO Car_Names VALUES(287,'honda','honda accord lx');

INSERT INTO Car_Names VALUES(288,'pontiac','pontiac lemans v6');

INSERT INTO Car_Names VALUES(289,'mercury','mercury zephyr 6');

INSERT INTO Car_Names VALUES(290,'ford','ford fairmont 4');

INSERT INTO Car_Names VALUES(291,'amc','amc concord dl 6');

INSERT INTO Car_Names VALUES(292,'dodge','dodge aspen 6');

INSERT INTO Car_Names VALUES(293,'chevrolet','chevrolet caprice classic');

INSERT INTO Car_Names VALUES(294,'ford','ford ltd landau');

INSERT INTO Car_Names VALUES(295,'mercury','mercury grand marquis');

INSERT INTO Car_Names VALUES(296,'dodge','dodge st. regis');

INSERT INTO Car_Names VALUES(297,'buick','buick estate wagon (sw)');

INSERT INTO Car_Names VALUES(298,'ford','ford country squire (sw)');

INSERT INTO Car_Names VALUES(299,'chevrolet','chevrolet malibu classic (sw)');

INSERT INTO Car_Names VALUES(300,'chrysler','chrysler lebaron town @ country (sw)');

INSERT INTO Car_Names VALUES(301,'volkswagen','vw rabbit custom');

INSERT INTO Car_Names VALUES(302,'mazda', 'mazda glc deluxe');

INSERT INTO Car_Names VALUES(303,'dodge','dodge colt hatchback custom');

INSERT INTO Car_Names VALUES(304,'amc','amc spirit dl');

INSERT INTO Car_Names VALUES(305,'mercedes','mercedes benz 300d');

INSERT INTO Car_Names VALUES(306,'cadillac','cadillac eldorado');

INSERT INTO Car_Names VALUES(307,'peugeot','peugeot 504');

INSERT INTO Car_Names VALUES(308,'oldsmobile','oldsmobile cutlass salon brougham');

INSERT INTO Car_Names VALUES(309,'plymouth','plymouth horizon');

INSERT INTO Car_Names VALUES(310,'plymouth','plymouth horizon tc3');

INSERT INTO Car_Names VALUES(311,'datsun','datsun 210');

INSERT INTO Car_Names VALUES(312,'fiat','fiat strada custom');

INSERT INTO Car_Names VALUES(313,'buick','buick skylark limited');

INSERT INTO Car_Names VALUES(314,'chevrolet','chevrolet citation');

INSERT INTO Car_Names VALUES(315,'oldsmobile','oldsmobile omega brougham');

INSERT INTO Car_Names VALUES(316,'pontiac','pontiac phoenix');

INSERT INTO Car_Names VALUES(317,'volkswagen','vw rabbit');

INSERT INTO Car_Names VALUES(318,'toyota','toyota corolla tercel');

INSERT INTO Car_Names VALUES(319,'chevrolet','chevrolet chevette');

INSERT INTO Car_Names VALUES(320,'datsun','datsun 310');

INSERT INTO Car_Names VALUES(321,'chevrolet','chevrolet citation');

INSERT INTO Car_Names VALUES(322,'ford','ford fairmont');

INSERT INTO Car_Names VALUES(323,'amc','amc concord');

INSERT INTO Car_Names VALUES(324,'dodge','dodge aspen');

INSERT INTO Car_Names VALUES(325,'audi','audi 4000');

INSERT INTO Car_Names VALUES(326,'toyota','toyota corona liftback');

INSERT INTO Car_Names VALUES(327,'mazda','mazda 626');

INSERT INTO Car_Names VALUES(328,'datsun','datsun 510 hatchback');

INSERT INTO Car_Names VALUES(329,'toyota','toyota corolla');

INSERT INTO Car_Names VALUES(330,'mazda','mazda glc');

INSERT INTO Car_Names VALUES(331,'dodge','dodge colt');

INSERT INTO Car_Names VALUES(332,'datsun','datsun 210');

INSERT INTO Car_Names VALUES(333,'volkswagen','vw rabbit c (diesel)');

INSERT INTO Car_Names VALUES(334,'volkswagen','vw dasher (diesel)');

INSERT INTO Car_Names VALUES(335,'audi','audi 5000s (diesel)');

INSERT INTO Car_Names VALUES(336,'mercedes-benz','mercedes-benz 240d');

INSERT INTO Car_Names VALUES(337,'honda','honda civic 1500 gl');

INSERT INTO Car_Names VALUES(338,'renault','renault lecar deluxe');

INSERT INTO Car_Names VALUES(339,'subaru','subaru dl');

INSERT INTO Car_Names VALUES(340, 'volkswagen','volkswagen rabbit');

INSERT INTO Car_Names VALUES(341,'datsun','datsun 280-zx');

INSERT INTO Car_Names VALUES(342,'mazda','mazda rx-7 gs');

INSERT INTO Car_Names VALUES(343,'triumph','triumph tr7 coupe');

INSERT INTO Car_Names VALUES(344,'ford','ford mustang cobra');

INSERT INTO Car_Names VALUES(345,'honda','honda accord');

INSERT INTO Car_Names VALUES(346,'plymouth','plymouth reliant');

INSERT INTO Car_Names VALUES(347,'buick','buick skylark');

INSERT INTO Car_Names VALUES(348,'dodge','dodge aries wagon (sw)');

INSERT INTO Car_Names VALUES(349,'chevrolet','chevrolet citation');

INSERT INTO Car_Names VALUES(350,'plymouth','plymouth reliant');

INSERT INTO Car_Names VALUES(351,'toyota','toyota starlet');

INSERT INTO Car_Names VALUES(352,'plymouth','plymouth champ');

INSERT INTO Car_Names VALUES(353,'honda','honda civic 1300');

INSERT INTO Car_Names VALUES(354,'subaru','subaru');

INSERT INTO Car_Names VALUES(355,'datsun','datsun 210 mpg');

INSERT INTO Car_Names VALUES(356,'toyota','toyota tercel');

INSERT INTO Car_Names VALUES(357,'mazda','mazda glc 4');

INSERT INTO Car_Names VALUES(358,'plymouth','plymouth horizon 4');

INSERT INTO Car_Names VALUES(359,'ford','ford escort 4w');

INSERT INTO Car_Names VALUES(360,'ford','ford escort 2h');

INSERT INTO Car_Names VALUES(361,'volkswagen','volkswagen jetta');

INSERT INTO Car_Names VALUES(362,'renault','renault 18i');

INSERT INTO Car_Names VALUES(363,'honda','honda prelude');

INSERT INTO Car_Names VALUES(364,'toyota','toyota corolla');

INSERT INTO Car_Names VALUES(365,'datsun','datsun 200sx');

INSERT INTO Car_Names VALUES(366,'mazda','mazda 626');

INSERT INTO Car_Names VALUES(367,'peugeot','peugeot 505s turbo diesel');

INSERT INTO Car_Names VALUES(368,'saab','saab 900s');

INSERT INTO Car_Names VALUES(369,'volvo','volvo diesel');

INSERT INTO Car_Names VALUES(370,'toyota','toyota cressida');

INSERT INTO Car_Names VALUES(371,'datsun','datsun 810 maxima');

INSERT INTO Car_Names VALUES(372,'buick','buick century');

INSERT INTO Car_Names VALUES(373,'oldsmobile','oldsmobile cutlass ls');

INSERT INTO Car_Names VALUES(374,'ford','ford granada gl');

INSERT INTO Car_Names VALUES(375,'chrysler','chrysler lebaron salon');

INSERT INTO Car_Names VALUES(376,'chevrolet','chevrolet cavalier');

INSERT INTO Car_Names VALUES(377,'chevrolet','chevrolet cavalier wagon');

INSERT INTO Car_Names VALUES(378,'chevrolet','chevrolet cavalier 2-door');

INSERT INTO Car_Names VALUES(379,'pontiac','pontiac j2000 se hatchback');

INSERT INTO Car_Names VALUES(380,'dodge','dodge aries se');

INSERT INTO Car_Names VALUES(381,'pontiac','pontiac phoenix');

INSERT INTO Car_Names VALUES(382,'ford','ford fairmont futura');

INSERT INTO Car_Names VALUES(383,'amc','amc concord dl');

INSERT INTO Car_Names VALUES(384,'volkswagen','volkswagen rabbit l');

INSERT INTO Car_Names VALUES(385,'mazda','mazda glc custom l');

INSERT INTO Car_Names VALUES(386,'mazda','mazda glc custom');

INSERT INTO Car_Names VALUES(387,'plymouth','plymouth horizon miser');

INSERT INTO Car_Names VALUES(388,'mercury','mercury lynx l');

INSERT INTO Car_Names VALUES(389,'nissan','nissan stanza xe');

INSERT INTO Car_Names VALUES(390,'honda','honda accord');

INSERT INTO Car_Names VALUES(391,'toyota','toyota corolla');

INSERT INTO Car_Names VALUES(392,'honda','honda civic');

INSERT INTO Car_Names VALUES(393,'honda','honda civic (auto)');

INSERT INTO Car_Names VALUES(394,'datsun','datsun 310 gx');

INSERT INTO Car_Names VALUES(395,'buick','buick century limited');

INSERT INTO Car_Names VALUES(396,'oldsmobile','oldsmobile cutlass ciera (diesel)');

INSERT INTO Car_Names VALUES(397,'chrysler','chrysler lebaron medallion');

INSERT INTO Car_Names VALUES(398,'ford','ford granada l');

INSERT INTO Car_Names VALUES(399,'toyota','toyota celica gt');

INSERT INTO Car_Names VALUES(400,'dodge','dodge charger 2.2');

INSERT INTO Car_Names VALUES(401,'chevrolet','chevrolet camaro');

INSERT INTO Car_Names VALUES(402,'ford','ford mustang gl');

INSERT INTO Car_Names VALUES(403,'volkswagen','vw pickup');

INSERT INTO Car_Names VALUES(404,'dodge','dodge rampage');

INSERT INTO Car_Names VALUES(405,'ford','ford ranger');

INSERT INTO Car_Names VALUES(406,'chevrolet','chevy s-10');

INSERT INTO Car_Details VALUES(1,18,8,307,130,3504,12,1970);

INSERT INTO Car_Details VALUES(2,15,8,350,165,3693,11.5,1970);

INSERT INTO Car_Details VALUES(3,18,8,318,150,3436,11,1970);

INSERT INTO Car_Details VALUES(4,16,8,304,150,3433,12,1970);

INSERT INTO Car_Details VALUES(5,17,8,302,140,3449,10.5,1970);

INSERT INTO Car_Details VALUES(6,15,8,429,198,4341,10,1970);

INSERT INTO Car_Details VALUES(7,14,8,454,220,4354,9,1970);

INSERT INTO Car_Details VALUES(8,14,8,440,215,4312,8.5,1970);

INSERT INTO Car_Details VALUES(9,14,8,455,225,4425,10,1970);

INSERT INTO Car_Details VALUES(10,15,8,390,190,3850,8.5,1970);

INSERT INTO Car_Details VALUES(11,null,4,133,115,3090,17.5,1970);

INSERT INTO Car_Details VALUES(12,null,8,350,165,4142,11.5,1970);

INSERT INTO Car_Details VALUES(13,null,8,351,153,4034,11,1970);

INSERT INTO Car_Details VALUES(14,null,8,383,175,4166,10.5,1970);

INSERT INTO Car_Details VALUES(15,null,8,360,175,3850,11,1970);

INSERT INTO Car_Details VALUES(16,15,8,383,170,3563,10,1970);

INSERT INTO Car_Details VALUES(17,14,8,340,160,3609,8,1970);

INSERT INTO Car_Details VALUES(18,null,8,302,140,3353,8,1970);

INSERT INTO Car_Details VALUES(19,15,8,400,150,3761,9.5,1970);

INSERT INTO Car_Details VALUES(20,14,8,455,225,3086,10,1970);

INSERT INTO Car_Details VALUES(21,24,4,113,95,2372,15,1970);

INSERT INTO Car_Details VALUES(22,22,6,198,95,2833,15.5,1970);

INSERT INTO Car_Details VALUES(23,18,6,199,97,2774,15.5,1970);

INSERT INTO Car_Details VALUES(24,21,6,200,85,2587,16,1970);

INSERT INTO Car_Details VALUES(25,27,4,97,88,2130,14.5,1970);

INSERT INTO Car_Details VALUES(26,26,4,97,46,1835,20.5,1970);

INSERT INTO Car_Details VALUES(27,25,4,110,87,2672,17.5,1970);

INSERT INTO Car_Details VALUES(28,24,4,107,90,2430,14.5,1970);

INSERT INTO Car_Details VALUES(29,25,4,104,95,2375,17.5,1970);

INSERT INTO Car_Details VALUES(30,26,4,121,113,2234,12.5,1970);

INSERT INTO Car_Details VALUES(31,21,6,199,90,2648,15,1970);

INSERT INTO Car_Details VALUES(32,10,8,360,215,4615,14,1970);

INSERT INTO Car_Details VALUES(33,10,8,307,200,4376,15,1970);

INSERT INTO Car_Details VALUES(34,11,8,318,210,4382,13.5,1970);

INSERT INTO Car_Details VALUES(35,9,8,304,193,4732,18.5,1970);

INSERT INTO Car_Details VALUES(36,27,4,97,88,2130,14.5,1971);

INSERT INTO Car_Details VALUES(37,28,4,140,90,2264,15.5,1971);

INSERT INTO Car_Details VALUES(38,25,4,113,95,2228,14,1971);

INSERT INTO Car_Details VALUES(39,25,4,98,null,2046,19,1971);

INSERT INTO Car_Details VALUES(40,null,4,97,48,1978,20,1971);

INSERT INTO Car_Details VALUES(41,19,6,232,100,2634,13,1971);

INSERT INTO Car_Details VALUES(42,16,6,225,105,3439,15.5,1971);

INSERT INTO Car_Details VALUES(43,17,6,250,100,3329,15.5,1971);

INSERT INTO Car_Details VALUES(44,19,6,250,88,3302,15.5,1971);

INSERT INTO Car_Details VALUES(45,18,6,232,100,3288,15.5,1971);

INSERT INTO Car_Details VALUES(46,14,8,350,165,4209,12,1971);

INSERT INTO Car_Details VALUES(47,14,8,400,175,4464,11.5,1971);

INSERT INTO Car_Details VALUES(48,14,8,351,153,4154,13.5,1971);

INSERT INTO Car_Details VALUES(49,14,8,318,150,4096,13,1971);

INSERT INTO Car_Details VALUES(50,12,8,383,180,4955,11.5,1971);

INSERT INTO Car_Details VALUES(51,13,8,400,170,4746,12,1971);

INSERT INTO Car_Details VALUES(52,13,8,400,175,5140,12,1971);

INSERT INTO Car_Details VALUES(53,18,6,258,110,2962,13.5,1971);

INSERT INTO Car_Details VALUES(54,22,4,140,72,2408,19,1971);

INSERT INTO Car_Details VALUES(55,19,6,250,100,3282,15,1971);

INSERT INTO Car_Details VALUES(56,18,6,250,88,3139,14.5,1971);

INSERT INTO Car_Details VALUES(57,23,4,122,86,2220,14,1971);

INSERT INTO Car_Details VALUES(58,28,4,116,90,2123,14,1971);

INSERT INTO Car_Details VALUES(59,30,4,79,70,2074,19.5,1971);

INSERT INTO Car_Details VALUES(60,30,4,88,76,2065,14.5,1971);

INSERT INTO Car_Details VALUES(61,31,4,71,65,1773,19,1971);

INSERT INTO Car_Details VALUES(62,35,4,72,69,1613,18,1971);

INSERT INTO Car_Details VALUES(63,27,4,97,60,1834,19,1971);

INSERT INTO Car_Details VALUES(64,26,4,91,70,1955,20.5,1971);

INSERT INTO Car_Details VALUES(65,24,4,113,95,2278,15.5,1972);

INSERT INTO Car_Details VALUES(66,25,4,97.5,80,2126,17,1972);

INSERT INTO Car_Details VALUES(67,23,4,97,54,2254,23.5,1972);

INSERT INTO Car_Details VALUES(68,20,4,140,90,2408,19.5,1972);

INSERT INTO Car_Details VALUES(69,21,4,122,86,2226,16.5,1972);

INSERT INTO Car_Details VALUES(70,13,8,350,165,4274,12,1972);

INSERT INTO Car_Details VALUES(71,14,8,400,175,4385,12,1972);

INSERT INTO Car_Details VALUES(72,15,8,318,150,4135,13.5,1972);

INSERT INTO Car_Details VALUES(73,14,8,351,153,4129,13,1972);

INSERT INTO Car_Details VALUES(74,17,8,304,150,3672,11.5,1972);

INSERT INTO Car_Details VALUES(75,11,8,429,208,4633,11,1972);

INSERT INTO Car_Details VALUES(76,13,8,350,155,4502,13.5,1972);

INSERT INTO Car_Details VALUES(77,12,8,350,160,4456,13.5,1972);

INSERT INTO Car_Details VALUES(78,13,8,400,190,4422,12.5,1972);

INSERT INTO Car_Details VALUES(79,19,3,70,97,2330,13.5,1972);

INSERT INTO Car_Details VALUES(80,15,8,304,150,3892,12.5,1972);

INSERT INTO Car_Details VALUES(81,13,8,307,130,4098,14,1972);

INSERT INTO Car_Details VALUES(82,13,8,302,140,4294,16,1972);

INSERT INTO Car_Details VALUES(83,14,8,318,150,4077,14,1972);

INSERT INTO Car_Details VALUES(84,18,4,121,112,2933,14.5,1972);

INSERT INTO Car_Details VALUES(85,22,4,121,76,2511,18,1972);

INSERT INTO Car_Details VALUES(86,21,4,120,87,2979,19.5,1972);

INSERT INTO Car_Details VALUES(87,26,4,96,69,2189,18,1972);

INSERT INTO Car_Details VALUES(88,22,4,122,86,2395,16,1972);

INSERT INTO Car_Details VALUES(89,28,4,97,92,2288,17,1972);

INSERT INTO Car_Details VALUES(90,23,4,120,97,2506,14.5,1972);

INSERT INTO Car_Details VALUES(91,28,4,98,80,2164,15,1972);

INSERT INTO Car_Details VALUES(92,27,4,97,88,2100,16.5,1972);

INSERT INTO Car_Details VALUES(93,13,8,350,175,4100,13,1973);

INSERT INTO Car_Details VALUES(94,14,8,304,150,3672,11.5,1973);

INSERT INTO Car_Details VALUES(95,13,8,350,145,3988,13,1973);

INSERT INTO Car_Details VALUES(96,14,8,302,137,4042,14.5,1973);

INSERT INTO Car_Details VALUES(97,15,8,318,150,3777,12.5,1973);

INSERT INTO Car_Details VALUES(98,12,8,429,198,4952,11.5,1973);

INSERT INTO Car_Details VALUES(99,13,8,400,150,4464,12,1973);

INSERT INTO Car_Details VALUES(100,13,8,351,158,4363,13,1973);

INSERT INTO Car_Details VALUES(101,14,8,318,150,4237,14.5,1973);

INSERT INTO Car_Details VALUES(102,13,8,440,215,4735,11,1973);

INSERT INTO Car_Details VALUES(103,12,8,455,225,4951,11,1973);

INSERT INTO Car_Details VALUES(104,13,8,360,175,3821,11,1973);

INSERT INTO Car_Details VALUES(105,18,6,225,105,3121,16.5,1973);

INSERT INTO Car_Details VALUES(106,16,6,250,100,3278,18,1973);

INSERT INTO Car_Details VALUES(107,18,6,232,100,2945,16,1973);

INSERT INTO Car_Details VALUES(108,18,6,250,88,3021,16.5,1973);

INSERT INTO Car_Details VALUES(109,23,6,198,95,2904,16,1973);

INSERT INTO Car_Details VALUES(110,26,4,97,46,1950,21,1973);

INSERT INTO Car_Details VALUES(111,11,8,400,150,4997,14,1973);

INSERT INTO Car_Details VALUES(112,12,8,400,167,4906,12.5,1973);

INSERT INTO Car_Details VALUES(113,13,8,360,170,4654,13,1973);

INSERT INTO Car_Details VALUES(114,12,8,350,180,4499,12.5,1973);

INSERT INTO Car_Details VALUES(115,18,6,232,100,2789,15,1973);

INSERT INTO Car_Details VALUES(116,20,4,97,88,2279,19,1973);

INSERT INTO Car_Details VALUES(117,21,4,140,72,2401,19.5,1973);

INSERT INTO Car_Details VALUES(118,22,4,108,94,2379,16.5,1973);

INSERT INTO Car_Details VALUES(119,18,3,70,90,2124,13.5,1973);

INSERT INTO Car_Details VALUES(120,19,4,122,85,2310,18.5,1973);

INSERT INTO Car_Details VALUES(121,21,6,155,107,2472,14,1973);

INSERT INTO Car_Details VALUES(122,26,4,98,90,2265,15.5,1973);

INSERT INTO Car_Details VALUES(123,15,8,350,145,4082,13,1973);

INSERT INTO Car_Details VALUES(124,16,8,400,230,4278,9.5,1973);

INSERT INTO Car_Details VALUES(125,29,4,68,49,1867,19.5,1973);

INSERT INTO Car_Details VALUES(126,24,4,116,75,2158,15.5,1973);

INSERT INTO Car_Details VALUES(127,20,4,114,91,2582,14,1973);

INSERT INTO Car_Details VALUES(128,19,4,121,112,2868,15.5,1973);

INSERT INTO Car_Details VALUES(129,15,8,318,150,3399,11,1973);

INSERT INTO Car_Details VALUES(130,24,4,121,110,2660,14,1973);

INSERT INTO Car_Details VALUES(131,20,6,156,122,2807,13.5,1973);

INSERT INTO Car_Details VALUES(132,11,8,350,180,3664,11,1973);

INSERT INTO Car_Details VALUES(133,20,6,198,95,3102,16.5,1974);

INSERT INTO Car_Details VALUES(134,21,6,200,null,2875,17,1974);

INSERT INTO Car_Details VALUES(135,19,6,232,100,2901,16,1974);

INSERT INTO Car_Details VALUES(136,15,6,250,100,3336,17,1974);

INSERT INTO Car_Details VALUES(137,31,4,79,67,1950,19,1974);

INSERT INTO Car_Details VALUES(138,26,4,122,80,2451,16.5,1974);

INSERT INTO Car_Details VALUES(139,32,4,71,65,1836,21,1974);

INSERT INTO Car_Details VALUES(140,25,4,140,75,2542,17,1974);

INSERT INTO Car_Details VALUES(141,16,6,250,100,3781,17,1974);

INSERT INTO Car_Details VALUES(142,16,6,258,110,3632,18,1974);

INSERT INTO Car_Details VALUES(143,18,6,225,105,3613,16.5,1974);

INSERT INTO Car_Details VALUES(144,16,8,302,140,4141,14,1974);

INSERT INTO Car_Details VALUES(145,13,8,350,150,4699,14.5,1974);

INSERT INTO Car_Details VALUES(146,14,8,318,150,4457,13.5,1974);

INSERT INTO Car_Details VALUES(147,14,8,302,140,4638,16,1974);

INSERT INTO Car_Details VALUES(148,14,8,304,150,4257,15.5,1974);

INSERT INTO Car_Details VALUES(149,29,4,98,83,2219,16.5,1974);

INSERT INTO Car_Details VALUES(150,26,4,79,67,1963,15.5,1974);

INSERT INTO Car_Details VALUES(151,26,4,97,78,2300,14.5,1974);

INSERT INTO Car_Details VALUES(152,31,4,76,52,1649,16.5,1974);

INSERT INTO Car_Details VALUES(153,32,4,83,61,2003,19,1974);

INSERT INTO Car_Details VALUES(154,28,4,90,75,2125,14.5,1974);

INSERT INTO Car_Details VALUES(155,24,4,90,75,2108,15.5,1974);

INSERT INTO Car_Details VALUES(156,26,4,116,75,2246,14,1974);

INSERT INTO Car_Details VALUES(157,24,4,120,97,2489,15,1974);

INSERT INTO Car_Details VALUES(158,26,4,108,93,2391,15.5,1974);

INSERT INTO Car_Details VALUES(159,31,4,79,67,2000,16,1974);

INSERT INTO Car_Details VALUES(160,19,6,225,95,3264,16,1975);

INSERT INTO Car_Details VALUES(161,18,6,250,105,3459,16,1975);

INSERT INTO Car_Details VALUES(162,15,6,250,72,3432,21,1975);

INSERT INTO Car_Details VALUES(163,15,6,250,72,3158,19.5,1975);

INSERT INTO Car_Details VALUES(164,16,8,400,170,4668,11.5,1975);

INSERT INTO Car_Details VALUES(165,15,8,350,145,4440,14,1975);

INSERT INTO Car_Details VALUES(166,16,8,318,150,4498,14.5,1975);

INSERT INTO Car_Details VALUES(167,14,8,351,148,4657,13.5,1975);

INSERT INTO Car_Details VALUES(168,17,6,231,110,3907,21,1975);

INSERT INTO Car_Details VALUES(169,16,6,250,105,3897,18.5,1975);

INSERT INTO Car_Details VALUES(170,15,6,258,110,3730,19,1975);

INSERT INTO Car_Details VALUES(171,18,6,225,95,3785,19,1975);

INSERT INTO Car_Details VALUES(172,21,6,231,110,3039,15,1975);

INSERT INTO Car_Details VALUES(173,20,8,262,110,3221,13.5,1975);

INSERT INTO Car_Details VALUES(174,13,8,302,129,3169,12,1975);

INSERT INTO Car_Details VALUES(175,29,4,97,75,2171,16,1975);

INSERT INTO Car_Details VALUES(176,23,4,140,83,2639,17,1975);

INSERT INTO Car_Details VALUES(177,20,6,232,100,2914,16,1975);

INSERT INTO Car_Details VALUES(178,23,4,140,78,2592,18.5,1975);

INSERT INTO Car_Details VALUES(179,24,4,134,96,2702,13.5,1975);

INSERT INTO Car_Details VALUES(180,25,4,90,71,2223,16.5,1975);

INSERT INTO Car_Details VALUES(181,24,4,119,97,2545,17,1975);

INSERT INTO Car_Details VALUES(182,18,6,171,97,2984,14.5,1975);

INSERT INTO Car_Details VALUES(183,29,4,90,70,1937,14,1975);

INSERT INTO Car_Details VALUES(184,19,6,232,90,3211,17,1975);

INSERT INTO Car_Details VALUES(185,23,4,115,95,2694,15,1975);

INSERT INTO Car_Details VALUES(186,23,4,120,88,2957,17,1975);

INSERT INTO Car_Details VALUES(187,22,4,121,98,2945,14.5,1975);

INSERT INTO Car_Details VALUES(188,25,4,121,115,2671,13.5,1975);

INSERT INTO Car_Details VALUES(189,33,4,91,53,1795,17.5,1975);

INSERT INTO Car_Details VALUES(190,28,4,107,86,2464,15.5,1976);

INSERT INTO Car_Details VALUES(191,25,4,116,81,2220,16.9,1976);

INSERT INTO Car_Details VALUES(192,25,4,140,92,2572,14.9,1976);

INSERT INTO Car_Details VALUES(193,26,4,98,79,2255,17.7,1976);

INSERT INTO Car_Details VALUES(194,27,4,101,83,2202,15.3,1976);

INSERT INTO Car_Details VALUES(195,17.5,8,305,140,4215,13,1976);

INSERT INTO Car_Details VALUES(196,16,8,318,150,4190,13,1976);

INSERT INTO Car_Details VALUES(197,15.5,8,304,120,3962,13.9,1976);

INSERT INTO Car_Details VALUES(198,14.5,8,351,152,4215,12.8,1976);

INSERT INTO Car_Details VALUES(199,22,6,225,100,3233,15.4,1976);

INSERT INTO Car_Details VALUES(200,22,6,250,105,3353,14.5,1976);

INSERT INTO Car_Details VALUES(201,24,6,200,81,3012,17.6,1976);

INSERT INTO Car_Details VALUES(202,22.5,6,232,90,3085,17.6,1976);

INSERT INTO Car_Details VALUES(203,29,4,85,52,2035,22.2,1976);

INSERT INTO Car_Details VALUES(204,24.5,4,98,60,2164,22.1,1976);

INSERT INTO Car_Details VALUES(205,29,4,90,70,1937,14.2,1976);

INSERT INTO Car_Details VALUES(206,33,4,91,53,1795,17.4,1976);

INSERT INTO Car_Details VALUES(207,20,6,225,100,3651,17.7,1976);

INSERT INTO Car_Details VALUES(208,18,6,250,78,3574,21,1976);

INSERT INTO Car_Details VALUES(209,18.5,6,250,110,3645,16.2,1976);

INSERT INTO Car_Details VALUES(210,17.5,6,258,95,3193,17.8,1976);

INSERT INTO Car_Details VALUES(211,29.5,4,97,71,1825,12.2,1976);

INSERT INTO Car_Details VALUES(212,32,4,85,70,1990,17,1976);

INSERT INTO Car_Details VALUES(213,28,4,97,75,2155,16.4,1976);

INSERT INTO Car_Details VALUES(214,26.5,4,140,72,2565,13.6,1976);

INSERT INTO Car_Details VALUES(215,20,4,130,102,3150,15.7,1976);

INSERT INTO Car_Details VALUES(216,13,8,318,150,3940,13.2,1976);

INSERT INTO Car_Details VALUES(217,19,4,120,88,3270,21.9,1976);

INSERT INTO Car_Details VALUES(218,19,6,156,108,2930,15.5,1976);

INSERT INTO Car_Details VALUES(219,16.5,6,168,120,3820,16.7,1976);

INSERT INTO Car_Details VALUES(220,16.5,8,350,180,4380,12.1,1976);

INSERT INTO Car_Details VALUES(221,13,8,350,145,4055,12,1976);

INSERT INTO Car_Details VALUES(222,13,8,302,130,3870,15,1976);

INSERT INTO Car_Details VALUES(223,13,8,318,150,3755,14,1976);

INSERT INTO Car_Details VALUES(224,31.5,4,98,68,2045,18.5,1977);

INSERT INTO Car_Details VALUES(225,30,4,111,80,2155,14.8,1977);

INSERT INTO Car_Details VALUES(226,36,4,79,58,1825,18.6,1977);

INSERT INTO Car_Details VALUES(227,25.5,4,122,96,2300,15.5,1977);

INSERT INTO Car_Details VALUES(228,33.5,4,85,70,1945,16.8,1977);

INSERT INTO Car_Details VALUES(229,17.5,8,305,145,3880,12.5,1977);

INSERT INTO Car_Details VALUES(230,17,8,260,110,4060,19,1977);

INSERT INTO Car_Details VALUES(231,15.5,8,318,145,4140,13.7,1977);

INSERT INTO Car_Details VALUES(232,15,8,302,130,4295,14.9,1977);

INSERT INTO Car_Details VALUES(233,17.5,6,250,110,3520,16.4,1977);

INSERT INTO Car_Details VALUES(234,20.5,6,231,105,3425,16.9,1977);

INSERT INTO Car_Details VALUES(235,19,6,225,100,3630,17.7,1977);

INSERT INTO Car_Details VALUES(236,18.5,6,250,98,3525,19,1977);

INSERT INTO Car_Details VALUES(237,16,8,400,180,4220,11.1,1977);

INSERT INTO Car_Details VALUES(238,15.5,8,350,170,4165,11.4,1977);

INSERT INTO Car_Details VALUES(239,15.5,8,400,190,4325,12.2,1977);

INSERT INTO Car_Details VALUES(240,16,8,351,149,4335,14.5,1977);

INSERT INTO Car_Details VALUES(241,29,4,97,78,1940,14.5,1977);

INSERT INTO Car_Details VALUES(242,24.5,4,151,88,2740,16,1977);

INSERT INTO Car_Details VALUES(243,26,4,97,75,2265,18.2,1977);

INSERT INTO Car_Details VALUES(244,25.5,4,140,89,2755,15.8,1977);

INSERT INTO Car_Details VALUES(245,30.5,4,98,63,2051,17,1977);

INSERT INTO Car_Details VALUES(246,33.5,4,98,83,2075,15.9,1977);

INSERT INTO Car_Details VALUES(247,30,4,97,67,1985,16.4,1977);

INSERT INTO Car_Details VALUES(248,30.5,4,97,78,2190,14.1,1977);

INSERT INTO Car_Details VALUES(249,22,6,146,97,2815,14.5,1977);

INSERT INTO Car_Details VALUES(250,21.5,4,121,110,2600,12.8,1977);

INSERT INTO Car_Details VALUES(251,21.5,3,80,110,2720,13.5,1977);

INSERT INTO Car_Details VALUES(252,43.1,4,90,48,1985,21.5,1978);

INSERT INTO Car_Details VALUES(253,36.1,4,98,66,1800,14.4,1978);

INSERT INTO Car_Details VALUES(254,32.8,4,78,52,1985,19.4,1978);

INSERT INTO Car_Details VALUES(255,39.4,4,85,70,2070,18.6,1978);

INSERT INTO Car_Details VALUES(256,36.1,4,91,60,1800,16.4,1978);

INSERT INTO Car_Details VALUES(257,19.9,8,260,110,3365,15.5,1978);

INSERT INTO Car_Details VALUES(258,19.4,8,318,140,3735,13.2,1978);

INSERT INTO Car_Details VALUES(259,20.2,8,302,139,3570,12.8,1978);

INSERT INTO Car_Details VALUES(260,19.2,6,231,105,3535,19.2,1978);

INSERT INTO Car_Details VALUES(261,20.5,6,200,95,3155,18.2,1978);

INSERT INTO Car_Details VALUES(262,20.2,6,200,85,2965,15.8,1978);

INSERT INTO Car_Details VALUES(263,25.1,4,140,88,2720,15.4,1978);

INSERT INTO Car_Details VALUES(264,20.5,6,225,100,3430,17.2,1978);

INSERT INTO Car_Details VALUES(265,19.4,6,232,90,3210,17.2,1978);

INSERT INTO Car_Details VALUES(266,20.6,6,231,105,3380,15.8,1978);

INSERT INTO Car_Details VALUES(267,20.8,6,200,85,3070,16.7,1978);

INSERT INTO Car_Details VALUES(268,18.6,6,225,110,3620,18.7,1978);

INSERT INTO Car_Details VALUES(269,18.1,6,258,120,3410,15.1,1978);

INSERT INTO Car_Details VALUES(270,19.2,8,305,145,3425,13.2,1978);

INSERT INTO Car_Details VALUES(271,17.7,6,231,165,3445,13.4,1978);

INSERT INTO Car_Details VALUES(272,18.1,8,302,139,3205,11.2,1978);

INSERT INTO Car_Details VALUES(273,17.5,8,318,140,4080,13.7,1978);

INSERT INTO Car_Details VALUES(274,30,4,98,68,2155,16.5,1978);

INSERT INTO Car_Details VALUES(275,27.5,4,134,95,2560,14.2,1978);

INSERT INTO Car_Details VALUES(276,27.2,4,119,97,2300,14.7,1978);

INSERT INTO Car_Details VALUES(277,30.9,4,105,75,2230,14.5,1978);

INSERT INTO Car_Details VALUES(278,21.1,4,134,95,2515,14.8,1978);

INSERT INTO Car_Details VALUES(279,23.2,4,156,105,2745,16.7,1978);

INSERT INTO Car_Details VALUES(280,23.8,4,151,85,2855,17.6,1978);

INSERT INTO Car_Details VALUES(281,23.9,4,119,97,2405,14.9,1978);

INSERT INTO Car_Details VALUES(282,20.3,5,131,103,2830,15.9,1978);

INSERT INTO Car_Details VALUES(283,17,6,163,125,3140,13.6,1978);

INSERT INTO Car_Details VALUES(284,21.6,4,121,115,2795,15.7,1978);

INSERT INTO Car_Details VALUES(285,16.2,6,163,133,3410,15.8,1978);

INSERT INTO Car_Details VALUES(286,31.5,4,89,71,1990,14.9,1978);

INSERT INTO Car_Details VALUES(287,29.5,4,98,68,2135,16.6,1978);

INSERT INTO Car_Details VALUES(288,21.5,6,231,115,3245,15.4,1979);

INSERT INTO Car_Details VALUES(289,19.8,6,200,85,2990,18.2,1979);

INSERT INTO Car_Details VALUES(290,22.3,4,140,88,2890,17.3,1979);

INSERT INTO Car_Details VALUES(291,20.2,6,232,90,3265,18.2,1979);

INSERT INTO Car_Details VALUES(292,20.6,6,225,110,3360,16.6,1979);

INSERT INTO Car_Details VALUES(293,17,8,305,130,3840,15.4,1979);

INSERT INTO Car_Details VALUES(294,17.6,8,302,129,3725,13.4,1979);

INSERT INTO Car_Details VALUES(295,16.5,8,351,138,3955,13.2,1979);

INSERT INTO Car_Details VALUES(296,18.2,8,318,135,3830,15.2,1979);

INSERT INTO Car_Details VALUES(297,16.9,8,350,155,4360,14.9,1979);

INSERT INTO Car_Details VALUES(298,15.5,8,351,142,4054,14.3,1979);

INSERT INTO Car_Details VALUES(299,19.2,8,267,125,3605,15,1979);

INSERT INTO Car_Details VALUES(300,18.5,8,360,150,3940,13,1979);

INSERT INTO Car_Details VALUES(301,31.9,4,89,71,1925,14,1979);

INSERT INTO Car_Details VALUES(302,34.1,4,86,65,1975,15.2,1979);

INSERT INTO Car_Details VALUES(303,35.7,4,98,80,1915,14.4,1979);

INSERT INTO Car_Details VALUES(304,27.4,4,121,80,2670,15,1979);

INSERT INTO Car_Details VALUES(305,25.4,5,183,77,3530,20.1,1979);

INSERT INTO Car_Details VALUES(306,23,8,350,125,3900,17.4,1979);

INSERT INTO Car_Details VALUES(307,27.2,4,141,71,3190,24.8,1979);

INSERT INTO Car_Details VALUES(308,23.9,8,260,90,3420,22.2,1979);

INSERT INTO Car_Details VALUES(309,34.2,4,105,70,2200,13.2,1979);

INSERT INTO Car_Details VALUES(310,34.5,4,105,70,2150,14.9,1979);

INSERT INTO Car_Details VALUES(311,31.8,4,85,65,2020,19.2,1979);

INSERT INTO Car_Details VALUES(312,37.3,4,91,69,2130,14.7,1979);

INSERT INTO Car_Details VALUES(313,28.4,4,151,90,2670,16,1979);

INSERT INTO Car_Details VALUES(314,28.8,6,173,115,2595,11.3,1979);

INSERT INTO Car_Details VALUES(315,26.8,6,173,115,2700,12.9,1979);

INSERT INTO Car_Details VALUES(316,33.5,4,151,90,2556,13.2,1979);

INSERT INTO Car_Details VALUES(317,41.5,4,98,76,2144,14.7,1980);

INSERT INTO Car_Details VALUES(318,38.1,4,89,60,1968,18.8,1980);

INSERT INTO Car_Details VALUES(319,32.1,4,98,70,2120,15.5,1980);

INSERT INTO Car_Details VALUES(320,37.2,4,86,65,2019,16.4,1980);

INSERT INTO Car_Details VALUES(321,28,4,151,90,2678,16.5,1980);

INSERT INTO Car_Details VALUES(322,26.4,4,140,88,2870,18.1,1980);

INSERT INTO Car_Details VALUES(323,24.3,4,151,90,3003,20.1,1980);

INSERT INTO Car_Details VALUES(324,19.1,6,225,90,3381,18.7,1980);

INSERT INTO Car_Details VALUES(325,34.3,4,97,78,2188,15.8,1980);

INSERT INTO Car_Details VALUES(326,29.8,4,134,90,2711,15.5,1980);

INSERT INTO Car_Details VALUES(327,31.3,4,120,75,2542,17.5,1980);

INSERT INTO Car_Details VALUES(328,37,4,119,92,2434,15,1980);

INSERT INTO Car_Details VALUES(329,32.2,4,108,75,2265,15.2,1980);

INSERT INTO Car_Details VALUES(330,46.6,4,86,65,2110,17.9,1980);

INSERT INTO Car_Details VALUES(331,27.9,4,156,105,2800,14.4,1980);

INSERT INTO Car_Details VALUES(332,40.8,4,85,65,2110,19.2,1980);

INSERT INTO Car_Details VALUES(333,44.3,4,90,48,2085,21.7,1980);

INSERT INTO Car_Details VALUES(334,43.4,4,90,48,2335,23.7,1980);

INSERT INTO Car_Details VALUES(335,36.4,5,121,67,2950,19.9,1980);

INSERT INTO Car_Details VALUES(336,30,4,146,67,3250,21.8,1980);

INSERT INTO Car_Details VALUES(337,44.6,4,91,67,1850,13.8,1980);

INSERT INTO Car_Details VALUES(338,40.9,4,85,null,1835,17.3,1980);

INSERT INTO Car_Details VALUES(339,33.8,4,97,67,2145,18,1980);

INSERT INTO Car_Details VALUES(340,29.8,4,89,62,1845,15.3,1980);

INSERT INTO Car_Details VALUES(341,32.7,6,168,132,2910,11.4,1980);

INSERT INTO Car_Details VALUES(342,23.7,3,70,100,2420,12.5,1980);

INSERT INTO Car_Details VALUES(343,35,4,122,88,2500,15.1,1980);

INSERT INTO Car_Details VALUES(344,23.6,4,140,null,2905,14.3,1980);

INSERT INTO Car_Details VALUES(345,32.4,4,107,72,2290,17,1980);

INSERT INTO Car_Details VALUES(346,27.2,4,135,84,2490,15.7,1981);

INSERT INTO Car_Details VALUES(347,26.6,4,151,84,2635,16.4,1981);

INSERT INTO Car_Details VALUES(348,25.8,4,156,92,2620,14.4,1981);

INSERT INTO Car_Details VALUES(349,23.5,6,173,110,2725,12.6,1981);

INSERT INTO Car_Details VALUES(350,30,4,135,84,2385,12.9,1981);

INSERT INTO Car_Details VALUES(351,39.1,4,79,58,1755,16.9,1981);

INSERT INTO Car_Details VALUES(352,39,4,86,64,1875,16.4,1981);

INSERT INTO Car_Details VALUES(353,35.1,4,81,60,1760,16.1,1981);

INSERT INTO Car_Details VALUES(354,32.3,4,97,67,2065,17.8,1981);

INSERT INTO Car_Details VALUES(355,37,4,85,65,1975,19.4,1981);

INSERT INTO Car_Details VALUES(356,37.7,4,89,62,2050,17.3,1981);

INSERT INTO Car_Details VALUES(357,34.1,4,91,68,1985,16,1981);

INSERT INTO Car_Details VALUES(358,34.7,4,105,63,2215,14.9,1981);

INSERT INTO Car_Details VALUES(359,34.4,4,98,65,2045,16.2,1981);

INSERT INTO Car_Details VALUES(360,29.9,4,98,65,2380,20.7,1981);

INSERT INTO Car_Details VALUES(361,33,4,105,74,2190,14.2,1981);

INSERT INTO Car_Details VALUES(362,34.5,4,100,null,2320,15.8,1981);

INSERT INTO Car_Details VALUES(363,33.7,4,107,75,2210,14.4,1981);

INSERT INTO Car_Details VALUES(364,32.4,4,108,75,2350,16.8,1981);

INSERT INTO Car_Details VALUES(365,32.9,4,119,100,2615,14.8,1981);

INSERT INTO Car_Details VALUES(366,31.6,4,120,74,2635,18.3,1981);

INSERT INTO Car_Details VALUES(367,28.1,4,141,80,3230,20.4,1981);

INSERT INTO Car_Details VALUES(368,null,4,121,110,2800,15.4,1981);

INSERT INTO Car_Details VALUES(369,30.7,6,145,76,3160,19.6,1981);

INSERT INTO Car_Details VALUES(370,25.4,6,168,116,2900,12.6,1981);

INSERT INTO Car_Details VALUES(371,24.2,6,146,120,2930,13.8,1981);

INSERT INTO Car_Details VALUES(372,22.4,6,231,110,3415,15.8,1981);

INSERT INTO Car_Details VALUES(373,26.6,8,350,105,3725,19,1981);

INSERT INTO Car_Details VALUES(374,20.2,6,200,88,3060,17.1,1981);

INSERT INTO Car_Details VALUES(375,17.6,6,225,85,3465,16.6,1981);

INSERT INTO Car_Details VALUES(376,28,4,112,88,2605,19.6,1982);

INSERT INTO Car_Details VALUES(377,27,4,112,88,2640,18.6,1982);

INSERT INTO Car_Details VALUES(378,34,4,112,88,2395,18,1982);

INSERT INTO Car_Details VALUES(379,31,4,112,85,2575,16.2,1982);

INSERT INTO Car_Details VALUES(380,29,4,135,84,2525,16,1982);

INSERT INTO Car_Details VALUES(381,27,4,151,90,2735,18,1982);

INSERT INTO Car_Details VALUES(382,24,4,140,92,2865,16.4,1982);

INSERT INTO Car_Details VALUES(383,23,4,151,null,3035,20.5,1982);

INSERT INTO Car_Details VALUES(384,36,4,105,74,1980,15.3,1982);

INSERT INTO Car_Details VALUES(385,37,4,91,68,2025,18.2,1982);

INSERT INTO Car_Details VALUES(386,31,4,91,68,1970,17.6,1982);

INSERT INTO Car_Details VALUES(387,38,4,105,63,2125,14.7,1982);

INSERT INTO Car_Details VALUES(388,36,4,98,70,2125,17.3,1982);

INSERT INTO Car_Details VALUES(389,36,4,120,88,2160,14.5,1982);

INSERT INTO Car_Details VALUES(390,36,4,107,75,2205,14.5,1982);

INSERT INTO Car_Details VALUES(391,34,4,108,70,2245,16.9,1982);

INSERT INTO Car_Details VALUES(392,38,4,91,67,1965,15,1982);

INSERT INTO Car_Details VALUES(393,32,4,91,67,1965,15.7,1982);

INSERT INTO Car_Details VALUES(394,38,4,91,67,1995,16.2,1982);

INSERT INTO Car_Details VALUES(395,25,6,181,110,2945,16.4,1982);

INSERT INTO Car_Details VALUES(396,38,6,262,85,3015,17,1982);

INSERT INTO Car_Details VALUES(397,26,4,156,92,2585,14.5,1982);

INSERT INTO Car_Details VALUES(398,22,6,232,112,2835,14.7,1982);

INSERT INTO Car_Details VALUES(399,32,4,144,96,2665,13.9,1982);

INSERT INTO Car_Details VALUES(400,36,4,135,84,2370,13,1982);

INSERT INTO Car_Details VALUES(401,27,4,151,90,2950,17.3,1982);

INSERT INTO Car_Details VALUES(402,27,4,140,86,2790,15.6,1982);

INSERT INTO Car_Details VALUES(403,44,4,97,52,2130,24.6,1982);

INSERT INTO Car_Details VALUES(404,32,4,135,84,2295,11.6,1982);

INSERT INTO Car_Details VALUES(405,28,4,120,79,2625,18.6,1982);

INSERT INTO Car_Details VALUES(406,31,4,119,82,2720,19.4,1982);