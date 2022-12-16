### MH Delete non active account after a amount of days not logged in.

this goes fully automatic, on every server restart it checks for non active accounts.
If a player does not logged in in a amount of days, this account will be deleted from the database.


#Install
- place the 'mh-deletenonactiveplayers' in resources/[mh]/
- add `ensure [mh]` in your server.cfg
- restart your server.
