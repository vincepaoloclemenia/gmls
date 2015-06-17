class LogreqResponse < ActiveRecord::Base
	acts_as_paranoid
  belongs_to :logreq
end
