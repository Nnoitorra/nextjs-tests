BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[A_Stelle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [A_Stelle] VARCHAR(50),
    [Kurz] NVARCHAR(100),
    [Strasse] NVARCHAR(100),
    [Ort] NVARCHAR(50),
    [PLZ] VARCHAR(50),
    [LKZ] NVARCHAR(5),
    [Telefon] VARCHAR(50),
    [Fax] VARCHAR(50),
    [E_Mail] VARCHAR(50),
    [Internet] VARCHAR(50),
    [Ref_Person] INT,
    [IDNr] VARCHAR(50),
    [EN1090] BIT,
    [EN15085] BIT,
    [IDEN1090] VARCHAR(5),
    [EN1090_Bezeichnung] NVARCHAR(100),
    [NomenklaturNr] INT,
    [DIN27201] BIT,
    [ISO3834] BIT,
    [Latitude] DECIMAL(14,10),
    [Longitude] DECIMAL(14,10),
    [Kooperationspartner] INT,
    [Firmenname] NVARCHAR(200),
    [DIN6701] BIT,
    [APIkey] NVARCHAR(100),
    [EN15085_2020] BIT CONSTRAINT [DF_A_Stelle_EN15085_2020] DEFAULT 0,
    [ISO17660] BIT,
    CONSTRAINT [PK_A_Stelle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Access_Protokoll] (
    [ID] UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_Access_Protokoll_ID] DEFAULT newid(),
    [Benutzer_ID] INT NOT NULL,
    [Zugriff] DATETIME CONSTRAINT [DF_Access_Protokoll_Zugriff] DEFAULT CURRENT_TIMESTAMP,
    [IP] VARCHAR(50),
    [login_error] BIT,
    CONSTRAINT [PK_Access_Protokoll] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Activity] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [kurz] NVARCHAR(50),
    [activity_de] NVARCHAR(50),
    [activity_en] NVARCHAR(50),
    [activity_it] NVARCHAR(50),
    [activity_fr] NVARCHAR(50),
    [activity_pl] NVARCHAR(50),
    [activity_es] NVARCHAR(50),
    [activity_HU] NVARCHAR(100),
    CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Adresse_Benutzer_6700_Paypal] (
    [FID] INT NOT NULL IDENTITY(1,1),
    [Firmenname] VARCHAR(200),
    [Land] VARCHAR(200),
    [Bundesland] VARCHAR(200),
    [Stadt] VARCHAR(200),
    [Strasse] VARCHAR(200),
    [Hausnummer] VARCHAR(50),
    [PLZ] VARCHAR(50),
    [Tel_or_Fax_Nr] VARCHAR(50),
    [UST. ID Nr] VARCHAR(100),
    [Internetadresse] VARCHAR(200),
    CONSTRAINT [PK__Adresse___C1BEA5A23B2333AA] PRIMARY KEY CLUSTERED ([FID])
);

-- CreateTable
CREATE TABLE [dbo].[Anrede_Adresse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Anrede_Adresse] VARCHAR(50),
    [Anrede_Brief] VARCHAR(50),
    [Anrede_Adresse_DE] NVARCHAR(50),
    [Anrede_Adresse_EN] NVARCHAR(50),
    [Anrede_Adresse_FR] NVARCHAR(50),
    [Anrede_Adresse_IT] NVARCHAR(50),
    [Anrede_Adresse_PL] NVARCHAR(50),
    [Anrede_Adresse_ES] NVARCHAR(50),
    [Anrede_Brief_DE] NVARCHAR(50),
    [Anrede_Brief_EN] NVARCHAR(50),
    [Anrede_Brief_FR] NVARCHAR(50),
    [Anrede_Brief_IT] NVARCHAR(50),
    [Anrede_Brief_PL] NVARCHAR(50),
    [Anrede_Brief_ES] NVARCHAR(50),
    [Anrede_Adresse_HU] NVARCHAR(100),
    [Anrede_Brief_HU] NVARCHAR(100),
    CONSTRAINT [PK_Anrede] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Anwendung] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Anwendung] VARCHAR(50),
    CONSTRAINT [PK_Anwendung] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Anwendungsgebiet] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Anwendungsgebiet] NVARCHAR(1000),
    [Ref_Bauteilklasse] INT,
    [Anwendungsgebiet_de] NVARCHAR(1000),
    [Anwendungsgebiet_en] NVARCHAR(1000),
    [Anwendungsgebiet_fr] NVARCHAR(1000),
    [Anwendungsgebiet_it] NVARCHAR(1000),
    [Anwendungsgebiet_pl] NVARCHAR(1000),
    [Anwendungsgebiet_es] NVARCHAR(1000),
    [Anwendungsgebiet_HU] NVARCHAR(2000),
    CONSTRAINT [PK_Anwendungsgebiet] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Audit] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Personen] INT,
    [Auditdaten] VARCHAR(50),
    [Audit_Datum] DATETIME,
    [Audit_next] DATETIME,
    [Ref_Personentyp] INT,
    [Ref_CoAuditor] INT,
    [Ref_TypCoAuditor] INT,
    [Ref_Mutter] INT,
    CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Auditor] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Nachname] NVARCHAR(100),
    [Vorname] NVARCHAR(100),
    [Inst] BIT,
    [Nachname_normal] NVARCHAR(100),
    [Ref_Titel] INT,
    [Geb_Datum] DATE,
    [aktiv] BIT,
    [Geb_Ort] NVARCHAR(150),
    [Geb_Land_LKZ] VARCHAR(5),
    [thermalSpraying] BIT,
    CONSTRAINT [PK_Auditor] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Aufgabe_Person] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Aufgabe] NVARCHAR(200),
    [Aufgabe_DE] NVARCHAR(200),
    [Aufgabe_EN] NVARCHAR(200),
    [Aufgabe_FR] NVARCHAR(200),
    [Aufgabe_IT] NVARCHAR(200),
    [Aufgabe_PL] NVARCHAR(200),
    [Aufgabe_ES] NVARCHAR(200),
    [Aufgabe_HU] NVARCHAR(400),
    CONSTRAINT [PK_Aufgabe_Person] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Bausteintyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Bausteintyp] VARCHAR(50),
    CONSTRAINT [PK_Bausteintyp] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Bauteilklasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Klasse] INT NOT NULL,
    [Bauteilklasse] VARCHAR(255),
    [DIN27201] BIT,
    [aktiv] BIT CONSTRAINT [DF_Bauteilklasse_aktiv] DEFAULT 1,
    [Bauteilklasse_DE] NVARCHAR(255),
    [Bauteilklasse_EN] NVARCHAR(255),
    [Bauteilklasse_FR] NVARCHAR(255),
    [Bauteilklasse_IT] NVARCHAR(255),
    [Bauteilklasse_PL] NVARCHAR(255),
    [Bauteilklasse_ES] NVARCHAR(255),
    [kurz_DE] VARCHAR(50),
    [kurz_EN] NVARCHAR(50),
    [kurz_FR] NVARCHAR(50),
    [kurz_IT] NVARCHAR(50),
    [kurz_PL] NVARCHAR(50),
    [kurz_ES] NVARCHAR(50),
    [Bauteilklasse_HU] NVARCHAR(510),
    [kurz_HU] NVARCHAR(50),
    CONSTRAINT [PK_Bauteilklasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Benutzer] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Benutzer] VARCHAR(50) NOT NULL,
    [Passwort] VARCHAR(50) CONSTRAINT [DF_Benutzer_Passwort] DEFAULT '',
    [Name] VARCHAR(50) CONSTRAINT [DF_Benutzer_Name] DEFAULT '',
    [Vorname] VARCHAR(50) CONSTRAINT [DF_Benutzer_Vorname] DEFAULT '',
    [EMail] VARCHAR(50) CONSTRAINT [DF_Benutzer_EMail] DEFAULT '',
    [Gueltigkeit] SMALLDATETIME CONSTRAINT [DF_Benutzer_Gueltigkeit] DEFAULT convert(smalldatetime,(getdate() + 365)),
    [Suche] BIT CONSTRAINT [DF_Benutzer_Suche] DEFAULT 0,
    [Nachweissuche] BIT CONSTRAINT [DF_Benutzer_Nachweissuche] DEFAULT 0,
    [Ausgabe] BIT CONSTRAINT [DF_Benutzer_Ausgabe] DEFAULT 0,
    [Druck] BIT CONSTRAINT [DF_Benutzer_Druck] DEFAULT 0,
    [Eingabe] BIT CONSTRAINT [DF_Benutzer_Eingabe] DEFAULT 0,
    [Anmeldung] BIT CONSTRAINT [DF_Benutzer_Anmeldung] DEFAULT 0,
    [Datenbasis] BIT CONSTRAINT [DF_Benutzer_Datenbasis] DEFAULT 0,
    [Nutzer] BIT CONSTRAINT [DF_Benutzer_Nutzer] DEFAULT 0,
    [Statistik] BIT CONSTRAINT [DF_Benutzer_Statistik] DEFAULT 1,
    [Ref_Sprache] INT CONSTRAINT [DF_Benutzer_Ref_Sprache] DEFAULT 0,
    [pwd_key] INT,
    [din18800] BIT,
    [Kurzzeichen] VARCHAR(5),
    [Management] BIT CONSTRAINT [DF__Benutzer__Manage__23B5BE6D] DEFAULT 0,
    [ECWRV] BIT,
    [Ref_Firma] INT,
    [Ref_A_Stelle] INT,
    [PWJoinCert] NVARCHAR(255),
    CONSTRAINT [PK_Benutzer] PRIMARY KEY CLUSTERED ([ID]),
    CONSTRAINT [IX_Benutzer] UNIQUE NONCLUSTERED ([pwd_key])
);

