# Helper methods defined here can be accessed in any controller or view in the application

module Messages
  class App
    module MessagesHelper
      def id_is_numeric?(id)
        true if Float(id) rescue false
      end
    end

    helpers MessagesHelper
  end
end
