task :delete => :environment do
  ::Message.not_actual_messages.destroy_all
end