-- CreateTable
CREATE TABLE [dbo].[Berichte] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_A_Stelle] INT NOT NULL,
    [Nummer] NVARCHAR(10) NOT NULL CONSTRAINT [DF_Berichte_Nummer] DEFAULT '0',
    [Datum] DATE NOT NULL,
    [Dateiname] VARCHAR(50) NOT NULL,
    [aktiv] BIT,
    [Ref_Nachweis_Art] INT,
    [INSERT_DATUM] DATETIME,
    CONSTRAINT [PK_Berichte] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[bescheinigungen_aktuell] (
    [id] INT NOT NULL,
    [Firma] NVARCHAR(250),
    [Straße] NVARCHAR(150),
    [Postleitzahl] NVARCHAR(50),
    [Ort] NVARCHAR(100),
    [Land] NVARCHAR(50),
    [Laufende Zertifizierung] SMALLINT,
    [Ruhend] SMALLINT,
    [A1] NVARCHAR(12),
    [A2] NVARCHAR(12),
    [A3] NVARCHAR(12),
    [Hauptfunktion] NVARCHAR(110),
    [Vorbehandlungsverfahren] NVARCHAR(110),
    [Fertigungsverfahren] NVARCHAR(110),
    [Prüfverfahren] NVARCHAR(110),
    [Mechanisierungsgrad] NVARCHAR(110),
    [Deutsche Bemerkungen] TEXT,
    [Englische Bemerkungen] TEXT,
    [Bescheinigungnummer] NVARCHAR(30),
    [Gültig ab] DATE,
    [Gültig bis] DATE,
    [1. Auditor] NVARCHAR(100),
    [2. Auditor] NVARCHAR(100),
    [Zertifiziert durch] NVARCHAR(100),
    [Ausgestellt durch] NVARCHAR(100),
    [Ausstellungsdatum] DATE,
    [Änderungsdatum] DATE,
    [Reaudit] DATE,
    [KAP_1_1_Anrede] NVARCHAR(20),
    [KAP_1_1_Titel] NVARCHAR(50),
    [KAP_1_1_Nachname] NVARCHAR(100),
    [KAP_1_1_Vorname] NVARCHAR(100),
    [KAP_1_1_Geburtsdatum] DATE,
    [KAP_1_1_Qualifikation] NVARCHAR(50),
    [KAP_1_1_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_1_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_1_Extern] SMALLINT,
    [KAP_1_2_Anrede] NVARCHAR(20),
    [KAP_1_2_Titel] NVARCHAR(50),
    [KAP_1_2_Nachname] NVARCHAR(100),
    [KAP_1_2_Vorname] NVARCHAR(100),
    [KAP_1_2_Geburtsdatum] DATE,
    [KAP_1_2_Qualifikation] NVARCHAR(50),
    [KAP_1_2_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_2_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_2_Extern] SMALLINT,
    [KAP_1_3_Anrede] NVARCHAR(20),
    [KAP_1_3_Titel] NVARCHAR(50),
    [KAP_1_3_Nachname] NVARCHAR(100),
    [KAP_1_3_Vorname] NVARCHAR(100),
    [KAP_1_3_Geburtsdatum] DATE,
    [KAP_1_3_Qualifikation] NVARCHAR(50),
    [KAP_1_3_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_3_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_3_Extern] SMALLINT,
    [KAP_1_4_Anrede] NVARCHAR(20),
    [KAP_1_4_Titel] NVARCHAR(50),
    [KAP_1_4_Nachname] NVARCHAR(100),
    [KAP_1_4_Vorname] NVARCHAR(100),
    [KAP_1_4_Geburtsdatum] DATE,
    [KAP_1_4_Qualifikation] NVARCHAR(50),
    [KAP_1_4_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_4_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_4_Extern] SMALLINT,
    [KAP_2_1_Anrede] NVARCHAR(20),
    [KAP_2_1_Titel] NVARCHAR(50),
    [KAP_2_1_Nachname] NVARCHAR(100),
    [KAP_2_1_Vorname] NVARCHAR(100),
    [KAP_2_1_Geburtsdatum] DATE,
    [KAP_2_1_Qualifikation] NVARCHAR(50),
    [KAP_2_1_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_1_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_1_Extern] SMALLINT,
    [KAP_2_2_Anrede] NVARCHAR(20),
    [KAP_2_2_Titel] NVARCHAR(50),
    [KAP_2_2_Nachname] NVARCHAR(100),
    [KAP_2_2_Vorname] NVARCHAR(100),
    [KAP_2_2_Geburtsdatum] DATE,
    [KAP_2_2_Qualifikation] NVARCHAR(50),
    [KAP_2_2_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_2_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_2_Extern] SMALLINT,
    [KAP_2_3_Anrede] NVARCHAR(20),
    [KAP_2_3_Titel] NVARCHAR(50),
    [KAP_2_3_Nachname] NVARCHAR(100),
    [KAP_2_3_Vorname] NVARCHAR(100),
    [KAP_2_3_Geburtsdatum] DATE,
    [KAP_2_3_Qualifikation] NVARCHAR(50),
    [KAP_2_3_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_3_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_3_Extern] SMALLINT,
    [KAP_2_4_Anrede] NVARCHAR(20),
    [KAP_2_4_Titel] NVARCHAR(50),
    [KAP_2_4_Nachname] NVARCHAR(100),
    [KAP_2_4_Vorname] NVARCHAR(100),
    [KAP_2_4_Geburtsdatum] DATE,
    [KAP_2_4_Qualifikation] NVARCHAR(50),
    [KAP_2_4_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_4_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_4_Extern] SMALLINT,
    [KAP_2_5_Anrede] NVARCHAR(20),
    [KAP_2_5_Titel] NVARCHAR(50),
    [KAP_2_5_Nachname] NVARCHAR(100),
    [KAP_2_5_Vorname] NVARCHAR(100),
    [KAP_2_5_Geburtsdatum] DATE,
    [KAP_2_5_Qualifikation] NVARCHAR(50),
    [KAP_2_5_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_5_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_5_Extern] SMALLINT,
    [KAP_2_6_Anrede] NVARCHAR(20),
    [KAP_2_6_Titel] NVARCHAR(50),
    [KAP_2_6_Nachname] NVARCHAR(100),
    [KAP_2_6_Vorname] NVARCHAR(100),
    [KAP_2_6_Geburtsdatum] DATE,
    [KAP_2_6_Qualifikation] NVARCHAR(50),
    [KAP_2_6_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_6_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_6_Extern] SMALLINT,
    [KAP_2_7_Anrede] NVARCHAR(20),
    [KAP_2_7_Titel] NVARCHAR(50),
    [KAP_2_7_Nachname] NVARCHAR(100),
    [KAP_2_7_Vorname] NVARCHAR(100),
    [KAP_2_7_Geburtsdatum] DATE,
    [KAP_2_7_Qualifikation] NVARCHAR(50),
    [KAP_2_7_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_7_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_7_Extern] SMALLINT,
    [KAP_2_8_Anrede] NVARCHAR(20),
    [KAP_2_8_Titel] NVARCHAR(50),
    [KAP_2_8_Nachname] NVARCHAR(100),
    [KAP_2_8_Vorname] NVARCHAR(100),
    [KAP_2_8_Geburtsdatum] DATE,
    [KAP_2_8_Qualifikation] NVARCHAR(50),
    [KAP_2_8_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_8_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_8_Extern] SMALLINT,
    [KAP_3_1_Anrede] NVARCHAR(20),
    [KAP_3_1_Titel] NVARCHAR(50),
    [KAP_3_1_Nachname] NVARCHAR(100),
    [KAP_3_1_Vorname] NVARCHAR(100),
    [KAP_3_1_Geburtsdatum] DATE,
    [KAP_3_1_Qualifikation] NVARCHAR(50),
    [KAP_3_1_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_1_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_1_Extern] SMALLINT,
    [KAP_3_2_Anrede] NVARCHAR(20),
    [KAP_3_2_Titel] NVARCHAR(50),
    [KAP_3_2_Nachname] NVARCHAR(100),
    [KAP_3_2_Vorname] NVARCHAR(100),
    [KAP_3_2_Geburtsdatum] DATE,
    [KAP_3_2_Qualifikation] NVARCHAR(50),
    [KAP_3_2_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_2_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_2_Extern] SMALLINT,
    [KAP_3_3_Anrede] NVARCHAR(20),
    [KAP_3_3_Titel] NVARCHAR(50),
    [KAP_3_3_Nachname] NVARCHAR(100),
    [KAP_3_3_Vorname] NVARCHAR(100),
    [KAP_3_3_Geburtsdatum] DATE,
    [KAP_3_3_Qualifikation] NVARCHAR(50),
    [KAP_3_3_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_3_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_3_Extern] SMALLINT,
    [KAP_3_4_Anrede] NVARCHAR(20),
    [KAP_3_4_Titel] NVARCHAR(50),
    [KAP_3_4_Nachname] NVARCHAR(100),
    [KAP_3_4_Vorname] NVARCHAR(100),
    [KAP_3_4_Geburtsdatum] DATE,
    [KAP_3_4_Qualifikation] NVARCHAR(50),
    [KAP_3_4_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_4_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_4_Extern] SMALLINT,
    [KAP_3_5_Anrede] NVARCHAR(20),
    [KAP_3_5_Titel] NVARCHAR(50),
    [KAP_3_5_Nachname] NVARCHAR(100),
    [KAP_3_5_Vorname] NVARCHAR(100),
    [KAP_3_5_Geburtsdatum] DATE,
    [KAP_3_5_Qualifikation] NVARCHAR(50),
    [KAP_3_5_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_5_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_5_Extern] SMALLINT,
    [KAP_3_6_Anrede] NVARCHAR(20),
    [KAP_3_6_Titel] NVARCHAR(50),
    [KAP_3_6_Nachname] NVARCHAR(100),
    [KAP_3_6_Vorname] NVARCHAR(100),
    [KAP_3_6_Geburtsdatum] DATE,
    [KAP_3_6_Qualifikation] NVARCHAR(50),
    [KAP_3_6_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_6_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_6_Extern] SMALLINT,
    [KAP_3_7_Anrede] NVARCHAR(20),
    [KAP_3_7_Titel] NVARCHAR(50),
    [KAP_3_7_Nachname] NVARCHAR(100),
    [KAP_3_7_Vorname] NVARCHAR(100),
    [KAP_3_7_Geburtsdatum] DATE,
    [KAP_3_7_Qualifikation] NVARCHAR(50),
    [KAP_3_7_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_7_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_7_Extern] SMALLINT,
    [KAP_3_8_Anrede] NVARCHAR(20),
    [KAP_3_8_Titel] NVARCHAR(50),
    [KAP_3_8_Nachname] NVARCHAR(100),
    [KAP_3_8_Vorname] NVARCHAR(100),
    [KAP_3_8_Geburtsdatum] DATE,
    [KAP_3_8_Qualifikation] NVARCHAR(50),
    [KAP_3_8_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_8_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_8_Extern] SMALLINT,
    [KAP_3_9_Anrede] NVARCHAR(20),
    [KAP_3_9_Titel] NVARCHAR(50),
    [KAP_3_9_Nachname] NVARCHAR(100),
    [KAP_3_9_Vorname] NVARCHAR(100),
    [KAP_3_9_Geburtsdatum] DATE,
    [KAP_3_9_Qualifikation] NVARCHAR(50),
    [KAP_3_9_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_9_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_9_Extern] SMALLINT,
    [KAP_3_10_Anrede] NVARCHAR(20),
    [KAP_3_10_Titel] NVARCHAR(50),
    [KAP_3_10_Nachname] NVARCHAR(100),
    [KAP_3_10_Vorname] NVARCHAR(100),
    [KAP_3_10_Geburtsdatum] DATE,
    [KAP_3_10_Qualifikation] NVARCHAR(50),
    [KAP_3_10_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_10_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_10_Extern] SMALLINT,
    [KAP_3_11_Anrede] NVARCHAR(20),
    [KAP_3_11_Titel] NVARCHAR(50),
    [KAP_3_11_Nachname] NVARCHAR(100),
    [KAP_3_11_Vorname] NVARCHAR(100),
    [KAP_3_11_Geburtsdatum] DATE,
    [KAP_3_11_Qualifikation] NVARCHAR(50),
    [KAP_3_11_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_11_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_11_Extern] SMALLINT,
    [KAP_3_12_Anrede] NVARCHAR(20),
    [KAP_3_12_Titel] NVARCHAR(50),
    [KAP_3_12_Nachname] NVARCHAR(100),
    [KAP_3_12_Vorname] NVARCHAR(100),
    [KAP_3_12_Geburtsdatum] DATE,
    [KAP_3_12_Qualifikation] NVARCHAR(50),
    [KAP_3_12_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_12_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_12_Extern] SMALLINT,
    [KAP_3_13_Anrede] NVARCHAR(20),
    [KAP_3_13_Titel] NVARCHAR(50),
    [KAP_3_13_Nachname] NVARCHAR(100),
    [KAP_3_13_Vorname] NVARCHAR(100),
    [KAP_3_13_Geburtsdatum] DATE,
    [KAP_3_13_Qualifikation] NVARCHAR(50),
    [KAP_3_13_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_13_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_13_Extern] SMALLINT,
    [KAP_3_14_Anrede] NVARCHAR(20),
    [KAP_3_14_Titel] NVARCHAR(50),
    [KAP_3_14_Nachname] NVARCHAR(100),
    [KAP_3_14_Vorname] NVARCHAR(100),
    [KAP_3_14_Geburtsdatum] DATE,
    [KAP_3_14_Qualifikation] NVARCHAR(50),
    [KAP_3_14_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_14_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_14_Extern] SMALLINT,
    [KAP_3_15_Anrede] NVARCHAR(20),
    [KAP_3_15_Titel] NVARCHAR(50),
    [KAP_3_15_Nachname] NVARCHAR(100),
    [KAP_3_15_Vorname] NVARCHAR(100),
    [KAP_3_15_Geburtsdatum] DATE,
    [KAP_3_15_Qualifikation] NVARCHAR(50),
    [KAP_3_15_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_15_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_15_Extern] SMALLINT,
    [KAP_3_16_Anrede] NVARCHAR(20),
    [KAP_3_16_Titel] NVARCHAR(50),
    [KAP_3_16_Nachname] NVARCHAR(100),
    [KAP_3_16_Vorname] NVARCHAR(100),
    [KAP_3_16_Geburtsdatum] DATE,
    [KAP_3_16_Qualifikation] NVARCHAR(50),
    [KAP_3_16_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_16_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_16_Extern] SMALLINT,
    [KAP_3_17_Anrede] NVARCHAR(20),
    [KAP_3_17_Titel] NVARCHAR(50),
    [KAP_3_17_Nachname] NVARCHAR(100),
    [KAP_3_17_Vorname] NVARCHAR(100),
    [KAP_3_17_Geburtsdatum] DATE,
    [KAP_3_17_Qualifikation] NVARCHAR(50),
    [KAP_3_17_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_17_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_17_Extern] SMALLINT,
    [KAP_3_18_Anrede] NVARCHAR(20),
    [KAP_3_18_Titel] NVARCHAR(50),
    [KAP_3_18_Nachname] NVARCHAR(100),
    [KAP_3_18_Vorname] NVARCHAR(100),
    [KAP_3_18_Geburtsdatum] DATE,
    [KAP_3_18_Qualifikation] NVARCHAR(50),
    [KAP_3_18_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_18_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_18_Extern] SMALLINT,
    [KAP_3_19_Anrede] NVARCHAR(20),
    [KAP_3_19_Titel] NVARCHAR(50),
    [KAP_3_19_Nachname] NVARCHAR(100),
    [KAP_3_19_Vorname] NVARCHAR(100),
    [KAP_3_19_Geburtsdatum] DATE,
    [KAP_3_19_Qualifikation] NVARCHAR(50),
    [KAP_3_19_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_19_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_19_Extern] SMALLINT,
    [KAP_3_20_Anrede] NVARCHAR(20),
    [KAP_3_20_Titel] NVARCHAR(50),
    [KAP_3_20_Nachname] NVARCHAR(100),
    [KAP_3_20_Vorname] NVARCHAR(100),
    [KAP_3_20_Geburtsdatum] DATE,
    [KAP_3_20_Qualifikation] NVARCHAR(50),
    [KAP_3_20_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_20_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_20_Extern] SMALLINT,
    [KAP_3_21_Anrede] NVARCHAR(20),
    [KAP_3_21_Titel] NVARCHAR(50),
    [KAP_3_21_Nachname] NVARCHAR(100),
    [KAP_3_21_Vorname] NVARCHAR(100),
    [KAP_3_21_Geburtsdatum] DATE,
    [KAP_3_21_Qualifikation] NVARCHAR(50),
    [KAP_3_21_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_21_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_21_Extern] SMALLINT,
    [KAP_3_22_Anrede] NVARCHAR(20),
    [KAP_3_22_Titel] NVARCHAR(50),
    [KAP_3_22_Nachname] NVARCHAR(100),
    [KAP_3_22_Vorname] NVARCHAR(100),
    [KAP_3_22_Geburtsdatum] DATE,
    [KAP_3_22_Qualifikation] NVARCHAR(50),
    [KAP_3_22_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_22_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_22_Extern] SMALLINT,
    [KAP_3_23_Anrede] NVARCHAR(20),
    [KAP_3_23_Titel] NVARCHAR(50),
    [KAP_3_23_Nachname] NVARCHAR(100),
    [KAP_3_23_Vorname] NVARCHAR(100),
    [KAP_3_23_Geburtsdatum] DATE,
    [KAP_3_23_Qualifikation] NVARCHAR(50),
    [KAP_3_23_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_23_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_23_Extern] SMALLINT,
    [KAP_3_24_Anrede] NVARCHAR(20),
    [KAP_3_24_Titel] NVARCHAR(50),
    [KAP_3_24_Nachname] NVARCHAR(100),
    [KAP_3_24_Vorname] NVARCHAR(100),
    [KAP_3_24_Geburtsdatum] DATE,
    [KAP_3_24_Qualifikation] NVARCHAR(50),
    [KAP_3_24_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_24_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_24_Extern] SMALLINT,
    [KAP_3_25_Anrede] NVARCHAR(20),
    [KAP_3_25_Titel] NVARCHAR(50),
    [KAP_3_25_Nachname] NVARCHAR(100),
    [KAP_3_25_Vorname] NVARCHAR(100),
    [KAP_3_25_Geburtsdatum] DATE,
    [KAP_3_25_Qualifikation] NVARCHAR(50),
    [KAP_3_25_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_25_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_25_Extern] SMALLINT,
    [KAP_3_26_Anrede] NVARCHAR(20),
    [KAP_3_26_Titel] NVARCHAR(50),
    [KAP_3_26_Nachname] NVARCHAR(100),
    [KAP_3_26_Vorname] NVARCHAR(100),
    [KAP_3_26_Geburtsdatum] DATE,
    [KAP_3_26_Qualifikation] NVARCHAR(50),
    [KAP_3_26_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_26_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_26_Extern] SMALLINT,
    [KAP_3_27_Anrede] NVARCHAR(20),
    [KAP_3_27_Titel] NVARCHAR(50),
    [KAP_3_27_Nachname] NVARCHAR(100),
    [KAP_3_27_Vorname] NVARCHAR(100),
    [KAP_3_27_Geburtsdatum] DATE,
    [KAP_3_27_Qualifikation] NVARCHAR(50),
    [KAP_3_27_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_27_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_27_Extern] SMALLINT,
    [KAP_3_28_Anrede] NVARCHAR(20),
    [KAP_3_28_Titel] NVARCHAR(50),
    [KAP_3_28_Nachname] NVARCHAR(100),
    [KAP_3_28_Vorname] NVARCHAR(100),
    [KAP_3_28_Geburtsdatum] DATE,
    [KAP_3_28_Qualifikation] NVARCHAR(50),
    [KAP_3_28_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_28_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_28_Extern] SMALLINT,
    [KAP_3_29_Anrede] NVARCHAR(20),
    [KAP_3_29_Titel] NVARCHAR(50),
    [KAP_3_29_Nachname] NVARCHAR(100),
    [KAP_3_29_Vorname] NVARCHAR(100),
    [KAP_3_29_Geburtsdatum] DATE,
    [KAP_3_29_Qualifikation] NVARCHAR(50),
    [KAP_3_29_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_29_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_29_Extern] SMALLINT,
    [KAP_3_30_Anrede] NVARCHAR(20),
    [KAP_3_30_Titel] NVARCHAR(50),
    [KAP_3_30_Nachname] NVARCHAR(100),
    [KAP_3_30_Vorname] NVARCHAR(100),
    [KAP_3_30_Geburtsdatum] DATE,
    [KAP_3_30_Qualifikation] NVARCHAR(50),
    [KAP_3_30_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_30_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_30_Extern] SMALLINT,
    [KAP_3_31_Anrede] NVARCHAR(20),
    [KAP_3_31_Titel] NVARCHAR(50),
    [KAP_3_31_Nachname] NVARCHAR(100),
    [KAP_3_31_Vorname] NVARCHAR(100),
    [KAP_3_31_Geburtsdatum] DATE,
    [KAP_3_31_Qualifikation] NVARCHAR(50),
    [KAP_3_31_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_31_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_31_Extern] SMALLINT,
    [KAP_3_32_Anrede] NVARCHAR(20),
    [KAP_3_32_Titel] NVARCHAR(50),
    [KAP_3_32_Nachname] NVARCHAR(100),
    [KAP_3_32_Vorname] NVARCHAR(100),
    [KAP_3_32_Geburtsdatum] DATE,
    [KAP_3_32_Qualifikation] NVARCHAR(50),
    [KAP_3_32_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_32_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_32_Extern] SMALLINT
);

