
CREATE TABLE Funkcje (
    funkcja VARCHAR2(10) CONSTRAINT fu_fu_pk PRIMARY KEY,
    min_myszy NUMBER(3) CONSTRAINT fu_min_ch CHECK (min_myszy > 5),
    max_myszy NUMBER(3) CONSTRAINT fu_max_ch CHECK (max_myszy < 200), 
    CONSTRAINT fu_max_min_ch CHECK (max_myszy >= min_myszy)
);

CREATE TABLE Wrogowie (
    imie_wroga VARCHAR2(15) CONSTRAINT wr_iw_pk PRIMARY KEY,
    stopien_wrogosci NUMBER(2) CONSTRAINT wr_sw_ch CHECK (stopien_wrogosci BETWEEN 1 AND 10),
    gatunek VARCHAR2(15),
    lapowka VARCHAR2(20)
);

CREATE TABLE Kocury (
    imie VARCHAR(15) CONSTRAINT ko_im_nn NOT NULL,
    plec VARCHAR(1) CONSTRAINT ko_pl_ch CHECK (plec IN ('M', 'D')),
    pseudo VARCHAR2(15) CONSTRAINT ko_ps_pk PRIMARY KEY,
    funkcja VARCHAR2(10),
    szef VARCHAR2(15),
    w_stadku_od DATE DEFAULT SYSDATE,
    przydzial_myszy NUMBER(3),
    myszy_extra NUMBER(3),
    nr_bandy NUMBER(2)
);

CREATE TABLE Bandy (
    nr_bandy NUMBER(2) CONSTRAINT ba_nrb_pk PRIMARY KEY,
    nazwa VARCHAR2(20) CONSTRAINT ba_na_nn NOT NULL,
    teren VARCHAR2(15) CONSTRAINT ba_ter_un UNIQUE,
    szef_bandy VARCHAR2(15) CONSTRAINT ba_szb_un UNIQUE
);

CREATE TABLE Wrogowie_kocurow (
    pseudo VARCHAR(15),
    imie_wroga VARCHAR(15),
    data_incydentu DATE CONSTRAINT wk_di_nn NOT NULL,
    opis_incydentu VARCHAR2(50),
    CONSTRAINT wk_pk PRIMARY KEY (pseudo, imie_wroga)
);


INSERT ALL
INTO Kocury VALUES('JACEK','M','PLACEK','LOWCZY','LYSY','2008-12-01',67,NULL,2)
INTO Kocury VALUES('BARI','M','RURA','LAPACZ','LYSY','2009-09-01',56,NULL,2)
INTO Kocury VALUES('MICKA','D','LOLA','MILUSIA','TYGRYS','2009-10-14',25,47,1)
INTO Kocury VALUES('LUCEK','M','ZERO','KOT','KURKA','2010-03-01',43,NULL,3)
INTO Kocury VALUES('SONIA','D','PUSZYSTA','MILUSIA','ZOMBI','2010-11-18',20,35,3)
INTO Kocury VALUES('LATKA','D','UCHO','KOT','RAFA','2011-01-01',40,NULL,4)
INTO Kocury VALUES('DUDEK','M','MALY','KOT','RAFA','2011-05-15',40,NULL,4)
INTO Kocury VALUES('MRUCZEK','M','TYGRYS','SZEFUNIO',NULL,'2002-01-01',103,33,1)
INTO Kocury VALUES('CHYTRY','M','BOLEK','DZIELCZY','TYGRYS','2002-05-05',50,NULL,1)
INTO Kocury VALUES('KOREK','M','ZOMBI','BANDZIOR','TYGRYS','2004-03-16',75,13,3)
INTO Kocury VALUES('BOLEK','M','LYSY','BANDZIOR','TYGRYS','2006-08-15',72,21,2)
INTO Kocury VALUES('ZUZIA','D','SZYBKA','LOWCZY','LYSY','2006-07-21',65,NULL,2)
INTO Kocury VALUES('RUDA','D','MALA','MILUSIA','TYGRYS','2006-09-17',22,42,1)
INTO Kocury VALUES('PUCEK','M','RAFA','LOWCZY','TYGRYS','2006-10-15',65,NULL,4)
INTO Kocury VALUES('PUNIA','D','KURKA','LOWCZY','ZOMBI','2008-01-01',61,NULL,3)
INTO Kocury VALUES('BELA','D','LASKA','MILUSIA','LYSY','2008-02-01',24,28,2)
INTO Kocury VALUES('KSAWERY','M','MAN','LAPACZ','RAFA','2008-07-12',51,NULL,4)
INTO Kocury VALUES('MELA','D','DAMA','LAPACZ','RAFA','2008-11-01',51,NULL,4)
SELECT * FROM Dual;

INSERT ALL
INTO Bandy VALUES(1, 'SZEFOSTWO', 'CALOSC', 'TYGRYS')
INTO Bandy VALUES(2, 'CZARNI RYCERZE', 'POLE', 'LYSY')
INTO Bandy VALUES(3, 'BIALI LOWCY', 'SAD', 'ZOMBI')
INTO Bandy VALUES(4, 'LACIACI MYSLIWI', 'GORKA', 'RAFA')
INTO Bandy VALUES(5, 'ROCKERSI', 'ZAGRODA', NULL)
SELECT * FROM Dual;

INSERT ALL
INTO Funkcje VALUES('SZEFUNIO',90,110)
INTO Funkcje VALUES('BANDZIOR',70,90)
INTO Funkcje VALUES('LOWCZY',60,70)
INTO Funkcje VALUES('LAPACZ',50,60)
INTO Funkcje VALUES('KOT',40,50)
INTO Funkcje VALUES('MILUSIA',20,30)
INTO Funkcje VALUES('DZIELCZY',45,55)
INTO Funkcje VALUES('HONOROWA',6,25)
SELECT * FROM Dual;

INSERT ALL
INTO Wrogowie VALUES('KAZIO',10,'CZLOWIEK','FLASZKA')
INTO Wrogowie VALUES('GLUPIA ZOSKA',1,'CZLOWIEK','KORALIK')
INTO Wrogowie VALUES('SWAWOLNY DYZIO',7,'CZLOWIEK','GUMA DO ZUCIA')
INTO Wrogowie VALUES('BUREK',4,'PIES','KOSC')
INTO Wrogowie VALUES('DZIKI BILL',10,'PIES',NULL)
INTO Wrogowie VALUES('REKSIO',2,'PIES','KOSC')
INTO Wrogowie VALUES('BETHOVEN',1,'PIES','PEDIGRIPALL')
INTO Wrogowie VALUES('CHYTRUSEK',5,'LIS','KURCZAK')
INTO Wrogowie VALUES('SMUKLA',1,'SOSNA',NULL)
INTO Wrogowie VALUES('BAZYLI',3,'KOGUT','KURA DO STADA')
SELECT * FROM Dual;

INSERT ALL
INTO Wrogowie_kocurow VALUES('TYGRYS','KAZIO','2004-10-13','USILOWAL NABIC NA WIDLY')
INTO Wrogowie_kocurow VALUES('ZOMBI','SWAWOLNY DYZIO','2005-03-07','WYBIL OKO Z PROCY')
INTO Wrogowie_kocurow VALUES('BOLEK','KAZIO','2005-03-29','POSZCZUL BURKIEM')
INTO Wrogowie_kocurow VALUES('SZYBKA','GLUPIA ZOSKA','2006-09-12','UZYLA KOTA JAKO SCIERKI')
INTO Wrogowie_kocurow VALUES('MALA','CHYTRUSEK','2007-03-07','ZALECAL SIE')
INTO Wrogowie_kocurow VALUES('TYGRYS','DZIKI BILL','2007-06-12','USILOWAL POZBAWIC ZYCIA')
INTO Wrogowie_kocurow VALUES('BOLEK','DZIKI BILL','2007-11-10','ODGRYZL UCHO')
INTO Wrogowie_kocurow VALUES('LASKA','DZIKI BILL','2008-12-12','POGRYZL ZE LEDWO SIE WYLIZALA')
INTO Wrogowie_kocurow VALUES('LASKA','KAZIO','2009-01-07','ZLAPAL ZA OGON I ZROBIL WIATRAK')
INTO Wrogowie_kocurow VALUES('DAMA','KAZIO','2009-02-07','CHCIAL OBEDRZEC ZE SKORY')
INTO Wrogowie_kocurow VALUES('MAN','REKSIO','2009-04-14','WYJATKOWO NIEGRZECZNIE OBSZCZEKAL')
INTO Wrogowie_kocurow VALUES('LYSY','BETHOVEN','2009-05-11','NIE PODZIELIL SIE SWOJA KASZA')
INTO Wrogowie_kocurow VALUES('RURA','DZIKI BILL','2009-09-03','ODGRYZL OGON')
INTO Wrogowie_kocurow VALUES('PLACEK','BAZYLI','2010-07-12','DZIOBIAC UNIEMOZLIWIL PODEBRANIE KURCZAKA')
INTO Wrogowie_kocurow VALUES('PUSZYSTA','SMUKLA','2010-11-19','OBRZUCILA SZYSZKAMI')
INTO Wrogowie_kocurow VALUES('KURKA','BUREK','2010-12-14','POGONIL')
INTO Wrogowie_kocurow VALUES('MALY','CHYTRUSEK','2011-07-13','PODEBRAL PODEBRANE JAJKA')
INTO Wrogowie_kocurow VALUES('UCHO','SWAWOLNY DYZIO','2011-07-14','OBRZUCIL KAMIENIAMI')
SELECT * FROM Dual;

ALTER TABLE Kocury ADD CONSTRAINT ko_fu_fk FOREIGN KEY (funkcja) REFERENCES Funkcje(funkcja);
ALTER TABLE Kocury ADD CONSTRAINT ko_sz_fk FOREIGN KEY (szef) REFERENCES Kocury(pseudo);
ALTER TABLE Kocury ADD CONSTRAINT ko_nb_fk FOREIGN KEY (nr_bandy) REFERENCES Bandy(nr_bandy);
ALTER TABLE Bandy ADD CONSTRAINT ba_szb_fk FOREIGN KEY (szef_bandy) REFERENCES Kocury(pseudo);
ALTER TABLE Wrogowie_kocurow ADD CONSTRAINT wk_ps_fk FOREIGN KEY (pseudo) REFERENCES Kocury(pseudo);
ALTER TABLE Wrogowie_kocurow ADD CONSTRAINT wk_iw_fk FOREIGN KEY (imie_wroga) REFERENCES Wrogowie(imie_wroga);

--Zad. 1
SELECT imie_wroga "WROG", opis_incydentu "PRZEWINA"
FROM Wrogowie_Kocurow
WHERE data_incydentu >= '2009.01.01' AND data_incydentu <= '2009.12.31';

--Zad. 2.
SELECT imie "IMIE", funkcja "FUNKCJA", w_stadku_od "Z NAMI OD"
FROM Kocury
WHERE plec = 'D'
      AND w_stadku_od >= '2005.09.01'
      AND w_stadku_od <= '2007.07.31';
    
--Zad. 3.  
SELECT imie_wroga "WROG", gatunek, stopien_wrogosci
FROM Wrogowie
WHERE lapowka IS NULL
ORDER BY stopien_wrogosci;

--Zad. 4.
SELECT imie || ' zwany ' || pseudo  || ' (fun. ' || funkcja || ') lowi myszki w bandzie ' || nr_bandy || ' od ' || TO_CHAR(w_stadku_od, 'YYYY-MM-DD') "WSZYSTKO O KOCURACH"
FROM Kocury
WHERE plec = 'M';

--Zad. 5.
SELECT RPAD(pseudo, 20) AS pseudo, 
       REGEXP_REPLACE(REGEXP_REPLACE(pseudo, '(.*?)L(.*)', '\1%\2', 1, 1), '(.*?)A(.*)', '\1#\2', 1, 1) AS "Po wymianie A na # oraz L na %"
FROM Kocury
WHERE pseudo LIKE '%A%'
      AND pseudo LIKE '%L%';
      
