class Person
  def initialize(go_fish_client = nil, name = nil, player = nil, socket = nil)
    @go_fish_client = go_fish_client
    @name = name
    @player = player
    @in_game = false
    @socket = socket
  end

  def go_fish_client
    @go_fish_client
  end

  def in_game
    @in_game
  end

  def name
    @name
  end

  def player
    @player
  end

  def socket
    @socket
  end

  def set_go_fish_client(go_fish_client)
    @go_fish_client = go_fish_client
  end

  def set_in_game(new_state)
    @in_game = new_state
  end

  def set_name(new_name)
    @name = new_name
  end

  def set_player(player)
    @player = player
  end

  def set_socket(socket)
    @socket = socket
  end

  # TODO: override hash class later
  def ==(other_person)
    (name == other_person.name) && (player == other_person.player)
  end

end