-- CreateTable
CREATE TABLE [dbo].[bescheinigungen_alt] (
    [id] INT NOT NULL,
    [Firma] NVARCHAR(250),
    [Straße] NVARCHAR(150),
    [Postleitzahl] NVARCHAR(50),
    [Ort] NVARCHAR(100),
    [Land] NVARCHAR(50),
    [Klasse] NVARCHAR(25),
    [Unterklasse] NVARCHAR(25),
    [A1] NVARCHAR(12),
    [A2] NVARCHAR(12),
    [A3] NVARCHAR(12),
    [Hauptfunktion] NVARCHAR(110),
    [Vorbehandlungsverfahren] NVARCHAR(110),
    [Fertigungsverfahren] NVARCHAR(110),
    [Prüfverfahren] NVARCHAR(110),
    [Mechanisierungsgrad] NVARCHAR(110),
    [Deutsche Bemerkungen] TEXT,
    [Englische Bemerkungen] TEXT,
    [Bescheinigungnummer] NVARCHAR(30),
    [Gültig ab] DATE,
    [Gültig bis] DATE,
    [1. Auditor] NVARCHAR(100),
    [2. Auditor] NVARCHAR(100),
    [Zertifiziert durch] NVARCHAR(100),
    [Ausgestellt durch] NVARCHAR(100),
    [Ausstellungsdatum] DATE,
    [Änderungsdatum] DATE,
    [Zurückgezogendatum] DATE,
    [KAP_1_1_Anrede] NVARCHAR(20),
    [KAP_1_1_Titel] NVARCHAR(50),
    [KAP_1_1_Nachname] NVARCHAR(100),
    [KAP_1_1_Vorname] NVARCHAR(100),
    [KAP_1_1_Geburtsdatum] DATE,
    [KAP_1_1_Qualifikation] NVARCHAR(50),
    [KAP_1_1_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_1_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_1_Extern] SMALLINT,
    [KAP_1_2_Anrede] NVARCHAR(20),
    [KAP_1_2_Titel] NVARCHAR(50),
    [KAP_1_2_Nachname] NVARCHAR(100),
    [KAP_1_2_Vorname] NVARCHAR(100),
    [KAP_1_2_Geburtsdatum] DATE,
    [KAP_1_2_Qualifikation] NVARCHAR(50),
    [KAP_1_2_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_2_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_2_Extern] SMALLINT,
    [KAP_1_3_Anrede] NVARCHAR(20),
    [KAP_1_3_Titel] NVARCHAR(50),
    [KAP_1_3_Nachname] NVARCHAR(100),
    [KAP_1_3_Vorname] NVARCHAR(100),
    [KAP_1_3_Geburtsdatum] DATE,
    [KAP_1_3_Qualifikation] NVARCHAR(50),
    [KAP_1_3_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_3_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_3_Extern] SMALLINT,
    [KAP_1_4_Anrede] NVARCHAR(20),
    [KAP_1_4_Titel] NVARCHAR(50),
    [KAP_1_4_Nachname] NVARCHAR(100),
    [KAP_1_4_Vorname] NVARCHAR(100),
    [KAP_1_4_Geburtsdatum] DATE,
    [KAP_1_4_Qualifikation] NVARCHAR(50),
    [KAP_1_4_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_1_4_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_1_4_Extern] SMALLINT,
    [KAP_2_1_Anrede] NVARCHAR(20),
    [KAP_2_1_Titel] NVARCHAR(50),
    [KAP_2_1_Nachname] NVARCHAR(100),
    [KAP_2_1_Vorname] NVARCHAR(100),
    [KAP_2_1_Geburtsdatum] DATE,
    [KAP_2_1_Qualifikation] NVARCHAR(50),
    [KAP_2_1_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_1_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_1_Extern] SMALLINT,
    [KAP_2_2_Anrede] NVARCHAR(20),
    [KAP_2_2_Titel] NVARCHAR(50),
    [KAP_2_2_Nachname] NVARCHAR(100),
    [KAP_2_2_Vorname] NVARCHAR(100),
    [KAP_2_2_Geburtsdatum] DATE,
    [KAP_2_2_Qualifikation] NVARCHAR(50),
    [KAP_2_2_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_2_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_2_Extern] SMALLINT,
    [KAP_2_3_Anrede] NVARCHAR(20),
    [KAP_2_3_Titel] NVARCHAR(50),
    [KAP_2_3_Nachname] NVARCHAR(100),
    [KAP_2_3_Vorname] NVARCHAR(100),
    [KAP_2_3_Geburtsdatum] DATE,
    [KAP_2_3_Qualifikation] NVARCHAR(50),
    [KAP_2_3_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_3_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_3_Extern] SMALLINT,
    [KAP_2_4_Anrede] NVARCHAR(20),
    [KAP_2_4_Titel] NVARCHAR(50),
    [KAP_2_4_Nachname] NVARCHAR(100),
    [KAP_2_4_Vorname] NVARCHAR(100),
    [KAP_2_4_Geburtsdatum] DATE,
    [KAP_2_4_Qualifikation] NVARCHAR(50),
    [KAP_2_4_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_4_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_4_Extern] SMALLINT,
    [KAP_2_5_Anrede] NVARCHAR(20),
    [KAP_2_5_Titel] NVARCHAR(50),
    [KAP_2_5_Nachname] NVARCHAR(100),
    [KAP_2_5_Vorname] NVARCHAR(100),
    [KAP_2_5_Geburtsdatum] DATE,
    [KAP_2_5_Qualifikation] NVARCHAR(50),
    [KAP_2_5_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_5_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_5_Extern] SMALLINT,
    [KAP_2_6_Anrede] NVARCHAR(20),
    [KAP_2_6_Titel] NVARCHAR(50),
    [KAP_2_6_Nachname] NVARCHAR(100),
    [KAP_2_6_Vorname] NVARCHAR(100),
    [KAP_2_6_Geburtsdatum] DATE,
    [KAP_2_6_Qualifikation] NVARCHAR(50),
    [KAP_2_6_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_6_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_6_Extern] SMALLINT,
    [KAP_2_7_Anrede] NVARCHAR(20),
    [KAP_2_7_Titel] NVARCHAR(50),
    [KAP_2_7_Nachname] NVARCHAR(100),
    [KAP_2_7_Vorname] NVARCHAR(100),
    [KAP_2_7_Geburtsdatum] DATE,
    [KAP_2_7_Qualifikation] NVARCHAR(50),
    [KAP_2_7_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_7_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_7_Extern] SMALLINT,
    [KAP_2_8_Anrede] NVARCHAR(20),
    [KAP_2_8_Titel] NVARCHAR(50),
    [KAP_2_8_Nachname] NVARCHAR(100),
    [KAP_2_8_Vorname] NVARCHAR(100),
    [KAP_2_8_Geburtsdatum] DATE,
    [KAP_2_8_Qualifikation] NVARCHAR(50),
    [KAP_2_8_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_2_8_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_2_8_Extern] SMALLINT,
    [KAP_3_1_Anrede] NVARCHAR(20),
    [KAP_3_1_Titel] NVARCHAR(50),
    [KAP_3_1_Nachname] NVARCHAR(100),
    [KAP_3_1_Vorname] NVARCHAR(100),
    [KAP_3_1_Geburtsdatum] DATE,
    [KAP_3_1_Qualifikation] NVARCHAR(50),
    [KAP_3_1_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_1_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_1_Extern] SMALLINT,
    [KAP_3_2_Anrede] NVARCHAR(20),
    [KAP_3_2_Titel] NVARCHAR(50),
    [KAP_3_2_Nachname] NVARCHAR(100),
    [KAP_3_2_Vorname] NVARCHAR(100),
    [KAP_3_2_Geburtsdatum] DATE,
    [KAP_3_2_Qualifikation] NVARCHAR(50),
    [KAP_3_2_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_2_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_2_Extern] SMALLINT,
    [KAP_3_3_Anrede] NVARCHAR(20),
    [KAP_3_3_Titel] NVARCHAR(50),
    [KAP_3_3_Nachname] NVARCHAR(100),
    [KAP_3_3_Vorname] NVARCHAR(100),
    [KAP_3_3_Geburtsdatum] DATE,
    [KAP_3_3_Qualifikation] NVARCHAR(50),
    [KAP_3_3_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_3_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_3_Extern] SMALLINT,
    [KAP_3_4_Anrede] NVARCHAR(20),
    [KAP_3_4_Titel] NVARCHAR(50),
    [KAP_3_4_Nachname] NVARCHAR(100),
    [KAP_3_4_Vorname] NVARCHAR(100),
    [KAP_3_4_Geburtsdatum] DATE,
    [KAP_3_4_Qualifikation] NVARCHAR(50),
    [KAP_3_4_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_4_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_4_Extern] SMALLINT,
    [KAP_3_5_Anrede] NVARCHAR(20),
    [KAP_3_5_Titel] NVARCHAR(50),
    [KAP_3_5_Nachname] NVARCHAR(100),
    [KAP_3_5_Vorname] NVARCHAR(100),
    [KAP_3_5_Geburtsdatum] DATE,
    [KAP_3_5_Qualifikation] NVARCHAR(50),
    [KAP_3_5_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_5_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_5_Extern] SMALLINT,
    [KAP_3_6_Anrede] NVARCHAR(20),
    [KAP_3_6_Titel] NVARCHAR(50),
    [KAP_3_6_Nachname] NVARCHAR(100),
    [KAP_3_6_Vorname] NVARCHAR(100),
    [KAP_3_6_Geburtsdatum] DATE,
    [KAP_3_6_Qualifikation] NVARCHAR(50),
    [KAP_3_6_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_6_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_6_Extern] SMALLINT,
    [KAP_3_7_Anrede] NVARCHAR(20),
    [KAP_3_7_Titel] NVARCHAR(50),
    [KAP_3_7_Nachname] NVARCHAR(100),
    [KAP_3_7_Vorname] NVARCHAR(100),
    [KAP_3_7_Geburtsdatum] DATE,
    [KAP_3_7_Qualifikation] NVARCHAR(50),
    [KAP_3_7_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_7_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_7_Extern] SMALLINT,
    [KAP_3_8_Anrede] NVARCHAR(20),
    [KAP_3_8_Titel] NVARCHAR(50),
    [KAP_3_8_Nachname] NVARCHAR(100),
    [KAP_3_8_Vorname] NVARCHAR(100),
    [KAP_3_8_Geburtsdatum] DATE,
    [KAP_3_8_Qualifikation] NVARCHAR(50),
    [KAP_3_8_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_8_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_8_Extern] SMALLINT,
    [KAP_3_9_Anrede] NVARCHAR(20),
    [KAP_3_9_Titel] NVARCHAR(50),
    [KAP_3_9_Nachname] NVARCHAR(100),
    [KAP_3_9_Vorname] NVARCHAR(100),
    [KAP_3_9_Geburtsdatum] DATE,
    [KAP_3_9_Qualifikation] NVARCHAR(50),
    [KAP_3_9_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_9_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_9_Extern] SMALLINT,
    [KAP_3_10_Anrede] NVARCHAR(20),
    [KAP_3_10_Titel] NVARCHAR(50),
    [KAP_3_10_Nachname] NVARCHAR(100),
    [KAP_3_10_Vorname] NVARCHAR(100),
    [KAP_3_10_Geburtsdatum] DATE,
    [KAP_3_10_Qualifikation] NVARCHAR(50),
    [KAP_3_10_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_10_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_10_Extern] SMALLINT,
    [KAP_3_11_Anrede] NVARCHAR(20),
    [KAP_3_11_Titel] NVARCHAR(50),
    [KAP_3_11_Nachname] NVARCHAR(100),
    [KAP_3_11_Vorname] NVARCHAR(100),
    [KAP_3_11_Geburtsdatum] DATE,
    [KAP_3_11_Qualifikation] NVARCHAR(50),
    [KAP_3_11_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_11_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_11_Extern] SMALLINT,
    [KAP_3_12_Anrede] NVARCHAR(20),
    [KAP_3_12_Titel] NVARCHAR(50),
    [KAP_3_12_Nachname] NVARCHAR(100),
    [KAP_3_12_Vorname] NVARCHAR(100),
    [KAP_3_12_Geburtsdatum] DATE,
    [KAP_3_12_Qualifikation] NVARCHAR(50),
    [KAP_3_12_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_12_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_12_Extern] SMALLINT,
    [KAP_3_13_Anrede] NVARCHAR(20),
    [KAP_3_13_Titel] NVARCHAR(50),
    [KAP_3_13_Nachname] NVARCHAR(100),
    [KAP_3_13_Vorname] NVARCHAR(100),
    [KAP_3_13_Geburtsdatum] DATE,
    [KAP_3_13_Qualifikation] NVARCHAR(50),
    [KAP_3_13_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_13_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_13_Extern] SMALLINT,
    [KAP_3_14_Anrede] NVARCHAR(20),
    [KAP_3_14_Titel] NVARCHAR(50),
    [KAP_3_14_Nachname] NVARCHAR(100),
    [KAP_3_14_Vorname] NVARCHAR(100),
    [KAP_3_14_Geburtsdatum] DATE,
    [KAP_3_14_Qualifikation] NVARCHAR(50),
    [KAP_3_14_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_14_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_14_Extern] SMALLINT,
    [KAP_3_15_Anrede] NVARCHAR(20),
    [KAP_3_15_Titel] NVARCHAR(50),
    [KAP_3_15_Nachname] NVARCHAR(100),
    [KAP_3_15_Vorname] NVARCHAR(100),
    [KAP_3_15_Geburtsdatum] DATE,
    [KAP_3_15_Qualifikation] NVARCHAR(50),
    [KAP_3_15_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_15_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_15_Extern] SMALLINT,
    [KAP_3_16_Anrede] NVARCHAR(20),
    [KAP_3_16_Titel] NVARCHAR(50),
    [KAP_3_16_Nachname] NVARCHAR(100),
    [KAP_3_16_Vorname] NVARCHAR(100),
    [KAP_3_16_Geburtsdatum] DATE,
    [KAP_3_16_Qualifikation] NVARCHAR(50),
    [KAP_3_16_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_16_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_16_Extern] SMALLINT,
    [KAP_3_17_Anrede] NVARCHAR(20),
    [KAP_3_17_Titel] NVARCHAR(50),
    [KAP_3_17_Nachname] NVARCHAR(100),
    [KAP_3_17_Vorname] NVARCHAR(100),
    [KAP_3_17_Geburtsdatum] DATE,
    [KAP_3_17_Qualifikation] NVARCHAR(50),
    [KAP_3_17_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_17_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_17_Extern] SMALLINT,
    [KAP_3_18_Anrede] NVARCHAR(20),
    [KAP_3_18_Titel] NVARCHAR(50),
    [KAP_3_18_Nachname] NVARCHAR(100),
    [KAP_3_18_Vorname] NVARCHAR(100),
    [KAP_3_18_Geburtsdatum] DATE,
    [KAP_3_18_Qualifikation] NVARCHAR(50),
    [KAP_3_18_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_18_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_18_Extern] SMALLINT,
    [KAP_3_19_Anrede] NVARCHAR(20),
    [KAP_3_19_Titel] NVARCHAR(50),
    [KAP_3_19_Nachname] NVARCHAR(100),
    [KAP_3_19_Vorname] NVARCHAR(100),
    [KAP_3_19_Geburtsdatum] DATE,
    [KAP_3_19_Qualifikation] NVARCHAR(50),
    [KAP_3_19_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_19_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_19_Extern] SMALLINT,
    [KAP_3_20_Anrede] NVARCHAR(20),
    [KAP_3_20_Titel] NVARCHAR(50),
    [KAP_3_20_Nachname] NVARCHAR(100),
    [KAP_3_20_Vorname] NVARCHAR(100),
    [KAP_3_20_Geburtsdatum] DATE,
    [KAP_3_20_Qualifikation] NVARCHAR(50),
    [KAP_3_20_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_20_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_20_Extern] SMALLINT,
    [KAP_3_21_Anrede] NVARCHAR(20),
    [KAP_3_21_Titel] NVARCHAR(50),
    [KAP_3_21_Nachname] NVARCHAR(100),
    [KAP_3_21_Vorname] NVARCHAR(100),
    [KAP_3_21_Geburtsdatum] DATE,
    [KAP_3_21_Qualifikation] NVARCHAR(50),
    [KAP_3_21_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_21_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_21_Extern] SMALLINT,
    [KAP_3_22_Anrede] NVARCHAR(20),
    [KAP_3_22_Titel] NVARCHAR(50),
    [KAP_3_22_Nachname] NVARCHAR(100),
    [KAP_3_22_Vorname] NVARCHAR(100),
    [KAP_3_22_Geburtsdatum] DATE,
    [KAP_3_22_Qualifikation] NVARCHAR(50),
    [KAP_3_22_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_22_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_22_Extern] SMALLINT,
    [KAP_3_23_Anrede] NVARCHAR(20),
    [KAP_3_23_Titel] NVARCHAR(50),
    [KAP_3_23_Nachname] NVARCHAR(100),
    [KAP_3_23_Vorname] NVARCHAR(100),
    [KAP_3_23_Geburtsdatum] DATE,
    [KAP_3_23_Qualifikation] NVARCHAR(50),
    [KAP_3_23_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_23_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_23_Extern] SMALLINT,
    [KAP_3_24_Anrede] NVARCHAR(20),
    [KAP_3_24_Titel] NVARCHAR(50),
    [KAP_3_24_Nachname] NVARCHAR(100),
    [KAP_3_24_Vorname] NVARCHAR(100),
    [KAP_3_24_Geburtsdatum] DATE,
    [KAP_3_24_Qualifikation] NVARCHAR(50),
    [KAP_3_24_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_24_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_24_Extern] SMALLINT,
    [KAP_3_25_Anrede] NVARCHAR(20),
    [KAP_3_25_Titel] NVARCHAR(50),
    [KAP_3_25_Nachname] NVARCHAR(100),
    [KAP_3_25_Vorname] NVARCHAR(100),
    [KAP_3_25_Geburtsdatum] DATE,
    [KAP_3_25_Qualifikation] NVARCHAR(50),
    [KAP_3_25_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_25_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_25_Extern] SMALLINT,
    [KAP_3_26_Anrede] NVARCHAR(20),
    [KAP_3_26_Titel] NVARCHAR(50),
    [KAP_3_26_Nachname] NVARCHAR(100),
    [KAP_3_26_Vorname] NVARCHAR(100),
    [KAP_3_26_Geburtsdatum] DATE,
    [KAP_3_26_Qualifikation] NVARCHAR(50),
    [KAP_3_26_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_26_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_26_Extern] SMALLINT,
    [KAP_3_27_Anrede] NVARCHAR(20),
    [KAP_3_27_Titel] NVARCHAR(50),
    [KAP_3_27_Nachname] NVARCHAR(100),
    [KAP_3_27_Vorname] NVARCHAR(100),
    [KAP_3_27_Geburtsdatum] DATE,
    [KAP_3_27_Qualifikation] NVARCHAR(50),
    [KAP_3_27_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_27_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_27_Extern] SMALLINT,
    [KAP_3_28_Anrede] NVARCHAR(20),
    [KAP_3_28_Titel] NVARCHAR(50),
    [KAP_3_28_Nachname] NVARCHAR(100),
    [KAP_3_28_Vorname] NVARCHAR(100),
    [KAP_3_28_Geburtsdatum] DATE,
    [KAP_3_28_Qualifikation] NVARCHAR(50),
    [KAP_3_28_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_28_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_28_Extern] SMALLINT,
    [KAP_3_29_Anrede] NVARCHAR(20),
    [KAP_3_29_Titel] NVARCHAR(50),
    [KAP_3_29_Nachname] NVARCHAR(100),
    [KAP_3_29_Vorname] NVARCHAR(100),
    [KAP_3_29_Geburtsdatum] DATE,
    [KAP_3_29_Qualifikation] NVARCHAR(50),
    [KAP_3_29_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_29_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_29_Extern] SMALLINT,
    [KAP_3_30_Anrede] NVARCHAR(20),
    [KAP_3_30_Titel] NVARCHAR(50),
    [KAP_3_30_Nachname] NVARCHAR(100),
    [KAP_3_30_Vorname] NVARCHAR(100),
    [KAP_3_30_Geburtsdatum] DATE,
    [KAP_3_30_Qualifikation] NVARCHAR(50),
    [KAP_3_30_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_30_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_30_Extern] SMALLINT,
    [KAP_3_31_Anrede] NVARCHAR(20),
    [KAP_3_31_Titel] NVARCHAR(50),
    [KAP_3_31_Nachname] NVARCHAR(100),
    [KAP_3_31_Vorname] NVARCHAR(100),
    [KAP_3_31_Geburtsdatum] DATE,
    [KAP_3_31_Qualifikation] NVARCHAR(50),
    [KAP_3_31_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_31_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_31_Extern] SMALLINT,
    [KAP_3_32_Anrede] NVARCHAR(20),
    [KAP_3_32_Titel] NVARCHAR(50),
    [KAP_3_32_Nachname] NVARCHAR(100),
    [KAP_3_32_Vorname] NVARCHAR(100),
    [KAP_3_32_Geburtsdatum] DATE,
    [KAP_3_32_Qualifikation] NVARCHAR(50),
    [KAP_3_32_DeutscherAufgabenbereich] NVARCHAR(250),
    [KAP_3_32_EnglischerAufgabenbereich] NVARCHAR(250),
    [KAP_3_32_Extern] SMALLINT
);

