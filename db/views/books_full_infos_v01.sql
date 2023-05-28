SELECT
  b.id AS book_id,
  b.name AS book_name,
  a.authors_middle_names,
  p.name AS publisher_name
FROM
  books b
JOIN
  book_authors ba ON b.id = ba.book_id
JOIN (
  SELECT
    b.id AS book_id, 
    STRING_AGG(a.middle_name, ', ') AS authors_middle_names
  FROM
    books b
  JOIN
    book_authors ba ON b.id = ba.book_id
  JOIN 
    authors a ON ba.author_id = a.id
  GROUP BY
    b.id
) as a ON b.id = a.book_id
JOIN
  publishers p ON b.publisher_id = p.id;