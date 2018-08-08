class Player
attr_reader(:name,:lives)
attr_writer(:lives)
def initialize(name)
  @name = name
  @lives = 6
end

end