-- CreateTable
CREATE TABLE [dbo].[Bundesland] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Kurz] VARCHAR(50),
    [Bundesland] VARCHAR(50),
    [Ref_LKZ] NCHAR(5),
    [Bundesland_DE] NVARCHAR(100),
    [Bundesland_EN] NVARCHAR(100),
    [Bundesland_FR] NVARCHAR(100),
    [Bundesland_IT] NVARCHAR(100),
    [Bundesland_PL] NVARCHAR(100),
    [Bundesland_ES] NVARCHAR(100),
    [Bundesland_HU] NVARCHAR(200),
    CONSTRAINT [PK_Bundesland] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Adresse_Benutzer_6700_Paypal_Benutzer] (
    [Id] INT NOT NULL IDENTITY(1,1),
    [Ref_Benutzer] INT,
    [Ref_Firma] INT,
    CONSTRAINT [PK__Conn_Adr__3214EC073EF3C48E] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_AG_ENW] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Anwendungsgebiet] INT NOT NULL CONSTRAINT [DF__Conn_AG_E__Ref_A__1D1DCF77] DEFAULT 0,
    [Ref_ENW] INT NOT NULL CONSTRAINT [DF__Conn_AG_E__Ref_E__1E11F3B0] DEFAULT 0,
    [lngRow] INT NOT NULL CONSTRAINT [DF__Conn_AG_E__lngRo__1F0617E9] DEFAULT 0,
    [Ref_Sprache] INT,
    CONSTRAINT [PK_Conn_AG_ENW] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_AnonymRegister] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_A_Stelle] INT,
    [Ref_Norm] INT,
    [Ref_Person] INT,
    [anonymRegister] BIT,
    CONSTRAINT [PK_Conn_AnonymRegister] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Anwendung_Module] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Anwendung] INT NOT NULL,
    [Ref_Module] INT NOT NULL,
    CONSTRAINT [PK_Conn_Anwendung_Module] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Anwendung_Module_Benutzer] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Anwendung] INT,
    [Ref_Module] INT,
    [Ref_Benutzer] INT,
    [Ref_A_Stelle] INT,
    CONSTRAINT [PK_Conn_Anwendung_Module_Benutzer] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Anwendung_Module_Rolle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Anwendung] INT,
    [Ref_Module] INT,
    [Ref_Rolle] INT,
    CONSTRAINT [PK_Conn_Anwendung_Module_Rolle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Auditor_Norm_A_Stelle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Auditor] INT,
    [Ref_Norm] INT,
    [Ref_A_Stelle] INT,
    [aktiv] BIT,
    CONSTRAINT [PK_Conn_Auditor_Norm_A_Stelle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Auditor_Personentyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Person] INT,
    [Ref_PersonenTyp] INT,
    CONSTRAINT [PK_Conn_Auditor_Personentyp] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Auditor_Qualifikation] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Auditor] INT NOT NULL,
    [Ref_Qualifikation] INT NOT NULL,
    CONSTRAINT [PK_Conn_Auditor_Qualifikation] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Auditziel_ENW] (
    [ID] INT,
    [Ref_ENW] INT,
    [Ref_EN15085_Auditziel] INT,
    [Datum] DATE
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Auftragsart_ENW] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT,
    [Ref_EN15085_Auftragsart] INT,
    [Ref_A_Stelle] INT,
    [Ablaufdatum] DATE,
    CONSTRAINT [PK_Conn_Auftragsart_ENW] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Benutzer_6700] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Benutzer] INT CONSTRAINT [DF_Conn_Benutzer_6700_Ref_Benutzer] DEFAULT 0,
    [Ref_Firma] INT CONSTRAINT [DF_Conn_Benutzer_6700_Ref_Firma] DEFAULT 0,
    [Ref_A_Stelle] INT CONSTRAINT [DF_Conn_Benutzer_6700_Ref_A_Stelle] DEFAULT 0,
    [master] BIT CONSTRAINT [DF_Conn_Benutzer_6700_master] DEFAULT 0,
    [POS2] BIT,
    CONSTRAINT [PK_Conn_Benutzer_6700] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_BMM] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Benutzer] INT,
    [Ref_Mandant] INT,
    [Ref_Mandantentyp] INT,
    CONSTRAINT [PK_Conn_BAMM] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_DIN6701_CERT_DIN6701_AG_DIN6701_Klasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_DIN6701_CERT] INT NOT NULL,
    [Ref_DIN6701_Klasse] INT NOT NULL,
    [Ref_DIN6701_Anwendungsgebiet] INT NOT NULL,
    [row] INT,
    CONSTRAINT [PK_Conn_DIN6701_CERT_DIN6701_AG_DIN6701_Klasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_DIN6701_CERT_DIN6701_Anwendungsgebiet] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_DIN6701_CERT] INT NOT NULL,
    [Ref_DIN_Anwendungsgebiet] INT NOT NULL,
    [row] INT,
    CONSTRAINT [PK_Conn_DIN6701_CERT_DIN6701_Anwendungsgebiet] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_DIN6701_CERT_DIN6701_Geltungsbereich] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_DIN6701_CERT] INT NOT NULL,
    [Ref_DIN6701_Geltungsbereich] INT NOT NULL,
    [row] INT,
    CONSTRAINT [PK_Conn_DIN6701_CERT_DIN6701_Geltungsbereich] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_DIN6701_CERT_Person] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_DIN6701_CERT] INT NOT NULL,
    [Ref_Person] INT NOT NULL,
    [Ref_Personentyp] INT NOT NULL,
    [row] INT,
    [extern] BIT,
    CONSTRAINT [PK_Conn_DIN6701_CERT_Person] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_DIN6701_CERT_Status] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_DIN6701_CERT] INT NOT NULL,
    [Ref_Status] INT NOT NULL,
    [erstellt_am] DATETIME NOT NULL CONSTRAINT [DF_Conn_DIN6701_CERT_Status_erstellt_am] DEFAULT CURRENT_TIMESTAMP,
    [erstellt_von] NVARCHAR(50),
    CONSTRAINT [PK_Conn_DIN6701_CERT_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN1090_CERT_Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_EN1090_CERT] INT,
    [Ref_Firma] INT,
    [CompanyCode] VARCHAR(50),
    CONSTRAINT [PK_Conn_EN1090_CERT_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN1090_CERT_Status] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_EN1090_CERT] INT,
    [Ref_EN1090_Status] INT,
    [INSERT_DATUM] DATETIME,
    CONSTRAINT [PK_Conn_EN1090_CERT_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN1090_CERT_WSG] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_EN1090_CERT] INT,
    [Ref_EN1090_WSG] INT,
    CONSTRAINT [PK_Conn_EN1090_CERT_WSG] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN1090_Firma_Kundennummer] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_A_Stelle] INT,
    [Ref_Firma] INT,
    [Kundennummer] VARCHAR(50),
    [CODE] VARCHAR(50),
    CONSTRAINT [PK_Conn_EN1090_Firma_Kundennummer] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN1090_Person] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Person] INT,
    [Ref_EN1090_CERT] INT,
    [Ref_Personentyp] INT,
    [Ref_Aufgabe] INT,
    CONSTRAINT [PK_Conn_EN1090_Person] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN1090_Translation] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_EN1090_Label] INT,
    [Ref_EN1090_Funktion] INT,
    [Ref_EN1090_Sprache] INT,
    [Ref_EN1090_Text] INT,
    CONSTRAINT [PK_Conn_EN1090_Translation] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN15085_Auftragsart_ENW] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT,
    [Ref_EN15085_WIC] INT,
    CONSTRAINT [PK_Conn_EN15085_Auftragsart_ENW] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN15085_WIC_ENW] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT,
    [Ref_EN15085_WIC] INT,
    CONSTRAINT [PK_Conn_EN15085_WIC_ENW] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_EN15085_WPC_ENW] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT,
    [Ref_EN15085_WPC] INT,
    CONSTRAINT [PK_Conn_EN15085_WPC_ENW] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_ENW_Activity] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT,
    [Ref_Activity] INT,
    CONSTRAINT [PK_Conn_ENW_Activity] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_ENW_Person] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Person] INT,
    [Ref_ENW] INT,
    [Ref_Personentyp] INT,
    [Ref_Aufgabe] INT NOT NULL CONSTRAINT [DF_Conn_ENW_Person_Ref_Aufgabe] DEFAULT 1,
    [status_Person] BIT,
    [anonymCert] BIT,
    [AbnahmeberechtigungPruefungen] BIT,
    [Ref_Stufe] INT,
    CONSTRAINT [PK_Conn_ENW_Person] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_ENW_Sprache] (
    [ID] INT NOT NULL,
    [Ref_ENW] INT,
    [Ref_Sprache] INT,
    CONSTRAINT [PK_Conn_ENW_Sprache] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_ENW_Taetigkeitsbereiche_Werkstatt] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Taetigkeitsbereiche] INT,
    [Ref_ENW] INT,
    [Ref_Werkstatt] INT,
    CONSTRAINT [PK_Conn_ENW_Taetigkeitsbereiche_Werkstatt] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Firmenaudit] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [Ref_ENW] INT,
    [aktiv] BIT CONSTRAINT [DF_Conn_Firmenaudit_aktiv] DEFAULT 1,
    CONSTRAINT [PK_Conn_Firmenaudit] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_FT] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [Ref_Taetigkeitsbereich] INT,
    [Ref_ENW] INT,
    CONSTRAINT [PK_Conn_FT] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Geltungsbereich_Norm] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Geltungsbereich] INT,
    [Ref_Norm] INT,
    CONSTRAINT [PK_Conn_Geltungsbereich_Norm] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_ISO3834_CERT_Status] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO3834_CERT] INT NOT NULL,
    [Ref_Status] INT NOT NULL,
    [erstellt_am] DATETIME NOT NULL CONSTRAINT [DF_Conn_ISO3834_CERT_Status_erstellt_am] DEFAULT CURRENT_TIMESTAMP,
    [erstellt_von] NVARCHAR(50),
    CONSTRAINT [PK_Conn_ISO3834_CERT_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Komm_ENW] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Kommentar] INT NOT NULL,
    [Ref_ENW] INT NOT NULL,
    [Ref_Kommentar_Typ] INT,
    [row] INT,
    CONSTRAINT [PK_Conn_Komm_ENW] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Kontakt_Person] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Person] INT,
    [Ref_KontaktTyp] INT,
    [KontaktWert] NVARCHAR(200) NOT NULL,
    CONSTRAINT [PK_Conn_Kontakt_Person] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Kundennummer] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [Ref_A_Stelle] INT,
    [Kundennummer] NVARCHAR(50),
    CONSTRAINT [PK_Conn_Kundennummer] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Land_Territorium] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Land] NVARCHAR(5) NOT NULL,
    [Ref_Territorium] INT NOT NULL,
    CONSTRAINT [PK_Conn_Land_Territorium] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Norm_Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Norm] INT NOT NULL,
    [Ref_Firma] INT NOT NULL,
    CONSTRAINT [PK_Conn_Norm_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Norm_Laendercode] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Norm] INT,
    [Ref_Laendercode] NVARCHAR(5),
    [Erweiterung] NVARCHAR(10),
    CONSTRAINT [PK_Conn_Norm_Laendercode] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Norm_Normversion] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Norm] INT,
    [Ref_Normversion] INT,
    [Ref_Klasse] INT,
    [Ref_Unterklasse] INT,
    CONSTRAINT [PK_Conn_Norm_Normversion] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Norm_Qualifikation] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Qualifikation] INT NOT NULL,
    [Ref_Norm] INT NOT NULL,
    CONSTRAINT [PK_Conn_Norm_Qualifikation] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Norm_Schweissverfahren] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Schweissverfahren] INT,
    [Ref_Norm] INT,
    [Normteil] SMALLINT,
    CONSTRAINT [PK_Conn_Norm_Schweissverfahren] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Norm_Sprache] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Sprache] INT,
    [Ref_Norm] INT,
    [Surface] BIT,
    [Joincert_Surface] INT,
    [Joincert_Cert] INT,
    CONSTRAINT [PK_Conn_Norm_Sprache] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Norm_Werkstoffgruppe] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Werkstoffgruppe] INT NOT NULL,
    [Ref_Norm] INT NOT NULL,
    CONSTRAINT [PK_Conn_Norm_Werkstoffgruppe] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Person_AStelle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Person] INT NOT NULL,
    [Ref_A_Stelle] INT NOT NULL,
    CONSTRAINT [PK_Conn_Person_AStelle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Person_Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [Ref_Person] INT,
    [Telefon] VARCHAR(50),
    [E_Mail] VARCHAR(150),
    CONSTRAINT [PK_Conn_Person_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Person_Personentyp_A_Stelle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Person] INT NOT NULL,
    [Ref_PersonenTyp] INT NOT NULL,
    [Ref_A_Stelle] INT NOT NULL,
    CONSTRAINT [PK_Conn_Person_Personentyp_A_Stelle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Profil_Beschreibung_Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [Ref_Profil_Beschreibung] INT,
    CONSTRAINT [PK_Conn_Profil_Beschreibung_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Profil_Leistung_Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [Ref_Profil_Leistung] INT,
    [row] INT,
    CONSTRAINT [PK_Conn_Profil_Leistung_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Profil_Produkt_Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [Ref_Profil_Produkt] INT,
    [row] INT,
    CONSTRAINT [PK_Conn_Profil_Produkt_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_RAM] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Rolle] INT,
    [Ref_Module] INT,
    CONSTRAINT [PK_Conn_RAM] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Rolle_Conn_BMM] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Rolle] INT,
    [Ref_Conn_BMM] INT,
    CONSTRAINT [PK_Conn_Rolle_Conn_BAMM] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Anrede_Adresse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Anrede_Adresse] INT,
    [Ref_Sprache] INT,
    [Anrede_Adresse] NVARCHAR(100),
    [Anrede_Brief] NVARCHAR(100),
    CONSTRAINT [PK_Conn_Sprache_Anrede_Adresse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Bauteilklasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Bauteilklasse] INT,
    [Ref_Sprache] INT,
    [Bauteilklasse] VARCHAR(200),
    [kurz] NVARCHAR(50),
    CONSTRAINT [PK_Conn_Sprache_Bauteilklasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Bundesland] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Bundesland] INT,
    [Ref_Sprache] INT,
    [Bundesland] VARCHAR(100),
    [Kurz] VARCHAR(10),
    CONSTRAINT [PK_Conn_Sprache_Bundesland] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Geltungsbereich] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Geltungsbereich] INT,
    [Ref_Sprache] INT,
    [Geltungsbereich] VARCHAR(100),
    CONSTRAINT [PK_Conn_Sprache_Geltungsbereich] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Laendercode] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_LKZ] NVARCHAR(5),
    [Ref_Sprache] INT,
    [Lang] VARCHAR(100),
    CONSTRAINT [PK_Conn_Sprache_Laendercode] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Personentyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Personentyp] INT,
    [Ref_Sprache] INT,
    [Ref_Norm] INT,
    [Typ] NVARCHAR(100),
    [row] INT,
    CONSTRAINT [PK_Conn_Sprache_Personentyp] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Qualifikation] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Qualifikation] INT,
    [Ref_Sprache] INT,
    [Qualifikation] VARCHAR(100),
    CONSTRAINT [PK_Conn_Sprache_Qualifikation] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Sprache_Titel] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Titel] INT,
    [Ref_Sprache] INT,
    [Titel] NVARCHAR(100),
    CONSTRAINT [PK_Conn_Sprache_Titel] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Stufe_Norm] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Stufe] INT NOT NULL,
    [Ref_Norm] INT NOT NULL,
    CONSTRAINT [PK_Conn_Stufe_Norm] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Conn_Taetigkeitsbereiche_Bauteilklasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Taetigkeitsbereiche] INT,
    [Ref_Bauteilklasse] INT,
    CONSTRAINT [PK_Conn_Taetigkeitsbereiche_Bauteilklasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Content] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Content] TEXT,
    CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Content1] (
    [ID] INT NOT NULL,
    [Content] TEXT,
    CONSTRAINT [PK_Content1] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_Anwendungsgebiet] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Text_DE] NVARCHAR(150),
    [Text_EN] NVARCHAR(150),
    [aktiv] BIT,
    [Text_HU] NVARCHAR(300),
    CONSTRAINT [PK_DIN6701_Anwendungsgebiet] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_Bemerkungen] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_DIN6701_CERT] INT NOT NULL,
    [row] INT,
    [Bemerkung] NVARCHAR(1000),
    [Ref_Sprache] INT,
    CONSTRAINT [PK_DIN6701_Bemerkungen] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_CERT] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_A_Stelle] INT,
    [Ref_Firma] INT,
    [Ref_DIN6701_Klasse] INT,
    [Ref_Norm] INT,
    [Ref_Audit] INT,
    [Ref_Sprache] INT,
    [Ref_Mutter] INT,
    [Jahr] INT,
    [Nummer] NVARCHAR(100),
    [gueltig_von] DATE,
    [gueltig_bis] DATE,
    [aktiv] BIT,
    [erstellt_am] DATETIME,
    [erstellt_von] NVARCHAR(50),
    [ausgestellt_am] DATE,
    [naechstesAudit_am] DATE,
    [Art] VARCHAR(10),
    [geaendert_am] DATE,
    [archiv] BIT,
    CONSTRAINT [PK_DIN6701_CERT] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_Geltungsbereich] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Code] NVARCHAR(10) NOT NULL,
    [Ref_GeltungsbereichTyp] INT NOT NULL,
    [Text_DE] NVARCHAR(100),
    [Text_EN] NVARCHAR(100),
    [Text_HU] NVARCHAR(200),
    CONSTRAINT [PK_DIN6701_Geltungsbereich] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_Geltungsbereich_Freitext] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_DIN6701_CERT] INT NOT NULL,
    [Ref_GeltungsbereichTyp] INT NOT NULL,
    [row] INT,
    [Text_DE] NVARCHAR(150),
    [Text_EN] NVARCHAR(150),
    [Text_HU] NVARCHAR(300),
    CONSTRAINT [PK_DIN6701_Geltungsbereich_Freitext] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_GeltungsbereichTyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Text_DE] NVARCHAR(50),
    [Text_EN] NVARCHAR(50) NOT NULL,
    [Text_HU] NVARCHAR(100),
    CONSTRAINT [PK_DIN6701_GeltungsbereichTyp] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_Klasse] (
    [ID] INT NOT NULL,
    [Klasse] NVARCHAR(10) NOT NULL,
    [Beschreibung_DE] NVARCHAR(250),
    [Beschreibung_HU] NVARCHAR(500),
    CONSTRAINT [PK_DIN6701_Klasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[DIN6701_Status] (
    [ID] INT NOT NULL,
    [Status_DE] NVARCHAR(50) NOT NULL,
    [Status_EN] NVARCHAR(50) NOT NULL,
    [status_class] NVARCHAR(50),
    [Status_HU] NVARCHAR(100),
    CONSTRAINT [PK_DIN6701_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Dokumente] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Filename] NVARCHAR(100),
    [Filename_Original] NVARCHAR(200),
    [Verzeichnis] NVARCHAR(200),
    [Datum] DATETIME,
    [Ref_ENW] INT,
    [Ref_Dokumentenart] INT,
    [row] INT,
    [aktiv] BIT,
    CONSTRAINT [PK_Dokumente] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Dokumentenart] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Art] NVARCHAR(100),
    [Art_DE] NVARCHAR(100),
    [Art_EN] NVARCHAR(100),
    [Art_FR] NVARCHAR(100),
    [Art_IT] NVARCHAR(100),
    [Art_PL] NVARCHAR(100),
    [Art_ES] NVARCHAR(100),
    [Art_HU] NVARCHAR(200),
    CONSTRAINT [PK_Dokumentenart] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ECWRV_Files] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_A_Stelle] INT,
    [DateiTyp] TINYINT,
    [DateiName] VARCHAR(100),
    [DateiPfad] VARCHAR(200),
    [DateiBeschreibung] VARCHAR(50),
    CONSTRAINT [PK_ECWRVFiles] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ECWRV_Recognition] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_A_Stelle] INT NOT NULL,
    [Identification_Number] VARCHAR(50) NOT NULL,
    [valid_from] DATE NOT NULL,
    [valid_to] DATE NOT NULL,
    [issued_on] DATE NOT NULL,
    [Ref_Assesor_1] INT,
    [Ref_Assesor_2] INT,
    [status] TINYINT,
    [Ref_Assesor_3] INT,
    CONSTRAINT [PK_ECWRV_Recognition] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Ausstellungsort] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ausstellungsort] VARCHAR(50),
    CONSTRAINT [PK_EN1090_Ausstellungsort] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Bemerkung] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_EN1090_CERT] INT,
    [Bemerkung] NVARCHAR(4000),
    [Ref_Sprache] INT,
    [row] INT,
    [CERT_Nummer] NVARCHAR(100),
    [Ref_EN1090_CERTStelle] INT,
    [Ablaufdatum] DATE,
    CONSTRAINT [PK_EN1090_Bemerkung] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_CERT] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Nummer] VARCHAR(5),
    [Ref_A_Stelle] INT,
    [Jahr] VARCHAR(4),
    [Ref_EN1090_Version] INT,
    [Ref_Norm] INT,
    [CERT_Nummer] VARCHAR(40),
    [Datum_Beginn] DATE,
    [Ref_Audit] INT,
    [Ref_EN1090_Ausstellungsort] INT,
    [ausgestellt_am] DATE,
    [Ref_Mutter] INT,
    [Ref_Sprache] INT,
    [erstellt_am] DATE,
    [erstellt_durch] INT,
    [geaendert_am] DATE,
    [geaendert_durch] INT,
    [aktiv] BIT,
    [Ref_Firma] INT,
    [Konstruktion] BIT,
    [Korrosion] BIT,
    [Ref_EN1090_CEVerfahren] INT,
    [Ref_EN1090_Klasse] INT,
    [Ref_ZNorm] INT,
    [INSERT_DATUM] DATETIME,
    [OwnNumber] NVARCHAR(100),
    [Produktion] BIT,
    [Schneiden] BIT,
    [Schweissen] BIT,
    [Waerme] BIT,
    [Verbinden] BIT,
    [Datum_Ende] DATE,
    CONSTRAINT [PK_EN1090_CERT] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_CERTStelle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [CERTStelle] VARCHAR(50),
    CONSTRAINT [PK_EN1090_CERTStelle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_CEVerfahren] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [CEVerfahren] VARCHAR(50),
    CONSTRAINT [PK_EN1090_CEVerfahren] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Funktion] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Funktion] VARCHAR(50),
    CONSTRAINT [PK_EN1090_Funktion] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Kenndaten] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Schweissverfahren] INT,
    [Ref_Mech_Grad] INT,
    [Ref_Grundwerkstoff] INT,
    [Ref_Norm] INT,
    [Ref_EN1090_CERT] INT,
    CONSTRAINT [PK_EN1090_Kenndaten] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Klasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [EXC] VARCHAR(20),
    CONSTRAINT [PK_EN1090_Klasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Label] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Label] VARCHAR(50),
    CONSTRAINT [PK_EN1090_Label] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Normversion] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Norm] INT,
    [Beginn] DATE,
    [Text] VARCHAR(50),
    CONSTRAINT [PK_EN1090_Normversion] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_OPEN] (
    [ID] INT NOT NULL,
    [Ref_Firma] INT,
    [Ref_Norm] INT,
    [Ref_A_Stelle] INT,
    CONSTRAINT [PK_EN1090_OPEN] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Produktion] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_EN1090_CERT] INT,
    [Ref_Sprache] INT,
    [Produktion] NVARCHAR(200),
    [row] INT,
    CONSTRAINT [PK_EN1090_Produktion] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Sprache] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Sprache] VARCHAR(50),
    [Kurz] VARCHAR(10),
    [public] BIT,
    CONSTRAINT [PK_EN1090_Sprache] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Status] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Status_DE] NVARCHAR(100),
    [Status_EN] NVARCHAR(100),
    [Status_HU] NVARCHAR(200),
    CONSTRAINT [PK_EN1090_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Text] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Text] VARCHAR(500),
    CONSTRAINT [PK_EN1090_Text] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Translate] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_EN1090_Funktion] INT,
    [Ref_EN1090_Label] INT,
    [Text_DE] NVARCHAR(2000),
    [Text_EN] NVARCHAR(2000),
    [Text_PL] NVARCHAR(2000),
    [Text_FR] NVARCHAR(2000),
    [Text_IT] NVARCHAR(2000),
    [Text_ES] NVARCHAR(2000),
    [text_HU] NVARCHAR(2000)
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_Version] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Version] VARCHAR(50),
    CONSTRAINT [PK_EN1090_Version] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_WSG] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [WSG] NVARCHAR(50),
    [Ref_EN1090_WSG_Tabelle] INT,
    [Ref_Norm] INT,
    CONSTRAINT [PK_EN1090_WSG] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN1090_WSG_Tabelle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Tabelle_DE] NVARCHAR(100),
    [Tabelle_EN] NVARCHAR(100),
    [Tabelle_PL] NVARCHAR(100),
    [Tabelle_RU] NVARCHAR(100),
    [Tabelle_FR] NVARCHAR(100),
    [Tabelle_IT] NVARCHAR(100),
    [Tabelle_HU] NVARCHAR(200),
    CONSTRAINT [PK_EN1090_WSG_Tabelle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN15085_Auditziel] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Auditziel] NVARCHAR(50),
    [DE] NVARCHAR(50),
    [EN] NVARCHAR(50),
    [FR] NVARCHAR(50),
    [IT] NVARCHAR(50),
    [PL] NVARCHAR(50),
    [ES] NVARCHAR(50),
    CONSTRAINT [PK_EN15085_Auditziel] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN15085_Auftragsart] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Auftragsart] NVARCHAR(50),
    [Auftragsart_DE] NVARCHAR(50),
    [Auftragsart_EN] NVARCHAR(50),
    [Auftragsart_IT] NVARCHAR(50),
    [Auftragsart_FR] NVARCHAR(50),
    [Auftragsart_PL] NVARCHAR(50),
    [Auftragsart_ES] NVARCHAR(50),
    [Auftragsart_HU] NVARCHAR(100),
    CONSTRAINT [PK_EN15085_Auftragsart] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN15085_Normversion] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Norm] INT,
    [Beginn] DATE,
    [Text] NVARCHAR(50),
    CONSTRAINT [PK_EN15085_Normversion] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN15085_Translate] (
    [Id] INT NOT NULL IDENTITY(1,1),
    [section_id] VARCHAR(50),
    [label_id] INT,
    [Enable_Markdown] BIT CONSTRAINT [DF__EN15085_T__Enabl__4694E656] DEFAULT 0,
    [Text_DE] VARCHAR(800),
    [Text_EN] VARCHAR(800),
    [Text_HU] NVARCHAR(800),
    CONSTRAINT [PK__EN15085___3214EC0744AC9DE4] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[EN15085_Unterschreiber] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT,
    [Ref_Auditor] INT,
    [Ref_Personentyp] INT
);

