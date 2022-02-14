
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  rolify :role_cname => 'Admin'
  rolify :role_cname => 'Customer'
  validates :email, presence: true, email: true
  has_many :orders
  has_many :bank_accounts

  include Devise::JWT::RevocationStrategies::JTIMatcher

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:customer) if self.roles.blank?
  end
end
