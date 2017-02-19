class Message < ActiveRecord::Base
  extend FriendlyId
  after_save :delete_msg, only: :show
  friendly_id :secure_random, use: :slugged
  validates :description, presence: true

  scope :not_actual_messages, -> { where('exstraction = ? AND created_at < ?', HOUR, 1.hour.ago) }

  VISIT = 1
  HOUR  = 0
  TYPE_FOR_DELETING = { hour: HOUR, visit: VISIT }
  enum exstraction: TYPE_FOR_DELETING

  def secure_random
    SecureRandom.hex(16)
  end

  def delete_msg
    ::DeleteMessages.(message_object: self)
  end
end