-- CreateTable
CREATE TABLE [dbo].[EN15085_WIC] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [WIC] NVARCHAR(10),
    [DE] NVARCHAR(10),
    [EN] NVARCHAR(10),
    [FR] NVARCHAR(10),
    [IT] NVARCHAR(10),
    [PL] NVARCHAR(10),
    [ES] NVARCHAR(10),
    CONSTRAINT [PK_EN15085_WIC] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN15085_WPC] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [WPC] NVARCHAR(10),
    [DE] NVARCHAR(10),
    [EN] NVARCHAR(10),
    [FR] NVARCHAR(10),
    [IT] NVARCHAR(10),
    [PL] NVARCHAR(10),
    [ES] NVARCHAR(10),
    CONSTRAINT [PK_EN15085_WPC] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN17460_Anwendungsgebiet] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Text_DE] NVARCHAR(150),
    [Text_EN] NVARCHAR(150),
    [aktiv] BIT,
    CONSTRAINT [PK_EN17460_Anwendungsgebiet] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[EN17460_GeltungsbereichTyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Text_DE] NVARCHAR(100),
    [Text_EN] NVARCHAR(100) NOT NULL,
    [Text_HU] NVARCHAR(100),
    CONSTRAINT [PK_EN17460_GeltungsbereichTyp] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ENW] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_A_Stelle] INT,
    [Ref_Unterklasse] INT,
    [Ref_Norm] INT,
    [Nummer] NVARCHAR(3),
    [Ref_Nachweis_Art] INT,
    [Jahr] NVARCHAR(2),
    [ENW_Nummer] NVARCHAR(50),
    [Geltungsdauer] SMALLDATETIME,
    [Ausstellungsdatum] SMALLDATETIME,
    [Erstellt_am] SMALLDATETIME,
    [Geaendert_am] SMALLDATETIME,
    [Ref_Firma] INT NOT NULL,
    [Ref_Bezeichnung] INT NOT NULL,
    [Ref_Sprache] INT,
    [Ref_Audit] INT,
    [Erstellt_durch] INT,
    [Geaendert_durch] INT,
    [aktiv] BIT,
    [Ref_Mutter] INT,
    [XML_send] BIT CONSTRAINT [DF__ENW__XML_send__737017C0] DEFAULT 0,
    [Geltungsdauer_start] SMALLDATETIME,
    [INSERT_DATUM] DATETIME,
    [DIN27201] BIT,
    [OWNNUMBER] NVARCHAR(50),
    [Ref_Zertifikatstyp] INT NOT NULL CONSTRAINT [DF_ENW_Ref_Zertifikatstyp] DEFAULT 1,
    CONSTRAINT [PK_ENW] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ENW_Bemerkung] (
    [IDBem] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT NOT NULL,
    [Bemerkung] NVARCHAR(max),
    [Row] INT NOT NULL,
    [Ref_Sprache] INT,
    CONSTRAINT [PK_ENW_Bemerkung] PRIMARY KEY NONCLUSTERED ([IDBem])
);

-- CreateTable
CREATE TABLE [dbo].[ENW_Status] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ENW] INT,
    [Ref_Status] INT,
    [INSERT_DATUM] DATETIME,
    CONSTRAINT [PK_ENW_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ENW_Zertifikatstyp] (
    [Id] INT NOT NULL,
    [Art] VARCHAR(50),
    [Art_DE] NVARCHAR(100),
    [Art_EN] NVARCHAR(100),
    [Art_PL] NVARCHAR(100),
    [Art_FR] NVARCHAR(100),
    [Art_IT] NVARCHAR(100),
    [Art_HU] NVARCHAR(200),
    CONSTRAINT [PK_ENW_Zertifikatstyp] PRIMARY KEY CLUSTERED ([Id])
);

-- CreateTable
CREATE TABLE [dbo].[Favoriten] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [CertID] INT NOT NULL,
    [NormID] INT NOT NULL,
    [Benutzer] INT NOT NULL,
    [StartDatum] DATE,
    [EndeDatum] DATE,
    [InfoPerDashboard] BIT,
    [InfoPerMail] BIT,
    [InfoGesendet] BIT,
    [LetzteInfo] DATETIME,
    [erstellt_am] DATETIME,
    [geaendert_am] DATETIME,
    [aktiv] BIT,
    CONSTRAINT [PK_Favoriten] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[File] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Datei] VARCHAR(50),
    CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[File1] (
    [ID] INT NOT NULL,
    [Datei] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Firma_Name_1] NVARCHAR(100),
    [Firma_Name_2] NVARCHAR(100),
    [Firma_Name_3] NVARCHAR(100),
    [Strasse] NVARCHAR(200),
    [Ort] NVARCHAR(100),
    [PLZ] VARCHAR(50),
    [LKZ] NVARCHAR(5),
    [Telefon] VARCHAR(50),
    [Fax] VARCHAR(50),
    [E_Mail] NVARCHAR(100),
    [Internet] NVARCHAR(100),
    [Ref_Mutter] INT,
    [Kundennummer] NVARCHAR(100),
    [Ref_Bundesland] INT,
    [Ref_Person] INT,
    [contact] BIT CONSTRAINT [DF_Firma_contact] DEFAULT 0,
    [Vorgang] BIT CONSTRAINT [DF_Firma_Vorgang] DEFAULT 0,
    [free_cert] BIT,
    [CODENAME] NVARCHAR(100),
    [USTIDNR] NVARCHAR(50),
    [Ortsteil] NVARCHAR(100),
    [Lat] DECIMAL(14,10),
    [Long] DECIMAL(14,10),
    [LatLongQuality] DECIMAL(1,0),
    [Formated] NVARCHAR(200),
    [Unternehmensgroesse] BIT,
    [Ref_Konzern] INT,
    [Ref_Vorgaenger] INT,
    CONSTRAINT [PK_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Firma_Files] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT NOT NULL,
    [Ref_A_Stelle] INT NOT NULL,
    [Ref_Norm] INT NOT NULL,
    [DateiTyp] TINYINT,
    [DateiName] NVARCHAR(100),
    [DateiPfad] NVARCHAR(150),
    [DateiBeschreibung] NVARCHAR(150),
    [createUser] NVARCHAR(50),
    [createDate] DATETIME,
    [editUser] NVARCHAR(50),
    [editDate] DATETIME,
    CONSTRAINT [PK_Firma_Files] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Firma_Selbst] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Firma_Name_1] NVARCHAR(150),
    [Firma_Name_2] NVARCHAR(150),
    [Firma_Name_3] NVARCHAR(150),
    [Strasse] NVARCHAR(200),
    [Ort] NVARCHAR(100),
    [PLZ] VARCHAR(50),
    [LKZ] NVARCHAR(5),
    [Telefon] VARCHAR(50),
    [Fax] VARCHAR(50),
    [E_Mail] NVARCHAR(100),
    [Internet] NVARCHAR(100),
    [Kundennummer] NVARCHAR(100),
    [USTIDNR] NVARCHAR(50),
    [Ortsteil] NVARCHAR(100),
    [Formated] NVARCHAR(200),
    [Person_name] NVARCHAR(200),
    [Person_vorname] NVARCHAR(200),
    [Ref_Anrede] INT,
    [Ref_A_Stelle] INT,
    [base64_doc] NVARCHAR(max),
    [DateiName] NVARCHAR(100),
    [DateiPfad] NVARCHAR(150),
    [DateiBeschreibung] NVARCHAR(150),
    [createUser] NVARCHAR(50),
    [createDate] DATETIME,
    [editUser] NVARCHAR(50),
    [editDate] DATETIME,
    CONSTRAINT [PK_Firma_Selbst] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Geltungsbereich] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Geltungsbereich] VARCHAR(75),
    [Geltungsbereich_DE] NVARCHAR(255),
    [Geltungsbereich_EN] NVARCHAR(255),
    [Geltungsbereich_FR] NVARCHAR(255),
    [Geltungsbereich_IT] NVARCHAR(255),
    [Geltungsbereich_PL] NVARCHAR(255),
    [Geltungsbereich_ES] NVARCHAR(255),
    [Geltungsbereich_HU] NVARCHAR(510),
    CONSTRAINT [PK_Geltungsbereich] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Grundwerkstoff] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Kurz] VARCHAR(100),
    [hash] VARCHAR(50),
    [Bemerkung] VARCHAR(500),
    CONSTRAINT [PK_Grundwerkstoff] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Historie] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [benutzer] VARCHAR(50),
    [typ] VARCHAR(50),
    [logzeit] DATETIME,
    [bemerkung] VARCHAR(100)
);

-- CreateTable
CREATE TABLE [dbo].[Historie_Aktion] (
    [id] INT NOT NULL IDENTITY(1,1),
    [suchParameter] NVARCHAR(max),
    [zeitstempel] DATETIME,
    [benutzer] NVARCHAR(50),
    [Ref_Firma] INT,
    [CertTyp] NVARCHAR(20),
    [userHash] NVARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Ausstellungsort] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Text_DE] NVARCHAR(100),
    [Text_EN] NVARCHAR(100),
    [Text_IT] NVARCHAR(100),
    [Text_FR] NVARCHAR(100),
    [Text_PL] NVARCHAR(100),
    [Text_HU] NVARCHAR(100),
    [Ref_ENW] INT,
    CONSTRAINT [PK_ISO17660_Ausstellungsort] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Bildnummer] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Normversion] SMALLINT NOT NULL,
    [Bildnummern] NVARCHAR(50),
    CONSTRAINT [PK_ISO17660_Bildnummer] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Conn_CERT_Schweissverfahren] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Schweissverfahren] INT,
    [Ref_ISO17660_CERT] INT,
    CONSTRAINT [PK_ISO17660_Conn_CERT_Schweissverfahren] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Conn_CERT_Verbindungsart] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO17660_Verbindungsart] INT,
    [Ref_ISO17660_CERT] INT,
    CONSTRAINT [PK_ISO17660_Conn_CERT_Verbindungsart] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Conn_CERT_WSG] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO17660_WSG] INT,
    [Ref_ISO17660_CERT] INT,
    CONSTRAINT [PK_ISO17660_Conn_CERT_WSG] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Conn_Norm_Verbindungsart] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Norm] INT NOT NULL,
    [Ref_Verbindungsart] INT NOT NULL
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Conn_Verbindungsart_Bild] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO17660_Conn_CERT_Verbindungsart] INT NOT NULL,
    [Ref_ISO17660_Bildnummer] INT NOT NULL,
    CONSTRAINT [PK_ISO17660_Conn_Verbindungsart_Bild] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Normversion] (
    [ID] SMALLINT NOT NULL,
    [Ref_Norm] INT NOT NULL,
    [Beginn] DATE,
    [Ende] DATE,
    [Beschreibung] NVARCHAR(50),
    [Bezeichnung_DE] NVARCHAR(50),
    [Bezeichnung_EN] NVARCHAR(50),
    [Bezeichnung_FR] NVARCHAR(50),
    CONSTRAINT [PK_ISO17660_Normversion] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_Verbindungsart] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Bezeichnung] NVARCHAR(100),
    [Art_DE] NVARCHAR(100),
    [ArtAusgabe_DE] NVARCHAR(100),
    [Art_EN] NVARCHAR(100),
    [ArtAusgabe_EN] NVARCHAR(100),
    [Art_FR] NVARCHAR(100),
    [ArtAusgabe_FR] NVARCHAR(100)
);

-- CreateTable
CREATE TABLE [dbo].[ISO17660_ZusatzDaten] (
    [Ref_ENW] INT NOT NULL,
    [NormTeil] SMALLINT NOT NULL CONSTRAINT [DF_ISO17660_ZusatzDaten_NormTeil] DEFAULT 2,
    [Erstellt_am] SMALLDATETIME,
    [Erstellt_von] INT
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Anwendungsgebiet] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO3834_CERT] INT,
    [Ref_Sprache] INT,
    [row] INT,
    [Anwendungsgebiet] NVARCHAR(1000),
    CONSTRAINT [PK_ISO3834_Anwendungsgebiet] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Auditor] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Nachname] NVARCHAR(200),
    [Vorname] NVARCHAR(200),
    [Ref_Titel] INT,
    [Ref_A_Stelle] INT,
    [ID_extern_Auditor] VARCHAR(20),
    CONSTRAINT [PK_ISO3834_Auditor] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Ausstellungsort] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Text_DE] NVARCHAR(100),
    [Text_EN] NVARCHAR(100),
    [Text_IT] NVARCHAR(100),
    [Text_FR] NVARCHAR(100),
    [Text_PL] NVARCHAR(100),
    [Text_HU] NVARCHAR(200),
    CONSTRAINT [PK_ISO3834_Ausstellungsort] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Bemerkungen] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO3834_CERT] INT,
    [row] INT,
    [Bemerkung] NVARCHAR(1000),
    [Ref_Sprache] INT,
    CONSTRAINT [PK_ISO3834_Bemerkungen] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_CERT] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Nummer] NVARCHAR(50),
    [Jahr] INT,
    [OwnNumber] NVARCHAR(100),
    [Ref_ISO3834_Klasse] INT,
    [Ref_ISO3834_Version] INT,
    [Ref_A_Stelle] INT,
    [Ref_Firma] INT,
    [Ref_Firma2] INT,
    [Ref_ISO3834_Auditor] INT,
    [Ref_ISO3834_Ausstellungsort] INT,
    [Ref_Mutter] INT,
    [Ref_Sprache] INT,
    [ausgestellt_am] DATE,
    [gueltig_von] DATE,
    [gueltig_bis] DATE,
    [Logo] NVARCHAR(100),
    [QRCode] NVARCHAR(1000),
    [aktiv] BIT,
    [createDate] DATETIME,
    [createUser] NVARCHAR(50),
    [free_cert] BIT,
    CONSTRAINT [PK_ISO3834_CERT] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Conn_Cert_Person] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO3834_CERT] INT,
    [Ref_Person] INT,
    [Ref_Personentyp] INT,
    [row] INT,
    [extern] BIT,
    [anonymCert] BIT,
    [Ref_Stufe] INT,
    CONSTRAINT [PK_ISO3834_Conn_Cert_Person] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Conn_CERT_Schweissverfahren] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO3834_CERT] INT,
    [Ref_Schweissverfahren] INT,
    CONSTRAINT [PK_ISO3834_Conn_CERT_Schweissverfahren] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Conn_CERT_WSG] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ISO3834_WSG] INT,
    [Ref_ISO3834_CERT] INT,
    CONSTRAINT [PK_ISO3834_Conn_CERT_WSG] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Klasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Klasse] NCHAR(10),
    CONSTRAINT [PK_ISO3834_Klasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Status] (
    [ID] INT NOT NULL,
    [Status_DE] NVARCHAR(50) NOT NULL,
    [Status_EN] NVARCHAR(50) NOT NULL,
    [Status_PL] NVARCHAR(50) NOT NULL,
    [Status_FR] NVARCHAR(50) NOT NULL,
    [status_class] NVARCHAR(50),
    [Status_HU] NVARCHAR(100),
    CONSTRAINT [PK_ISO3834_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_Version] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Version] NVARCHAR(50),
    CONSTRAINT [PK_ISO3834_Version] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ISO3834_WSG] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [WSG] NVARCHAR(50),
    [aktiv] BIT,
    [usedISO3834] BIT,
    CONSTRAINT [PK_ISO3834_WSG] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Kenndaten] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Werkstoffgruppe] INT,
    [Ref_Werkstoffgruppe2] INT,
    [Ref_Grundwerkstoff] INT,
    [Ref_Grundwerkstoff2] INT,
    [Ref_Schweissverfahren] INT,
    [Ref_Mech_Grad] INT,
    [Ref_Schweissverfahren2] INT,
    [Ref_Mech_Grad2] INT,
    [Ref_ENW] INT NOT NULL,
    [tmin] FLOAT(53),
    [tmax] FLOAT(53),
    [dmin] FLOAT(53),
    [dmax] FLOAT(53),
    [Bemerkung] VARCHAR(255),
    [Ref_Geltungsbereich] INT NOT NULL,
    [Bemerkung_DE] NVARCHAR(500),
    [Bemerkung_EN] NVARCHAR(500),
    [Bemerkung_FR] NVARCHAR(500),
    [Bemerkung_IT] NVARCHAR(500),
    [Bemerkung_PL] NVARCHAR(500),
    [Bemerkung_ES] NVARCHAR(500),
    [Ref_Nahtart] INT,
    [Bemerkung_HU] NVARCHAR(1000),
    CONSTRAINT [PK_Kenndaten_neu] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Kenndaten_old] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Werkstoffgruppe] INT,
    [Ref_Werkstoffgruppe2] INT,
    [Ref_Grundwerkstoff] INT,
    [Ref_Schweissverfahren] INT,
    [Ref_ENW] INT NOT NULL,
    [tmin] FLOAT(53),
    [tmax] FLOAT(53),
    [dmin] FLOAT(53),
    [dmax] FLOAT(53),
    [Bemerkung] VARCHAR(255),
    [Ref_Geltungsbereich] INT NOT NULL,
    CONSTRAINT [PK_Kenndaten] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Klasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Klasse] VARCHAR(5),
    CONSTRAINT [PK_Klasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Kommentar_Typ] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Typ] VARCHAR(50),
    CONSTRAINT [PK_Kommentar_Typ] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Kommentare] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Kommentar] VARCHAR(255),
    [Ref_Typ] INT,
    [Text] VARCHAR(5000),
    CONSTRAINT [PK_Kommentare] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[KontaktDaten] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [KontaktTyp] INT NOT NULL,
    [KontaktWert] VARCHAR(200) NOT NULL,
    CONSTRAINT [PK_KontaktDaten] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[KontaktTypen] (
    [ID] INT NOT NULL,
    [Kontaktbezeichnung] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_KontaktTypen] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Label] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Name] VARCHAR(50),
    CONSTRAINT [PK_Label] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Laendercode] (
    [LKZ] NVARCHAR(5) NOT NULL,
    [Lang] NVARCHAR(255),
    [Lang_DE] NVARCHAR(255),
    [Lang_EN] NVARCHAR(255),
    [Lang_FR] NVARCHAR(255),
    [Lang_IT] NVARCHAR(255),
    [Lang_PL] NVARCHAR(255),
    [Lang_ES] NVARCHAR(255),
    [aktiv] BIT CONSTRAINT [DF_Laendercode_aktiv] DEFAULT 1,
    [Lang_HU] NVARCHAR(510),
    CONSTRAINT [PK_Laendercode] PRIMARY KEY CLUSTERED ([LKZ])
);

-- CreateTable
CREATE TABLE [dbo].[Mandantentyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Mandantentyp] NVARCHAR(100),
    [Bezeichnung_DE] NVARCHAR(200),
    [Bezeichnung_EN] NVARCHAR(200),
    [Bezeichnung_FR] NVARCHAR(200),
    [Bezeichnung_IT] NVARCHAR(200),
    [Bezeichnung_PL] NVARCHAR(200),
    [Bezeichnung_ES] NVARCHAR(200),
    [Bezeichnung_HU] NVARCHAR(400),
    CONSTRAINT [PK_Mandantentyp] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Mech_Grad] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Mech_Grad] VARCHAR(50),
    [Beschreibung] VARCHAR(30),
    [Beschreibung_DE] NVARCHAR(60),
    [Beschreibung_EN] NVARCHAR(60),
    [Beschreibung_PL] NVARCHAR(60),
    [Beschreibung_FR] NVARCHAR(60),
    [Beschreibung_IT] NVARCHAR(60),
    [Beschreibung_ES] NVARCHAR(60),
    [Beschreibung_HU] NVARCHAR(120),
    CONSTRAINT [PK_Mech_Grad] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Module] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Modul] VARCHAR(50),
    [menuTyp] SMALLINT,
    [aufruf] VARCHAR(50),
    [protected] BIT,
    [rownumber] INT,
    [text_de] NVARCHAR(50),
    [text_en] NVARCHAR(50),
    [text_pl] NVARCHAR(50),
    [text_fr] NVARCHAR(50),
    [text_HU] NVARCHAR(100),
    CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Nachgewiesene_Verfahren] (
    [ID_Nachweis] INT,
    [ID_Prozess] INT,
    [WSG] NVARCHAR(50),
    [WS] NVARCHAR(50),
    [tmin] FLOAT(53),
    [tmax] FLOAT(53),
    [Dmin] FLOAT(53),
    [Dmax] FLOAT(53),
    [Bemerkung] NVARCHAR(50),
    [Einkaufssperre] BIT NOT NULL
);

-- CreateTable
CREATE TABLE [dbo].[Nachgewiesene_Verfahren_Ori] (
    [ID_Nachweis] INT,
    [ID_Prozess] INT,
    [WSG] NVARCHAR(50),
    [WS] NVARCHAR(50),
    [tmin] FLOAT(53),
    [tmax] FLOAT(53),
    [Dmin] FLOAT(53),
    [Dmax] FLOAT(53),
    [Bemerkung] NVARCHAR(50),
    [Einkaufssperre] BIT NOT NULL
);

