# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts
     "SELECT projects.title, SUM(pledges.amount)  
     FROM PLEDGES join PROJECTS
     ON pledges.project_id = projects.id GROUP BY projects.id ORDER BY projects.title ASC"  ##SUM(pledges.amount) #GROUPBY 
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
    "SELECT users.name, users.age, SUM(pledges.amount) 
    FROM PLEDGES join USERS 
    ON users.id = pledges.user_id GROUP BY users.id
    ORDER BY users.name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal #cannot filter out negative values and decimal points out
  


     "SELECT projects.title, SUM(pledges.amount) - projects.funding_goal
     FROM PROJECTS 
     join PLEDGES 
     ON projects.id = pledges.project_id
     GROUP BY projects.title
      HAVING SUM(pledges.amount) >= projects.funding_goal" #or >= projects.funding_goal or >= 0
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount #cannot puts the girls Rosie, Hermione Pacha and Sophoie in order. WHy????! Same values but alphbaetically?
# "SELECT users.name, SUM(pledges.amount) 
#  FROM PLEDGES
#  JOIN USERS
#  ON users.id = pledges.user_id
#  GROUP BY users.id = pledges.user_id
#  ORDER BY SUM(pledges.amount)"
    "SELECT users.name, SUM(pledges.amount) 
      FROM pledges
      JOIN users
      ON users.id = pledges.user_id
      GROUP BY users.id 
      ORDER BY SUM(pledges.amount), users.name"




     #  "SELECT users.name, pledges.amount 
     # FROM pledges
     # join users
     # ON users.id = pledges.user_id
     # GROUP BY .id ORDER BY projects.title ASC"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  # "SELECT projects.category, SUM(pledges.amount) 
  #   FROM projects
  #   JOIN pledges
  #   ON projects.id = pledges.project_id
  #   GROUP BY projects.id
  #   HAVING projects.category = 'music'"

   "SELECT projects.category, pledges.amount 
    FROM projects
    INNER JOIN pledges
    ON projects.id = pledges.project_id
    WHERE projects.category = 'music' 
    ORDER BY projects.category
    "  
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
      "SELECT projects.category, SUM(pledges.amount) 
    FROM projects
    INNER JOIN pledges
    ON projects.id = pledges.project_id
    WHERE projects.category = 'books' 
    GROUP BY projects.id = pledges.project_id
    ORDER BY projects.category
    " 
end
