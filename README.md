# Rocket Elevators - Machine Learning

## WEEK 12 - Machine Learning

### Video showcase : https://www.youtube.com/watch?v=ovhl46_hw_Y

### Features
```
- Datawarehouse;
- Relational database;
- Interventions form;
- Admin panel (backoffice);
- Multiple fully fonctional apis;
- Rake tasks to fully operate the databases;
- Fully operational postman collection to test the apis;
- An "Elevators media streamer" feature for rspec testing;
- A speech recognition & speech to text API.
```

### Instructions for testing
- Login as admin on the page, in the menu click on the "administration" dropdown and select "recognition";
- Simply browse the tabs on the recognition page for your needs, everything is explaine on the video if clarification is needed.

### Admin Information
```
- Admin email/pass : mathieu.houde@codeboxx.biz/password
```

### Rake task
```
- Rake dwh:clear : truncates the mysql tables
- Rake dwh:cleardwh : truncates the postgresql tables
- Rake dwh:fake : truncates the mysql tables AND fakes all the information
- Rake dwh:populate : populates all the tables in the datawarehouse
- Rake dwh:update : truncates the postgresql tables AND populates them
```

### Rspec Information
- For testing the api requests, simply run the pre-made postmand collection;
- For testing the rspec examples, use the following command : bundle exec rspec --format documentation

- Everything is running on the development environment to ease the usage;
- After running the specified command in the instructions, an html file will be generated in the /coverage folder of the application (simplecov gem). This file will allow you to see the coverage of the examples tested with rspec (for the whole application). Simply open up the file in your browser.
- The following are the tested examples :
``` - Streamer class initialization;
 - Streamer class receiving the getContent method;
 - Streamer class responding to the getContent method;
 - GetContent method is neither nil or false, it contains a string and div tags;
 - Connecting to the admin panel;
 - GetContent receives the picture method, weather api, spotify api and pokemon api;
 - GetContent responds to the picture method, weather api, spotify api and pokemon api;
 - Fetching the first record from the address, batteries, building_details, buildings, columns, customers, elevators, employees, leads, quotes and users table;
 - Rendering a pokemon in a view file;
 - Accessing the interventions page only as admin or employee;
 - Filling the contact form.