-- CreateTable
CREATE TABLE [dbo].[Nachweis_Art] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Kurz] VARCHAR(5),
    [Lang] VARCHAR(50),
    CONSTRAINT [PK_Nachweis_Art] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Nachweisbezeichnung] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Bezeichnung] VARCHAR(100),
    CONSTRAINT [PK_Nachweisbezeichnung] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Nahtart] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Kurz] NVARCHAR(50),
    [Nahtart_de] NVARCHAR(50),
    [Nahtart_en] NVARCHAR(50),
    [Nahtart_it] NVARCHAR(50),
    [Nahtart_fr] NVARCHAR(50),
    [Nahtart_pl] NVARCHAR(50),
    [Nahtart_es] NVARCHAR(50),
    [Nahtart_HU] NVARCHAR(100),
    CONSTRAINT [PK_Nahtart] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Norm] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Norm] VARCHAR(50),
    [Beschreibung] VARCHAR(50),
    [DE] NVARCHAR(100),
    [EN] NVARCHAR(100),
    [PL] NVARCHAR(100),
    [IT] NVARCHAR(100),
    [FR] NVARCHAR(100),
    [ES] NVARCHAR(100),
    CONSTRAINT [PK_Norm_1] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[opengeodb] (
    [LKZ] VARCHAR(8000),
    [Land] VARCHAR(8000),
    [Regierungsbezirk] VARCHAR(8000),
    [Landkreis] VARCHAR(8000),
    [Verwaltungszusammenschluss] VARCHAR(8000),
    [Ort] VARCHAR(8000),
    [Laenge] FLOAT(53),
    [Breite] FLOAT(53),
    [PLZ] VARCHAR(8000),
    [ID] INT NOT NULL IDENTITY(1,1),
    CONSTRAINT [PK_opengeodb] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[OriNachweise] (
    [Zähler] INT NOT NULL,
    [DatumÄnderung] SMALLDATETIME,
    [ID_AS] INT,
    [Eignungsnachweisart] INT,
    [Klasse_grob] NVARCHAR(3),
    [Norm] NVARCHAR(10),
    [Nummer] NVARCHAR(3),
    [Art] NVARCHAR(2),
    [Jahr] NVARCHAR(2),
    [Eignungsbescheinigungsnummer] NVARCHAR(50),
    [Geltungsdauer] SMALLDATETIME,
    [Ausstellungsdatum] SMALLDATETIME,
    [Nation] NVARCHAR(20),
    [FirmaZ1] NVARCHAR(50),
    [FirmaZ2] NVARCHAR(50),
    [FirmaZ3] NVARCHAR(50),
    [Straße] NVARCHAR(50),
    [LKZ] NVARCHAR(3),
    [PLZ] NVARCHAR(10),
    [Ort] NVARCHAR(50),
    [Anschrift] NTEXT,
    [Anschrift_Register] NTEXT,
    [TelefonF] NVARCHAR(20),
    [FaxF] NVARCHAR(20),
    [E-mail] NVARCHAR(50),
    [Internet] NVARCHAR(50),
    [KundenNr] NVARCHAR(10),
    [AnredeSA] NVARCHAR(50),
    [Anrede_BriefSA] NVARCHAR(50),
    [NameSA] NVARCHAR(20),
    [VornameSA] NVARCHAR(20),
    [GeburtsdatumSA] SMALLDATETIME,
    [AusbildungSA] NVARCHAR(50),
    [Vertreter] NVARCHAR(50),
    [AnredeV] NVARCHAR(50),
    [Anrede_BriefV] NVARCHAR(50),
    [NameV] NVARCHAR(20),
    [VornameV] NVARCHAR(20),
    [GeburtsdatumV] SMALLDATETIME,
    [AusbildungV] NVARCHAR(50),
    [Vertreter1] NVARCHAR(50),
    [AnredeV1] NVARCHAR(20),
    [Anrede_BriefV1] NVARCHAR(50),
    [NameV1] NVARCHAR(20),
    [VornameV1] NVARCHAR(20),
    [GeburtsdatumV1] SMALLDATETIME,
    [AusbildungV1] NVARCHAR(50),
    [Vertreter2] NVARCHAR(50),
    [AnredeV2] NVARCHAR(20),
    [Anrede_BriefV2] NVARCHAR(50),
    [NameV2] NVARCHAR(20),
    [VornameV2] NVARCHAR(20),
    [GeburtsdatumV2] SMALLDATETIME,
    [AusbildungV2] NVARCHAR(50),
    [AnwendungsgebietZ1] NVARCHAR(150),
    [AnwendungsgebietZ2] NVARCHAR(150),
    [AnwendungsgebietZ3] NVARCHAR(150),
    [AnwendungsgebietZ4] NVARCHAR(150),
    [Erstellt_am] SMALLDATETIME,
    [Geändert_am] SMALLDATETIME,
    [Schlüssel2] NVARCHAR(50),
    [Funktion_Abteilung] NVARCHAR(50),
    [OwnerSLV] BIT NOT NULL,
    [Einkaufssperre] BIT NOT NULL
);

-- CreateTable
CREATE TABLE [dbo].[Person] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Nachname] NVARCHAR(100),
    [Vorname] NVARCHAR(100),
    [Ref_Titel] INT,
    [Geb_Datum] DATETIME,
    [Ref_Anrede] INT,
    [Ref_Qualifikation] INT,
    [anonym] BIT,
    [email] NVARCHAR(100),
    CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Personentyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Typ] VARCHAR(50),
    CONSTRAINT [PK_Vertreter] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[PersonenVorauswahlNorm] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_PersonenTyp] INT NOT NULL,
    [Ref_AStelle] INT NOT NULL,
    [Ref_Titel] INT NOT NULL,
    [Ref_Norm] INT NOT NULL,
    [Ref_Anrede] INT,
    [Nachname] NVARCHAR(100),
    [Vorname] NVARCHAR(100),
    [Geb_Datum] DATE,
    [row] INT,
    [erstellt_am] DATETIME,
    [erstellt_von] NVARCHAR(50),
    [geaendert_am] DATETIME,
    [geaendert_von] NVARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[Profil_Beschreibung] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Beschreibung] TEXT,
    [Beschreibung_DE] TEXT,
    [Beschreibung_EN] TEXT,
    [Beschreibung_FR] TEXT,
    [Beschreibung_IT] TEXT,
    [Beschreibung_PL] TEXT,
    [Beschreibung_ES] TEXT,
    [Beschreibung_HU] NTEXT,
    CONSTRAINT [PK_Profil_Beschreibung] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Profil_Leistung] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Leistung] TEXT,
    [Leistung_DE] TEXT,
    [Leistung_EN] TEXT,
    [Leistung_FR] TEXT,
    [Leistung_IT] TEXT,
    [Leistung_PL] TEXT,
    [Leistung_ES] TEXT,
    [Leistung_HU] NTEXT,
    CONSTRAINT [PK_Profil_Leistung] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Profil_Personal] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Firma] INT,
    [total] INT,
    [design] INT,
    [production] INT,
    [maintenance] INT,
    [purchase and supply] INT,
    CONSTRAINT [PK_Profil_Personal] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Profil_Produkt] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Produkt] VARCHAR(256),
    [Produkt_DE] NVARCHAR(500),
    [Produkt_EN] NVARCHAR(500),
    [Produkt_FR] NVARCHAR(500),
    [Produkt_IT] NVARCHAR(500),
    [Produkt_PL] NVARCHAR(500),
    [Produkt_ES] NVARCHAR(500),
    [Produkt_HU] NVARCHAR(1000),
    CONSTRAINT [PK_Profil_Produkt] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Qualifikation] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Qualifikation] NVARCHAR(100),
    [Qualifikation_DE] NVARCHAR(100),
    [Qualifikation_EN] NVARCHAR(100),
    [Qualifikation_FR] NVARCHAR(100),
    [Qualifikation_IT] NVARCHAR(100),
    [Qualifikation_PL] NVARCHAR(100),
    [Qualifikation_ES] NVARCHAR(100),
    [Qualifikation_HU] NVARCHAR(200),
    CONSTRAINT [PK_Qualifikation] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[QualityMapping] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Qualifikation] NVARCHAR(255),
    [neue Qualifikation] NVARCHAR(255),
    CONSTRAINT [PK_QualityMapping] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[RID_Firma] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Firma] NVARCHAR(400),
    [aktiv] BIT,
    [Ref_A_Stelle] INT,
    CONSTRAINT [PK_RID_Firma] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[RID_Pruefstelle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Pruefstelle] NVARCHAR(400),
    [aktiv] BIT,
    [Ref_A_Stelle] INT,
    CONSTRAINT [PK_RID_Pruefstelle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[RID_Verfahrenspruefung] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Verfahrenspruefung] NVARCHAR(400),
    [Datei] NVARCHAR(400),
    [aktiv] BIT,
    [Ref_A_Stelle] INT,
    CONSTRAINT [PK_RID_Verfahrenspruefung] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[RID_Zertifikat] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Aktenzeichen] NVARCHAR(400),
    [Ref_RID_Firma] INT,
    [Ref_RID_Pruefstelle] INT,
    [Ref_RID_Verfahrenspruefung] INT,
    [Dauer] DATETIME,
    [Datei] NVARCHAR(400),
    [aktiv] BIT,
    [Ref_A_Stelle] INT,
    CONSTRAINT [PK_RID_Zertifikat] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Rohr_Blech] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Typ] VARCHAR(1),
    CONSTRAINT [PK_Rohr_Blech] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Rolle] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Rolle] NVARCHAR(100),
    [Beschreibung] NVARCHAR(200),
    CONSTRAINT [PK_Rolle] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Schweissverfahren] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Bezeichnung] NVARCHAR(80),
    [Nummer] NVARCHAR(7),
    [Kurzzeichen] NVARCHAR(10),
    [Bezeichnung_DE] NVARCHAR(200),
    [Bezeichnung_EN] NVARCHAR(200),
    [Bezeichnung_PL] NVARCHAR(200),
    [Bezeichnung_FR] NVARCHAR(200),
    [Bezeichnung_IT] NVARCHAR(200),
    [Bezeichnung_ES] NVARCHAR(200),
    [Bezeichnung_HU] NVARCHAR(400),
    CONSTRAINT [PK_Schweissverfahren_neu] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Schweissverfahren_old] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Bezeichnung] NVARCHAR(80),
    [Nummer] NVARCHAR(7),
    [Kurzzeichen] NVARCHAR(10),
    CONSTRAINT [PK_Schweissverfahren] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Selbstauskunft_Antrag] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Selbstauskunft_Daten] INT,
    [Ref_A_Stelle] INT NOT NULL,
    [Ref_Beantragender] INT NOT NULL,
    [datum_antrag] DATETIME NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_datum_antrag] DEFAULT CURRENT_TIMESTAMP,
    [auditor_wunsch] VARCHAR(300) NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_auditor_wunsch] DEFAULT '',
    [art] INT NOT NULL,
    [bearbeitet_am] DATETIME,
    [bearbeiter_von] INT,
    [Ref_Firma_Selbst] INT,
    [aktiv] BIT,
    [datum_start] DATE,
    [AntragMutter] INT,
    [AntragAktiv] BIT,
    [AntragGesperrt] BIT,
    [AntragGesperrtDatum] DATE,
    [AntragFinalFile] NVARCHAR(200),
    CONSTRAINT [PK_ENW_Selbstauskunft_Antrag] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Selbstauskunft_Antrag_Art] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Beschreibung] VARCHAR(250),
    [Beschreibung_de] VARCHAR(250) NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_Art_Beschreibung_de] DEFAULT '',
    [Beschreibung_en] VARCHAR(250) NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_Art_Beschreibung_en] DEFAULT '',
    [Beschreibung_fr] VARCHAR(250) NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_Art_Beschreibung_fr] DEFAULT '',
    [Beschreibung_it] VARCHAR(250) NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_Art_Beschreibung_it] DEFAULT '',
    [Beschreibung_es] VARCHAR(250) NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_Art_Beschreibung_es] DEFAULT '',
    [Beschreibung_pl] VARCHAR(250) NOT NULL CONSTRAINT [DF_ENW_Selbstauskunft_Antrag_Art_Beschreibung_pl] DEFAULT '',
    [Beschreibung_HU] NVARCHAR(250),
    CONSTRAINT [PK_ENW_Selbstauskunft_Antrag_Art] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Selbstauskunft_Conn_Antrag_Taetigkeitsbereich] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Taetigkeitsbereich] INT,
    [Ref_SA_Antrag] INT,
    CONSTRAINT [PK_Selbstauskunft_Conn_Antrag_Taetigkeitsbereich] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Selbstauskunft_Daten] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Norm] INT,
    [Ref_Taetigkeitsbereiche] NVARCHAR(50),
    [Ref_Unterklasse] INT,
    CONSTRAINT [PK_Selbstauskunft_Daten] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Sprache] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Sprache] VARCHAR(50),
    [kurz] VARCHAR(10),
    CONSTRAINT [PK_Sprache] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Status] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Status_DE] NVARCHAR(100),
    [Status_EN] NVARCHAR(100),
    [Status_FR] NVARCHAR(100),
    [Status_IT] NVARCHAR(100),
    [Status_PL] NVARCHAR(100),
    [Status_ES] NVARCHAR(100),
    [Status_HU] NVARCHAR(200),
    CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Stufe] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Stufe] NVARCHAR(100),
    [Stufe_DE] NVARCHAR(100),
    [Stufe_EN] NVARCHAR(100),
    [Stufe_FR] NVARCHAR(100),
    [Stufe_IT] NVARCHAR(100),
    [Stufe_PL] NVARCHAR(100),
    [Stufe_ES] NVARCHAR(100),
    [Stufe_HU] NVARCHAR(200),
    CONSTRAINT [PK__Stufe__3214EC2719BE0DFA] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[sysdiagrams] (
    [name] NVARCHAR(128) NOT NULL,
    [principal_id] INT NOT NULL,
    [diagram_id] INT NOT NULL IDENTITY(1,1),
    [version] INT,
    [definition] VARBINARY(max),
    CONSTRAINT [PK__sysdiagr__C2B05B616AB24B3B] PRIMARY KEY CLUSTERED ([diagram_id]),
    CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED ([principal_id],[name])
);

-- CreateTable
CREATE TABLE [dbo].[Table_LKZ_Kontinent] (
    [name_de] NVARCHAR(50),
    [name_en] NVARCHAR(50),
    [kontinent] NVARCHAR(30),
    [lkz] NVARCHAR(2)
);

-- CreateTable
CREATE TABLE [dbo].[Taetigkeitsbereich] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Taetigkeitsbereich] VARCHAR(50),
    CONSTRAINT [PK_Taetigkeitsbereich] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Taetigkeitsbereiche] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Kurz] NVARCHAR(5),
    [Lang_DE] NVARCHAR(100),
    [Lang_EN] NVARCHAR(100),
    [Lang_FR] NVARCHAR(100),
    [Lang_IT] NVARCHAR(100),
    [Lang_PL] NVARCHAR(100),
    [Lang_ES] NVARCHAR(100),
    [Beschreibung_DE] NVARCHAR(300),
    [Beschreibung_EN] NVARCHAR(300),
    [Beschreibung_FR] NVARCHAR(300),
    [Beschreibung_IT] NVARCHAR(300),
    [Beschreibung_PL] NVARCHAR(300),
    [Beschreibung_ES] NVARCHAR(300),
    [Lang_HU] NVARCHAR(200),
    [Beschreibung_HU] NVARCHAR(600),
    CONSTRAINT [PK_Taetigkeitsbereiche] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[tblArtenMapping] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [alteArt] NVARCHAR(50),
    [neueArt] NVARCHAR(50),
    CONSTRAINT [PK_tblArtenMapping] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[tblGWSMapping] (
    [ID] INT,
    [Kurz] VARCHAR(50),
    [EN_Bezeichnung] VARCHAR(50),
    [Bemerkung] VARCHAR(50),
    [WSG1] VARCHAR(10),
    [WSG2] VARCHAR(10),
    [WSG3] VARCHAR(10),
    [WSG4] VARCHAR(10),
    [WSG5] VARCHAR(10)
);

-- CreateTable
CREATE TABLE [dbo].[tblProzesseMapping] (
    [ID] INT,
    [Nummer] VARCHAR(10),
    [Kurzzeichen] VARCHAR(10),
    [Nummer_Neu] VARCHAR(10),
    [Kurz_neu] VARCHAR(10),
    [Mechgrad] VARCHAR(1),
    [Nummer_Neu1] VARCHAR(10),
    [Kurz_neu1] VARCHAR(10),
    [Mechgrad1] VARCHAR(1),
    [Kombi] VARCHAR(10),
    [NewPID] INT
);

-- CreateTable
CREATE TABLE [dbo].[tblWSGMapping] (
    [WSG] NVARCHAR(100),
    [WSGK11] NVARCHAR(5),
    [WSGK12] NVARCHAR(5),
    [WSGK21] NVARCHAR(5),
    [WSGK22] NVARCHAR(5),
    [WSGK31] NVARCHAR(5),
    [WSGK32] NVARCHAR(5),
    [WSGK41] NVARCHAR(5),
    [WSGK42] NVARCHAR(5),
    [WSGK51] NVARCHAR(5),
    [WSGK52] NVARCHAR(5),
    [WSGK61] NVARCHAR(5),
    [WSGK62] NVARCHAR(5),
    [WSGK71] NVARCHAR(5),
    [WSGK72] NVARCHAR(5),
    [WSGK81] NVARCHAR(5),
    [WSGK82] NVARCHAR(5),
    [WSGK91] NVARCHAR(5),
    [WSGK92] NVARCHAR(5),
    [Bemerkung] NVARCHAR(255)
);

-- CreateTable
CREATE TABLE [dbo].[TempPerson] (
    [Anrede_Adresse] NVARCHAR(50),
    [Anrede_Brief] NVARCHAR(50),
    [Nachname] NVARCHAR(20),
    [Vorname] NVARCHAR(20),
    [Geb_Datum] SMALLDATETIME,
    [Qualifikation] NVARCHAR(50),
    [ID] INT NOT NULL IDENTITY(1,1)
);

-- CreateTable
CREATE TABLE [dbo].[TempPerson1] (
    [RefAnrede] INT,
    [Nachname] NVARCHAR(20),
    [Vorname] NVARCHAR(20),
    [Geb_Datum] SMALLDATETIME,
    [Qualifikation] NVARCHAR(50),
    [ID] INT NOT NULL,
    [RefTitel] INT
);

-- CreateTable
CREATE TABLE [dbo].[Territorium] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Typ] INT NOT NULL,
    [Kurz] NVARCHAR(3),
    [Name_DE] VARCHAR(50) NOT NULL,
    [Name_EN] NVARCHAR(50),
    [Name_FR] NVARCHAR(50),
    [Name_IT] NVARCHAR(50),
    [Name_PL] NVARCHAR(50),
    [Name_ES] NVARCHAR(50),
    [Name_HU] NVARCHAR(50),
    CONSTRAINT [PK_Territorium] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Territorium_Typ] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Name_DE] VARCHAR(50),
    [Name_EN] NVARCHAR(50),
    [Name_FR] NVARCHAR(50),
    [Name_IT] NVARCHAR(50),
    [Name_PL] NVARCHAR(50),
    [Name_ES] NVARCHAR(50),
    [Name_HU] NVARCHAR(50),
    CONSTRAINT [PK_Territorium_Typ] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Textbaustein] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Textbaustein] VARCHAR(255),
    [Ref_Bausteintyp] INT,
    [Ref_Norm] INT,
    CONSTRAINT [PK_Textbaustein] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Titel] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Titel] VARCHAR(30),
    [Titel_DE] NVARCHAR(50),
    [Titel_EN] NVARCHAR(50),
    [Titel_FR] NVARCHAR(50),
    [Titel_IT] NVARCHAR(50),
    [Titel_PL] NVARCHAR(50),
    [Titel_ES] NVARCHAR(50),
    [Titel_HU] NVARCHAR(100),
    CONSTRAINT [PK_Titel] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Translation] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Label] INT,
    [Ref_Sprache] INT,
    [Ref_File] INT,
    [Text] VARCHAR(50),
    CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Uebersetzer] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_Label] INT,
    [Ref_Sprache] INT,
    [Ref_File] INT,
    [Ref_Content] INT,
    CONSTRAINT [PK_Uebersetzer] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Uebersetzer1] (
    [ID] INT NOT NULL,
    [Ref_Label] INT,
    [Ref_Sprache] INT,
    [Ref_File] INT,
    [Ref_Content] INT
);

