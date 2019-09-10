# el-training

## About this curriculum

This document is a curriculum for new employees to learn the basics of Ruby on Rails and its peripheral technologies, which are essential in Manyo.
Regardless of the ability of new employees, you will be required to follow a single step.
There is no specific training period.
The training is completed when all steps are completed.

This curriculum assumes the following characters:

-New employees (mentees): Participants in this curriculum.
-Mentors: Provide education, guidance and advice for new employees. It also has the role of coordinating specifications with new employees.

It is at the discretion of the mentor to determine how much the mentor is involved in teaching. In addition, for the training period, the mentor will set a standard in advance in consideration of the skill level of new employees and the status of projects in the company.

## Overview

### System requirements

In this curriculum, you will develop a task management system as an issue.
The task management system wants to do the following:

-I want to register my task easily
-I want to be able to set an end date for a task
-I want to prioritize tasks
-I want to manage my status (not started / started / completed)
-I want to filter tasks by status
-I want to search for tasks by task name or task description
-I want to list tasks. I want to sort on the list screen (based on priority, end date, etc.)
-Want to classify tasks with labels
-I want to register as a user and see only the tasks I have registered

In order to meet the above requirements, we want the following management functions.

-User management function

### Support browser

-Support browser assumes the latest version of macOS / Chrome

### Application (server) configuration

I would like you to build using the following languages ​​and middleware (the latest stable version).

-Ruby
-Ruby on Rails
-PostgreSQL
-[Optional Requirements] Build a development environment using Docker

I would like you to use the following for the server.

-Heroku
-[Optional Requirements] Create and build an EC2 instance with an AWS account
  -t2.micro (Amazon Linux)
  -RDS

* Performance requirements and security requirements are not specified, but make them with general quality.
  If the site response is too bad, please improve

## Final goal of this curriculum

At the end of this curriculum, it is assumed that you will master the following items:

-Be able to implement basic web applications using Rails
-Rails application can publish application using general environment
-Ability to add functions and maintain data for published Rails applications
-Mastering a series of merges with PR on GitHub. Also, master the necessary Git commands
  -Ability to commit at the right granularity
  -Appropriate PR description can be written
  -The ability to respond and modify the review
-Able to ask questions to team members and related parties at appropriate times (in this case, mentoring) verbally or by chat

## Recommended books

The following books are recommended as recommended books for the training curriculum.

