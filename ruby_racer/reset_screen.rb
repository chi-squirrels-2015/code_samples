module ResetScreen
  def self.call(obj, delay)
    clear_screen
    move_to_home
    puts obj
    sleep(delay)
  end

  def self.clear_screen
    print "\e[2J"
  end

  def self.move_to_home
    print "\e[H"
  end
end
