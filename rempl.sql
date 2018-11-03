INSERT INTO date_dim (id, fullDate, day, month, monthNum, year)
SELECT n,
	TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'DD'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'Month'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'MM'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'YYYY')
FROM (
	SELECT level n
	FROM dual
	connect by level <= 365 * 3
	);

INSERT INTO time_dim (id, timeFull, timeFull24, heure, heure24, minute, am_pm)
SELECT n as id,
	to_char(t, 'HH:MI:SS AM'),
	to_char(t, 'HH24:MI:SS'),
	to_number(to_char(t, 'HH'), '00'),
	to_number(to_char(t, 'HH24'), '00'),
	to_number(to_char(t, 'MI'), '00'),
	to_char(t, 'AM')
FROM (
	SELECT level n, trunc(sysdate) + (level - 1)/1440 as t
	FROM dual
	connect by level <= 1440
	);