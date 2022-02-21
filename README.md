# Yorchwitter.
Twitter clone app.

## Description.
This README would normally document whatever steps are necessary to get the
application up and running.

## SQL commands

* @users_result_fn = where("first_name like ?", "%#{result}%")
* if @users_result_fn.length > 0

* Connection.all
* followers = Connection.where(user_id: 1).count
* following = Connection.where(follower_id: 1).counts

## Softwares and versions.
* Ruby: 3.0.1
* Rails: 7.0.2
* Bootstrap.
* Heroku server: not yet.
* PostgreSQL.
* VS Code.