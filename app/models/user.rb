class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  #attr_accessor :name, :email
  validates :name, presence:true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness:{case_sensitive: false}
  has_secure_password
  #see https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
  # for details about has_secure_password
  validates :password, length: { minimum: 6}
end
