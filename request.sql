# Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe.

SELECT id, first_name, last_name
FROM Employee
WHERE team_id IS NULL

# Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé de leur vie.
select Employee.id, first_name, last_name from Employee
left join Leave on Employee.id = leave.employee_id 
where leave.employee_id is null

# Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé, le nom & prénom de l’employé qui prend congé et le nom de son équipe.

select leave.id, leave.start_date, leave.end_date , Employee.last_name, Employee.first_name, Team.name as team_name
from Leave
join Employee on leave.employee_id = Employee.id
join Team on Team.id = Employee.team_id

# Affichez par le nombre d’employés par contract_type, vous devez afficher le type de contrat, et le nombre d’employés associés.

select contract_type, count(contract_type) as number_of_employees from Employee
 GROUP BY contract_type

# Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend de start_date inclus jusqu’à end_date inclus.
select count(*) as number_of_employees_on_leave_today from Leave
where CURRENT_DATE between start_date and end_date