--Zad. 6.
SELECT imie, 
       TO_CHAR(w_stadku_od, 'YYYY-MM-DD') AS "W stadku", 
       ROUND(przydzial_myszy / 1.1 ) AS "Zjadal", 
       TO_CHAR(ADD_MONTHS(w_stadku_od, 6), 'YYYY-MM-DD') AS "Podwyzka", 
       przydzial_myszy AS "Zjada"
FROM Kocury
WHERE ADD_MONTHS(w_stadku_od, 180) <= TO_DATE(CURRENT_DATE, 'YYYY-MM-DD')
      AND EXTRACT(MONTH FROM w_stadku_od) >= 3 
      AND EXTRACT(MONTH FROM w_stadku_od) <= 9;

    
--Zad. 7.  
SELECT imie, 3 * przydzial_myszy "MYSZY KWARTALNIE", 3 * NVL(myszy_extra, 0) "KWARTALNE DODATKI"
FROM Kocury
WHERE przydzial_myszy > 2 * NVL(myszy_extra, 0)
      AND przydzial_myszy > 55;

SELECT imie,
  DECODE(SIGN((12 * przydzial_myszy + 12 * NVL(myszy_extra, 0)) - 660),
          -1, 'Ponizej 660',
          0, 'Limit',
          TO_CHAR(12 * przydzial_myszy + 12 * NVL(myszy_extra, 0))) "Zjada rocznie"
FROM Kocury;

--Zad. 8a.
SELECT pseudo, TO_CHAR(w_stadku_od, 'YYYY-MM-DD') "W STADKU", CASE
                                       WHEN (EXTRACT(DAY FROM w_stadku_od) <= 15
                                             AND NEXT_DAY(LAST_DAY(TO_DATE('2024-10-29')), 3) - 7 >= TO_DATE('2024-10-29'))
                                         THEN TO_CHAR(NEXT_DAY(LAST_DAY(TO_DATE('2024-10-29')), 3) - 7, 'YYYY-MM-DD')
                                       WHEN (EXTRACT(DAY FROM w_stadku_od) > 15
                                             AND NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2024-10-29'), 1)), 3) - 7 >= TO_DATE('2024-10-29'))
                                         THEN TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2024-10-29'), 1)), 3) - 7, 'YYYY-MM-DD')
                                       ELSE TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2024-10-29'), 1)), 3) - 7, 'YYYY-MM-DD')
                                       END "WYPLATA"
FROM Kocury;

--Zad. 8b.
SELECT pseudo, TO_CHAR(w_stadku_od, 'YYYY-MM-DD') "W STADKU", CASE
                                       WHEN (EXTRACT(DAY FROM w_stadku_od) <= 15
                                             AND NEXT_DAY(LAST_DAY(TO_DATE('2024-10-31')), 3) - 7 >= TO_DATE('2024-10-31'))
                                         THEN TO_CHAR(NEXT_DAY(LAST_DAY(TO_DATE('2024-10-31')), 3) - 7, 'YYYY-MM-DD')
                                       WHEN (EXTRACT(DAY FROM w_stadku_od) > 15
                                             AND NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2024-10-31'), 1)), 3) - 7 >= TO_DATE('2024-10-31'))
                                         THEN TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2024-10-31'), 1)), 3) - 7, 'YYYY-MM-DD')
                                       ELSE TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(TO_DATE('2024-10-31'), 1)), 3) - 7, 'YYYY-MM-DD')
                                       END "WYPLATA"
FROM Kocury;

--Zad. 9.
SELECT pseudo || ' - ' || NVL2(NULLIF(COUNT(*), 1), 'Nieunikalny', 'Unikalny') "Unikalnosc atr. PSEUDO"
FROM Kocury
GROUP BY pseudo;

--Zad. 10.
SELECT szef || ' - ' || NVL2(NULLIF(COUNT(*), 1), 'Nieunikalny', 'Unikalny') "Unikalnosc atr. PSEUDO"
FROM Kocury
GROUP BY szef
HAVING szef IS NOT NULL;

--Zad. 11.
SELECT pseudo "Pseudonim", COUNT(pseudo) "Liczba wrogow"
FROM Wrogowie_Kocurow
GROUP BY pseudo
HAVING COUNT(pseudo) >= 2;

--Zad. 12.
SELECT 'Liczba kotow= ' " ", COUNT(pseudo) " ", ' lowi jako ' " ",  funkcja " ", ' i zjada max. ' " ",
       TO_CHAR(MAX(przydzial_myszy + NVL(myszy_extra, 0)), '999990.99') " ", ' myszy miesiecznie' " "
FROM Kocury
WHERE plec != 'M'
GROUP BY funkcja
HAVING funkcja != 'SZEFUNIO' AND
       AVG(przydzial_myszy + NVL(myszy_extra, 0)) >= 50;

--Zad. 13.       
SELECT nr_bandy "Nr bandy", plec "Plec", MIN(przydzial_myszy) "Minimalny przydzial"
FROM Kocury
GROUP BY nr_bandy, plec;

--Zad. 14.
SELECT LEVEL "Poziom", pseudo "Pseudonim", funkcja "Funkcja", nr_bandy "Nr bandy"
FROM Kocury
WHERE plec  = 'M'
CONNECT BY PRIOR pseudo = szef
START WITH funkcja = 'BANDZIOR';

--Zad. 15.
SELECT
  LPAD(TO_CHAR(LEVEL - 1), (LEVEL - 1) * 4 + LENGTH(TO_CHAR(LEVEL - 1)), '===>') || '        ' || imie "Hierarchia",
  NVL(szef, 'Sam sobie panem') "Pseudo szefa",
  funkcja "Funkcja"
FROM Kocury
WHERE myszy_extra > 0
CONNECT BY PRIOR pseudo = szef
START WITH szef IS NULL;

--Zad. 16.
SELECT RPAD(' ', 4 * (LEVEL - 1), ' ') || pseudo "Droga sluzbowa"
FROM Kocury
CONNECT BY PRIOR szef = pseudo
START WITH EXTRACT(YEAR FROM w_stadku_od) < EXTRACT(YEAR FROM TO_DATE(CURRENT_DATE)) - 8
           AND plec = 'M'
           AND myszy_extra IS NULL;
        
--Zad. 17.           
SELECT pseudo "POLUJE W POLU", przydzial_myszy "PRZYDZIAL MYSZY", nazwa
FROM Kocury JOIN Bandy ON Bandy.nr_bandy = Kocury.nr_bandy
WHERE (teren = 'CALOSC' OR teren = 'POLE') AND przydzial_myszy > 50;

--Zad. 18.
SELECT C1.imie, TO_CHAR(C1.w_stadku_od, 'yyyy-mm-dd') "POLUJE OD"
FROM Kocury C1 JOIN Kocury C2 ON C2.imie = 'JACEK'
WHERE C1.w_stadku_od < C2.w_stadku_od
ORDER BY C1.w_stadku_od DESC;

--Zad. 19a.
SELECT C1.imie "Imie", C1.funkcja "Funkcja", C2.imie "Szef 1", C3.imie "Szef 2", C4.imie "Szef 3"
FROM Kocury C1 LEFT JOIN
(Kocury C2 LEFT JOIN
(Kocury C3 LEFT JOIN Kocury C4
ON C3.szef = C4.pseudo)
ON C2.szef = C3.pseudo)
ON C1.szef = C2.pseudo
WHERE C1.funkcja = 'KOT' OR C1.funkcja = 'MILUSIA';

--Zad. 19b.
SELECT * FROM
(SELECT CONNECT_BY_ROOT imie "Imie", imie, CONNECT_BY_ROOT funkcja "Funkcja", LEVEL "L"
FROM Kocury
CONNECT BY PRIOR szef = pseudo
START WITH funkcja IN ('KOT', 'MILUSIA')
) PIVOT
(MIN(imie) FOR L IN(2 szef1, 3 szef2, 4 szef3));

--Zad. 19c.
SELECT imie, funkcja, RTRIM(REVERSE(RTRIM(SYS_CONNECT_BY_PATH(REVERSE(imie), ' | '), imie)), '| ') "Imiona kolejnych szef?w"
FROM Kocury
WHERE funkcja = 'KOT' OR funkcja = 'MILUSIA'
CONNECT BY PRIOR pseudo = szef
START WITH szef IS NULL;

--Zad. 20
SELECT Kocury.imie, Bandy.nazwa, Wrogowie.imie_wroga,
Wrogowie.stopien_wrogosci, Wrogowie_kocurow.data_incydentu
FROM Wrogowie JOIN Wrogowie_kocurow JOIN (Kocury JOIN Bandy ON Kocury.nr_bandy = Bandy.nr_bandy)
ON Wrogowie_kocurow.pseudo = Kocury.pseudo ON Wrogowie.imie_wroga = Wrogowie_kocurow.imie_wroga
WHERE Kocury.plec = 'D' AND Wrogowie_kocurow.data_incydentu > TO_DATE('2007-01-01');

--Zad. 21.
SELECT Bandy.nazwa, COUNT(C1.pseudo) "Koty z wrogami"
FROM Bandy JOIN
  (SELECT DISTINCT Kocury.pseudo, Kocury.nr_bandy
    FROM (Kocury JOIN Wrogowie_kocurow
         ON Kocury.pseudo = Wrogowie_kocurow.pseudo)
  ) C1 ON C1.nr_bandy= Bandy.nr_bandy
GROUP BY Bandy.nazwa;

--Zad. 22.
SELECT funkcja, Kocury.pseudo, COUNT(Kocury.pseudo) "Liczba wrog?w"
FROM Kocury JOIN Wrogowie_kocurow
    ON Kocury.pseudo = Wrogowie_kocurow.pseudo
GROUP BY Kocury.pseudo, funkcja
HAVING COUNT(Kocury.pseudo) > 1;

--Zad. 23
SELECT imie, 12 * (przydzial_myszy + NVL(myszy_extra, 0)) AS "DAWKA ROCZNA", 'poni?ej 864' "DAWKA"
FROM Kocury
WHERE myszy_extra IS NOT NULL AND 12 * (przydzial_myszy + NVL(myszy_extra, 0)) < 864

UNION

SELECT imie, 12 * (przydzial_myszy + NVL(myszy_extra, 0)) AS "DAWKA ROCZNA", '864' "DAWKA"
FROM Kocury
WHERE myszy_extra IS NOT NULL AND 12 * (przydzial_myszy + NVL(myszy_extra, 0)) = 864

UNION

SELECT imie, 12 * (przydzial_myszy + NVL(myszy_extra, 0)) AS "DAWKA ROCZNA", 'powy?ej 864' "DAWKA"
FROM Kocury
WHERE myszy_extra IS NOT NULL AND 12 * (przydzial_myszy + NVL(myszy_extra, 0)) > 864

ORDER BY "DAWKA ROCZNA" DESC;

--Zad. 24a.
SELECT Bandy.nr_bandy, nazwa, teren 
FROM Bandy 
LEFT JOIN Kocury ON Bandy.nr_bandy = Kocury.nr_bandy
WHERE Kocury.nr_bandy IS NULL;

--Zad. 24b.
SELECT nr_bandy, nazwa, teren FROM Bandy

MINUS

SELECT DISTINCT Kocury.nr_bandy, Bandy.nazwa, Bandy.teren
FROM Bandy LEFT JOIN Kocury ON Bandy.nr_bandy = Kocury.nr_bandy;

--Zad. 25.
SELECT imie, funkcja, NVL(przydzial_myszy, 0) "PRZYDZIAL MYSZY"
FROM Kocury
WHERE NVL(przydzial_myszy, 0) >= ALL (SELECT 3 * NVL(przydzial_myszy, 0)
FROM Kocury JOIN Bandy ON Kocury.nr_bandy = Bandy.nr_bandy
WHERE funkcja = 'MILUSIA' AND Bandy.teren IN ('SAD', 'CALOSC'));

