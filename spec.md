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
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Create project route
```ruby
post '/projects' do
    project = current_user.projects.build(params[:project])
    project.save # Save new project
    redirect '/projects'
end
```

Read project route
```ruby
get '/projects/:id' do
  @project = current_user.projects.find_by(id: params[:id])
  erb :"projects/show"
end
```

Update project route
```ruby
put '/projects/:id/edit' do
  project = current_user.projects.find_by(id: params[:id])
  project.update(params[:project])
  redirect "/projects/#{project.id}"
end
```

Delete/Destroy project route
```ruby
delete '/projects/:id/delete' do
  @project = current_user.projects.find_by(id: params[:id])
  @project.destroy
  redirect '/projects'
end
```

- [x] Ensure that users can't modify content created by other users
All routes are projected with a #logged_in? helper

- [x] Include user input validations
Minimal validates are added on server side. Form inputs have been give a required attribute to implement client side validation before posting to server.

- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
