CREATE SEQUENCE seq_idFuncionario
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    MINVALUE 1
;
/

CREATE OR REPLACE TRIGGER FUNCIONARIOS_ID_TRG
BEFORE INSERT ON Funcionario
FOR EACH ROW
BEGIN
    :new.idFuncionario := seq_idFuncionario.nextval;
END;
/



CREATE SEQUENCE seq_idPaciente
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    MINVALUE 1
;
/

CREATE OR REPLACE TRIGGER PACIENTE_ID_TRG
BEFORE INSERT ON Paciente
FOR EACH ROW
BEGIN
    :new.idPaciente := seq_idPaciente.nextval;
END;
/


CREATE SEQUENCE seq_idFarmaceutico
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    MINVALUE 1
;
/

CREATE OR REPLACE TRIGGER FARMACEUTICO_ID_TRG
BEFORE INSERT ON Farmaceutico
FOR EACH ROW
BEGIN
    :new.idFarmaceutico := seq_idFarmaceutico.nextval;
END;
/

CREATE SEQUENCE seq_idPrescricao
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    MINVALUE 1
;
/

CREATE OR REPLACE TRIGGER PRESCRICAO_ID_TRG
BEFORE INSERT ON prescricao
FOR EACH ROW
BEGIN
    :new.idPrescricao := seq_idPrescricao.nextval;
END;
/


CREATE OR REPLACE TRIGGER PRESCRICAO_LIBERACAO_TRG
BEFORE UPDATE OR DELETE ON Prescricao
FOR EACH ROW
BEGIN
    if :old.liberacao = 'S' THEN
        raise_application_error (-20002, 'Prescrição Liberada, impossível alterar ou deletar.');
    end if;
END;
/
