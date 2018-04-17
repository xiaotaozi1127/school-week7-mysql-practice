#取得平均薪水最高的公司
SELECT companyName, 
(SELECT avg(salary) from employee 
where companyId = company.id) as avgSalary from company
ORDER BY avgSalary DESC
limit 1;
#输出公司名称和平均薪水：companyName avgSalary


