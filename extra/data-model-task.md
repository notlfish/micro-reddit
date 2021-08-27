# Data Model Task

For each of the following scenarios, write down the models, columns, validations and associations you might use to implement it. Some of these are more difficult than others and you’ll have to use a bit of creativity to infer which columns might need to be present for the scenario to make sense in the real world.

## Online learning platform

You are building an online learning platform (much like this!). You’ve got many different courses, each with a title and description, and each course has multiple lessons. Lesson content consists of a title and body text.

#### Courses
title:string [present]
description:text [present]

has_many lessons

id:integer
created_at:datetime
updated_at:datetime

#### Lessons
title:string [present]
body:text [present]

belongs_to lesson

id:integer
created_at:datetime
updated_at:datetime

## User profile

You are building the profile tab for a new user on your site. You are already storing your user’s username and email, but now you want to collect demographic information like city, state, country, age and gender. Think – how many profiles should a user have? How would you relate this to the User model?

#### Users
name:string [present]
email:string [present, unique]

has_one profile

id:integer
created_at:datetime
updated_at:datetime

#### Profiles
age:integer [present, positive]
gender:string [present, in ('man, 'woman, 'non-binary', 'rather not say')]
belongs_to user
belongs_to city

id:integer
created_at:datetime
updated_at:datetime

#### Cities
name:string [present]
state:string [present]
country:string [present]

has_many users :through profiles

id:integer
created_at:datetime
updated_at:datetime

## Virtual pinboard
You want to build a virtual pinboard, so you’ll have users on your platform who can create “pins”. Each pin will contain the URL to an image on the web. Users can comment on pins (but can’t comment on comments).

#### Users
name:string [present]
email:string [present, unique]

has_many pins
has_many comments

id:integer
created_at:datetime
updated_at:datetime

#### Pins
url:string [present]

belongs_to user
has_many comments

id:integer
created_at:datetime
updated_at:datetime

#### Comments
body:text [present]

belongs_to user
belongs_to pin

id:integer
created_at:datetime
updated_at:datetime

## Message board
You want to build a message board like Hacker News. Users can post links. Other users can comment on these submissions or comment on the comments. How would you make sure a comment knows where in the hierarchy it lives?

#### Users
name:string [present]
email:string [present, unique]

has_many submissions
has_many comments

id:integer
created_at:datetime
updated_at:datetime

#### Submission
link:string [present]

belongs_to user
has_many comments

id:integer
created_at:datetime
updated_at:datetime

#### Comments
body:text [present]

belongs_to user
belongs_to sumbission
belongs_to comment [optional: true]

id:integer
created_at:datetime
updated_at:datetime
