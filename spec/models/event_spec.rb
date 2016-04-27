require 'spec_helper'

describe Event do

  before do
    @todays_event = Event.create(baby_id: 1, event_type_id: 1, time: Time.now)
    @yesterdays_event = Event.create(baby_id: 1, event_type_id: 1, time: Time.now - (24*60*60))
    @two_days_ago_event = Event.create(baby_id: 1, event_type_id: 1, time: Time.now - (48*60*60))
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
end
