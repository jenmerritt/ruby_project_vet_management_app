# Vet Practice Management App

## Brief:

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

- Clone from github
- Requires: postgresql, ruby
- Create database as per 'dnname' in db/sql_runner file
- run psql for database and db/vet_practice.sql to create tables
- run app via ruby file app.rb
- App is loaded via localhost using Sinatra
