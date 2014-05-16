module Launchy
  module Rails
    class AfterInitialize < ::Rails::Railtie
      config.after_initialize do
        if ::Rails.env.development? && ::Rails.const_defined?(:Server)
          a = Launchy::Rails::Opener.new('http', 'localhost', ::Rails::Server.new.options[:Port])
          a.open_when_ready
        end
      end
    end
  end
end