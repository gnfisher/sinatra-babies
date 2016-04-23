module SinatraBabies
  module Models
    class Baby < ActiveRecord::Base
      validates :name, presence: true
      
      belongs_to :user

      def self.get_by_parent_id(id)
        Baby.where('user_id = ?', id)
      end

      def parent_id
        self.user_id.to_i
      end
    end
  end
end
