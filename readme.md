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
- Add Date field to the form
- Timezones? 
- Delete Events

### Reports

- Create a controller? NO
- or Build logic into Event model? YES
  - /babies/:id/events/24, /babies/:id/events/72
  - /babies/:if/events dashboard (hours slept on average if more than 3 days available, etc)