--Zad. 26
SELECT C2.funkcja "Funkcja", "AVG" AS "Srednio najw. i najm. myszy"
FROM (SELECT MIN(AVG) "MINAVG", MAX(AVG) "MAXAVG" 
FROM (SELECT funkcja, CEIL(AVG(przydzial_myszy + NVL(myszy_extra, 0))) "AVG"
FROM Kocury WHERE funkcja != 'SZEFUNIO' GROUP BY funkcja)) C1
JOIN
(SELECT funkcja, CEIL(AVG(przydzial_myszy + NVL(myszy_extra, 0))) "AVG"
FROM Kocury WHERE funkcja != 'SZEFUNIO' GROUP BY funkcja) C2
ON C1.MINAVG = C2.AVG OR C1.MAXAVG = C2.AVG ORDER BY C2.AVG;

--Zad. 27a.

SET SERVEROUTPUT ON;

ACCEPT n NUMBER PROMPT 'Prosz? poda? warto??
COLUMN ZJADA FORMAT 999;

SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) "ZJADA"
FROM Kocury K
WHERE (SELECT COUNT(DISTINCT przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury
      WHERE przydzial_myszy + NVL(myszy_extra, 0) > K.przydzial_myszy + NVL(K.myszy_extra, 0)) < &n
ORDER BY 2 DESC;

DECLARE
    liczba_wybranych NUMBER;
BEGIN
    SELECT COUNT(*) INTO liczba_wybranych
    FROM (SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) "ZJADA"
FROM Kocury K
WHERE (SELECT COUNT(DISTINCT przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury
      WHERE przydzial_myszy + NVL(myszy_extra, 0) > K.przydzial_myszy + NVL(K.myszy_extra, 0)) < &n
    );
    
    DBMS_OUTPUT.PUT_LINE(liczba_wybranych || ' wierszy zosta?o wybranych.');
END;
/


--Zad. 27b.

SET SERVEROUTPUT ON;

ACCEPT n NUMBER PROMPT 'Prosz? poda? warto?? dla n: '

COLUMN ZJADA FORMAT 999;

SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) "ZJADA"
FROM Kocury
WHERE przydzial_myszy + NVL(myszy_extra, 0) IN (
  SELECT *
  FROM (
    SELECT DISTINCT przydzial_myszy + NVL(myszy_extra, 0)
    FROM Kocury
    ORDER BY przydzial_myszy + NVL(myszy_extra, 0) DESC
  ) WHERE ROWNUM <= &n)
  ORDER BY "ZJADA" DESC;

DECLARE
  liczba_wierszy NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO liczba_wierszy
  FROM (
    SELECT pseudo, 
           przydzial_myszy + NVL(myszy_extra, 0) AS ZJADA
    FROM Kocury
    WHERE przydzial_myszy + NVL(myszy_extra, 0) IN (
      SELECT *
      FROM (
        SELECT DISTINCT przydzial_myszy + NVL(myszy_extra, 0)
        FROM Kocury
        ORDER BY przydzial_myszy + NVL(myszy_extra, 0) DESC
      ) WHERE ROWNUM <= &n
    )
  );

  DBMS_OUTPUT.PUT_LINE(liczba_wierszy || ' wierszy zosta?o wybranych');
END;
/


--Zad. 27c.
SET SERVEROUTPUT ON;

ACCEPT n NUMBER PROMPT 'Prosz? poda? warto?? dla n: '

COLUMN ZJADA FORMAT 999;

SELECT K1.pseudo, AVG(K1.przydzial_myszy + NVL(K1.myszy_extra, 0)) "ZJADA"
FROM Kocury K1
LEFT JOIN (SELECT DISTINCT przydzial_myszy + NVL(myszy_extra, 0) AS wynik FROM Kocury) K2
  ON K1.przydzial_myszy + NVL(K1.myszy_extra, 0) < K2.wynik
GROUP BY K1.pseudo
HAVING COUNT(K2.wynik) < &n
ORDER BY "ZJADA" DESC;

DECLARE
  liczba_wierszy NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO liczba_wierszy
  FROM (
    SELECT K1.pseudo, AVG(K1.przydzial_myszy + NVL(K1.myszy_extra, 0)) "ZJADA"
    FROM Kocury K1
    LEFT JOIN (SELECT DISTINCT przydzial_myszy + NVL(myszy_extra, 0) AS wynik FROM Kocury) K2
      ON K1.przydzial_myszy + NVL(K1.myszy_extra, 0) < K2.wynik
    GROUP BY K1.pseudo
    HAVING COUNT(K2.wynik) < &n
  );

  DBMS_OUTPUT.PUT_LINE(liczba_wierszy || ' wierszy zosta?o wybranych');
END;
/


--Zad. 27d.

SET SERVEROUTPUT ON;

ACCEPT n NUMBER PROMPT 'Prosz? poda? warto?? dla n: '

COLUMN ZJADA FORMAT 999;

SELECT  pseudo, ZJADA
FROM
(
  SELECT  pseudo,
    NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0) "ZJADA",
    DENSE_RANK() OVER (
      ORDER BY przydzial_myszy + NVL(myszy_extra, 0) DESC
    ) RANK
  FROM Kocury
)
WHERE RANK <= &n;

DECLARE
  liczba_wierszy NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO liczba_wierszy
  FROM (SELECT  pseudo, ZJADA
FROM
(
  SELECT  pseudo,
    NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0) "ZJADA",
    DENSE_RANK() OVER (
      ORDER BY przydzial_myszy + NVL(myszy_extra, 0) DESC
    ) RANK
  FROM Kocury
)
WHERE RANK <= &n
  );

  DBMS_OUTPUT.PUT_LINE(liczba_wierszy || ' wierszy zosta?o wybranych');
END;
/

--Zad. 28.
SELECT TO_CHAR(YEAR) "ROK", SUM "LICZBA WSTAPIEN"
FROM
(
  SELECT YEAR, SUM, ABS(SUM-AVG) "DIFF"
  FROM
    (
      SELECT EXTRACT(YEAR FROM w_stadku_od) "YEAR", COUNT(EXTRACT(YEAR FROM w_stadku_od)) "SUM"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) JOIN (
      SELECT AVG(COUNT(EXTRACT(YEAR FROM w_stadku_od))) "AVG"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) ON SUM < AVG
)
WHERE DIFF < ALL
(
  SELECT MAX(ABS(SUM-AVG)) "DIFF"
  FROM
    (
      SELECT EXTRACT(YEAR FROM w_stadku_od) "YEAR", COUNT(EXTRACT(YEAR FROM w_stadku_od)) "SUM"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) JOIN (
      SELECT AVG(COUNT(EXTRACT(YEAR FROM w_stadku_od))) "AVG"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) ON SUM < AVG
)

UNION ALL

SELECT 'Srednia', ROUND(AVG(COUNT(EXTRACT(YEAR FROM w_stadku_od))), 7) "AVG"
FROM Kocury
GROUP BY EXTRACT(YEAR FROM w_stadku_od)

UNION ALL

SELECT TO_CHAR(YEAR), SUM
FROM
(
  SELECT YEAR, SUM, ABS(SUM-AVG) "DIFF"
  FROM
    (
      SELECT EXTRACT(YEAR FROM w_stadku_od) "YEAR", COUNT(EXTRACT(YEAR FROM w_stadku_od)) "SUM"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) JOIN (
      SELECT AVG(COUNT(EXTRACT(YEAR FROM w_stadku_od))) "AVG"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) ON SUM > AVG
)
WHERE DIFF < ALL
(
  SELECT MAX(ABS(SUM-AVG)) "DIFF"
  FROM
    (
      SELECT EXTRACT(YEAR FROM w_stadku_od) "YEAR", COUNT(EXTRACT(YEAR FROM w_stadku_od)) "SUM"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) JOIN  (
      SELECT AVG(COUNT(EXTRACT(YEAR FROM w_stadku_od))) "AVG"
      FROM Kocury
      GROUP BY EXTRACT(YEAR FROM w_stadku_od)
    ) ON SUM > AVG
);

--Zad. 29a.
SELECT K1.imie, MIN(K1.przydzial_myszy + NVL(K1.myszy_extra, 0)) "ZJADA", K1.nr_bandy, TO_CHAR(AVG(K2.przydzial_myszy + NVL(K2.myszy_extra, 0)), '99.99') "SREDNIA BANDY"
FROM Kocury K1 JOIN Kocury K2 ON K1.nr_bandy= K2.nr_bandy
WHERE K1.PLEC = 'M'
GROUP BY K1.imie, K1.nr_bandy
HAVING MIN(K1.przydzial_myszy + NVL(K1.myszy_extra, 0)) < AVG(K2.przydzial_myszy + NVL(K2.myszy_extra, 0));

--Zad. 29b.
SELECT imie, przydzial_myszy + NVL(myszy_extra, 0) "ZJADA", K1.nr_bandy, TO_CHAR(AVG, '99.99') "SREDNIA BANDY"
FROM Kocury K1 JOIN (SELECT nr_bandy, AVG(przydzial_myszy + NVL(myszy_extra, 0)) "AVG" FROM Kocury GROUP BY nr_bandy) K2
    ON K1.nr_bandy= K2.nr_bandy
       AND przydzial_myszy + NVL(myszy_extra, 0) < AVG
WHERE PLEC = 'M';

--Zad. 29c.
SELECT imie, przydzial_myszy + NVL(myszy_extra, 0) "ZJADA", nr_bandy,
  TO_CHAR((SELECT AVG(przydzial_myszy + NVL(myszy_extra, 0)) "AVG" FROM Kocury K WHERE Kocury.nr_bandy = K.nr_bandy), '99.99') "SREDNIA BANDY"
FROM Kocury
WHERE PLEC = 'M'
      AND przydzial_myszy + NVL(myszy_extra, 0) < (SELECT AVG(przydzial_myszy + NVL(myszy_extra, 0)) "AVG" FROM Kocury K WHERE Kocury.nr_bandy= K.nr_bandy);
      
      
--Zad. 30.
SELECT imie, TO_CHAR(w_stadku_od, 'YYYY-MM-DD') || ' <--- NAJSTARSZY STAZEM W BANDZIE ' || nazwa "WSTAPIL DO STADKA"
FROM (
  SELECT imie, w_stadku_od, nazwa, MIN(w_stadku_od) OVER (PARTITION BY Kocury.nr_bandy) minstaz
  FROM Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy
)
WHERE w_stadku_od = minstaz

UNION ALL

SELECT imie, TO_CHAR(w_stadku_od, 'YYYY-MM-DD') || ' <--- NAJMLODSZY STAZEM W BANDZIE ' || nazwa "WSTAPIL DO STADKA"
FROM (
  SELECT imie, w_stadku_od, nazwa, MAX(w_stadku_od) OVER (PARTITION BY Kocury.nr_bandy) maxstaz
  FROM Kocury JOIN Bandy ON Kocury.nr_bandy = Bandy.nr_bandy
)
WHERE w_stadku_od = maxstaz

UNION ALL

SELECT imie, TO_CHAR(w_stadku_od, 'YYYY-MM-DD')
FROM (
  SELECT imie, w_stadku_od, nazwa,
    MIN(w_stadku_od) OVER (PARTITION BY Kocury.nr_bandy) minstaz,
    MAX(w_stadku_od) OVER (PARTITION BY Kocury.nr_bandy) maxstaz
  FROM Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy
)
WHERE W_STADKU_OD != minstaz AND
      W_STADKU_OD != maxstaz
ORDER BY IMIE;

--Zad. 31.
CREATE OR REPLACE VIEW Dane(nazwa_bandy, sre_spoz, max_spoz, min_spoz, koty, koty_z_dod)
AS
SELECT nazwa, AVG(przydzial_myszy), MAX(przydzial_myszy), MIN(przydzial_myszy), COUNT(pseudo), COUNT(myszy_extra)
FROM Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy
GROUP BY nazwa;

SELECT *
FROM Dane;

ACCEPT pseudonim CHAR PROMPT 'Prosz? poda? pseudonim: ';

