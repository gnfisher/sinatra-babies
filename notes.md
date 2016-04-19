SINATRA BABIES

An app to keep track of what's happening the first weeks home.

The idea is that forms are easy to touch/select/submit on an iphone.

> Users
  > Babies
      > Events
        > Woke
        > Slept
        > Pooped
        > Vomited
        > Started Feeding
        > Custom
        >> Ratings
            > A lot
            > Normal
            > A little
            > Abnormal

          >> Notes

So the idea is multi-page forms for each EVENT


PG1

    [ WOKE ]
    [ SLEPT ]
    [ POOPED ]
    [ VOMITED ]
    [ FED ]

PG2

    <WOKE>
    [ A LOT ]
    [ NORMAL ]
    [ A LITTLE ]
    [ ABNORMAL ]

PG3

    <WOKE>
    <NORMAL>
    [ OPTIONAL NOTE FIELD ]
        or
    [ SAVE ]


A user creates an account, and goes to their Babies page.
A user clicks a baby to see the current open day immediately.

    LAST NAP: <time>
    LAST POOP: <time>
    

    [ ADD EVENT ]
    [ VIEW PAST 24 HOURS ]
    [ VIEW PAST 72 HOURS ]
    [ VIEW PAST WEEK ]
    [ VIEW PAST MONTH ]
    [ VIEW OTHER BABIES ]    

The REPORT pages will list # of hours slept, #

So it would look at all EVENTS in last 24 hours, list them, fill up the things, then do the special operations...

Like 
  @events.poops.count (# of poops in last 24 hours)
  @events.poops.last.time_since (# mins or hours since last poop)

Getting hours slept will be trickier... lets see... 

if @events.sleeps.first.time > @events.wakes.first.time
  ((The baby was already asleep, so add the difference from 24 hours - Time of waking))

So very doable.

HOW ABOUT RATINGS for SLEPT/WOKE -> Shouldn't be one. So it should default to NULL and we will DYNAMICALLY make them uncheckable by Bootstrap.
 

How would you build the form... onclick submit.

params in checkboses

EVENT
 - event_type_id
 - event_rating_id
 - note

[ 1 ] 
form post='events/create/1'
  <% TYPE.all.each ... checkbox with value and name %>

controller:
  @form_params = {event => {event_type_id => params[event][type_id]}

  if hide-params-> erb: final/submit
  else erb :ratings
  
[ 2 ]
form post=events/create/2'
  hidden params in fields
  unless hide_ratings true
    display ratings options
   
event[type_id]
event[


event[type]

Event.types.all do |type|
end

Event.ratings.all do |rating|
end

if Event.ratings.include? params[event][rating]


USER
BABY
NOTE
--
REPORT (auto generated? every 24 hours, release a report for the previous 24 hours
        save an HTML/PDF file)


