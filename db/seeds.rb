User.delete_all
Baby.delete_all
Event.delete_all

if EventType.all.empty?
    %w(woke\ up fell\ asleep fed pooped puked).each do |type|
    EventType.create(name: type)
  end

  %w(a\ lot normal a\ little abnormal).each do |desc|
    EventDescription.create(text: desc)
  end
end

# Creating a default scaffold for the application.

dad = User.create(username: "temp_user", email: "temp_user", timezone: User.timezones[1], password: "password")
lucas = Baby.create( name: "Lucas")
lucas.user = dad
lucas.save

## Creating a history of events for Lucas.

Time.zone = User.timezones[1]

100.times do |i|
  @next_sleep_wake ||= 1
  if i % 2 == 0
    Event.create(
          baby_id: lucas.id, 
          event_type_id: @next_sleep_wake, 
          time: Chronic.parse('now') - (i * 7200))
    @next_sleep_wake = (@next_sleep_wake == 1 ? 2 : 1)
  else
    Event.create(
          baby_id: lucas.id, 
          event_type_id: rand(3..5), 
          event_description_id: rand(1..4), 
          time: Chronic.parse('now') - (i * 7200))
  end
end