SELECT pseudo AS "PSEUDONIM", imie, funkcja, przydzial_myszy AS "ZJADA", 'OD ' || min_spoz || ' DO ' || max_spoz AS "GRANICE SPOZYCIA", TO_CHAR(w_stadku_od, 'YYYY-MM-DD') AS "LOWI OD"
FROM (Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy JOIN Dane ON Bandy.nazwa = Dane.nazwa_bandy)
WHERE pseudo = UPPER('&pseudonim');

--Zad. 32.
CREATE OR REPLACE VIEW Przed(pseudo, plec, przydzial_myszy, myszy_extra, nr_bandy)
AS
SELECT pseudo, plec, przydzial_myszy, myszy_extra, nr_bandy
FROM Kocury
WHERE pseudo IN
(
  SELECT pseudo
  FROM Kocury JOIN Bandy ON Kocury.nr_bandy = Bandy.nr_bandy
  WHERE nazwa = 'CZARNI RYCERZE'
  ORDER BY w_stadku_od
  FETCH NEXT 3 ROWS ONLY
)
OR pseudo IN
(
  SELECT pseudo
  FROM Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy
  WHERE nazwa = 'LACIACI MYSLIWI'
  ORDER BY w_stadku_od
  FETCH NEXT 3 ROWS ONLY
);

SELECT pseudo, plec, przydzial_myszy "Myszy przed podw.", NVL(myszy_extra, 0) "Ekstra przed podw."
FROM Przed;

UPDATE Przed
SET przydzial_myszy = przydzial_myszy + DECODE(plec, 'D', 0.1 * (SELECT MIN(przydzial_myszy) FROM Kocury), 10),
    myszy_extra = NVL(myszy_extra, 0) + 0.15 * (SELECT AVG(NVl(myszy_extra, 0)) FROM Kocury WHERE Przed.nr_bandy = nr_bandy);

SELECT pseudo, plec, przydzial_myszy "Myszy po podw.", NVL(myszy_extra, 0) "Ekstra po podw."
FROM Przed;

ROLLBACK;
--Zad. 33a.
SELECT *
FROM
(
SELECT TO_CHAR(DECODE(plec, 'D', nazwa, ' ')) "NAZWA BANDY",
  TO_CHAR(DECODE(plec, 'D', 'Kotka', 'Kocor')),
  TO_CHAR(COUNT(pseudo)) "ILE",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'SZEFUNIO' AND K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "SZEFUNIO",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'BANDZIOR' AND K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "BANDZIOR",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'LOWCZY' AND K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "LOWCZY",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'LAPACZ' AND K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "LAPACZ",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'KOT' AND K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "KOT",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'MILUSIA' AND K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "MILUSIA",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'DZIELCZY' AND K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "DZIELCZY",
  TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE K.nr_bandy= Kocury.nr_bandy AND K.plec = Kocury.plec),0)) "SUMA"
FROM (Kocury JOIN Bandy ON Kocury.nr_bandy = Bandy.nr_bandy)
GROUP BY nazwa, plec, Kocury.nr_bandy
ORDER BY nazwa
)

UNION ALL

SELECT 'Z--------------', '------', '--------', '---------', '---------', '--------', '--------', '--------', '--------', '--------', '--------' FROM DUAL

UNION ALL

SELECT DISTINCT 'ZJADA RAZEM',
       ' ',
       ' ',
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'SZEFUNIO'),0)) "SZEFUNIO",
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'BANDZIOR'),0)) "BANDZIOR",
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'LOWCZY'),0)) "LOWCZY",
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'LAPACZ'),0)) "LAPACZ",
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'KOT'),0)) "KOT",
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'MILUSIA'),0)) "MILUSIA",
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K WHERE funkcja = 'DZIELCZY'),0)) "DZIELCZY",
       TO_CHAR(NVL((SELECT SUM(przydzial_myszy + NVL(myszy_extra, 0)) FROM Kocury K),0)) "SUMA"
FROM (Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy);
--Zad. 33b.
SELECT *
FROM
(
  SELECT TO_CHAR(DECODE(plec, 'D', nazwa, ' ')) "NAZWA BANDY",
    TO_CHAR(DECODE(plec, 'D', 'Kotka', 'Kocor')),
    TO_CHAR(ile) "ILE",
    TO_CHAR(NVL(szefunio, 0)) "SZEFUNIO",
    TO_CHAR(NVL(bandzior,0)) "BANDZIOR",
    TO_CHAR(NVL(lowczy,0)) "LOWCZY",
    TO_CHAR(NVL(lapacz,0)) "LAPACZ",
    TO_CHAR(NVL(kot,0)) "KOT",
    TO_CHAR(NVL(milusia,0)) "MILUSIA",
    TO_CHAR(NVL(dzielczy,0)) "DZIELCZY",
    TO_CHAR(NVL(suma,0)) "SUMA"
  FROM
  (
    SELECT nazwa, plec, funkcja, przydzial_myszy + NVL(myszy_extra, 0) liczba
    FROM Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy
  ) PIVOT (
      SUM(liczba) FOR funkcja IN (
      'SZEFUNIO' szefunio, 'BANDZIOR' bandzior, 'LOWCZY' lowczy, 'LAPACZ' lapacz,
      'KOT' kot, 'MILUSIA' milusia, 'DZIELCZY' dzielczy
    )
  ) JOIN (
    SELECT nazwa "N", plec "P", COUNT(pseudo) ile, SUM(przydzial_myszy + NVL(myszy_extra, 0)) suma
    FROM Kocury K JOIN Bandy B ON K.nr_bandy= B.nr_bandy
    GROUP BY nazwa, plec
    ORDER BY nazwa
  ) ON N = nazwa AND P = plec
)


UNION ALL

SELECT 'Z--------------', '------', '--------', '---------', '---------', '--------', '--------', '--------', '--------', '--------', '--------' FROM DUAL

UNION ALL

SELECT  'ZJADA RAZEM',
        ' ',
        ' ',
        TO_CHAR(NVL(szefunio, 0)) szefunio,
        TO_CHAR(NVL(bandzior, 0)) bandzior,
        TO_CHAR(NVL(lowczy, 0)) lowczy,
        TO_CHAR(NVL(lapacz, 0)) lapacz,
        TO_CHAR(NVL(kot, 0)) kot,
        TO_CHAR(NVL(milusia, 0)) milusia,
        TO_CHAR(NVL(dzielczy, 0)) dzielczy,
        TO_CHAR(NVL(suma, 0)) suma
FROM
(
  SELECT      funkcja, przydzial_myszy + NVL(myszy_extra, 0) liczba
  FROM        Kocury JOIN Bandy ON Kocury.nr_bandy= Bandy.nr_bandy
) PIVOT (
    SUM(liczba) FOR funkcja IN (
    'SZEFUNIO' szefunio, 'BANDZIOR' bandzior, 'LOWCZY' lowczy, 'LAPACZ' lapacz,
    'KOT' kot, 'MILUSIA' milusia, 'DZIELCZY' dzielczy
  )
) CROSS JOIN (
  SELECT      SUM(przydzial_myszy + NVL(myszy_extra, 0)) suma
  FROM        Kocury
);


--Zad 34.
SET SERVEROUTPUT ON;

DECLARE
  funkcja_input VARCHAR2(10); -- zmienna do przechowywania funkcji wprowadzonej przez u?ytkownika
  func Kocury.funkcja%TYPE; -- zmienna do przechowywania wyniku zapytania
  liczba_kotow NUMBER;
BEGIN
  -- pobranie warto?ci funkcji od u?ytkownika
  funkcja_input := '&funkcja_input'; -- u?ycie zmiennej dla wprowadzonej warto?ci
  funkcja_input := UPPER(funkcja_input);
  -- pr?ba znalezienia kota o podanej funkcji
  SELECT COUNT(*) INTO liczba_kotow
  FROM Kocury
  WHERE funkcja = funkcja_input;
  
IF liczba_kotow > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Znaleziono kota o funkcji: ' || funkcja_input);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nie znaleziono kota o podanej funkcji.');
  END IF;
  END;
--Zad. 35.
SET SERVEROUTPUT ON;

DECLARE
  pseudonim_input VARCHAR2(15); -- zmienna na pseudonim wprowadzony przez u?ytkownika
  przydzial_roczny NUMBER; -- zmienna na ca?kowity roczny przydzia? myszy
  imie_kota VARCHAR2(15); -- zmienna na imi? kota
  miesiac_przystapienia NUMBER; -- zmienna na miesi?c przyst?pienia do stada
BEGIN
  -- pobranie pseudonimu od u?ytkownika
  pseudonim_input := UPPER('&pseudonim_input'); -- konwersja na wielkie litery
  
  -- wyszukanie danych o kocie
  SELECT (przydzial_myszy + NVL(myszy_extra, 0)) * 12, imie, EXTRACT(MONTH FROM w_stadku_od)
  INTO przydzial_roczny, imie_kota, miesiac_przystapienia
  FROM Kocury
  WHERE pseudo = pseudonim_input; -- r?wnie? por?wnanie na wielkich literach

  -- sprawdzenie warunk?w w hierarchii wa?no?ci
  IF przydzial_roczny > 700 THEN
    DBMS_OUTPUT.PUT_LINE('Calkowity roczny przydzial myszy jest wi?kszy ni? 700');
  ELSIF INSTR(imie_kota, 'A') > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Imie zawiera litere A.');
  ELSIF miesiac_przystapienia = 5 THEN
    DBMS_OUTPUT.PUT_LINE('Maj jest miesiacem przystapienia do stada.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nie odpowiada kryteriom.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nie znaleziono kota o podanym pseudonimie.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Wyst?pi? nieoczekiwany b??d.');
    DBMS_OUTPUT.PUT_LINE('Kod b??du: ' || SQLCODE || '; Komunikat: ' || SQLERRM);
END;
/
  
--Zad. 36.
SET SERVEROUTPUT ON;

DECLARE
  CURSOR kocuryC IS
    SELECT *
    FROM Kocury
    ORDER BY przydzial_myszy ASC; -- przetwarzanie od najni?szego przydzia?u
  kocur kocuryC%ROWTYPE; -- zmienna wierszowa odpowiadaj?ca kursorowi
  suma NUMBER; -- zmienna na sum? przydzia??w
  maxf NUMBER; -- maksymalny przydzia? myszy dla funkcji
  pp NUMBER; -- nowy przydzia? myszy
  liczba_modyfikacji NUMBER := 0; -- liczba wykonanych modyfikacji
BEGIN
  LOOP
    -- oblicz aktualn? sum? przydzia??w
    SELECT SUM(przydzial_myszy) INTO suma FROM Kocury;

    -- zako?cz p?tl?, gdy suma przekracza 1050
    EXIT WHEN suma > 1050;

    -- otw?rz kursor
    OPEN kocuryC;

    LOOP
      -- pobierz dane kota z kursora
      FETCH kocuryC INTO kocur;
      EXIT WHEN kocuryC%NOTFOUND;

      -- pobierz maksymalny przydzia? myszy dla funkcji kota
      SELECT max_myszy INTO maxf
      FROM Funkcje
      WHERE funkcja = kocur.funkcja;

      -- oblicz nowy przydzia? myszy
      pp := kocur.przydzial_myszy * 1.1;

      -- ogranicz przydzia? do maksymalnego, je?li przekracza
      IF pp > maxf THEN
        pp := maxf;
      END IF;

      -- zaktualizuj przydzia? myszy
      UPDATE Kocury
      SET przydzial_myszy = pp
      WHERE pseudo = kocur.pseudo;

      -- zwi?ksz licznik modyfikacji
      liczba_modyfikacji := liczba_modyfikacji + 1;
    END LOOP;

    -- zamknij kursor
    CLOSE kocuryC;
  END LOOP;

  -- wy?wietl sum? przydzia??w po zako?czeniu zadania
  SELECT SUM(przydzial_myszy) INTO suma FROM Kocury;
  DBMS_OUTPUT.PUT_LINE('Suma przydzia??w myszy po zadaniu: ' || suma);
  DBMS_OUTPUT.PUT_LINE('Liczba modyfikacji w relacji Kocury: ' || liczba_modyfikacji);

