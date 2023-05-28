SELECT
  CONCAT(u.first_name, ' ', u.last_name) AS full_name,
  u.nickname,
  u.email,
  d.id AS department_id,
  d.name AS department_name,
  r.id AS role_id,
  r.name AS role_name,
  si.year,
  si.group_id,
  g.name AS group_name
  -- ,
  -- f.name AS facultie_name
FROM
  users u
JOIN
  student_infos si ON u.id = si.user_id
JOIN
  departments d ON u.department_id = d.id
JOIN
  roles r ON u.role_id = r.id
JOIN
  groups g ON si.group_id = g.id
-- JOIN 
--   facultie_groups fg on fg.group_id = g.id
-- JOIN
--   faculties f ON fg.facultie_id = fg.facultie_id
WHERE
  u.type = 'Student';