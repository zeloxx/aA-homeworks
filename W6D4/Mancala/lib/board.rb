require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
      @name1 = name1
      @name2 = name2
      @cups = Array.new(14) { Array.new }
      self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
      (0...cups.length).each do |i|
          if i != 6 && i != 13
            cups[i] = [:stone, :stone, :stone, :stone]
          end
      end
  end

  def valid_move?(start_pos)
      if !start_pos.between?(0, cups.length-1)
         raise "Invalid starting cup"
      elsif cups[start_pos].empty?
        raise 'Starting cup is empty'
      end
  end


  # display hand
  # display @cups
  # display i
  # display @cups[i]
  # display cups[i]

  def make_move(start_pos, current_player_name)
    # debugger
      hand = @cups[start_pos] 
      @cups[start_pos] = []
  
      i = start_pos
      until hand.empty?
        i += 1
        i = i % @cups.length

        if i == 6 && !hand.empty?
          @cups[6] << hand.pop if current_player_name == @name1
        elsif i == 13 && !hand.empty?
          @cups[13] << hand.pop if current_player_name == @name2
        elsif !hand.empty?
          @cups[i] << hand.pop
        end

      end
      
      self.render
      self.next_turn(i)
  end



  def next_turn(ending_cup_idx)
    # helper method to determine whether make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? { |cup| cup.empty? } || @cups[7...13].all? { |cup| cup.empty? }
  end

  def winner
      player_1_score = @cups[6].length
      player_2_score = @cups[13].length
      return :draw if player_1_score == player_2_score
      player_1_score > player_2_score ? @name1 : @name2
  end
end