END;
/

SELECT imie, przydzial_myszy "Myszki po podwy?ce"
FROM Kocury;

-- wycofaj wszystkie zmiany
  ROLLBACK;
/

--Zad. 37.
DECLARE
  CURSOR topC IS
    SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) "Zjada"
    FROM Kocury
    ORDER BY "Zjada" DESC;
  top topC%ROWTYPE;
BEGIN
  OPEN topC;
  DBMS_OUTPUT.PUT_LINE('Nr   Pseudonim   Zjada');
  DBMS_OUTPUT.PUT_LINE('----------------------');
  FOR i IN 1..5
  LOOP
    FETCH topC INTO top;
    EXIT WHEN topC%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(i) ||'    '|| RPAD(top.pseudo, 8) || '    ' || LPAD(TO_CHAR(top."Zjada"), 5));
  END LOOP;
END;
/

--Zad. 38.
SET SERVEROUTPUT ON;
DECLARE
CURSOR kotyCursor IS SELECT * FROM Kocury WHERE funkcja = 'KOT' OR funkcja = 'MILUSIA';
kot kotyCursor%ROWTYPE;
pseudoSzefa Kocury.pseudo%TYPE;
row VARCHAR2(500);
deep NUMBER := 5;
max_deep NUMBER;
i NUMBER := 0;
BEGIN

SELECT MAX(level) - 1 INTO max_deep FROM Kocury WHERE funkcja = 'KOT' OR funkcja = 'MILUSIA' START WITH szef IS NULL CONNECT BY PRIOR pseudo = szef;
IF max_deep < deep THEN deep := max_deep;
END IF;

OPEN kotyCursor;

row := RPAD('Imie', 15);
FOR j IN 1..deep
LOOP
row := row || '|  ' || RPAD('Szef ' || TO_CHAR(j), 15);
END LOOP;
DBMS_OUTPUT.PUT_LINE(row);
row := '';

row := RPAD('-', 13, '-');
FOR j IN 1..deep
LOOP
row := row || ' --- ' || RPAD('-', 13, '-');
END LOOP;
DBMS_OUTPUT.PUT_LINE(row);
row := '';

LOOP FETCH kotyCursor INTO kot;
EXIT WHEN kotyCursor%NOTFOUND;

row := row || RPAD(kot.imie, 15);

LOOP
EXIT WHEN i >= deep;
BEGIN
SELECT * INTO kot FROM Kocury WHERE pseudo = kot.szef;
row := row || '|  ' || RPAD(kot.imie, 15);
EXCEPTION
WHEN NO_DATA_FOUND THEN
row := row || '|  ' || RPAD(' ', 15);
END;
i := i + 1;

END LOOP;
DBMS_OUTPUT.PUT_LINE(row);
i := 0;
row := '';
END LOOP;
END;
/

--Zad. 39.
SET SERVEROUTPUT ON;

DECLARE
  CURSOR bandyCursor IS SELECT * FROM Bandy;
  banda Bandy%ROWTYPE; -- Zmienna do przechowywania wierszy kursora
  
  numer NUMBER := -6;
  nazwa_bandy VARCHAR2(20) := 'NURKOWIE';
  teren_bandy VARCHAR2(15) := 'JEZIORO';

  negative_number BOOLEAN := FALSE; -- Flaga dla numeru ujemnego
  exception_negative EXCEPTION; -- Wyjątek dla numeru ujemnego

  existence BOOLEAN := FALSE; -- Flaga dla istniej cych danych
  exists_info VARCHAR2(500) := NULL; -- Informacje o istniej cych danych
  exception_exists EXCEPTION; -- Wyj tek dla istniej cych danych
BEGIN
  -- Sprawdzenie, czy numer jest dodatni
  IF numer <= 0 THEN
    negative_number := TRUE;
    RAISE exception_negative;
  END IF;

  -- Otwieranie kursora
  OPEN bandyCursor;

  LOOP
    FETCH bandyCursor INTO banda;
    EXIT WHEN bandyCursor%NOTFOUND;

    -- Sprawdzanie, czy numer bandy już istnieje
    IF numer = banda.nr_bandy THEN
      existence := TRUE;
      IF LENGTH(exists_info) > 0  THEN
        exists_info := exists_info || ', ';
      END IF;
      exists_info := TO_CHAR(numer);
    END IF;

    -- Sprawdzanie, czy nazwa bandy już istnieje
    IF nazwa_bandy = banda.nazwa THEN
      existence := TRUE;
      IF LENGTH(exists_info) > 0  THEN
        exists_info := exists_info || ', ';
      END IF;
      exists_info := exists_info || nazwa_bandy;
    END IF;

    -- Sprawdzanie, czy teren bandy już istnieje
    IF teren_bandy = banda.teren THEN
      existence := TRUE;
        IF LENGTH(exists_info) > 0  THEN
          exists_info := exists_info || ', ';
        END IF;
      exists_info := exists_info || teren_bandy;
    END IF;
  END LOOP;

  -- Zamknięcie kursora
  CLOSE bandyCursor;

  -- Jeśli istnieją konflikty, podnieś wyjątek
  IF existence THEN
    RAISE exception_exists;
  END IF;

  -- Wstawianie nowej bandy
  INSERT INTO Bandy VALUES (numer, nazwa_bandy, teren_bandy, NULL);

  DBMS_OUTPUT.PUT_LINE('Banda zosta a pomy lnie dodana.');

