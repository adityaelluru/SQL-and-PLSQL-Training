SET SERVEROUTPUT ON;

DECLARE
    l_out_incentive_sal NUMBER;
BEGIN
    FOR i IN (
        SELECT
            *
        FROM
            emp
    ) LOOP
        l_out_incentive_sal := 0;
        incentive_sal(pn_in_empno =>i.empno,
                      pn_in_incentive=> 50,
                      p_out_increased_sal=>l_out_incentive_sal);
        dbms_output.put_line('emp no'
                             || i.empno
                             || ' /EMP NAME '
                             || i.ename
                             || '/PREVIOUS SAL'
                             || i.sal
                             || '/INCENTIVE SAL'
                             || l_out_incentive_sal);
      
      update emp set sal =l_out_incentive_sal where empno =i.empno;
    END LOOP;
END;