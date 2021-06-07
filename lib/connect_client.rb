def connect_client(server, player_name, client_list)
  client = Client.new(server.port_number)
  client_list.push(client)
  server.accept_new_client
end
