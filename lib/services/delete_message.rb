class DeleteMessages
  attr_reader :message_object

  def self.call(params = {})
    new(params).destroy_message
  end

  def initialize(params)
    @message_object = params[:message_object]
  end

  def destroy_message
    message_object.destroy if visit? && visit_count_more_zen_two?
  end

  private

  def visit?
    message_object.exstraction == 'visit'
  end

  def visit_count_more_zen_two?
    message_object.count_visit > 2
  end
end
