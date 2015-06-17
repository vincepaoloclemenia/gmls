class IncidentalQuote < ActiveRecord::Base
  acts_as_paranoid
  has_many :incidental_items
end
