# Rocket Elevators Foundation

WEEK 11 - Quality

Video showcase : 

Features :
- Datawarehouse;
- Relational database;
- Interventions form;
- Admin panel (backoffice);
- Multiple fully fonctional apis;
- Rake tasks to fully operate the databases;
- Fully operational postman collection to test the apis;
- An "Elevators media streamer" feature for rspec testing.

ADMIN INFORMATION
- Admin email/pass : mathieu.houde@codeboxx.biz/Codeboxx1!

RAKE TASK
- Rake dwh:clear : truncates the mysql tables
- Rake dwh:cleardwh : truncates the postgresql tables
- Rake dwh:fake : truncates the mysql tables AND fakes all the information
- Rake dwh:populate : populates all the tables in the datawarehouse
- Rake dwh:update : truncates the postgresql tables AND populates them

**INSTRUCTIONS**
- For testing the api requests, simply run the pre-made postmand collection;
- For testing the rspec examples, use the following command : bundle exec rspec --format documentation

**RSPEC INFORMATION**
- Everything is running on the development environment to ease the usage;
- After running the specified command in the instructions, an html file will be generated in the /coverage folder of the application (simplecov gem). This file will allow you to see the coverage of the examples tested with rspec (for the whole application). Simply open up the file in your browser.
- The following are the tested examples :
 - Streamer class initialization;
 - Streamer class receiving the getContent method;
 - Streamer class responding to the getContent method;
 - GetContent method is neither nil or false, it contains a string and <div> tags;
 - Connecting to the admin panel;
 - GetContent receives the picture method, weather api, spotify api and pokemon api;
 - GetContent responds to the picture method, weather api, spotify api and pokemon api;
 - Fetching the first record from the address, batteries, building_details, buildings, columns, customers, elevators, employees, leads, quotes and users table;
 - Rendering a pokemon in a view file;
 - Accessing the interventions page only as admin or employee;
 - Filling the contact form.
  
