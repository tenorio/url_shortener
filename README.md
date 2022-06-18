# URL Shortener

This is a URL shortener app. You can enter your **BIG** URL and it will be shortened and became more elegant and ease 
to use/remember.

**Prerequisites**

The setup steps expect the following tools to be installed on your system:

* Github;
* Ruby 3.1.2;
* Rails 6.1.6;
* PostgreSQL;

##### 1. Check out the repository
```bash
git clone git@github.com:tenorio/url_shortener.git
```

##### 2. Create and setup the database
Run the following commands to create and setup the database
```bash
rails db:create
rails db:seed
```

##### 3. Start the Rails server
```bash
rails s
```

**Algorithm used**

For this example, a [bijection function](https://en.wikipedia.org/wiki/Bijection) was used to turn the record's ID 
into a string, and vice-versa.
