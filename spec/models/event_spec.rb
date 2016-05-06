require 'spec_helper'

describe Event do

  before do
    @baby2 = Baby.create(name: "Baby Two")
    @todays_event = Event.create(baby_id: 1, event_type_id: 3, time: Time.now)
    @yesterdays_event = Event.create(baby_id: 1, event_type_id: 3, time: Time.now - (24*60*60))
    @two_days_ago_event = Event.create(baby_id: 1, event_type_id: 3, time: Time.now - (48*60*60))
    @not_your_baby_event = Event.create(baby_id: 2, event_type_id: 3, time: Time.now)
  end

  context 'Validations on create or update' do
  end
  
  context 'Queries by date/time' do
    context 'Event.days_ago(0)' do
      it 'should only include todays events' do
        result = Event.days_ago(0)
        expect(result).to include(@todays_event)
        expect(result).not_to include(@yesterdays_event)
      end

      it 'should not include another babies events' do
        lucas = Baby.find(1)
        result = lucas.events.days_ago(0)
        expect(result).not_to include(@not_your_baby_event)
      end
    end

    context 'Event.days_ago(1)' do
      it 'should only include yesterdays events' do
        result = Event.days_ago(1)
        expect(result).to include(@yesterdays_event)
        expect(result).not_to include(@todays_event)
      end
    end

    context 'Event.days_ago(2)' do
      it 'should only include two days ago events' do
        result = Event.days_ago(2)
        expect(result).to include(@two_days_ago_event)
        expect(result).not_to include(@yesterdays_event)
      end
    end
  end

  context 'Event.hours_slept' do
    it 'should accurately count hours slept since midnight' do
      result1 = Baby.find(1).events.days_ago(0).minutes_slept
      result2 = Baby.find(1).events.days_ago(1).minutes_slept
      # This result depends on when the test is run (current day, and seed data is dynamic).
      # expect(result1).to eq(479)
      expect(result2).to eq(719)
    end
  end
end
