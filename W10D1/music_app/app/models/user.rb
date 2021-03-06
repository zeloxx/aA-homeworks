class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true
    validates :email, :session_token, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true } 



    after_initialize :ensure_session_token



    def self.generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    def self.find_by_credentials(email, password)
        user = find_by(email: email)
        user && user.is_password?(password) ? user : nil
    end



    def reset_session_token!
        self.class.generate_session_token
        self.save!
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end



    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        password == BCrypt::Password.new(self.password_digest)
    end



end