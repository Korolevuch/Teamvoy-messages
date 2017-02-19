class Message < ActiveRecord::Base
  extend FriendlyId
  after_save :destroy_message, only: :show
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

  private

  def destroy_message
    self.destroy if visit? && visit_count_more_zen_two?
  end

  def visit?
    self.exstraction == 'visit'
  end

  def visit_count_more_zen_two?
    self.count_visit > 2
  end
end
