# Pewlett-Hackard-Analysis
SQL Practice


## Overview of the analysis: Explain the purpose of this analysis.
This Module is about managing data with sql. Several data was import it to pgadmin and was manipulated in order to create new tables. 

This challange consists on two assigments:
- To determine the number of retiring employees per tilte
- To identify employees who are eligible to participate in a mentorship program. 

## Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
- Deliverable 1: The Number of Retiring Employees by Title
  - Create a Retirement Titles table 
    - must hold all the titles of current employees who were born between January 1, 1952 and December 31, 1955. 
    - most recent title of each employee
    - create a final table that has the number of retirement-age employees by most recent job title.
> ### Unique Titles Table
>  ![unique_titles](https://user-images.githubusercontent.com/37987602/140682361-b751b4cd-71f3-48a2-beb3-398df4687ce5.png)

- Deliverable 2: The Employees Eligible for the Mentorship Program
  - Create a mentorship-eligibility table 
    - Must hold the current employees who were born between January 1, 1965 and December 31, 1965.


## Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

> According to the retiring_titles table we can se that managers seem to be pretty young, beacause there is only 2 of them ready to retire. 
> 
> ![retiring_titles](https://user-images.githubusercontent.com/37987602/140682757-8495c3c9-6dca-4183-b6b3-4f61ae296c46.png)


### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
> According to the unique_titles table there are 90,398 employees soon to retire
> 
> ![unique_titles_count](https://user-images.githubusercontent.com/37987602/140682391-2bc6545c-fbb7-4fb9-aa1a-b871cad5a3b9.png)

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
> According to the mentorship_eligibilty table there are 1,549, unfortunaly for the managmenet department there are obnly two soon to retire.
>  
>  ![mentorship_eligibility](https://user-images.githubusercontent.com/37987602/140683005-65ea4216-070a-43b7-a2b5-1316bae2b15a.png)