-[Ruby on Rails 5 speed practice guide that can be used in the field] (https://book.mynavi.jp/ec/products/detail/id=93905)

The Ruby on Rails 5 Speed ​​Learning Practice Guide that can be used in the field uses the task management system as well as the training curriculum.
Therefore, I think that there are many points that can be helpful in promoting this training.

It also explains the contents that could not be covered in this training and how to proceed with team development. Please refer to it.

## Helpful development topics

Although it was not included in specific task steps, topics.md summarizes topics that you want to use. Please refer to the curriculum as needed and refer to it.

## Assignment steps

### Step 1: Build a Rails development environment

#### 1-1: Install Ruby

-Install the latest version of Ruby using [rbenv] (https://github.com/rbenv/rbenv)
-Check that the Ruby version is displayed with the `ruby -v` command

#### 1-2: Install Rails

-Install Rails with Gem command
-Install the latest version of Rails
-Check that Rails version is displayed by `rails -v` command

#### 1-3: Install the database (PostgreSQL)

-Install PostgreSQL on your OS
  -For macOS, install with `brew`

### Step 2: Create a repository on GitHub

-Install Git at hand
  -For macOS, install with `brew`
  -Register username and email address with `gitconfig`
-Consider app name (= repository name)
-Create a repository
  -Get an account if you don't have one
  -Create an empty repository on it

### Step 3: Create a Rails project

-Use the `rails new` command to create the minimum required directories and files for your application
-Create a directory named `docs` directly under the project directory (app name directory) created by` rails new` and commit this document file.
  -To keep the specifications of this app under control so that you can see them anytime
-Push your app to the repository you created on GitHub
-In order to specify the version, write the Ruby version to be used in the `Gemfile` (make sure that Rails already has the version)

### Step 4: Consider the image of the application you want to create

-Before proceeding with the design, think about what the app will look like (with the mentor). Screen design by paper prototyping is recommended
-Read the system requirements and think about the data structures you need
  -What models (tables) do you need
  -What information do you need in the table?
-Think about the data structure and write it on the model diagram by hand
  -Take a photo and put it in the repository
  -Describe the table schema in `README.md` (model name, column name, data type)

* It is not necessary to create a correct model diagram at this time. Let's make it as an assumption at the present time.

### Step 5: Let's set database connection (peripheral)

-Start a new topic branch with Git
  -After that, work on the topic branch and commit
-Install Bundler
-Install `pg` (PostgreSQL database driver) with` Gemfile`
-Let's set `database.yml`
-Create a database with the `rails db: create` command
-Check the connection to the database with the `rails db` command
-Create a PR on GitHub for review
  -Make PR with WIP (Work In Progress) if necessary. See topic collection for details
  -Please respond to any comments. Merge into the master branch if you have 2 LGTM (Looks Good To Me)

### Step 6: Create a task model

Create CRUD to manage tasks.
Let's start with a simple configuration that allows you to register only the name and details.

-Use the `rails generate` command to create the model class required for task CRUD
-Create a migration and use it to create a table
  -It is important to ensure that the migration can be restored to the previous state! Let's put a trap to check by running `redo`
-Check that you can connect to the database via the model with the `rails c` command
  -Let's try creating a record with ActiveRecord
-Create a PR on GitHub for review

### Step 7: Lets you view, register, update, and delete tasks

Let's create task list screen, detail screen, creation screen, edit screen, delete function.

If you create these functions at once, PR tends to be huge.
Therefore, in Step 7, we will proceed with PR in several parts.

In the future steps, if PR is likely to increase, consider whether it can be divided into two or more.

### Step 7-1: Create a task list screen and details screen

-Let's be able to display the task created in step 6 on the list screen and details screen
-Create controllers and views with the `rails generate` command
  -Consult with your mentor to decide which template engine to use
-Add necessary implementations to controllers and views
-Edit `routes.rb` so that the task list screen is displayed at` http: // localhost: 3000 / `
-Explain to the mentor what kind of processing is being performed between the web browser and the server
-Create a PR on GitHub for review

### Step 7-2: Create a task creation screen and edit screen

-Lets you create and edit tasks from the screen
-Display the flash message on the screen after creating and updating
-Create a PR on GitHub for review

### Step 7-3: Let the task be deleted

-Lets you delete the created task
-Display the flash message on the screen after deletion
-Create a PR on GitHub for review

### Step 7-4: Looking back at the added code

-Let's explain the code added in steps 7-1 to 7-3 to the mentor
  -About classes, methods and variables
  -Process flow

### Step 8: Touch SQL

-Manipulate the database
  -Connect to the database with the `rails db` command
  -View, create, update and delete tasks in SQL
-Access the task list screen and check that the SQL log is flowing
  -Let the mentor explain what SQL is being executed
-Let's check what SQL is executed by ActiveRecord method
  -Try `find`,` where`, etc. with `rails c`

### Step 9: Write an E2E test

-Get ready to write spec
  -Prepare `spec / spec_helper.rb` and` spec / rails_helper.rb`
-Let's write system spec for task function
-Install CI tools such as Circle CI to notify Slack
  -In consideration of difficulty, it may be in the form of a mentor.
-Reference book: https://leanpub.com/everydayrailsrspec-jp

### Step 10: Share the Japanese part of the app

-Use the Rails i18n mechanism to output validation error messages in Japanese

### Step 11: Set the Rails time zone

-Set the Rails time zone to Japan (Tokyo)

### Step 12: Sort the task list in order of creation date and time

-It is currently arranged in order of ID, but let's sort this in descending order of creation date
-Let's write in system spec that sorting is going well

### Step 13: Set up validation

-Set validation
  -Think about which validation to add to which column
  -Create a migration that also sets DB constraints
  -Use the `rails generate` command to create only the migration file
-Display validation error messages on the screen
-Let's write a model test for validation
-Create a PR on GitHub for review

### Step 14: Deploy

-Now that you have a simple task management system in the master branch, let's deploy it.
-Let's deploy to Heroku
  -Create an account if you don't have one
-Touch the deployed app on Heroku
  -From now on, let's proceed with development by registering tasks in this app
  -※ However, since the Heroku application can be referenced anywhere on the Internet, do not put any bad information if you publish it.
    -Basic authentication may be allowed at this point
  -Continue to deploy your app to Heroku after each step
-Describe the deployment method in `README.md`
  -In that case, it is better to include the version information of the framework used in this application.

### Step 15: Add an expiration date

-Let's be able to register the end deadline for the task
-In the list screen, let's sort by end deadline
-Expand spec
-After PR and review, let's release

### Step 16: Add status so you can search

-Let's add a status (not started, in progress, completed)
  -[Optional Requirements] If you are not a beginner, you may introduce a gem to manage the state.
-Let's search by title and status on the list screen
  -[Optional Requirement] If you are not a beginner, you may introduce a gem that makes search implementations such as ransack convenient.
-When narrowing down, let's check the change of SQL issued by looking at the log
  -Put a habit to check if necessary in the following steps
-Paste the search index
  -Prepare a certain amount of test data, check the operation while looking at log / development.log, and confirm that the speed can be improved by adding an index
  -[Optional Requirements] Let's see the index usage on the database side using explain etc. of PostgreSQL
-Let's add a model spec to the search (and expand the system spec)

### Step 17: Set priorities (* Can be omitted if you have similar implementation experience)

-Lets you register priority (high, medium and low) for tasks
-Lets you sort by priority
-Expand system spec
-After PR and review, let's release it (Please continue)

### Step 18: Add pagination

-Let's add pagination to the list screen using a gem called Kaminari

### Step 19: Win the design

-Introduce Bootstrap and apply the design to the apps you have created
  -[Optional requirements] Write your own CSS and design

### Step 20: Make it available to multiple people (user introduction)

-Let's create a user model
-Let's create the first user with seed
-Let users and tasks be linked
  -Index the associations
  -* When deploying to Heroku, make sure that the registered task and user are linked (data maintenance)

### Step 21: Implementing login / logout functionality

-Try implementing it yourself without using additional gems
  -The purpose is to deepen understanding of mechanisms such as HTTP cookies and Sessions in Rails by not using Devise or other gems
  -It also aims to deepen your understanding of general authentication (such as password handling).
-Implement a login screen
-If you are not logged in, let's prevent you from transitioning to the task management page
-Show only the tasks you created
-Implement a logout function

### Step 22: Implement the user management screen

-Add a management menu on the screen
-Make sure to put the URL `/ admin` at the top of the admin screen.
  -Before adding to `routes.rb`, let's design it assuming URL and routing name (name that becomes` * _path`) beforehand
-Implement user list creation / update / deletion
-After deleting a user, let's delete the task that the user has
-Let's display the number of tasks the user has on the user list screen
  -Incorporate a mechanism to avoid the N + 1 problem
-Let's see a list of user created tasks

### Step 23: Add a role to the user

-Let users distinguish between administrative users and general users
-Let only admin users access the user management screen
  -When a general user accesses the management screen, let's make a special exception
  -Supplement the exception and display the error page appropriately (this can be done in step 25)
-Let's be able to select the role in the user management screen
-Control deletion so that no admin user is lost
  -Use model callbacks
-※ Use or non-use of Gem is free

### Step 24: Let the task be labeled

-Let's make it possible to assign multiple labels to a task
-Let's be able to search by the label you attached

### Step 25: Set the error page appropriately

-Let's make the default error page prepared by Rails the screen you created
-Set the error page appropriately according to the situation
  -At least two types of settings for status code 404 page and 500 page are required

## Afterword

Thank you for your hard work.
You have completed the educational curriculum!

Although I couldn't touch it in this curriculum, I think that the following topics will be needed in the future, so I think that it is better to advance learning (I think that there are many things to learn through projects).

-Deepen basic understanding of web applications
  -Understanding HTTP and HTTPS
-Learn how to use Rails a little more advanced
  -STI
  -Logging
  -Explicit transaction
  -Asynchronous processing
  -Asset pipeline (somewhat a release topic)
-Advanced understanding of frontends such as JavaScript and CSS
-Deepen your understanding of the database
  -SQL
  -Build more performance-oriented queries
  -Deepen your understanding of the index
-More understanding of the server environment
  -Linux OS
  -Web server (Nginx) settings
  -Application server (Unicorn) settings
  -Understanding PostgreSQL settings
-Understand release tools
  -Capistrano
  -Ansible

## (Extra) Optional requirements

Apart from the mandatory requirements, the following are optional requirements for the task management system:
Please consult with a mentor as needed.

### Option Requirement 1: I want to be alerted when there is a task nearing completion or past due

-When you log in, let's display tasks that are nearing end or past due somewhere
-It's better when you know what you have read

### Optional Requirement 2: I want to be able to share tasks between users

-I want to allow multiple people to view and edit the same task
  -Example: Mentors and new employees can share tasks
-Show author

### Option Requirement 3: I want to be able to set up a group

-Continued option requirement 2
-I want to be able to set a group so that I can see tasks only within the group

### Option Requirement 4: I want to be able to attach an attachment to a task

-Let's add attachments to tasks
-For Heroku, manage attachments uploaded to S3 bucket
-Let's select and use gems appropriately

### Optional requirement 5: Let the user set a profile picture

-Let users set their profile picture
-Uploaded images are used as icons, so I want to make thumbnail images so as not to slow down
-Choose appropriate gems and libraries

### Option Requirement 6: I want the task calendar function

-In order to visualize the end due date, let's display the task by the end due date in the calendar
-Use or non-use of the library is free

### Optional requirement 7: I want to be able to reorder tasks by drag and drop

-Let's reorder tasks by dragging and dropping them in the task list

### Optional Requirement 8: Let's graph the frequency of label usage

-Let's introduce a graph to visualize statistics
-Let's suggest what kind of graph is easy to see

### Optional Requirement 9: Let's send an email notification to the user who is about to finish

-If there is a task nearing the end, let's send an email notification in the background
-Use cloud service to send email
  -SendGrid for Heroku
  -AWS SES etc.
-Try sending in batches once a day
  -For Heroku, Heroku Scheduler (add-on)
  -Try setting up cron for AWS

### Option Requirement 10: Create an instance on AWS and build the environment

-Let's build and deploy environment on AWS
-The recommended middleware is Nginx + Unicorn
-Refer to server requirements for EC2 instance etc.