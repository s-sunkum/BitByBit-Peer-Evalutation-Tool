# BitByBit-Peer-Evalutation-Tool
PeerEval is a way for teachers and students to ensure quality collaborative work among peers. With this tool, instructors can monitor teams and make sure teammates are held to a high standard of work ethic. Students can be added by the instructor and with a given access token. From this, a student can log into PeerEval and make their account. 

### BitByBit Team Members
- Shravun Sunkum
- Suyash Talekar
- Yusen Zhang
- Thomas Liu

### Functionality 
- Students can submit scores and comments to their teammates for each project
- Administrative interface allows instructors to add students, make teams, assign projects, see evaluations, and grade students based on scores given by teammates. 
- Added Features:
  - Students can be part of multiple teams. Throughout the semester the instructor can add projects for all teams
  - Authentication/login makes it so that evaluations can only be made by the corresponding student in a team
  - Utilized Bootstrap for a better UI for the webpage. 
### Contributions
At the start most of our backend models were created together since the team wanted to ensure a solid database design. Afterwards here is how the work was split up. 
- Shravun: 
  - Worked on the controller code for creating evaluations, making teams, students/teachers being able to see evaluations and styling
- Suyash:
  - Worked on the controller code for Teachers adding students, editing teams, editing projects, and student teacher logins and styling
- Yusen: 
  - Worked on the controller code for authenticating student and teacher logins, delete functionality for teachers, and tracking sessions and styling
- Thomas: 
  - Worked on the testing section and styling, assisted with teachers and students controller code

To Run PeerEval:
- Go into the PeerEval directory with ```cd peerEval```
- Type ```bundle install```
- ***IMPORTANT*** First type ```rails webpacker:install```
- ***It will ask to overwrite a file. Enter ```n```***
- Then ```rails db:migrate``` to populate the tables
- Finally, ```rails server``` which can be accessed through the link displayed

 ### Teacher
- If teacher wants to ***add a student to class*** , first click Class Roster,  then Add Students
- If teacher wants to ***change the grade of a student***, first click Class Roster, then click the Grade link for that student.
- If teacher wants to ***see the evaluations***, first click the Manage Teams, then in Action, click View Members/Evaluations, then go to corresponding project, and choose a student from the drop down options.
- If teacher wants to ***add a team***,  first click Manage Teams, then click Create Teams
- If teacher wants to ***assign a student to a team***, first go Manage Teams, then click Edit in the Action column, then go Add Students To Team
- If teacher wants to ***create a project***, first go Manage Teams, then click Edit in the Action column, then go Assign Project To Team

 ### Student
- If Student wants to ***make a evaluation***, first go Make Evaluation, then choose the team, then chopse the project

### Testing
- To run the testing done for the program type ```rails test``` in the terminal
- All our testing can be viewed in the test folder. (Testing was done for models and controllers)
- ***Note for grader:*** After adding foreign keys to our model some of our test cases were not able to be made since some models depended on others, which is something we can work on with more time. Also, the team wasn't able to test the controllers thoroughly because we had a lot of parameter passing between controllers. 

### Project Development
- Creating a functional database was one of the hardest steps for the team at the start. With a near deadline and little time to learn Ruby on Rails, it was challenging to absorb all the information and apply it. After getting our CRUD functionality for the models, it became easier since controllers and veiws could be split up between the team. 
- Since the team had little time for this project, here are some plans that will be implemented in the future: 
  - Better security is an important aspect for web development and is something that should be taken into consideration soon
  - Auto generated access token and automated emailing so instructors don't have to manually send the tokens to students
  - Try to make the current database model more efficient (For example: A user super class for Teachers and Students)
  - Launching onto Heroku
- Overall, this project taught many important concepts for web development and with more time can lead to an applicable tool for teachers and students worldwide.

