# Vet Practice Management App

This project was completed during my time studying at CodeClan. The project was individual and based on Ruby.

I chose to build a Vet Practice Management App from a choice of briefs (See Brief below)

Dashboard:
![Image of Dashboard](dashboard.png)

View Appointments:
![Image of Appointments](appointments-list.png)

Create Appointment:
![Image of Appointments Form](add-appointment.png)

## Approach:
- Initial UX session: proto-personas, user stories and user journeys.
- Used Trello board to manage project and used KANBAN style board to move user stories as they were progressed. Worked in daily development sprints over 4 days after initial planning and UX day.
- Built MVP initially for simple CRUD app for vets / owners / animals.
- Extensions: added Appointments CRUD functionality, linking vets and animals. Then extended this to include dates and the ability to view appointments based on dates.
- Styled app using CSS, keeping a very simple layout in a tabular structure which I felt was appropriate for the purpose of the app.

## Challenges and Learnings:
- How to focus time and efforts on individual project with lots of ideas. Using the Trello board to manage user stories meant I had a clear list of tasks each day and was not distracted by the 'noise' of other ideas.
- Had not used Dates Class before, so had to learn how to integrate this into the project for appointments. Used a sandbox project to figure out how the Dates class worked, and how I could use the controllers to display appointments based on date, before implementing into the project.

## The Brief:

A veterinary practice has approached you to build a web application to help them manage their animals and vets. A vet may look after many animals at a time. An animal is registered with only one vet.

#### MVP
The practice wants to be able to register / track animals. Important information for the vets to know is -
- Name
- Date Of Birth (use a VARCHAR initially)
- Type of animal
- Contact details for the owner
- Treatment notes
- Be able to assign animals to vets
- CRUD actions for vets / animals - remember the user - what would they want to see on each View? What Views should there be?

## Rules:
The project must be built using only:

- HTML / CSS
- Ruby
- Sinatra
- PostgreSQL and the PG gem

It must NOT use:

- Any Object Relational Mapper (e.g. ActiveRecord)
- JavaScript. At all. Don't even think about it.
- Any pre-built CSS libraries, such as Bootstrap.
- Authentication. Assume that the user already has secure access to the app.

## Running Instructions

- Clone from GitHub
- Requires: postgresql, ruby
- Create database as per 'dbname' in db/sql_runner file
- run psql for database and db/vet_practice.sql to create tables
- run app via ruby file app.rb ('ruby app.rb')
- App is loaded via localhost using Sinatra
