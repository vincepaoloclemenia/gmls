class Role < ActiveRecord::Base
  acts_as_paranoid
  validates :role_name, presence: true
  has_many :employees, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :role_managements, dependent: :destroy
  # after_create :manage_roles
  
 # MODULES = %w[ Principals Vehicles Vessels Vessel_Classes Vessel_Types Navy_Types Items Categories Subcategories Locations Suppliers Employees Roles Government_Agencies Quality_Questionnaires LOGREQs RFQs Accounting Incidental_Quotes Contracts ]

 # def manage_roles
 # 	1..20 do |mr|
 # 		RoleManagement
 # 	end	
 # end

end
