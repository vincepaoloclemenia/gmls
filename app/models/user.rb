class User < ActiveRecord::Base
  acts_as_paranoid

  attr_accessor :role_name, :full_name

  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :ship_arrival, dependent: :destroy
  has_many :logreqs
  
  validates :email, presence: true       
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :department, presence: true
  # validates :position, presence: true
  # validates :age, presence: true
  # validates :gender, presence: true
  
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def department_type
    self.department == 1 ? "Ship" : "Military"
  end

  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
