class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  MAX_FAILED_ATTEMPTS = 5

  def sign_in(password)
    return if locked_at.present?
    if valid_password?(password)
      update_columns(failed_attempts: 0, locked_at: nil)
    else
      failed_attempts = self.failed_attempts + 1
      locked_at = failed_attempts >= MAX_FAILED_ATTEMPTS ? Time.zone.now : nil
      update_columns(failed_attempts: failed_attempts, locked_at: locked_at)
      false
    end
  end

  attr_reader :password

  def password=(password)
    self.encrypted_password = Digest::SHA256.base64digest(password)
    @password = password
  end

  def valid_password?(password)
    encrypted_password == Digest::SHA256.base64digest(password)
  end

  def reset_authentication_token
    update_column(:auth_token, SecureRandom.base58(24))
  end
end