EXCEPTION
  WHEN exception_negative THEN
    DBMS_OUTPUT.PUT_LINE('Numer bandy musi by  liczb  dodatni .');
  WHEN exception_exists THEN
    DBMS_OUTPUT.PUT_LINE(exists_info || ': ju  istnieje.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM); -- Obs uga innych b  d w
END;
/

-- Wy wietlenie tabeli po zako czeniu operacji
SELECT nr_bandy, nazwa, teren FROM Bandy ORDER BY nr_bandy;

ROLLBACK;

-- Wy wietlenie tabeli po przywr ceniu stanu pierwotnego
SELECT nr_bandy, nazwa, teren FROM Bandy ORDER BY nr_bandy;

--Zad. 40.
CREATE OR REPLACE PROCEDURE DodajBande (
  numer IN NUMBER,
  nazwa_bandy IN VARCHAR2,
  teren_bandy IN VARCHAR2
)
AS
  CURSOR bandyCursor IS SELECT * FROM Bandy;
  banda Bandy%ROWTYPE;

  negative_number BOOLEAN := FALSE; -- Flaga dla numeru ujemnego
  exception_negative EXCEPTION; -- Wyj tek dla numeru ujemnego

  existence BOOLEAN := FALSE; -- Flaga dla istniej cych danych
  exists_info VARCHAR2(500) := NULL; -- Informacje o istniej cych danych
  exception_exists EXCEPTION; -- Wyj tek dla istniej cych danych
BEGIN
  -- Sprawdzenie, czy numer jest dodatni
  IF numer <= 0 THEN
    negative_number := TRUE;
    RAISE exception_negative;
  END IF;

  -- Otwieranie kursora
  OPEN bandyCursor;

  LOOP
    FETCH bandyCursor INTO banda;
    EXIT WHEN bandyCursor%NOTFOUND;

    -- Sprawdzanie, czy numer bandy ju  istnieje
    IF numer = banda.nr_bandy THEN
      existence := TRUE;
      IF LENGTH(exists_info) > 0  THEN
        exists_info := exists_info || ', ';
      END IF;
      exists_info := TO_CHAR(numer);
    END IF;

    -- Sprawdzanie, czy nazwa bandy ju  istnieje
    IF nazwa_bandy = banda.nazwa THEN
      existence := TRUE;
      IF LENGTH(exists_info) > 0  THEN
        exists_info := exists_info || ', ';
      END IF;
      exists_info := exists_info || nazwa_bandy;
    END IF;

    -- Sprawdzanie, czy teren bandy ju  istnieje
    IF teren_bandy = banda.teren THEN
      existence := TRUE;
        IF LENGTH(exists_info) > 0  THEN
          exists_info := exists_info || ', ';
        END IF;
      exists_info := exists_info || teren_bandy;
    END IF;
  END LOOP;

  -- Zamkni cie kursora
  CLOSE bandyCursor;

  -- Je li istniej  konflikty, podnie  wyj tek
  IF existence THEN
    RAISE exception_exists;
  END IF;

  -- Wstawianie nowej bandy
  INSERT INTO Bandy VALUES (numer, nazwa_bandy, teren_bandy, NULL);

  DBMS_OUTPUT.PUT_LINE('Banda zosta a pomy lnie dodana.');

EXCEPTION
  WHEN exception_negative THEN
    DBMS_OUTPUT.PUT_LINE('Numer bandy musi by  liczb  dodatni .');
  WHEN exception_exists THEN
    DBMS_OUTPUT.PUT_LINE(exists_info || ': ju  istnieje.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM); -- Obs uga innych b  d w
END;
/

--Zad. 41.
CREATE OR REPLACE TRIGGER next_number
BEFORE INSERT ON Bandy
FOR EACH ROW
BEGIN
  IF :NEW.nr_bandy IS NULL THEN
    SELECT NVL(MAX(nr_bandy), 0) + 1
    INTO :NEW.nr_bandy
    FROM Bandy;
  END IF;
END;
/

BEGIN
  DodajBande(2, 'NURKOWIE', 'JEZIORO');
END;
/
SELECT * FROM Bandy ORDER BY nr_bandy;
ROLLBACK;
/

--Zad. 42a.
CREATE OR REPLACE PACKAGE wirus AS
  active BOOLEAN := FALSE;
  down BOOLEAN := FALSE;
  mutex BOOLEAN := FALSE;
  min_przydzial NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY wirus AS
BEGIN
  mutex := FALSE;
END;

CREATE OR REPLACE TRIGGER wirus_set
BEFORE UPDATE ON Kocury
BEGIN
  SELECT przydzial_myszy INTO wirus.min_przydzial FROM Kocury WHERE pseudo = 'TYGRYS';

END;

CREATE OR REPLACE TRIGGER wirus_przed
BEFORE UPDATE ON Kocury
FOR EACH ROW
  BEGIN
    IF :NEW.funkcja = 'MILUSIA' AND NOT wirus.mutex THEN
      wirus.active := TRUE;

      IF :NEW.przydzial_myszy < :OLD.przydzial_myszy THEN
        :NEW.przydzial_myszy := :OLD.przydzial_myszy;
      END IF;
      IF :NEW.przydzial_myszy - :OLD.przydzial_myszy <  0.1 * wirus.min_przydzial THEN
        :NEW.przydzial_myszy := :NEW.przydzial_myszy + 0.1 * wirus.min_przydzial ;
        :NEW.myszy_extra := :NEW.myszy_extra + 5;
        wirus.down := TRUE;
      END IF;
    END IF;
  END;

CREATE OR REPLACE TRIGGER wirus_po
AFTER UPDATE ON Kocury
  BEGIN
      IF wirus.active THEN
        wirus.mutex := TRUE;
        wirus.active := FALSE;
        IF wirus.down THEN
          wirus.down := FALSE;
          UPDATE kocury SET przydzial_myszy = przydzial_myszy - 0.1 * wirus.min_przydzial WHERE pseudo = 'TYGRYS';
        ELSE
          UPDATE kocury SET myszy_extra = myszy_extra + 5 WHERE pseudo = 'TYGRYS';
        END IF;
        wirus.mutex := FALSE;
      END IF;
  END;
  /
  
ALTER TRIGGER wirus_set ENABLE;
ALTER TRIGGER wirus_przed ENABLE;
ALTER TRIGGER wirus_po ENABLE;

ALTER TRIGGER wirus_set DISABLE;
ALTER TRIGGER wirus_przed DISABLE;
ALTER TRIGGER wirus_po DISABLE;

SELECT * FROM kocury WHERE funkcja = 'MILUSIA';
UPDATE kocury
SET przydzial_myszy = 21
WHERE funkcja = 'MILUSIA';
ROLLBACK;
/

  --Zad. 47.
DROP VIEW Wpis_O;
DROP VIEW Elita_O;
DROP VIEW Plebs_O;
DROP VIEW Kocury_O;
DROP VIEW Kocury_S;

DROP TABLE WpisT;
DROP TABLE ElitaT;
DROP TABLE PlebsT;
DROP TABLE KocuryT;

DROP TABLE Wpis CASCADE CONSTRAINTS;
DROP TABLE Elita CASCADE CONSTRAINTS;
DROP TABLE Plebs CASCADE CONSTRAINTS;
DROP TABLE Kocury CASCADE CONSTRAINTS;

DROP TYPE WpisO;
DROP TYPE ElitaO;
DROP TYPE PlebsO;
DROP TYPE KocuryO;
DROP TYPE KocuryVO;

CREATE OR REPLACE TYPE KocuryO AS OBJECT
(
 imie VARCHAR2(15),
 plec VARCHAR2(1),
 pseudo VARCHAR2(10),
 funkcja VARCHAR2(10),
 szef REF KocuryO,
 w_stadku_od DATE,
 przydzial_myszy NUMBER(3),
 myszy_extra NUMBER(3),
 nr_bandy NUMBER(2),
 MEMBER FUNCTION w_stadku_format RETURN VARCHAR2,
MEMBER FUNCTION pelny_przydzial RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY KocuryO AS
  MEMBER FUNCTION w_stadku_format RETURN VARCHAR2 IS
    BEGIN
      RETURN TO_CHAR(w_stadku_od, 'yyyy-mm-dd');
    END;
  MEMBER FUNCTION pelny_przydzial RETURN NUMBER IS
    BEGIN
      RETURN przydzial_myszy + NVL(myszy_extra, 0);
    END;
END;
/

CREATE OR REPLACE TYPE PlebsO AS OBJECT
(
  idn INTEGER,
  kot REF KocuryO,
  MEMBER FUNCTION dane_o_kocie RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY PlebsO AS
  MEMBER FUNCTION dane_o_kocie RETURN VARCHAR2 IS
      text VARCHAR2(500);
    BEGIN
      SELECT 'IMIE: ' || DEREF(kot).imie || ' PSEUDO ' || DEREF(kot).pseudo INTO text FROM dual;
      RETURN text;
    END;
END;
/

CREATE OR REPLACE TYPE ElitaO AS OBJECT
(
  idn INTEGER,
  kot REF KocuryO,
  sluga REF PlebsO,
  MEMBER FUNCTION pobierz_sluge RETURN REF PlebsO
);
/

CREATE OR REPLACE TYPE BODY ElitaO AS
  MEMBER FUNCTION pobierz_sluge RETURN REF PlebsO IS
    BEGIN
      RETURN sluga;
    END;
END;
/

CREATE OR REPLACE TYPE WpisO AS OBJECT
(
  idn INTEGER,
  dataWprowadzenia DATE,
  dataUsuniecia DATE,
  kot REF ElitaO,
  MEMBER PROCEDURE wyprowadz_mysz(dat DATE)
);
/

CREATE OR REPLACE TYPE BODY WpisO AS
  MEMBER PROCEDURE wyprowadz_mysz(dat DATE) IS
    BEGIN
      datausuniecia := dat;
    END;
END;
/

CREATE TABLE KocuryT OF KocuryO
(CONSTRAINT KocuryT_key PRIMARY KEY (pseudo));

CREATE TABLE PlebsT OF PlebsO
(CONSTRAINT PlebsT_key PRIMARY KEY (idn));

CREATE TABLE ElitaT OF ElitaO
(CONSTRAINT ElitaT_key PRIMARY KEY (idn));

CREATE TABLE WpisT OF WpisO
(CONSTRAINT WpisT_key PRIMARY KEY (idn));

DECLARE
  szef_ref REF KocuryO;
BEGIN
  INSERT INTO KocuryT 
  VALUES (KocuryO('JACEK','M','PLACEK','LOWCZY',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'LYSY'),
                  '2008-12-01',67,NULL,2));

  INSERT INTO KocuryT 
  VALUES (KocuryO('BARI','M','RURA','LAPACZ',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'LYSY'),
                  '2009-09-01',56,NULL,2));

  INSERT INTO KocuryT 
  VALUES (KocuryO('MICKA','D','LOLA','MILUSIA',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'TYGRYS'),
                  '2009-10-14',25,47,1));

  INSERT INTO KocuryT 
  VALUES (KocuryO('LUCEK','M','ZERO','KOT',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'KURKA'),
                  '2010-03-01',43,NULL,3));

  INSERT INTO KocuryT 
  VALUES (KocuryO('SONIA','D','PUSZYSTA','MILUSIA',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'ZOMBI'),
                  '2010-11-18',20,35,3));

  INSERT INTO KocuryT 
  VALUES (KocuryO('LATKA','D','UCHO','KOT',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'RAFA'),
                  '2011-01-01',40,NULL,4));

  INSERT INTO KocuryT 
  VALUES (KocuryO('DUDEK','M','MALY','KOT',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'RAFA'),
                  '2011-05-15',40,NULL,4));

  INSERT INTO KocuryT 
  VALUES (KocuryO('MRUCZEK','M','TYGRYS','SZEFUNIO',
                  NULL,
                  '2002-01-01',103,33,1));

  INSERT INTO KocuryT 
  VALUES (KocuryO('CHYTRY','M','BOLEK','DZIELCZY',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'TYGRYS'),
                  '2002-05-05',50,NULL,1));

  INSERT INTO KocuryT 
  VALUES (KocuryO('KOREK','M','ZOMBI','BANDZIOR',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'TYGRYS'),
                  '2004-03-16',75,13,3));

  INSERT INTO KocuryT 
  VALUES (KocuryO('BOLEK','M','LYSY','BANDZIOR',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'TYGRYS'),
                  '2006-08-15',72,21,2));

  INSERT INTO KocuryT 
  VALUES (KocuryO('ZUZIA','D','SZYBKA','LOWCZY',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'LYSY'),
                  '2006-07-21',65,NULL,2));

  INSERT INTO KocuryT 
  VALUES (KocuryO('RUDA','D','MALA','MILUSIA',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'TYGRYS'),
                  '2006-09-17',22,42,1));

  INSERT INTO KocuryT 
  VALUES (KocuryO('PUCEK','M','RAFA','LOWCZY',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'TYGRYS'),
                  '2006-10-15',65,NULL,4));

  INSERT INTO KocuryT 
  VALUES (KocuryO('PUNIA','D','KURKA','LOWCZY',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'ZOMBI'),
                  '2008-01-01',61,NULL,3));

  INSERT INTO KocuryT 
  VALUES (KocuryO('BELA','D','LASKA','MILUSIA',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'LYSY'),
                  '2008-02-01',24,28,2));

  INSERT INTO KocuryT 
  VALUES (KocuryO('KSAWERY','M','MAN','LAPACZ',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'RAFA'),
                  '2008-07-12',51,NULL,4));

  INSERT INTO KocuryT 
  VALUES (KocuryO('MELA','D','DAMA','LAPACZ',
                  (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'RAFA'),
                  '2008-11-01',51,NULL,4));

  COMMIT;
END;
/

UPDATE KocuryT 
  SET szef = (SELECT REF(K) FROM KocuryT K WHERE K.pseudo = 'RAFA') WHERE pseudo = 'MALY';

SELECT * FROM KocuryT;


INSERT INTO PlebsT
    SELECT PlebsO(ROWNUM, REF(K))
    FROM KocuryT K
    WHERE K.funkcja = 'KOT';
COMMIT;


INSERT INTO ElitaT
  SELECT ElitaO(ROWNUM, REF(K), NULL)
  FROM KocuryT K
  WHERE K.szef = 'TYGRYS'
        OR K.szef IS NULL;
COMMIT;

UPDATE ElitaT
SET sluga = (SELECT REF(T) FROM plebst T WHERE idn = 1)
WHERE DEREF(kot).pseudo = 'RAFA';
COMMIT;

INSERT INTO WpisT
  SELECT WpisO(ROWNUM, ADD_MONTHS(CURRENT_DATE, -TRUNC(DBMS_RANDOM.VALUE(0, 12))), NULL, REF(K))
  FROM ElitaT K;
COMMIT;

-- JOIN na REF
SELECT * FROM wpist w JOIN (KocuryT k JOIN elitat e ON e.kot = REF(k)) ON w.kot = REF(e);

-- Podzapytanie
SELECT ("p").dane_o_kocie()
FROM kocuryt k JOIN (SELECT DEREF(e.pobierz_sluge()) "p" FROM elitat e)  ON ("p").kot = REF(k);

-- grupowanie
SELECT k.pelny_przydzial()/10 FROM KocuryT k
GROUP BY k.pelny_przydzial() / 10
HAVING k.pelny_przydzial() / 10 > 10;

-- Zad. 18. dla 47.
SELECT C1.imie, C1.w_stadku_format() "Poluje od"
FROM KocuryT C1 JOIN KocuryT C2 ON C2.imie = 'JACEK'
WHERE C1.w_stadku_od < C2.w_stadku_od
ORDER BY C1.w_stadku_od DESC;

-- Zad. 19a. dla 47.

SELECT K.imie "Imie",
       K.funkcja "Funkcja",
       K.szef.imie "Szef 1",
       K.szef.szef.imie "Szef 2",
       K.szef.szef.szef.imie "Szef 3"
FROM KocuryT K
WHERE K.funkcja IN ('KOT', 'MILUSIA');

--Zad 35. dla 47.
SET SERVEROUTPUT ON;

DECLARE
  pseudonim_input VARCHAR2(15);
  przydzial_roczny NUMBER;
  imie_kota VARCHAR2(15);
  miesiac_przystapienia NUMBER;
BEGIN
  pseudonim_input := UPPER('PUSZYSTA');
  
  SELECT (przydzial_myszy + NVL(myszy_extra, 0)) * 12, imie, EXTRACT(MONTH FROM w_stadku_od)
  INTO przydzial_roczny, imie_kota, miesiac_przystapienia
  FROM KocuryT
  WHERE pseudo = pseudonim_input;

  IF przydzial_roczny > 700 THEN
    DBMS_OUTPUT.PUT_LINE('Calkowity roczny przydzial myszy jest wiekszy niz 700');
  ELSIF INSTR(imie_kota, 'A') > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Imie zawiera litere A.');
  ELSIF miesiac_przystapienia = 5 THEN
    DBMS_OUTPUT.PUT_LINE('Maj jest miesiacem przystapienia do stada.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nie odpowiada kryteriom.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nie znaleziono kota o podanym pseudonimie.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Wyst?pi? nieoczekiwany b??d.');
    DBMS_OUTPUT.PUT_LINE('Kod b??du: ' || SQLCODE || '; Komunikat: ' || SQLERRM);
END;
/

--Zad. 36. dla 47.
SET SERVEROUTPUT ON;

DECLARE
  CURSOR kocuryC IS
    SELECT *
    FROM KocuryT
    ORDER BY przydzial_myszy ASC;
  kocur kocuryC%ROWTYPE;
  suma NUMBER;
  maxf NUMBER;
  pp NUMBER;
  liczba_modyfikacji NUMBER := 0;
