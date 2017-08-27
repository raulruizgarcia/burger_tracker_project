Bugs to fix later:

- The path to add a burger to a deal uses the function find_deal_by_name() that returns a deal id after passing in a name as argument. This obviously might cause some problems if two deals have the same name.
Possible solutions:

  - Unique constraint in the database

  - Find another way to pass the id info from the HTML site to the post request.


- The website currently allows to add a burger to a deal in which it already exists. We should impede this somehow.
