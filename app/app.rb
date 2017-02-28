module Messages
  class App < Padrino::Application
    register ScssInitializer
    use ConnectionPoolManagement
    register Padrino::Mailer
    register Padrino::Helpers
    enable :sessions
    register Padrino::Sprockets
    sprockets :minify => (Padrino.env == :production)
 end
end
