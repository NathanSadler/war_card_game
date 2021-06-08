require_relative('server')

server = Server.new

server.start

# Server should immediately shut down clients and then itself when
# a third person joins.
# TODO: remove that limitation later
while server.people.length < 3
  server.accept_new_client_and_create_person
  server.assign_people_to_game
  sleep(5)
end

# Shut down the clients
server.people.each do |person|
  person.socket.close
end

server.close
