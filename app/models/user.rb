class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validate :password_complexity
  after_create :assign_default_role

  has_many :quotes
  has_many :posts
  has_many :employees
  has_many :customers
  has_many :buildings
  belongs_to :role, optional: true
  rolify

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
    errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  def assign_default_role
    if self.role_id == 1
      self.add_role(:admin) if self.roles.blank?
      # puts "Role is now admin"
    elsif self.role_id == 2
      self.add_role(:employee) if self.roles.blank?
      # puts "Role is now employee"
    elsif self.role_id == 3
      self.add_role(:customer) if self.roles.blank?
      # puts "Role is now customer"
    else
      self.add_role(:standard) if self.roles.blank?
      # puts "Role is now standard"
    end
  end
end
