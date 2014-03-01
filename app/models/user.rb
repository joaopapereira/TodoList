class User < ActiveRecord::Base
class EmailFormatValidator < ActiveModel::EachValidator  
  def validate_each(object, attribute, value)  
    unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i  
      object.errors[attribute] << (options[:message] || "is not formatted properly")  
    end  
  end  
end
  has_many :todo
  validates :username,  :presence => true
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  
  acts_as_authentic do |c|
    c.login_field = :email          # email is the login field
    c. validate_login_field = false # There is no login field, so don't validate it
  end
end
