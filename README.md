Welcome to the Hair Salon

The Hair Salon is a simple application that helps a stylist keep track of
their business. As a stylist, you're able to enter in your own name
and create your list of clients. You're also able to edit or delete your name to start a fresh list of clients.

INSTRUCTIONS

~Open terminal~ psql

Create two databases: hair_salon and hair_salon_test
 <p>Within the hair_salon database, create 2 tables: stylists and clients.</p>
 <p>Within the stylists table, (ID serial PRIMARY KEY, stylist_name varchar)</p>
 <p>Within the clients table, (ID serial PRIMARY KEY, client_name varchar, stylist_id integer)</p>
 <p>*You must drop and re-recreate the test database with the new schema*</p>
 <p>(1. DROP DATABASE hair_salon_test)</p>
 <p>(2. CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;)</p>

~Open terminal~ ruby
<p>Change directory to desktop, then hair_salon.</p>
<p>$gem install bundler</p>
<p>$bundle</p>
<p>$ruby app.rb</p>
<p>In web browser, type "localhost:4567". (This will launch the app)</p>

<p>~Enter a stylist's name and click "add"</p>
<p>Click on the name you've just added.</p>
<p>Enter a client's name and click "add client"</p>
<p>Click "Edit(name)"" to update or delete stylist.</p>
<p>If not, click "Return to Main Page"</p>


Known Bugs
No known bugs at this time.

Author: Alan Moon (https://github.com/moonjrock)

MIT License. Copyright 2015
