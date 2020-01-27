# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
We are inherit from Sinatra::Base to create an app with minimum effort.
```ruby
class ApplicationController < Sinatra::Base; end
```

- [x] Use ActiveRecord for storing information in a database
Models inherit from ActiveRecord::Base
```ruby
class User < ActiveRecord::Base; end
```
- [x] Include more than one model class (e.g. User, Post, Category)
For the project management app, we have a user and project model.
``` ruby
class User < ActiveRecord::Base; end
class Project < ActiveRecord::Base; end
```

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
In our domain, the user has many projects.
```ruby
class User < ActiveRecord::Base
  has_many :projects
end
```
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
Since the user has_many projects, the project model has the foreign key to the user model
```ruby
class Project < ActiveRecord::Base
  belongs_to :user
end
```
- [x] Include user accounts with unique login attribute (username or email)
We added validation to the user model to check against existing objects on create
```ruby
class User < ActiveRecord::Base
  validates :email, uniqueness: true, on: :create
end
```
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