BEGIN
  LOOP
    SELECT SUM(przydzial_myszy) INTO suma FROM KocuryT;

    EXIT WHEN suma > 1050;

    OPEN kocuryC;

    LOOP
      FETCH kocuryC INTO kocur;
      EXIT WHEN kocuryC%NOTFOUND;

      SELECT max_myszy INTO maxf
      FROM Funkcje
      WHERE funkcja = kocur.funkcja;

      pp := kocur.przydzial_myszy * 1.1;

      IF pp > maxf THEN
        pp := maxf;
      END IF;

      UPDATE KocuryT
      SET przydzial_myszy = pp
      WHERE pseudo = kocur.pseudo;

      liczba_modyfikacji := liczba_modyfikacji + 1;
    END LOOP;

    CLOSE kocuryC;
  END LOOP;

  SELECT SUM(przydzial_myszy) INTO suma FROM Kocury;
  DBMS_OUTPUT.PUT_LINE('Suma przydzia??w myszy po zadaniu: ' || suma);
  DBMS_OUTPUT.PUT_LINE('Liczba modyfikacji w relacji Kocury: ' || liczba_modyfikacji);

END;
/

SELECT imie, przydzial_myszy "Myszki po podwy?ce"
FROM Kocury;

  ROLLBACK;
/

