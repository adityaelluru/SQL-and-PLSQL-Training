create or replace function incentive_sal_func (
    pn_in_empno          IN  NUMBER,
    pn_in_incentive      IN   NUMBER DEFAULT 1
 --   p_out_increased_sal   OUT NUMBER
)  return number AS

    CURSOR emp_detail (
        c_in_emp_no NUMBER
    ) IS
    SELECT
        sal
    FROM
        emp
    WHERE
        empno = c_in_emp_no;

    l_sal         NUMBER;
    l_incentive   NUMBER;
BEGIN
    OPEN emp_detail(pn_in_empno);
    FETCH emp_detail INTO l_sal;
    CLOSE emp_detail;
    l_incentive := l_sal * ( pn_in_incentive / 100 ) + l_sal;
    --p_out_increased_sal := l_incentive;
    return (l_incentive);
END incentive_sal_func;