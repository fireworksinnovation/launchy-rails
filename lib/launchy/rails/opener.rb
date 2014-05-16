module Launchy
  module Rails
    class Opener 
      def initialize(protocol, host, port)
        @host = host
        @port = port
        @protocol = protocol
      end

      def open_when_ready
        url = "#{@protocol}://#{@host}:#{@port}"
        Thread.new do
          while !port_open?(@host, @port, 1)
            sleep 1
          end
          Launchy.open(url)
        end
      end

      def port_open?(ip, port, seconds=1)
        Timeout::timeout(seconds) do
          begin
            TCPSocket.new(ip, port).close
            true
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
            false
          end
        end
      rescue Timeout::Error
        false
      end
    end
  end
end