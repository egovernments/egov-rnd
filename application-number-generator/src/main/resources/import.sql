CREATE SEQUENCE NUM_SEQ;
INSERT INTO APP_NUMBER_FORMAT(id, name, format) VALUES(1, 'DYNAMIC_NUM', 'APPNO:{rnd(n,2)}/{rnd(a,2)}/{rnd(an,2)}-[{seq(num_seq,5)}-{expl(code,0)}-{expl(relationalEntity.name,0)}-{expl(name,1)}/{date(ddMMyyyy)}]');
INSERT INTO RELATIONAL_ENTITY(id, name) VALUES(1,'NAME');
INSERT INTO MAIN_ENTITY(id, code, relational_entity_id) VALUES(1,'CODE', 1);
INSERT INTO NON_RELATIONAL_ENTITY(id, name) VALUES(1,'NONREL_NAME');