-- CreateTable
CREATE TABLE [dbo].[Unterklasse] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Unterklasse] VARCHAR(50),
    [Ref_Klasse] INT,
    [Ref_Norm] INT,
    CONSTRAINT [PK_Unterklasse] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Werkstatt] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Name_1] NVARCHAR(200),
    [Name_2] NVARCHAR(200),
    [Name_3] NVARCHAR(200),
    [Ortsteil] NVARCHAR(200),
    [Strasse] NVARCHAR(200),
    [PLZ] NVARCHAR(20),
    [Ort] NVARCHAR(200),
    [Ref_LKZ] VARCHAR(5),
    [Lat] DECIMAL(14,10),
    [Long] DECIMAL(14,10),
    [Ref_Bundesland] INT,
    [Ref_Firma] INT,
    [aktiv] BIT,
    CONSTRAINT [PK_Werkstatt] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Werkstoffgruppe] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Hauptnummer] VARCHAR(50),
    [Beschreibung] VARCHAR(255),
    [Ref_Norm] INT,
    [Unternummer] VARCHAR(50),
    CONSTRAINT [PK_Werkstoffgruppe] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Werkstoffgruppen_EN288] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Gruppen-Nr] NVARCHAR(3),
    [Beschreibung] NVARCHAR(255),
    [Norm] NVARCHAR(10),
    CONSTRAINT [PK_Werkstoffgruppen_EN288] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[Werkstoffgruppen_ISOTR15608] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Nummer] NVARCHAR(10),
    [Hauptgruppe] TINYINT,
    [Untergruppe] TINYINT,
    [Kurzbeschreibung] NVARCHAR(100),
    [Beschreibung] NVARCHAR(max),
    CONSTRAINT [PK_Werkstoffgruppe_ISOTR15608] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Conn_Zertifikat_Schutzgas] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ZWS_Zertifikat] INT,
    [Ref_ZWS_Schutzgas] INT,
    [row] INT,
    CONSTRAINT [PK_ZWS_Conn_Zertifikat_Schutzgas] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Conn_Zertifikat_Schweissposition] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ZWS_Zertifikat] INT,
    [Ref_ZWS_Schweissposition] INT,
    [row] INT,
    CONSTRAINT [PK_ZWS_Conn_Zertifikat_Schweissposition] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Conn_Zertifikat_Schweissprozess] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ZWS_Zertifikat] INT,
    [Ref_ZWS_Schweissprozesse] INT,
    [row] INT CONSTRAINT [DF_Conn_ZWS_Zertifikat_Schweissprozess_row] DEFAULT 1,
    CONSTRAINT [PK_Conn_ZWS_Zertifikat_Schweissprozess] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Conn_Zertifikat_WSG] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Ref_ZWS_Zertifikat] INT,
    [Ref_ZWS_WSG] INT,
    [row] INT,
    CONSTRAINT [PK_ZWS_Conn_Zertifikat_WSG] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Hersteller] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Hersteller] NCHAR(200),
    [Strasse] NCHAR(200),
    [PLZ] NCHAR(10),
    [Ort] NCHAR(200),
    [Ref_LKZ] NVARCHAR(5),
    [aktiv] BIT CONSTRAINT [DF_ZWS_Hersteller_aktiv] DEFAULT 1,
    CONSTRAINT [PK_ZWS_Hersteller] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Norm] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Norm] NVARCHAR(100),
    [aktiv] BIT,
    CONSTRAINT [PK_ZWS_Norm] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Schutzgas] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Schutzgas] NVARCHAR(10),
    CONSTRAINT [PK_ZWS_Schutzgas] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Schweissposition] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Position] NVARCHAR(10),
    CONSTRAINT [PK_ZWS_Schweissposition] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Schweisszusatztyp] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [aktiv] BIT CONSTRAINT [DF_ZWS_Schweisszusatztyp_aktiv] DEFAULT 1,
    [Text_DE] NVARCHAR(100),
    [Text_EN] NVARCHAR(100),
    [Text_IT] NVARCHAR(100),
    [Text_FR] NVARCHAR(100),
    [Text_PL] NVARCHAR(100),
    [Text_HU] NVARCHAR(200),
    CONSTRAINT [PK_ZWS_Schweisszusatztyp] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateTable
CREATE TABLE [dbo].[ZWS_Zertifikat] (
    [ID] INT NOT NULL IDENTITY(1,1),
    [Nummer] NVARCHAR(50),
    [Ref_ZWS_Schweisszusatztyp] INT,
    [Ref_ZWS_Norm] INT,
    [Ref_ZWS_Hersteller] INT,
    [Markenbezeichnung] NVARCHAR(100),
    [Geltungsdauer] DATE,
    [aktiv] BIT,
    [Durchmesser_min] FLOAT(53),
    [Durchmesser_max] FLOAT(53),
    [geaendert_am] DATETIME CONSTRAINT [DF_ZWS_Zertifikat_geaendert_am] DEFAULT CURRENT_TIMESTAMP,
    [geaendert_von] NVARCHAR(50),
    CONSTRAINT [PK_ZWS_Zertifikat] PRIMARY KEY CLUSTERED ([ID])
);

