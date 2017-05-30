Usage
-----

1. Set up your server and associate plantkeeper www2 folder with plantkeeper URL (http://localhost:80/)

2. Run the following PHP script to setup the database in your browser:

    http://localhost:80/plantkeeper/php/server_management.php

3. Run plantkeeper.flow with cpp runner from command line:

    flowcpp plantkeeper/plantkeeper.flow

Add "-- port=..." if you are using a port different than 80

4. Compile .js file

    flow --js www2/plantkeeper.js plantkeeper/plantkeeper

And run in your browser:

    http://localhost:80/plantkeeper/flowjs.html?name=plantkeeper

Don't forget to fix the port if you are using diffent one.

DB schema
---------

To make changes in the custom DB tables:

1. Create SQL file (v*.sql) with corresponding schema changes (ALTER statements, etc).
Note, this file should also update version table. For example:

    UPDATE `plantkeeper_version` SET `version`=5 WHERE `version`=4 LIMIT 1;

2. Update sql/plantkeeper.sql to represent the latest tables

3. Regenerate code with meta_app. Note, all changes in generated files will be overwritten.

    update --generate

To incorporate the latest DB changes of included components simply run:

    update

Local setup
-----------

0. Pull flow, material, plantkeeper repositories

1. Run plantkeeper/update.bat on windows or plantkeeper/update.sh on linux/mac.

2. Compile application.

3. Copy compiled application in www2 directory.

4. Run server_management.php to create DB, grant DB user access and create tables



Deploying
---------

On the server:

0. Pull flow, material, plantkeeper repositories

1. Run plantkeeper/update.py with needed parameters: 

Use --pre-build parameter to generate files needed for compiling, that is, data2/version.json and data2/version-token

Use --version-token param to pass token identifying version, otherwise, token with components versions will be used.
We expect here the timestamp of latest commit, which can be acquired via command

    git log -1 --pretty=format:%ct

2. Compile application.

3. Run plantkeeper/update.py on server with needed parameters to generate required files.
Make sure www2 and sql2 folders exist and www2/php/servername.dbconfig.php is correct.
Use --version-token parameter to set the same version token as before.

4. Copy compiled application in www2 directory on server.

5. Run server_management.php to create DB, grant DB user access and create tables

Configuration
-------------

If the above does not work, you might need to change configuration files to make plantkeeper 
work on your machine. Make sure that following files contain correct information:

    www/php/localhost.dbconfig.php  - DB settings (should be specific for every server)
    www/php/plantkeeper_config.php     - email settings

Then run the update.bat script to update your www2 folder.

By default we expect Flow and Material be on the same level on your local disc.
For example C:\flow and C:\material. If you have unusual Flow repository placement, 
fix "flow.config".

Also if you are using unusual folders structure use --flow-path and --material-path parameters 
when running update script. Run "update.bat -h" for details.

If your localhost has different port than 80 give "port=..." parameter when running with flowcpp.
And if your localhost domain is different you can also use "url=..." parameter.

In general try to use parameters instead of changing code as other developers might have different set up.

Developing
----------

1. Do not make manual changes in www2/, sql2/, data2/, server2/ folders because:

  1) all changes will be lost the next time you run update.bat
  2) these folders are not saved in git
  3) production server will generate them independently.

So, if you want to make changes (for example in your PHP files), make them in www folder and then 
just run update.bat. It copies your chsnges to www2/ folder. 
Similarly, sql folder contains sql files you are working on (saved in git) and sql2 folder is just a copy of them plus all extra sql files you might need.

2. If your application uses Shift as an included component, you should not work with 
Shift DB tables directly to manipulate shift units. Instead, you should use Shift web API 
for this purpose. For more details about the API take a look at 'shift/doc/web_api.html' 
in shift repo.

There is an example of shift unit browser based on the API in 'material/shift/browser/' 
folder. The browser shows the units and provides basic operations on them. The browser 
can be imported to your application. In 'material/shift/browser/test/' folder you can 
find an example of the browser usage and test how the browser works with your application.
