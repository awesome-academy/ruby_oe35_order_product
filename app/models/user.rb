class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  USER_ATTRS = %i(full_name email password password_confirmation).freeze

  before_save :downcase_email

  validates :full_name, presence: true,
                        length: {maximum: Settings.model.user.name_length}
  validates :email, presence: true,
                    length: {maximum: Settings.model.user.email_length},
                    format: {with: Settings.model.user.email_regex},
                    uniqueness: true
  validates :password, presence: true,
                       length: {minimum: Settings.model.user.password_length}

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
