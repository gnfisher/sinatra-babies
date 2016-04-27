%w(woke\ up fell\ asleep fed pooped puked other).each do |type|
  EventType.create(name: type)
end

%w(a\ lot normal a\ little abnormal).each do |desc|
  EventDescription.create(text: desc)
end

# Creating a default scaffold for the application.

dad = User.create(username: "gnfisher", email: "me@gnfisher.com", password: "password")
lucas = Baby.create( name: "Lucas")
lucas.user = dad
lucas.save

# Creating a history of events for Lucas.

Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-27 08:00:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-27 06:50:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-27 06:20:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-27 06:10:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-27 03:00:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 4, time: '2016-04-27 02:50:00 -0300') # Pooped
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-27 02:20:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-27 02:10:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-26 23:40:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-26 23:00:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-26 23:00:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-26 20:00:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-26 19:15:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 4, time: '2016-04-26 18:55:00 -0300') # Pooped
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-26 18:45:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-26 14:45:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-26 14:00:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-26 13:50:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-26 11:30:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-26 11:00:00 -0300') # Fed


Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-26 08:00:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-26 06:50:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-26 06:20:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-26 06:10:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-26 03:00:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 4, time: '2016-04-26 02:50:00 -0300') # Pooped
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-26 02:20:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-26 02:10:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-25 23:40:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-25 23:00:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-25 23:00:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-25 20:00:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-25 19:15:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 4, time: '2016-04-25 18:55:00 -0300') # Pooped
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-25 18:45:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-25 14:45:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-25 14:00:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-25 13:50:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-25 11:30:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-25 11:00:00 -0300') # Fed

Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-25 08:00:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-25 06:50:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-25 06:20:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-25 06:10:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-25 03:00:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 4, time: '2016-04-25 02:50:00 -0300') # Pooped
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-25 02:20:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-25 02:10:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-24 23:40:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-24 23:00:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-24 23:00:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-24 20:00:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-24 19:15:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 4, time: '2016-04-24 18:55:00 -0300') # Pooped
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-24 18:45:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-24 14:45:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-24 14:00:00 -0300') # Fed
Event.create(baby_id: 1, event_type_id: 1, time: '2016-04-24 13:50:00 -0300') # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: '2016-04-24 11:30:00 -0300') # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: '2016-04-24 11:00:00 -0300') # Fed
