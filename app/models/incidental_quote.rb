class IncidentalQuote < ActiveRecord::Base
  acts_as_paranoid
  has_many :incidental_items

  validates :logreq_id, presence: true
  validates :quotation_no, presence: true
  validates :company, presence: true
  validates :subject, presence: true
  validates :subject_detail, presence: true
  validates :prepared_by, presence: true
  
end
