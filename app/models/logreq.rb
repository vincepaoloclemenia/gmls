class Logreq < ActiveRecord::Base
	acts_as_paranoid
	# validates :shipname, presence: true
  has_many :logreq_responses
  belongs_to :vessel
end
