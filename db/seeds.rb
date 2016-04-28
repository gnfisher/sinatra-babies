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

today = Time.now.strftime("%Y-%m-%d")
yesterday = (Time.now - 86400).strftime("%Y-%m-%d")
anteayer = (Time.now - (86400*2)).strftime("%Y-%m-%d")
three_days_ago = (Time.now - (86400*3)).strftime("%Y-%m-%d")

Event.create(baby_id: 1, event_type_id: 1, time: "#{today} 08:00:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{today} 06:50:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{today} 06:20:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{today} 06:10:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{today} 03:00:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 4, time: "#{today} 02:50:00 -0300") # Pooped
Event.create(baby_id: 1, event_type_id: 3, time: "#{today} 02:20:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{today} 02:10:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{yesterday} 23:40:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{yesterday} 23:00:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{yesterday} 23:00:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{yesterday} 20:00:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{yesterday} 19:15:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 4, time: "#{yesterday} 18:55:00 -0300") # Pooped
Event.create(baby_id: 1, event_type_id: 1, time: "#{yesterday} 18:45:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{yesterday} 14:45:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{yesterday} 14:00:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{yesterday} 13:50:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{yesterday} 11:30:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{yesterday} 11:00:00 -0300") # Fed


Event.create(baby_id: 1, event_type_id: 1, time: "#{yesterday} 08:00:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{yesterday} 06:50:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{yesterday} 06:20:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{yesterday} 06:10:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{yesterday} 03:00:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 4, time: "#{yesterday} 02:50:00 -0300") # Pooped
Event.create(baby_id: 1, event_type_id: 3, time: "#{yesterday} 02:20:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{yesterday} 02:10:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{anteayer} 23:40:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{anteayer} 23:00:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{anteayer} 23:00:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{anteayer} 20:00:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{anteayer} 19:15:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 4, time: "#{anteayer} 18:55:00 -0300") # Pooped
Event.create(baby_id: 1, event_type_id: 1, time: "#{anteayer} 18:45:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{anteayer} 14:45:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{anteayer} 14:00:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{anteayer} 13:50:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{anteayer} 11:30:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{anteayer} 11:00:00 -0300") # Fed

Event.create(baby_id: 1, event_type_id: 1, time: "#{anteayer} 08:00:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{anteayer} 06:50:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{anteayer} 06:20:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{anteayer} 06:10:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{anteayer} 03:00:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 4, time: "#{anteayer} 02:50:00 -0300") # Pooped
Event.create(baby_id: 1, event_type_id: 3, time: "#{anteayer} 02:20:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{anteayer} 02:10:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{three_days_ago} 23:40:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{three_days_ago} 23:00:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{three_days_ago} 23:00:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{three_days_ago} 20:00:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{three_days_ago} 19:15:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 4, time: "#{three_days_ago} 18:55:00 -0300") # Pooped
Event.create(baby_id: 1, event_type_id: 1, time: "#{three_days_ago} 18:45:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{three_days_ago} 14:45:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{three_days_ago} 14:00:00 -0300") # Fed
Event.create(baby_id: 1, event_type_id: 1, time: "#{three_days_ago} 13:50:00 -0300") # Woke up
Event.create(baby_id: 1, event_type_id: 2, time: "#{three_days_ago} 11:30:00 -0300") # Fell asleep
Event.create(baby_id: 1, event_type_id: 3, time: "#{three_days_ago} 11:00:00 -0300") # Fed