-- CreateIndex
CREATE NONCLUSTERED INDEX [Conn_DIN6701_CERT_Person_1] ON [dbo].[Conn_DIN6701_CERT_Person]([Ref_DIN6701_CERT]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [CertStatusIndex] ON [dbo].[Conn_DIN6701_CERT_Status]([Ref_DIN6701_CERT]);

-- CreateIndex
CREATE CLUSTERED INDEX [IX_1] ON [dbo].[ENW_Bemerkung]([IDBem], [Ref_ENW]);

-- AddForeignKey
ALTER TABLE [dbo].[A_Stelle] ADD CONSTRAINT [FK_A_Stelle_Person] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Person]([ID]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Access_Protokoll] ADD CONSTRAINT [FK_Access_Protokoll_Benutzer] FOREIGN KEY ([Benutzer_ID]) REFERENCES [dbo].[Benutzer]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Anwendungsgebiet] ADD CONSTRAINT [FK_Anwendungsgebiet_Bauteilklasse] FOREIGN KEY ([Ref_Bauteilklasse]) REFERENCES [dbo].[Bauteilklasse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_Personentyp] FOREIGN KEY ([Ref_Personentyp]) REFERENCES [dbo].[Personentyp]([ID]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [FK_Audit_Personentyp_CoAuditor] FOREIGN KEY ([Ref_TypCoAuditor]) REFERENCES [dbo].[Personentyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Auditor] ADD CONSTRAINT [FK_Auditor_Titel] FOREIGN KEY ([Ref_Titel]) REFERENCES [dbo].[Titel]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Bauteilklasse] ADD CONSTRAINT [FK_Bauteilklasse_Klasse] FOREIGN KEY ([Ref_Klasse]) REFERENCES [dbo].[Klasse]([ID]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Benutzer] ADD CONSTRAINT [FK_Benutzer_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Berichte] ADD CONSTRAINT [FK_Berichte_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Berichte] ADD CONSTRAINT [FK_Berichte_Nachweis_Art] FOREIGN KEY ([Ref_Nachweis_Art]) REFERENCES [dbo].[Nachweis_Art]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Adresse_Benutzer_6700_Paypal_Benutzer] ADD CONSTRAINT [FK__Conn_Adre__Ref_B__41D03139] FOREIGN KEY ([Ref_Benutzer]) REFERENCES [dbo].[Benutzer]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Adresse_Benutzer_6700_Paypal_Benutzer] ADD CONSTRAINT [FK__Conn_Adre__Ref_F__40DC0D00] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Adresse_Benutzer_6700_Paypal]([FID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_AG_ENW] ADD CONSTRAINT [FK_Conn_AG_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_AG_ENW] ADD CONSTRAINT [FK_Conn_AG_ENW_Anwendungsgebiet] FOREIGN KEY ([Ref_Anwendungsgebiet]) REFERENCES [dbo].[Anwendungsgebiet]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_AG_ENW] ADD CONSTRAINT [FK_Conn_AG_ENW_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_AnonymRegister] ADD CONSTRAINT [FK_Conn_AnonymRegister_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_AnonymRegister] ADD CONSTRAINT [FK_Conn_AnonymRegister_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_AnonymRegister] ADD CONSTRAINT [FK_Conn_AnonymRegister_Person] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Person]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Anwendung_Module] ADD CONSTRAINT [FK_Conn_Anwendung_Module_Anwendung] FOREIGN KEY ([Ref_Anwendung]) REFERENCES [dbo].[Anwendung]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Anwendung_Module] ADD CONSTRAINT [FK_Conn_Anwendung_Module_Module] FOREIGN KEY ([Ref_Module]) REFERENCES [dbo].[Module]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Anwendung_Module_Benutzer] ADD CONSTRAINT [FK_Conn_Anwendung_Module_Benutzer_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Anwendung_Module_Benutzer] ADD CONSTRAINT [FK_Conn_Anwendung_Module_Benutzer_Anwendung] FOREIGN KEY ([Ref_Anwendung]) REFERENCES [dbo].[Anwendung]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Anwendung_Module_Benutzer] ADD CONSTRAINT [FK_Conn_Anwendung_Module_Benutzer_Benutzer] FOREIGN KEY ([Ref_Benutzer]) REFERENCES [dbo].[Benutzer]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Anwendung_Module_Benutzer] ADD CONSTRAINT [FK_Conn_Anwendung_Module_Benutzer_Module] FOREIGN KEY ([Ref_Module]) REFERENCES [dbo].[Module]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditor_Norm_A_Stelle] ADD CONSTRAINT [FK_Conn_Auditor_Norm_A_Stelle_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditor_Norm_A_Stelle] ADD CONSTRAINT [FK_Conn_Auditor_Norm_A_Stelle_Auditor] FOREIGN KEY ([Ref_Auditor]) REFERENCES [dbo].[Auditor]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditor_Norm_A_Stelle] ADD CONSTRAINT [FK_Conn_Auditor_Norm_A_Stelle_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditor_Personentyp] ADD CONSTRAINT [FK_Conn_Auditor_Personentyp_Auditor] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Auditor]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditor_Personentyp] ADD CONSTRAINT [FK_Conn_Auditor_Personentyp_Personentyp] FOREIGN KEY ([Ref_PersonenTyp]) REFERENCES [dbo].[Personentyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditor_Qualifikation] ADD CONSTRAINT [FK_Conn_Auditor_Qualifikation_Auditor] FOREIGN KEY ([Ref_Auditor]) REFERENCES [dbo].[Auditor]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditor_Qualifikation] ADD CONSTRAINT [FK_Conn_Auditor_Qualifikation_Qualifikation] FOREIGN KEY ([Ref_Qualifikation]) REFERENCES [dbo].[Qualifikation]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditziel_ENW] ADD CONSTRAINT [FK_Conn_Auditziel_ENW_EN15085_Auditziel] FOREIGN KEY ([Ref_EN15085_Auditziel]) REFERENCES [dbo].[EN15085_Auditziel]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auditziel_ENW] ADD CONSTRAINT [FK_Conn_Auditziel_ENW_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auftragsart_ENW] ADD CONSTRAINT [FK_Conn_Auftragsart_ENW_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auftragsart_ENW] ADD CONSTRAINT [FK_Conn_Auftragsart_ENW_EN15085_Auftragsart] FOREIGN KEY ([Ref_EN15085_Auftragsart]) REFERENCES [dbo].[EN15085_Auftragsart]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Auftragsart_ENW] ADD CONSTRAINT [FK_Conn_Auftragsart_ENW_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Benutzer_6700] ADD CONSTRAINT [FK_Conn_Benutzer_6700_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Benutzer_6700] ADD CONSTRAINT [FK_Conn_Benutzer_6700_Benutzer] FOREIGN KEY ([Ref_Benutzer]) REFERENCES [dbo].[Benutzer]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Benutzer_6700] ADD CONSTRAINT [FK_Conn_Benutzer_6700_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_BMM] ADD CONSTRAINT [FK_Conn_BAMM_Benutzer] FOREIGN KEY ([Ref_Benutzer]) REFERENCES [dbo].[Benutzer]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_BMM] ADD CONSTRAINT [FK_Conn_BAMM_Mandantentyp] FOREIGN KEY ([Ref_Mandantentyp]) REFERENCES [dbo].[Mandantentyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Person] ADD CONSTRAINT [FK_Conn_EN1090_Person_Aufgabe_Person] FOREIGN KEY ([Ref_Aufgabe]) REFERENCES [dbo].[Aufgabe_Person]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Person] ADD CONSTRAINT [FK_Conn_EN1090_Person_EN1090_CERT] FOREIGN KEY ([Ref_EN1090_CERT]) REFERENCES [dbo].[EN1090_CERT]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Person] ADD CONSTRAINT [FK_Conn_EN1090_Person_Person] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Person]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Person] ADD CONSTRAINT [FK_Conn_EN1090_Person_Personentyp] FOREIGN KEY ([Ref_Personentyp]) REFERENCES [dbo].[Personentyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Translation] ADD CONSTRAINT [FK_Conn_EN1090_Translation_EN1090_Funktion] FOREIGN KEY ([Ref_EN1090_Funktion]) REFERENCES [dbo].[EN1090_Funktion]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Translation] ADD CONSTRAINT [FK_Conn_EN1090_Translation_EN1090_Label] FOREIGN KEY ([Ref_EN1090_Label]) REFERENCES [dbo].[EN1090_Label]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Translation] ADD CONSTRAINT [FK_Conn_EN1090_Translation_EN1090_Sprache] FOREIGN KEY ([Ref_EN1090_Sprache]) REFERENCES [dbo].[EN1090_Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN1090_Translation] ADD CONSTRAINT [FK_Conn_EN1090_Translation_EN1090_Text] FOREIGN KEY ([Ref_EN1090_Text]) REFERENCES [dbo].[EN1090_Text]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN15085_WIC_ENW] ADD CONSTRAINT [FK_Conn_EN15085_WIC_ENW_EN15085_WIC] FOREIGN KEY ([Ref_EN15085_WIC]) REFERENCES [dbo].[EN15085_WIC]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN15085_WIC_ENW] ADD CONSTRAINT [FK_Conn_EN15085_WIC_ENW_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN15085_WPC_ENW] ADD CONSTRAINT [FK_Conn_EN15085_WPC_ENW_EN15085_WPC] FOREIGN KEY ([Ref_EN15085_WPC]) REFERENCES [dbo].[EN15085_WPC]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_EN15085_WPC_ENW] ADD CONSTRAINT [FK_Conn_EN15085_WPC_ENW_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Activity] ADD CONSTRAINT [FK_Conn_ENW_Activity_Activity] FOREIGN KEY ([Ref_Activity]) REFERENCES [dbo].[Activity]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Activity] ADD CONSTRAINT [FK_Conn_ENW_Activity_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Person] ADD CONSTRAINT [FK_Conn_ENW_Person] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Person] ADD CONSTRAINT [FK_Conn_ENW_Person_Aufgabe_Person] FOREIGN KEY ([Ref_Aufgabe]) REFERENCES [dbo].[Aufgabe_Person]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Person] ADD CONSTRAINT [FK_Conn_ENW_Person_Person] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Person]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Person] ADD CONSTRAINT [FK_Conn_ENW_Person_Personentyp] FOREIGN KEY ([Ref_Personentyp]) REFERENCES [dbo].[Personentyp]([ID]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Person] ADD CONSTRAINT [FK_Conn_ENW_Person_Stufe] FOREIGN KEY ([Ref_Stufe]) REFERENCES [dbo].[Stufe]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Sprache] ADD CONSTRAINT [FK_Conn_ENW_Sprache_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Sprache] ADD CONSTRAINT [FK_Conn_ENW_Sprache_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Taetigkeitsbereiche_Werkstatt] ADD CONSTRAINT [FK_Conn_ENW_Taetigkeitsbereiche_Werkstatt_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Taetigkeitsbereiche_Werkstatt] ADD CONSTRAINT [FK_Conn_ENW_Taetigkeitsbereiche_Werkstatt_Taetigkeitsbereiche] FOREIGN KEY ([Ref_Taetigkeitsbereiche]) REFERENCES [dbo].[Taetigkeitsbereiche]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_ENW_Taetigkeitsbereiche_Werkstatt] ADD CONSTRAINT [FK_Conn_ENW_Taetigkeitsbereiche_Werkstatt_Werkstatt] FOREIGN KEY ([Ref_Werkstatt]) REFERENCES [dbo].[Werkstatt]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Firmenaudit] ADD CONSTRAINT [FK_Conn_Firmenaudit_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Firmenaudit] ADD CONSTRAINT [FK_Conn_Firmenaudit_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_FT] ADD CONSTRAINT [FK_Conn_FT_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_FT] ADD CONSTRAINT [FK_Conn_FT_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_FT] ADD CONSTRAINT [FK_Conn_FT_Taetigkeitsbereiche] FOREIGN KEY ([Ref_Taetigkeitsbereich]) REFERENCES [dbo].[Taetigkeitsbereiche]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Geltungsbereich_Norm] ADD CONSTRAINT [FK_Conn_Geltungsbereich_Norm_Geltungsbereich] FOREIGN KEY ([Ref_Geltungsbereich]) REFERENCES [dbo].[Geltungsbereich]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Geltungsbereich_Norm] ADD CONSTRAINT [FK_Conn_Geltungsbereich_Norm_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Komm_ENW] ADD CONSTRAINT [FK_Conn_Komm_ENW_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Komm_ENW] ADD CONSTRAINT [FK_Conn_Komm_ENW_Kommentar_Typ] FOREIGN KEY ([Ref_Kommentar_Typ]) REFERENCES [dbo].[Kommentar_Typ]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Komm_ENW] ADD CONSTRAINT [FK_Conn_Komm_ENW_Kommentare] FOREIGN KEY ([Ref_Kommentar]) REFERENCES [dbo].[Kommentare]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Kundennummer] ADD CONSTRAINT [FK_Conn_Kundennummer_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Kundennummer] ADD CONSTRAINT [FK_Conn_Kundennummer_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Land_Territorium] ADD CONSTRAINT [FK_Conn_Land_Territorium_Laendercode] FOREIGN KEY ([Ref_Land]) REFERENCES [dbo].[Laendercode]([LKZ]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Land_Territorium] ADD CONSTRAINT [FK_Conn_Land_Territorium_Territorium] FOREIGN KEY ([Ref_Territorium]) REFERENCES [dbo].[Territorium]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Firma] ADD CONSTRAINT [FK_Conn_Norm_Firma_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Firma] ADD CONSTRAINT [FK_Conn_Norm_Firma_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Qualifikation] ADD CONSTRAINT [FK_Conn_Norm_Qualifikation_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Qualifikation] ADD CONSTRAINT [FK_Conn_Norm_Qualifikation_Qualifikation] FOREIGN KEY ([Ref_Qualifikation]) REFERENCES [dbo].[Qualifikation]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Schweissverfahren] ADD CONSTRAINT [FK_Conn_Norm_Schweissverfahren_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Schweissverfahren] ADD CONSTRAINT [FK_Conn_Norm_Schweissverfahren_Schweissverfahren] FOREIGN KEY ([Ref_Schweissverfahren]) REFERENCES [dbo].[Schweissverfahren]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Sprache] ADD CONSTRAINT [FK_Conn_Norm_Sprache_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Sprache] ADD CONSTRAINT [FK_Conn_Norm_Sprache_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Werkstoffgruppe] ADD CONSTRAINT [FK_Conn_Norm_Werkstoffgruppe_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Norm_Werkstoffgruppe] ADD CONSTRAINT [FK_Conn_Norm_Werkstoffgruppe_Werkstoffgruppen_ISOTR15608] FOREIGN KEY ([Ref_Werkstoffgruppe]) REFERENCES [dbo].[Werkstoffgruppen_ISOTR15608]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Person_AStelle] ADD CONSTRAINT [FK_Conn_Person_AStelle_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Person_AStelle] ADD CONSTRAINT [FK_Conn_Person_AStelle_Person] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Person]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Person_Firma] ADD CONSTRAINT [FK_Conn_Person_Firma_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Person_Firma] ADD CONSTRAINT [FK_Conn_Person_Firma_Person] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Person]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Person_Personentyp_A_Stelle] ADD CONSTRAINT [FK_Conn_Person_Personentyp_A_Stelle_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Person_Personentyp_A_Stelle] ADD CONSTRAINT [FK_Conn_Person_Personentyp_A_Stelle_Auditor] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Auditor]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Person_Personentyp_A_Stelle] ADD CONSTRAINT [FK_Conn_Person_Personentyp_A_Stelle_Personentyp] FOREIGN KEY ([Ref_PersonenTyp]) REFERENCES [dbo].[Personentyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Profil_Beschreibung_Firma] ADD CONSTRAINT [FK_Conn_Profil_Beschreibung_Firma_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Profil_Beschreibung_Firma] ADD CONSTRAINT [FK_Conn_Profil_Beschreibung_Firma_Profil_Beschreibung] FOREIGN KEY ([Ref_Profil_Beschreibung]) REFERENCES [dbo].[Profil_Beschreibung]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Profil_Leistung_Firma] ADD CONSTRAINT [FK_Conn_Profil_Leistung_Firma_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Profil_Leistung_Firma] ADD CONSTRAINT [FK_Conn_Profil_Leistung_Firma_Profil_Leistung] FOREIGN KEY ([Ref_Profil_Leistung]) REFERENCES [dbo].[Profil_Leistung]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Profil_Produkt_Firma] ADD CONSTRAINT [FK_Conn_Profil_Produkt_Firma_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Profil_Produkt_Firma] ADD CONSTRAINT [FK_Conn_Profil_Produkt_Firma_Profil_Produkt] FOREIGN KEY ([Ref_Profil_Produkt]) REFERENCES [dbo].[Profil_Produkt]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_RAM] ADD CONSTRAINT [FK_Conn_RAM_Module] FOREIGN KEY ([Ref_Module]) REFERENCES [dbo].[Module]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_RAM] ADD CONSTRAINT [FK_Conn_RAM_Rolle] FOREIGN KEY ([Ref_Rolle]) REFERENCES [dbo].[Rolle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Rolle_Conn_BMM] ADD CONSTRAINT [FK_Conn_Rolle_Conn_BAMM_Conn_BAMM] FOREIGN KEY ([Ref_Conn_BMM]) REFERENCES [dbo].[Conn_BMM]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Rolle_Conn_BMM] ADD CONSTRAINT [FK_Conn_Rolle_Conn_BAMM_Rolle] FOREIGN KEY ([Ref_Rolle]) REFERENCES [dbo].[Rolle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Anrede_Adresse] ADD CONSTRAINT [FK_Conn_Sprache_Anrede_Adresse_Anrede_Adresse] FOREIGN KEY ([Ref_Anrede_Adresse]) REFERENCES [dbo].[Anrede_Adresse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Anrede_Adresse] ADD CONSTRAINT [FK_Conn_Sprache_Anrede_Adresse_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Bauteilklasse] ADD CONSTRAINT [FK_Conn_Sprache_Bauteilklasse_Bauteilklasse] FOREIGN KEY ([Ref_Bauteilklasse]) REFERENCES [dbo].[Bauteilklasse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Bauteilklasse] ADD CONSTRAINT [FK_Conn_Sprache_Bauteilklasse_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Bundesland] ADD CONSTRAINT [FK_Conn_Sprache_Bundesland_Bundesland] FOREIGN KEY ([Ref_Bundesland]) REFERENCES [dbo].[Bundesland]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Bundesland] ADD CONSTRAINT [FK_Conn_Sprache_Bundesland_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Geltungsbereich] ADD CONSTRAINT [FK_Conn_Sprache_Geltungsbereich_Geltungsbereich] FOREIGN KEY ([Ref_Geltungsbereich]) REFERENCES [dbo].[Geltungsbereich]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Geltungsbereich] ADD CONSTRAINT [FK_Conn_Sprache_Geltungsbereich_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Laendercode] ADD CONSTRAINT [FK_Conn_Sprache_Laendercode_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Personentyp] ADD CONSTRAINT [FK_Conn_Sprache_Personentyp_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Personentyp] ADD CONSTRAINT [FK_Conn_Sprache_Personentyp_Personentyp] FOREIGN KEY ([Ref_Personentyp]) REFERENCES [dbo].[Personentyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Personentyp] ADD CONSTRAINT [FK_Conn_Sprache_Personentyp_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Qualifikation] ADD CONSTRAINT [FK_Conn_Sprache_Qualifikation_Qualifikation] FOREIGN KEY ([Ref_Qualifikation]) REFERENCES [dbo].[Qualifikation]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Qualifikation] ADD CONSTRAINT [FK_Conn_Sprache_Qualifikation_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Titel] ADD CONSTRAINT [FK_Conn_Sprache_Titel_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Sprache_Titel] ADD CONSTRAINT [FK_Conn_Sprache_Titel_Titel] FOREIGN KEY ([Ref_Titel]) REFERENCES [dbo].[Titel]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Stufe_Norm] ADD CONSTRAINT [FK_Conn_Stufe_Norm_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Stufe_Norm] ADD CONSTRAINT [FK_Conn_Stufe_Norm_Stufe] FOREIGN KEY ([Ref_Stufe]) REFERENCES [dbo].[Stufe]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Taetigkeitsbereiche_Bauteilklasse] ADD CONSTRAINT [FK_Conn_Taetigkeitsbereiche_Bauteilklasse_Bauteilklasse] FOREIGN KEY ([Ref_Bauteilklasse]) REFERENCES [dbo].[Bauteilklasse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Conn_Taetigkeitsbereiche_Bauteilklasse] ADD CONSTRAINT [FK_Conn_Taetigkeitsbereiche_Bauteilklasse_Taetigkeitsbereiche] FOREIGN KEY ([Ref_Taetigkeitsbereiche]) REFERENCES [dbo].[Taetigkeitsbereiche]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Dokumente] ADD CONSTRAINT [FK_Dokumente_Dokumentenart] FOREIGN KEY ([Ref_Dokumentenart]) REFERENCES [dbo].[Dokumentenart]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Dokumente] ADD CONSTRAINT [FK_Dokumente_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ECWRV_Files] ADD CONSTRAINT [FK_ECWRV_Files_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ECWRV_Recognition] ADD CONSTRAINT [FK_ECWRV_Recognition_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Bemerkung] ADD CONSTRAINT [FK_EN1090_Bemerkung_EN1090_CERT] FOREIGN KEY ([Ref_EN1090_CERT]) REFERENCES [dbo].[EN1090_CERT]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Bemerkung] ADD CONSTRAINT [FK_EN1090_Bemerkung_EN1090_CERTStelle] FOREIGN KEY ([Ref_EN1090_CERTStelle]) REFERENCES [dbo].[EN1090_CERTStelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Bemerkung] ADD CONSTRAINT [FK_EN1090_Bemerkung_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_Audit] FOREIGN KEY ([Ref_Audit]) REFERENCES [dbo].[Audit]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_EN1090_Ausstellungsort] FOREIGN KEY ([Ref_EN1090_Ausstellungsort]) REFERENCES [dbo].[EN1090_Ausstellungsort]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_EN1090_CEVerfahren] FOREIGN KEY ([Ref_EN1090_CEVerfahren]) REFERENCES [dbo].[EN1090_CEVerfahren]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_EN1090_Klasse] FOREIGN KEY ([Ref_EN1090_Klasse]) REFERENCES [dbo].[EN1090_Klasse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_EN1090_Version] FOREIGN KEY ([Ref_EN1090_Version]) REFERENCES [dbo].[EN1090_Version]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_CERT] ADD CONSTRAINT [FK_EN1090_CERT_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Kenndaten] ADD CONSTRAINT [FK_EN1090_Kenndaten_EN1090_CERT] FOREIGN KEY ([Ref_EN1090_CERT]) REFERENCES [dbo].[EN1090_CERT]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Kenndaten] ADD CONSTRAINT [FK_EN1090_Kenndaten_Grundwerkstoff] FOREIGN KEY ([Ref_Grundwerkstoff]) REFERENCES [dbo].[Grundwerkstoff]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Kenndaten] ADD CONSTRAINT [FK_EN1090_Kenndaten_Mech_Grad] FOREIGN KEY ([Ref_Mech_Grad]) REFERENCES [dbo].[Mech_Grad]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Kenndaten] ADD CONSTRAINT [FK_EN1090_Kenndaten_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Kenndaten] ADD CONSTRAINT [FK_EN1090_Kenndaten_Schweissverfahren] FOREIGN KEY ([Ref_Schweissverfahren]) REFERENCES [dbo].[Schweissverfahren]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Translate] ADD CONSTRAINT [FK_EN1090_Translate_EN1090_Funktion] FOREIGN KEY ([Ref_EN1090_Funktion]) REFERENCES [dbo].[EN1090_Funktion]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[EN1090_Translate] ADD CONSTRAINT [FK_EN1090_Translate_EN1090_Label] FOREIGN KEY ([Ref_EN1090_Label]) REFERENCES [dbo].[EN1090_Label]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Audit] FOREIGN KEY ([Ref_Audit]) REFERENCES [dbo].[Audit]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_ENW] FOREIGN KEY ([Ref_Mutter]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Nachweis_Art] FOREIGN KEY ([Ref_Nachweis_Art]) REFERENCES [dbo].[Nachweis_Art]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Nachweisbezeichnung] FOREIGN KEY ([Ref_Bezeichnung]) REFERENCES [dbo].[Nachweisbezeichnung]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Unterklasse] FOREIGN KEY ([Ref_Unterklasse]) REFERENCES [dbo].[Unterklasse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW] ADD CONSTRAINT [FK_ENW_Zertifikatstyp] FOREIGN KEY ([Ref_Zertifikatstyp]) REFERENCES [dbo].[ENW_Zertifikatstyp]([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW_Bemerkung] ADD CONSTRAINT [FK_ENW_Bemerkung_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[ENW_Status] ADD CONSTRAINT [FK_ENW_Status_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ENW_Status] ADD CONSTRAINT [FK_ENW_Status_Status] FOREIGN KEY ([Ref_Status]) REFERENCES [dbo].[Status]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma] ADD CONSTRAINT [FK_Firma_Bundesland] FOREIGN KEY ([Ref_Bundesland]) REFERENCES [dbo].[Bundesland]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma] ADD CONSTRAINT [FK_Firma_Firma] FOREIGN KEY ([Ref_Mutter]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma] ADD CONSTRAINT [FK_Firma_Firma1] FOREIGN KEY ([ID]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma] ADD CONSTRAINT [FK_Firma_Firma2] FOREIGN KEY ([Ref_Konzern]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma] ADD CONSTRAINT [FK_Firma_Firma3] FOREIGN KEY ([Ref_Vorgaenger]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma] ADD CONSTRAINT [FK_Firma_Laendercode] FOREIGN KEY ([LKZ]) REFERENCES [dbo].[Laendercode]([LKZ]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma] ADD CONSTRAINT [FK_Firma_Person] FOREIGN KEY ([Ref_Person]) REFERENCES [dbo].[Person]([ID]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Firma_Selbst] ADD CONSTRAINT [FK_Firma_Selbst_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Firma_Selbst] ADD CONSTRAINT [FK_Firma_Selbst_Anrede_Adresse] FOREIGN KEY ([Ref_Anrede]) REFERENCES [dbo].[Anrede_Adresse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ISO17660_Conn_CERT_Schweissverfahren] ADD CONSTRAINT [FK_ISO17660_Conn_CERT_Schweissverfahren_ISO17660_CERT1] FOREIGN KEY ([Ref_ISO17660_CERT]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ISO17660_Conn_CERT_Verbindungsart] ADD CONSTRAINT [FK_ISO17660_Conn_CERT_Verbindungsart_ISO17660_CERT1] FOREIGN KEY ([Ref_ISO17660_CERT]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ISO17660_Conn_CERT_WSG] ADD CONSTRAINT [FK_ISO17660_Conn_CERT_WSG_ISO17660_CERT1] FOREIGN KEY ([Ref_ISO17660_CERT]) REFERENCES [dbo].[ENW]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ISO17660_ZusatzDaten] ADD CONSTRAINT [FK_ISO17660_ZusatzDaten_ISO17660_Normversion] FOREIGN KEY ([NormTeil]) REFERENCES [dbo].[ISO17660_Normversion]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ISO3834_Conn_CERT_WSG] ADD CONSTRAINT [FK_ISO3834_Conn_CERT_WSG_ISO3834_CERT1] FOREIGN KEY ([Ref_ISO3834_CERT]) REFERENCES [dbo].[ISO3834_CERT]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_ENW] FOREIGN KEY ([Ref_ENW]) REFERENCES [dbo].[ENW]([ID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Geltungsbereich] FOREIGN KEY ([Ref_Geltungsbereich]) REFERENCES [dbo].[Geltungsbereich]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Grundwerkstoff] FOREIGN KEY ([Ref_Grundwerkstoff]) REFERENCES [dbo].[Grundwerkstoff]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Grundwerkstoff1] FOREIGN KEY ([Ref_Grundwerkstoff2]) REFERENCES [dbo].[Grundwerkstoff]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Mech_Grad] FOREIGN KEY ([Ref_Mech_Grad]) REFERENCES [dbo].[Mech_Grad]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Mech_Grad1] FOREIGN KEY ([Ref_Mech_Grad2]) REFERENCES [dbo].[Mech_Grad]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Nahtart] FOREIGN KEY ([Ref_Nahtart]) REFERENCES [dbo].[Nahtart]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Schweissverfahren] FOREIGN KEY ([Ref_Schweissverfahren]) REFERENCES [dbo].[Schweissverfahren]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Schweissverfahren1] FOREIGN KEY ([Ref_Schweissverfahren2]) REFERENCES [dbo].[Schweissverfahren]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Werkstoffgruppe] FOREIGN KEY ([Ref_Werkstoffgruppe]) REFERENCES [dbo].[Werkstoffgruppe]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Kenndaten] ADD CONSTRAINT [FK_Kenndaten_Werkstoffgruppe1] FOREIGN KEY ([Ref_Werkstoffgruppe2]) REFERENCES [dbo].[Werkstoffgruppe]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Person] ADD CONSTRAINT [FK_Person_Anrede_Adresse] FOREIGN KEY ([Ref_Anrede]) REFERENCES [dbo].[Anrede_Adresse]([ID]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Person] ADD CONSTRAINT [FK_Person_Qualifikation] FOREIGN KEY ([Ref_Qualifikation]) REFERENCES [dbo].[Qualifikation]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Person] ADD CONSTRAINT [FK_Person_Titel] FOREIGN KEY ([Ref_Titel]) REFERENCES [dbo].[Titel]([ID]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Profil_Personal] ADD CONSTRAINT [FK_Profil_Personal_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[RID_Zertifikat] ADD CONSTRAINT [FK_RID_Zertifikat_RID_Firma] FOREIGN KEY ([Ref_RID_Firma]) REFERENCES [dbo].[RID_Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[RID_Zertifikat] ADD CONSTRAINT [FK_RID_Zertifikat_RID_Pruefstelle] FOREIGN KEY ([Ref_RID_Pruefstelle]) REFERENCES [dbo].[RID_Pruefstelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[RID_Zertifikat] ADD CONSTRAINT [FK_RID_Zertifikat_RID_Verfahrenspruefung] FOREIGN KEY ([Ref_RID_Verfahrenspruefung]) REFERENCES [dbo].[RID_Verfahrenspruefung]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Selbstauskunft_Antrag] ADD CONSTRAINT [FK_ENW_Selbstauskunft_Antrag_A_Stelle] FOREIGN KEY ([Ref_A_Stelle]) REFERENCES [dbo].[A_Stelle]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Selbstauskunft_Antrag] ADD CONSTRAINT [FK_ENW_Selbstauskunft_Antrag_Benutzer] FOREIGN KEY ([Ref_Beantragender]) REFERENCES [dbo].[Benutzer]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Selbstauskunft_Antrag] ADD CONSTRAINT [FK_ENW_Selbstauskunft_Antrag_Benutzer1] FOREIGN KEY ([bearbeiter_von]) REFERENCES [dbo].[Benutzer]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Selbstauskunft_Antrag] ADD CONSTRAINT [FK_ENW_Selbstauskunft_Antrag_ENW_Selbstauskunft_Antrag_Art] FOREIGN KEY ([art]) REFERENCES [dbo].[Selbstauskunft_Antrag_Art]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Territorium] ADD CONSTRAINT [FK_Territorium_Territorium_Typ] FOREIGN KEY ([Ref_Typ]) REFERENCES [dbo].[Territorium_Typ]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Textbaustein] ADD CONSTRAINT [FK_Textbaustein_Bausteintyp] FOREIGN KEY ([Ref_Bausteintyp]) REFERENCES [dbo].[Bausteintyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Textbaustein] ADD CONSTRAINT [FK_Textbaustein_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Translation] ADD CONSTRAINT [FK_Translation_File] FOREIGN KEY ([Ref_File]) REFERENCES [dbo].[File]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Translation] ADD CONSTRAINT [FK_Translation_Label] FOREIGN KEY ([Ref_Label]) REFERENCES [dbo].[Label]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Translation] ADD CONSTRAINT [FK_Translation_Sprache] FOREIGN KEY ([Ref_Sprache]) REFERENCES [dbo].[Sprache]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Unterklasse] ADD CONSTRAINT [FK_Unterklasse_Klasse] FOREIGN KEY ([Ref_Klasse]) REFERENCES [dbo].[Klasse]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Unterklasse] ADD CONSTRAINT [FK_Unterklasse_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Werkstatt] ADD CONSTRAINT [FK_Werkstatt_Bundesland] FOREIGN KEY ([Ref_Bundesland]) REFERENCES [dbo].[Bundesland]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Werkstatt] ADD CONSTRAINT [FK_Werkstatt_Firma] FOREIGN KEY ([Ref_Firma]) REFERENCES [dbo].[Firma]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Werkstoffgruppe] ADD CONSTRAINT [FK_Werkstoffgruppe_Norm] FOREIGN KEY ([Ref_Norm]) REFERENCES [dbo].[Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_Schutzgas] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_Schutzgas_ZWS_Schutzgas] FOREIGN KEY ([Ref_ZWS_Schutzgas]) REFERENCES [dbo].[ZWS_Schutzgas]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_Schutzgas] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_Schutzgas_ZWS_Zertifikat] FOREIGN KEY ([Ref_ZWS_Zertifikat]) REFERENCES [dbo].[ZWS_Zertifikat]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_Schweissposition] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_Schweissposition_ZWS_Schweissposition] FOREIGN KEY ([Ref_ZWS_Schweissposition]) REFERENCES [dbo].[ZWS_Schweissposition]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_Schweissposition] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_Schweissposition_ZWS_Zertifikat] FOREIGN KEY ([Ref_ZWS_Zertifikat]) REFERENCES [dbo].[ZWS_Zertifikat]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_Schweissprozess] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_Schweissprozess_Schweissverfahren] FOREIGN KEY ([Ref_ZWS_Schweissprozesse]) REFERENCES [dbo].[Schweissverfahren]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_Schweissprozess] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_Schweissprozess_ZWS_Zertifikat] FOREIGN KEY ([Ref_ZWS_Zertifikat]) REFERENCES [dbo].[ZWS_Zertifikat]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_WSG] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_WSG_ISO3834_WSG] FOREIGN KEY ([Ref_ZWS_WSG]) REFERENCES [dbo].[ISO3834_WSG]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Conn_Zertifikat_WSG] ADD CONSTRAINT [FK_ZWS_Conn_Zertifikat_WSG_ZWS_Zertifikat] FOREIGN KEY ([Ref_ZWS_Zertifikat]) REFERENCES [dbo].[ZWS_Zertifikat]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Zertifikat] ADD CONSTRAINT [FK_ZWS_Zertifikat_ZWS_Hersteller] FOREIGN KEY ([Ref_ZWS_Hersteller]) REFERENCES [dbo].[ZWS_Hersteller]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Zertifikat] ADD CONSTRAINT [FK_ZWS_Zertifikat_ZWS_Norm] FOREIGN KEY ([Ref_ZWS_Norm]) REFERENCES [dbo].[ZWS_Norm]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[ZWS_Zertifikat] ADD CONSTRAINT [FK_ZWS_Zertifikat_ZWS_Schweisszusatztyp] FOREIGN KEY ([Ref_ZWS_Schweisszusatztyp]) REFERENCES [dbo].[ZWS_Schweisszusatztyp]([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH

