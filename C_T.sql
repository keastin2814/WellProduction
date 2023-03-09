drop table WellType;
drop table WellStatus;
drop table MethodType;
drop table DefProdReason;
drop table Well;
drop table DailyProduction;

Create table WellType(
	TypeCode		smallint,
	Description		varchar(50),
	primary key (TypeCode)
);
	
	
Create table WellStatus(
	StatusCode		smallint,
	StatusDesc		varchar(50),
	primary key (StatusCode)
);
	
	
Create table MethodType(
	MethodCode		smallint,
	MethodDesc		varchar(50),
	primary key (MethodCode)
);
	
	
Create table DefProdReason(
	DefProdReasonCode		smallint,
	Reason					varchar(100),
	primary key (DefProdReasonCode)
);
	
	
Create table Well(
	WellZoneNum		varchar(7) not null,
	Field			int not null,
	LeaseCode		varchar(30) not null,
	WellNum			varchar(20) not null,
	OCSLease		bit not null,
	StateCompID		varchar(10),
	Latitude		float,
	Longitude		float,
	CompDate		date,
	InitProdDate	date,
	LastProdDate	date,
	StatusCode		smallint not null,
	TypeCode		smallint,
	MethodCode		smallint not null,
	Rotational		bit not null,
	SandName		varchar(50),
	ResevoirName	varchar(24),
	primary key (WellZoneNum),
	foreign key (StatusCode) references WellStatus (StatusCode),
	foreign key (TypeCode) references WellType (TypeCode),
	foreign key (MethodCode) references MethodType (MethodCode)
);
	
	
Create table DailyProduction(
	WellZoneNum				varchar(7) not null,
	AllocDate				date not null,
	StatusCode				smallint not null,
	MethodCode				smallint not null,
	Hours					float,
	DefProdReasonCode		smallint,
	OilVolProd				float,
	WaterVolProd			float,
	GasVolProd				int,
	WaterVolInj				float,
	GasVolInj				int,
	CO2Inj					int,
	GasLift					float,
	OilSales				float,
	GasSales				float,
	BeginningInv			float,
	EndingInv				float,
	primary key (WellZoneNum, AllocDate),
	foreign key (StatusCode) references WellStatus (StatusCode),
	foreign key (MethodCode) references MethodType (MethodCode),
	foreign key (DefProdReasonCode) references DefProdReason (DefProdReasonCode)
);
	
	
	
	