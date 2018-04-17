# 取得每个company中最高薪水的人员名字
select company.companyName as company_name, employee.name as employee_name
from company JOIN employee
on employee.id =
   (SELECT id FROM employee
   where employee.companyId = company.id
    ORDER BY salary desc
    limit 1);
# 输出结果包含公司名称和人员名称：companyName name
