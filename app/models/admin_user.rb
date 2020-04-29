class AdminUser < ApplicationRecord
  belongs_to :user
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
end
