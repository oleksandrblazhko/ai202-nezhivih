1) вхідні параметри:

1.1) date - день, на який формується договір (рядок дати):
- умова 1) - рядок date має формат "день.місяць.рік";
- умова 2) - дата формованого договору не має бути менша (раніше) за поточну дату;

1.2) text - текст, завдяки якому формується договір (рядок тексту):
- умова 3) - рядок text має обмеження у типі символів, повинна бути тільки кірилиця;

2) значення, що повертаються функцією:
- значення = 1 - договір успішно сформований;
- значення = -1 - дата договору не відповідає умовам;
- значення = -2 - тескт договору не відповідає умовам.