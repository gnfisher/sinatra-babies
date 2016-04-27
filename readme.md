# Sinatra Babies

An application for managing and keeping tabs on your newborn.

Features
---

- User login/logout
- User has many Babies
- Babies have many Events
- Events have many Types (Sleep, Wake, Feed, Poop, Vomit) (Aren't you excited now???)
- Events have many Ratings (A lot, Normal, A little, Abnormal)
- Events have option Notes
- User can view events and averages of last 24 hours, 72 hours (hours slept, poops, etc)


Goals
---

The idea is that the site is very usable on mobile devices/tablets. So the forms for creating new events for a baby must be easy to touch and progress. The idea is that no writing/typing is required (unless they want to include an option Note). The form should also progress step by step (no JS, so we'll submit, go to next page, submit, go to next page, submit and THEN actually try to save the Event... I have ideas how to accomplish this using `locals`.


Notes 
---

### Events

- Add an update method (form with dropdown menus, how to handle time/date?)
- [DONE] Add Date field to the form
- Timezones? 
- Delete Events

### Reports

- Create a controller? NO
- or Build logic into Event model? YES
  - /babies/:id/events/24, /babies/:id/events/72
  - /babies/:if/events dashboard (hours slept on average if more than 3 days available, etc)
    - Need to do more thinking about dashboard reporting and what info is interesting to put there.

---
Notes to self.

Gathering data by every 24 hours: (last twenty-four hours, yesterday, day before yesterday)

What will page look like: 

LAST 24 HOURS: 3 poops, 6 hours slept, 4 feeds, 0 abnormal events
LAST 72 HOURS: 23 poops, 10 hours slept, etc.
LAST WEEK:
DAILY AVERAGES LAST WEEK:

So how do each of these queries work.
24 hours query => 
  Events.where.time > 24 hours
  Determine if first wake/sleep event is one or the other to calculate sleeping hours. Calculate them.
  Count poop events, etc.
  Count abnormal events and their details.
72 hours query =>
  Same with a 72 hour limit
Week is the same

Daily Averages


---
For getting results by the last twenty four hours.. sort by time column, get where.
Event.where('DATE(time) = ?', Date.today-1)

---
Time zone... get users time zone, save to DB, during user creation.
For display times but also needs to be used when querying...

babies/1/events => last 24 hours
babies/1/events/1 => one day ago
babies/1/evenst/2 => two days ago
...and so on


