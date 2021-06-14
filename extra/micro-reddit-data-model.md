## Micro Reddit data model
Plan out what data models you would need to allow users to be on the site (don’t worry about login/logout or securing the passwords right now), to submit links (“posts”), and to comment on links. Users do NOT need to be able to comment on comments… each comment refers to a Post.

#### Users
name:string [present, unique, max 50 characters]
password:string [present, min 8 characters]

has_many posts
has_many comments

id:integer
created_at:datetime
updated_at:datetime

#### Post
title:string [present]
body:text [present]

belongs_to user
has_many comments

id:integer
created_at:datetime
updated_at:datetime

#### Comment
body:text [present]

belongs_to user
belongs_to post

id:integer
created_at:datetime
updated_at:datetime
