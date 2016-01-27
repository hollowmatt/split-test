# A/B Testing in Rails

This repo is a simple test of two A/B testing platforms for Rails (Split and Vanity)

The master branch is the 'split' version of the testing (also, the split branch), the vanity branch is the vanity test.  The apps are the same, with same styles.  Below are some key tech points:

* Ruby version 2.3.3
* Rails version 4.2.5
* Styling with Boostrap (Sass), and some custom stuff
* Split Dependencies: Redis 
* Vanity Dependencies: works with any persistence, I chose Mongo


And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

## Setup (Split)

You need Redis installed globally (I assume you use Homebrew, and RVM):

```sh
$ brew install redis
<random stuff shows up while it installs and stuff... then
$ redis-server
```
Ok, now you should clone the git repo somwhere, cd into the folder, and run bundle, migrate the db, and run it:
```sh
$ git clone git@github.com:hollowmatt/split-test.git
$ cd split-test
ruby-2.2.3@split-test$ bundle install
ruby-2.2.3@split-test$ rake db:migrate
ruby-2.2.3@split-test$ rails s
```
## Setup (Vanity)

You need Mongo installed globally (I assume you use Homebrew, and RVM):

```sh
$ brew install mongo
<random stuff shows up while it installs and stuff... then
$ mongod
```
Ok, you already have the repo, so change to the vanity branch, and run bundle, drop/migrate the db, and run it:
```sh
ruby-2.2.3@split-test$ git checkout vanity
ruby-2.2.3@split-test$ git pull
ruby-2.2.3@split-test$ bundle install
ruby-2.2.3@split-test$ rake db:drop
ruby-2.2.3@split-test$ rake db:migrate
ruby-2.2.3@split-test$ rails s
```
## About the tests
Ok, so what are we testing?
### Simple Test
First, I just have a test that changes the header on the signup form to 3 variants (I only did this in Split):
* Sign Up
* Sign Up in Seconds...
* Sign Up for Free

Second, I setup a (slightly) more complex test, that will offer a different navigation option depending on if you fall in group 'a' or 'b' (one shows a left nav, one shows a top nav).  The tests will then measure conversion (a user signup signifies a success scenario).  Cookies are used to keep the user in the same test (split).  In Vanity, you have the option of using a 'known user' to ensure commonality across browsers/devices/etc.

#### Split Results
To see the results of test runs, play around in a few browsers/incognito to convert (or not) on different views, then navigate to http://localhost:3000/split (assume you are on port 3000, otherwise, change that).

You should see the dashboard for Split with fancy looking results

#### Vanity Results
To see the results of test runs, play around in a few browsers/incognito to convert (or not) on different views, then navigate to http://localhost:3000/vanity (assume you are on port 3000, otherwise, change that).

You should see the dashboard for Vanity with fancy looking results.

## Key differences between Split/Vanity
__Split__
* Split is a very simple A/B testing tool.
* Split measures only conversion
* Split ONLY works with Redis
* Split is the most popular A/B Testing Gem for Rails

__Vanity__
* Vanity is more complex, and requires more setup
* Vanity has many options for measurement success (Conversion, Retention, Referals, etc.)
* Vanity works with many persistence solutions (SQL based, Redis, Mongo)
* Vanity is 2nd most popular A/B Testing Gem for Rails

## Caveats
These were very simple tests, but just quick ones to compare the frameworks.