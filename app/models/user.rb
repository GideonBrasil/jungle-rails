class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews
    before_save { self.email = email.downcase }
    validates :first_name, presence: true,
                           length: { maximum: 50 }
    validates :last_name, presence: true,
                          length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, 
                      uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true,
                                length: { minimum: 6 }

    def self.authenticate_with_credentials(email, password)
        user = self.find_by(email: email.downcase.strip) if email
        user if user && user.authenticate(password)
    end

end
