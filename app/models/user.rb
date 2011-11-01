class User < ActiveRecord::Base
  has_many :stockholder_base_reports
  has_many :stockholders, :through => :stockholder_base_reports
  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
end