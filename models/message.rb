class Message < ActiveRecord::Base
  extend FriendlyId
  friendly_id :secure_random, use: :slugged
  validates :description, presence: true

  VISIT = 1
  HOUR  = 0
  enum exstraction: { hour: HOUR, visit: VISIT }

  def secure_random
    SecureRandom.hex(16)
  end
end
