def connect_client(server, player_name, client_list)
  client = GoFishClient.new(server.port_number)
  client_list.push(client)
  server.accept_new_client_and_create_person(client, player_name)
end
