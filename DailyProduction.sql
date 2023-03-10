create table DailyProduction
(WellZoneNum		varchar(7)	not null,
 AllocDate		date		not null,
 StatusCode             smallint	not null,
 MethodCode		smallint	not null,
 Hours                  float,
 DefProdReason          
 OilVolProd 		float,
 WaterVolProd           float,
 GasVolProd		float,
 WaterVolInj		float,
 GasVolInj		int,
 CO2Inj			int,
 GasLift		float,
 OilSales		float,
 GasSales		float,
 BeginningInv		float,
 EndingInv		float,
 primary key (WellZoneNum,AllocDate),
 foreign key (WellZoneNum)	 references Well,
 foreign key (StatusCode)  	 references WellStatus,
 foreign key (MethodCode)  	 references MethodType,
 foreign key (DefProdReasonCode) references DefProdReason,
);
