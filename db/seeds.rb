%w(woke\ up fell\ asleep fed pooped puked other).each do |type|
  EventType.create(name: type)
end

%w(a\ lot normal a\ little abnormal).each do |desc|
  EventDescription.create(text: desc)
end
