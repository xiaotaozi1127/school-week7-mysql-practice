# 找出薪水在公司的平均薪水之上的人员名字
# 输出标准中包含Employee中所有字段和该employee所在公司名称以及该公司平均薪资：
# id | name | age | gender | companyId | salary | companyName | avgsal

CREATE TEMPORARY TABLE companyAvgSalary(companyId smallint, companyName VARCHAR(20), avgSal SMALLINT);

INSERT into companyAvgSalary
  (
SELECT id, companyName,
  (SELECT avg(salary) from employee where companyId = company.id)
from company);

SELECT id, name, age, gender, employee.companyId,
  salary, companyName, avgSal from employee, companyAvgSalary
where employee.companyId = companyAvgSalary.companyId
and employee.salary >= companyAvgSalary.avgSal;

DROP table companyAvgSalary;
