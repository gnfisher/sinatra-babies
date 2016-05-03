# Sinatra Babies

An application for managing and keeping tabs on your newborn.

Features
---

- User login/logout
- User can choose local timezone and change it later
- User has many Babies
- Babies have many Events
- Events have many Types (Sleep, Wake, Feed, Poop, Vomit) (Aren't you excited now???)
- Events have many Ratings (A lot, Normal, A little, Abnormal)
- User can view events and see a summary of hours slept, poops, etc for each day

How to run locally
---

1. Clone the repo
1. Navigate to the directory in your terminal
1. `bundle install`
1. `rake db:migrate`
1. `rake db:seed`
1. `shotgun`
1. Point your browser to `http://localhost:9393`
1. You can create a user or login as `sinatra@babies.com` with password `password`
