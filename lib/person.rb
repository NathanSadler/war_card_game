class Person
  def initialize(go_fish_client = nil, name = nil, player = nil)
    @go_fish_client = go_fish_client
    @name = name
    @player = player
  end

  def go_fish_client
    @go_fish_client
  end

  def name
    @name
  end

  def player
    @player
  end

  def set_go_fish_client(go_fish_client)
    @go_fish_client = go_fish_client
  end

  def set_name(new_name)
    @name = new_name
  end

  def set_player(player)
    @player = player
  end

  # TODO: override hash class later
  def ==(other_person)
    (name == other_person.name) && (player == other_person.player)
  end

end