--Zad. 48.
CREATE OR REPLACE TYPE KocuryV AS OBJECT
(
  imie VARCHAR2(15),
  plec VARCHAR2(1),
  pseudo VARCHAR2(10),
  funkcja VARCHAR2(10),
  szef REF KocuryV,
  w_stadku_od DATE,
  przydzial_myszy NUMBER(3),
  myszy_extra NUMBER(3),
  nr_bandy NUMBER(2),
MEMBER FUNCTION w_stadku_format RETURN VARCHAR2,
MEMBER FUNCTION pelny_przydzial RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY KocuryV AS
  MEMBER FUNCTION w_stadku_format RETURN VARCHAR2 IS
    BEGIN
      RETURN TO_CHAR(w_stadku_od, 'yyyy-mm-dd');
    END;
  MEMBER FUNCTION pelny_przydzial RETURN NUMBER IS
    BEGIN
      RETURN przydzial_myszy + NVL(myszy_extra, 0);
    END;
END;
/

CREATE OR REPLACE TYPE KocuryVO AS OBJECT
(
  kot kocuryV,
  szef REF kocuryV
);
/

CREATE TABLE Plebs (
  idn INTEGER CONSTRAINT plebs_pk PRIMARY KEY,
  kot VARCHAR2(10) CONSTRAINT plebks_fk REFERENCES KocuryT(pseudo)
);
/

CREATE TABLE Elita (
  idn INTEGER CONSTRAINT elita_pk PRIMARY KEY,
  kot VARCHAR2(10) CONSTRAINT elita_fk REFERENCES KocuryT(pseudo),
  sluga NUMBER CONSTRAINT elita_sluga_fk REFERENCES Plebs(idn)
);
/

CREATE TABLE Wpis (
  idn INTEGER CONSTRAINT wpis_pk PRIMARY KEY,
  dataWprowadzenia DATE,
  dataUsuniecia DATE,
  kot NUMBER CONSTRAINT wpis_fk REFERENCES Elita(idn)
);
/

CREATE OR REPLACE VIEW Kocury_S OF KocuryV
WITH OBJECT IDENTIFIER (pseudo) AS
SELECT KocuryV(imie, plec, pseudo, funkcja, NULL, w_stadku_od, przydzial_myszy, myszy_extra, nr_bandy)
FROM KocuryT;

CREATE OR REPLACE VIEW Kocury_O OF KocuryO
WITH OBJECT IDENTIFIER (pseudo) AS
SELECT KocuryO(
         imie,
         plec,
         pseudo,
         funkcja,
         szef,
         w_stadku_od,
         przydzial_myszy,
         myszy_extra,
         nr_bandy
       )
FROM KocuryT;

CREATE OR REPLACE VIEW Plebs_O OF PlebsO
WITH OBJECT IDENTIFIER (idn) AS
SELECT idn, MAKE_REF(Kocury_O, kot) kot
FROM Plebs;

CREATE OR REPLACE VIEW Elita_O OF ElitaO
WITH OBJECT IDENTIFIER (idn) AS
SELECT idn, MAKE_REF(Kocury_O, kot) kot, MAKE_REF(Plebs_O, sluga) sluga
FROM Elita;

CREATE OR REPLACE VIEW Wpis_O OF WpisO
WITH OBJECT IDENTIFIER (idn) AS
SELECT idn, datawprowadzenia, Wpis.datausuniecia, MAKE_REF(Elita_O, kot) kot
FROM Wpis;


INSERT INTO Plebs_O
  SELECT PlebsO(ROWNUM, REF(K))
  FROM Kocury_O K
  WHERE K.funkcja = 'KOT';
COMMIT;


INSERT INTO Elita_O
  SELECT ElitaO(ROWNUM, REF(K), NULL)
  FROM Kocury_O K
  WHERE K.szef = 'TYGRYS'
        OR K.szef IS NULL;
COMMIT;

UPDATE Elita_O
SET sluga = (SELECT REF(T) FROM plebs_o T WHERE idn = 1)
WHERE DEREF(kot).pseudo = 'RAFA';
COMMIT;

INSERT INTO Wpis_O
  SELECT WpisO(ROWNUM, ADD_MONTHS(CURRENT_DATE, -TRUNC(DBMS_RANDOM.VALUE(0, 12))), NULL, REF(K))
  FROM Elita_O K;
COMMIT;


-- JOIN na REF
SELECT * FROM wpis_O w JOIN (Kocury_O k JOIN Elita_O e ON e.kot = REF(k)) ON w.kot = REF(e);

-- Podzapytanie
SELECT ("p").dane_o_kocie()
FROM kocury_o k JOIN (SELECT DEREF(e.pobierz_sluge()) "p" FROM elita_o e)  ON ("p").kot = REF(k) ;

-- grupowanie
SELECT k.pelny_przydzial()/10 FROM kocury_o k
GROUP BY k.pelny_przydzial() / 10
HAVING k.pelny_przydzial() / 10 > 10 ;

-- Zad. 18. dla 48.
SELECT C1.imie, C1.w_stadku_format() "Poluje od"
FROM Kocury_O C1 JOIN Kocury_O C2 ON C2.imie = 'JACEK'
WHERE C1.w_stadku_od < C2.w_stadku_od
ORDER BY C1.w_stadku_od DESC;

-- Zad. 19a. dla 48.
SELECT C1.imie "Imie", C1.funkcja "Funkcja", C2.imie "Szef 1", C3.imie "Szef 2", C4.imie "Szef 3"
FROM Kocury_O C1 LEFT JOIN
(Kocury_O C2 LEFT JOIN
(Kocury_O C3 LEFT JOIN Kocury_O C4
ON C3.szef = C4.pseudo)
ON C2.szef = C3.pseudo)
ON C1.szef = C2.pseudo
WHERE C1.funkcja = 'KOT' OR C1.funkcja = 'MILUSIA';

--Zad 35. dla 48.
SET SERVEROUTPUT ON;

DECLARE
  pseudonim_input VARCHAR2(15);
  przydzial_roczny NUMBER;
  imie_kota VARCHAR2(15);
  miesiac_przystapienia NUMBER;
BEGIN
  pseudonim_input := UPPER('PUSZYSTA');
  
  SELECT (przydzial_myszy + NVL(myszy_extra, 0)) * 12, imie, EXTRACT(MONTH FROM w_stadku_od)
  INTO przydzial_roczny, imie_kota, miesiac_przystapienia
  FROM Kocury_O
  WHERE pseudo = pseudonim_input;

  IF przydzial_roczny > 700 THEN
    DBMS_OUTPUT.PUT_LINE('Calkowity roczny przydzial myszy jest wiekszy niz 700');
  ELSIF INSTR(imie_kota, 'A') > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Imie zawiera litere A.');
  ELSIF miesiac_przystapienia = 5 THEN
    DBMS_OUTPUT.PUT_LINE('Maj jest miesiacem przystapienia do stada.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nie odpowiada kryteriom.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nie znaleziono kota o podanym pseudonimie.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Wyst?pi? nieoczekiwany b??d.');
    DBMS_OUTPUT.PUT_LINE('Kod b??du: ' || SQLCODE || '; Komunikat: ' || SQLERRM);
END;
/

--Zad. 36. dla 48.
SET SERVEROUTPUT ON;

DECLARE
  CURSOR kocuryC IS
    SELECT *
    FROM Kocury_O
    ORDER BY przydzial_myszy ASC;
  kocur kocuryC%ROWTYPE;
  suma NUMBER;
  maxf NUMBER;
  pp NUMBER;
  liczba_modyfikacji NUMBER := 0;
BEGIN
  LOOP
    SELECT SUM(przydzial_myszy) INTO suma FROM Kocury_O;

    EXIT WHEN suma > 1050;

    OPEN kocuryC;

    LOOP
      FETCH kocuryC INTO kocur;
      EXIT WHEN kocuryC%NOTFOUND;

      SELECT max_myszy INTO maxf
      FROM Funkcje
      WHERE funkcja = kocur.funkcja;

      pp := kocur.przydzial_myszy * 1.1;

      IF pp > maxf THEN
        pp := maxf;
      END IF;

      UPDATE Kocury_O
      SET przydzial_myszy = pp
      WHERE pseudo = kocur.pseudo;

      liczba_modyfikacji := liczba_modyfikacji + 1;
    END LOOP;

    CLOSE kocuryC;
  END LOOP;

  SELECT SUM(przydzial_myszy) INTO suma FROM Kocury;
  DBMS_OUTPUT.PUT_LINE('Suma przydzia??w myszy po zadaniu: ' || suma);
  DBMS_OUTPUT.PUT_LINE('Liczba modyfikacji w relacji Kocury: ' || liczba_modyfikacji);

END;
/

SELECT imie, przydzial_myszy "Myszki po podwy?ce"
FROM Kocury_O;

  ROLLBACK;
/

--Zad. 49.
DROP TABLE myszy;
DROP TABLE myszy_tmp;

CREATE TABLE Myszy(nr_myszy NUMBER CONSTRAINT myszy_pk PRIMARY KEY,
                   lowca VARCHAR2(10) CONSTRAINT lowca_fk REFERENCES Kocury(pseudo),
                   zjadacz VARCHAR2(10) CONSTRAINT zajadacz_fk REFERENCES Kocury(pseudo),
                   waga_myszy NUMBER(3),
                   data_zlowienia DATE,
                   data_wydania DATE
);

CREATE TABLE Myszy_tmp(nr_myszy NUMBER CONSTRAINT myszy_tmp_pk PRIMARY KEY,
                   lowca VARCHAR2(10) CONSTRAINT lowca_tmp_fk REFERENCES Kocury(pseudo),
                   zjadacz VARCHAR2(10) CONSTRAINT zajadacz_tmp_fk REFERENCES Kocury(pseudo),
                   waga_myszy NUMBER(3),
                   data_zlowienia DATE,
                   data_wydania DATE
);

DECLARE
  from_date DATE := TO_DATE('2004-01-01');
  cat_date DATE;
  cat_date_record DATE;
  current_date DATE := TO_DATE('2025-01-23');
  max_month_diff INTEGER := MONTHS_BETWEEN(current_date, from_date);
  months_b INTEGER;
  extra_pseudo VARCHAR2(10) := 'TYGRYS';
  kocur_przydzial INTEGER;
  randFromDate DATE;
  randToDate DATE;
  kot_max INTEGER;

  suma INTEGER := 0;
  dostepnych INTEGER;


  TYPE MyszyTmp IS TABLE OF Myszy%ROWTYPE INDEX BY BINARY_INTEGER;
  myszyTmpTable MyszyTmp;
  myszyTmpIndex BINARY_INTEGER := 1;
  numer_myszy NUMBER := 1;


  CURSOR kocuryC IS SELECT * FROM Kocury ORDER BY przydzial_myszy + NVL(myszy_extra, 0), w_stadku_od;
  kocur Kocury%ROWTYPE;

  TYPE myszyCT IS REF CURSOR;
  myszyC myszyCT;
  tmpMysz myszy_tmp%ROWTYPE;

  CURSOR avgsC IS (SELECT (SELECT CEIL(AVG(przydzial_myszy + NVL(myszy_extra, 0))) FROM kocury WHERE w_stadku_od < "dat")
                   FROM (SELECT trunc(LAST_DAY(ADD_MONTHS(sysdate, -rn + 1))) "dat"
                         FROM (SELECT rownum rn
                               FROM dual
                               CONNECT BY level <= max_month_diff + 1)
                        ) dates);
  avgs INTEGER;

  CURSOR srodyC IS SELECT NEXT_DAY(LAST_DAY(ADD_MONTHS(sysdate, -rn + 1)) - 7, 3) "dat"
                   FROM (SELECT rownum rn
                         FROM dual
                         CONNECT BY level <= max_month_diff +1);
  sroda DATE;

BEGIN
  DELETE FROM myszy_Tmp;

  OPEN kocuryC;


  LOOP
    FETCH kocuryC INTO kocur;
    EXIT WHEN kocuryC%NOTFOUND;

    IF kocur.w_stadku_od < from_date THEN
      cat_date := from_date;
    ELSE
      cat_date := kocur.w_stadku_od;
    END IF;

    cat_date_record := cat_date;
    months_b := MONTHS_BETWEEN(current_date, cat_date);
    kocur_przydzial := kocur.przydzial_myszy + NVL(kocur.myszy_extra, 0);

    OPEN avgsC;
    OPEN srodyC;

    FOR i IN 0..(months_b-1)
    LOOP
      FETCH avgsC INTO avgs;
      FETCH srodyC INTO sroda;

      EXIT WHEN avgsC%NOTFOUND;
      EXIT WHEN srodyC%NOTFOUND;

      IF i = (months_b-1) AND TRUNC(ADD_MONTHS(current_date, -i), 'MONTH') = TRUNC(kocur.w_stadku_od, 'MONTH') THEN
        randFromDate := kocur.w_stadku_od;
      ELSE
        randFromDate := TRUNC(ADD_MONTHS(current_date, -i), 'MONTH');
      END IF;

      IF i = 0 THEN
        randToDate := current_date;
      ELSE
        randToDate := sroda;
      END IF;

      IF kocur_przydzial <= avgs THEN
        kot_max := kocur_przydzial;
      ELSE
        kot_max := avgs;
      END IF;

      FOR j IN 1..kot_max
      LOOP
        myszyTmpTable(myszyTmpIndex).nr_myszy := numer_myszy;
        myszyTmpTable(myszyTmpIndex).zjadacz := kocur.pseudo;
        myszyTmpTable(myszyTmpIndex).lowca := kocur.pseudo;
        myszyTmpTable(myszyTmpIndex).waga_myszy := CEIL(DBMS_RANDOM.VALUE(16, 60));
        myszyTmpTable(myszyTmpIndex).data_zlowienia := randFromDate + DBMS_RANDOM.VALUE(0, randToDate - randFromDate);
        myszyTmpTable(myszyTmpIndex).data_wydania := sroda;

        myszyTmpIndex := myszyTmpIndex + 1;
        numer_myszy := numer_myszy + 1;
      END LOOP;

      IF avgs >= kocur_przydzial THEN
        suma := suma + (avgs - kocur_przydzial);
        FOR k IN 1..(avgs - kocur_przydzial)
        LOOP
          INSERT INTO myszy_tmp VALUES(numer_myszy, kocur.pseudo, NULL,
                                       CEIL(DBMS_RANDOM.VALUE(16, 60)),
                                       randFromDate + DBMS_RANDOM.VALUE(0, randToDate - randFromDate), sroda);
          numer_myszy := numer_myszy + 1;
        END LOOP;
      ELSE
        OPEN myszyC FOR SELECT * FROM myszy_tmp WHERE TRUNC(data_zlowienia, 'MONTH') = TRUNC(randFromDate, 'MONTH')
                                                      AND TRUNC(data_wydania, 'MONTH') = TRUNC(randToDate, 'MONTH');
        FOR k IN 1..(kocur_przydzial - avgs)
        LOOP
          FETCH myszyC INTO tmpMysz;
          EXIT WHEN myszyC%NOTFOUND;
          myszyTmpTable(myszyTmpIndex).nr_myszy := tmpMysz.nr_myszy;
          myszyTmpTable(myszyTmpIndex).zjadacz := kocur.pseudo;
          myszyTmpTable(myszyTmpIndex).lowca := tmpMysz.lowca;
          myszyTmpTable(myszyTmpIndex).waga_myszy := tmpmysz.waga_myszy;
          myszyTmpTable(myszyTmpIndex).data_zlowienia := tmpmysz.data_zlowienia;
          myszyTmpTable(myszyTmpIndex).data_wydania := tmpmysz.data_wydania;
          myszyTmpIndex := myszyTmpIndex + 1;
          DELETE FROM myszy_tmp WHERE nr_myszy = tmpmysz.nr_myszy;
        END LOOP;
      END IF;
    END LOOP;
    CLOSE avgsC;
    CLOSE srodyC;
  END LOOP;


  OPEN myszyC FOR SELECT *  FROM myszy_tmp;
  LOOP
    FETCH myszyC INTO tmpMysz;
    EXIT WHEN myszyC%NOTFOUND;

    myszyTmpTable(myszyTmpIndex).nr_myszy := tmpMysz.nr_myszy;
    myszyTmpTable(myszyTmpIndex).zjadacz := extra_pseudo;
    myszyTmpTable(myszyTmpIndex).lowca := tmpMysz.lowca;
    myszyTmpTable(myszyTmpIndex).waga_myszy := tmpmysz.waga_myszy;
    myszyTmpTable(myszyTmpIndex).data_zlowienia := tmpmysz.data_zlowienia;
    myszyTmpTable(myszyTmpIndex).data_wydania := tmpmysz.data_wydania;
    myszyTmpIndex := myszyTmpIndex + 1;
    DELETE FROM myszy_tmp WHERE nr_myszy = tmpmysz.nr_myszy;
  END LOOP;

  FORALL i IN 1 .. myszyTmpTable.COUNT
  INSERT INTO Myszy VALUES (
    myszyTmpTable(i).nr_myszy,
    myszyTmpTable(i).lowca,
    myszyTmpTable(i).zjadacz,
    myszyTmpTable(i).waga_myszy,
    myszyTmpTable(i).data_zlowienia,
    myszyTmpTable(i).data_wydania
  );
END;
/

CREATE OR REPLACE PROCEDURE przyjmij_myszy_od_kota(ps Kocury.pseudo%TYPE, data_z DATE) AS
  ile_pseudo NUMBER;

  TYPE MyszyTable IS TABLE OF MYSZY%ROWTYPE INDEX BY BINARY_INTEGER;
  lista_myszy MyszyTable;

  TYPE MyszyKotaType IS RECORD (nr_myszy MYSZY.nr_myszy%TYPE, waga_myszy MYSZY.waga_myszy%TYPE, data_zlowienia MYSZY.data_zlowienia%TYPE);
  TYPE MyszyKotaTable IS TABLE OF MyszyKotaType INDEX BY BINARY_INTEGER;
  upolowane_myszy MyszyKotaTable;

  indeks NUMBER;
  BEGIN
    SELECT  COUNT(*) INTO ile_pseudo FROM Kocury WHERE pseudo=ps;

    SELECT  MAX(nr_myszy) + 1 INTO indeks FROM Myszy;

    EXECUTE IMMEDIATE 'SELECT * FROM ZLOWIONE_MYSZY_' || ps || ' WHERE data_zlowienia=''' || data_z || ''''
    BULK COLLECT INTO upolowane_myszy;

    FOR i IN 1 .. upolowane_myszy.COUNT
    LOOP
      lista_myszy(i).nr_myszy := indeks;
      lista_myszy(i).waga_myszy := upolowane_myszy(i).waga_myszy;
      lista_myszy(i).data_zlowienia := upolowane_myszy(i).data_zlowienia;
      indeks := indeks + 1;
    END LOOP;

    FORALL i IN 1..lista_myszy.COUNT
    INSERT INTO Myszy VALUES(
      lista_myszy(i).nr_myszy,
      ps,
      NULL,
      lista_myszy(i).waga_myszy,
      lista_myszy(i).data_zlowienia,
      NULL
    );

    EXECUTE IMMEDIATE 'DELETE FROM ZLOWIONE_MYSZY_' || ps || ' WHERE data_zlowienia=''' || TO_DATE(data_z) || '''';
  END ;
/

CREATE OR REPLACE PROCEDURE wyplata AS
  koty_indeks NUMBER:=1;
  myszy_indeks NUMBER:=1;
  suma_przydzialow NUMBER:=0;
  przydzielono_mysz BOOLEAN;

  najblizsza_sroda DATE;

  TYPE MyszyTable IS TABLE OF Myszy%ROWTYPE INDEX BY BINARY_INTEGER;
  lista_myszy MyszyTable;

  TYPE Pair IS RECORD (pseudo Kocury.pseudo%TYPE, myszy NUMBER(3));
  TYPE PairTable IS TABLE OF Pair INDEX BY BINARY_INTEGER;
  lista_kotow PairTable;
  BEGIN
    SELECT  * BULK COLLECT INTO lista_myszy
    FROM Myszy
    WHERE zjadacz IS NULL;

    SELECT NEXT_DAY(LAST_DAY(SYSDATE) - 7, 3) INTO najblizsza_sroda FROM Dual;

    SELECT pseudo, przydzial_myszy + NVL(myszy_extra, 0) BULK COLLECT INTO lista_kotow
    FROM kocury
    WHERE w_stadku_od <= NEXT_DAY(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) - 7, 3)
    START WITH szef IS NULL
    CONNECT BY PRIOR pseudo = szef
    ORDER BY LEVEL ASC;

    FOR i IN 1 .. lista_kotow.COUNT
    LOOP
      suma_przydzialow := suma_przydzialow + lista_kotow(i).myszy;
    END LOOP;

    WHILE myszy_indeks <= lista_myszy.COUNT AND suma_przydzialow> 0
    LOOP
      przydzielono_mysz:=FALSE;
      WHILE NOT przydzielono_mysz
      LOOP
        IF lista_kotow(koty_indeks).myszy > 0 THEN
          lista_myszy(myszy_indeks).zjadacz       := lista_kotow(koty_indeks).pseudo;
          lista_myszy(myszy_indeks).data_wydania  := najblizsza_sroda;
          lista_kotow(koty_indeks).myszy          := lista_kotow(koty_indeks).myszy-1;
          suma_przydzialow := suma_przydzialow - 1;
          przydzielono_mysz := true;
          myszy_indeks := myszy_indeks + 1;
        END IF;
        koty_indeks := MOD(koty_indeks, lista_kotow.COUNT) + 1;
      END LOOP;
    END LOOP;

    FORALL i IN 1..lista_myszy.COUNT
    UPDATE  Myszy
    SET     data_wydania = lista_myszy(i).data_wydania,
      zjadacz = lista_myszy(i).zjadacz
    WHERE   nr_myszy = lista_myszy(i).nr_myszy;
  END;
  /
  
SELECT COUNT(*) FROM Myszy;
SELECT COUNT(*) FROM Myszy_tmp;

SELECT * FROM Myszy;
SELECT * FROM Myszy_tmp;



/*
ALTER TABLE Wrogowie_kocurow DROP CONSTRAINT wk_ps_fk;
ALTER TABLE Wrogowie_kocurow DROP CONSTRAINT wk_iw_fk;
ALTER TABLE Kocury DROP CONSTRAINT ko_fu_fk;
ALTER TABLE Kocury DROP CONSTRAINT ko_sz_fk;
ALTER TABLE Kocury DROP CONSTRAINT ko_nb_fk;
ALTER TABLE Bandy DROP CONSTRAINT ba_szb_fk;

DELETE FROM Kocury;
DELETE FROM Funkcje;
DELETE FROM Bandy;
DELETE FROM Wrogowie;
DELETE FROM Wrogowie_kocurow;

DROP TABLE Kocury;
DROP TABLE Funkcje;
DROP TABLE Bandy;
DROP TABLE Wrogowie;
DROP TABLE Wrogowie_kocurow; 
*/
