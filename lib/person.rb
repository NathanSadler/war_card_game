class Person
  def initialize()
  end

  def go_fish_client
    @go_fish_client ||= nil
  end

  def name
    @name ||= nil
  end

  def player
    @player ||= nil
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

end
