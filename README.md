# README

This is a simple URL shortening service.

# Installation:

1. Clone the repo
2. `cd shortenUrl`
3. Make sure you have Ruby installed (`ruby --version`)
4. If you are using ruby version controller then install and switch to `2.7.2`
5. Run `bundle install`
6. Run `npm install`

## Database creation

1. `rake db:create`
2. `rake db:migrate`
3. `rake db:seed`

# Running on local

1. `rails s`
2. Visit http://127.0.0.1:3000/ to use the service.

# Conceptual Questions/Answers:

1. How would you test this service?
    - Appropriate unit tests would be sufficient to test this service. Some of the test cases could be passing an invalid input as the URL (in case of URL validation is added in the future), passing an empty string, passing an existing URL, not passing the required params etc.
2. What DB models would need to change to support multiple users?
    - A new users DB model should be added on top of modifying the already existing url model, in case we want to support multiple users. Also, a new model, representing the relation of these two models, should be added (eg. userUrl). If we want to implement user authorization as well, we should consider adding roles and permissions models. In case we store session authentication tokens, then we might also want to add a session authentication token field to the aforementioned users model.
3. How can this service support 1000 concurrent requests?
    - There are a few ways to support 1000 concurrent requests. The first step to overcome this problem might be allocating more processing power and memory to the server that hosts our service (having separate web servers and DBs might also help). Using something like memcache to cache the results that we would otherwise pull from the db would also help the service handle more concurrent requests. We might also consider implementing data versioning/locking in case the problem persists.
4. What kind of database models do you think would cause an issue? And why?
    - In the current implementation of our url model, the actual URL shortening algorithm generates 6 alphanumerical characters by default. In the future, in case our service fills up with too many shortened URLs, we might want to increase the default number of characters in order to allocate more unique strings. This issue might also slow down our service as our algorithm would loop too many times to find a unique string.
5. Which parts of the service do you think are most likely to fail? And why?
    - In case the db fills up too fast, we might need to index the short URL in url table to have a quicker query response. Also, instead of using standard incremental IDs we can start using UU IDs that might help us spread across many servers in the future. Too many concurrent requests might break our service, as that is currently not handled in any way. If we do not maintain and update the service regularly, Ruby gems and nmp packages might become outdated, which can cause hackers to penetrate known vulnerabilities in those packages.
