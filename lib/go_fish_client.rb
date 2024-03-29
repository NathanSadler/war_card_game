require 'socket'
class GoFishClient

  attr_reader :previous_message

  def initialize(port=3336, ip='localhost')
    @socket = TCPSocket.new(ip, port)
    @previous_message = nil
  end

  def provide_input(text)
    @socket.puts(text)
  end

  def get_socket
    return @socket
  end

  def capture_output(delay=0.1)
    sleep(delay)
    @output = @socket.read_nonblock(1000) # not gets which blocks
    rescue IO::WaitReadable
      @output = ""
  end

  def close
    @socket.close if @socket
  end

  def set_previous_message(updated_message)
    previous_message = updated_message
  end

end
