class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :comments

  has_many :tag_user_links
  has_many :tags, :through => :tag_user_links
end
