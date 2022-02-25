
class Input
  def self.get_coordinates
    # gets.chomp
    tries = gets        # get input
    tries ||= ''        # set to empty string if nil
    tries.chomp!
  end

  def self.get_orientation
    # gets.chomp
    tries = gets        # get input
    tries ||= ''        # set to empty string if nil
    tries.chomp!
  end
end
