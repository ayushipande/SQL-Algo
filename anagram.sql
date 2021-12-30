DECLARE
    v_exception EXCEPTION;
    v_string char;
    v_count integer;
    v_count2 integer;
    var1 varchar2(20) := 'Silents';
    var2 varchar2(20) := 'Listens';
BEGIN
    IF length(var1) = length(var2) THEN
        --DBMS_Output.PUT_LINE('11');
        NULL;
    ELSE
        RAISE v_exception;
    END IF;
    FOR i IN 1..length(var1)
    LOOP
    --v1 :=substr(var1,i,1)
        IF regexp_count(var1,substr(var1,i,1),1,'i') = 1 OR INSTR(UPPER(var1),substr(UPPER(var1),i,1),1,1) = i
        THEN
            v_string := substr(var1,i,1);
            v_count := regexp_count(var1,v_string,1,'i');
            v_count2 := regexp_count(var2, v_string, 1, 'i');
            IF v_count = v_count2 THEN
        --DBMS_Output.PUT_LINE('11');
                
                NULL;
            ELSE
                RAISE v_exception;
            END IF;
        ELSE
            null;
        END IF;
    END LOOP;
    DBMS_Output.PUT_LINE('It is an Anagram');
    EXCEPTION
        WHEN v_exception THEN
        DBMS_Output.PUT_LINE('It is not an Anagram');
END;
