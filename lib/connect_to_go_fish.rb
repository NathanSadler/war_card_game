require_relative 'go_fish_client'
require 'socket'

go_fish_client = GoFishClient.new(3336)
previous_message = ""

while true
  new_message = go_fish_client.capture_output
  if (!new_message.nil? && new_message != previous_message && !previous_message.nil?)
  # Display the most recent message if it is not equal to the previous one,
  # is not nil, and not empty
    puts(new_message)
  end

end
