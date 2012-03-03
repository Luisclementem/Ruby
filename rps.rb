class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end
require 'yaml'

def is_valid_strategy(strategy)
  start_down = strategy.downcase
  if (start_down == "p" || start_down == "s" || start_down == "r")
    return true;
  else
    return false
  end
end
def winning_strategy(strat1, strat2)
  strat0_d = strat1.downcase
  strat1_d = strat2.downcase
  if (strat0_d == strat1_d)
   return 0
  end
  if (strat0_d == "p" && strat1_d == "r")
    return 0
  end
  if (strat0_d == "p" && strat1_d == "s")
    return 1
  end
  if (strat0_d == "r" && strat1_d == "s")
    return 0
  end
  if (strat0_d == "r" && strat1_d == "p")
    return 1
  end
  if (strat0_d == "s" && strat1_d == "p")
    return 0
  end
  if (strat0_d == "s" && strat1_d == "r")
    return 1
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless is_valid_strategy(game[0][1]) && is_valid_strategy(game[1][1])
  return game[winning_strategy(game[0][1],game[1][1])]
end
def rps_round_winner(player1,player2)
str ="[#{rps_tournament_winner(player1)}, #{ rps_tournament_winner(player2)}]"
str.gsub!(/(\,)(\S)/, "\\1 \\2")
  return  rps_game_winner(YAML::load(str))
end
def rps_tournament_winner(tournament)
    if tournament.size == 2 && tournament[1][1].kind_of?(Array)
      rps_round_winner(tournament[0],tournament[1])
    else
      return rps_game_winner(tournament)
    end
end

#puts rps_game_winner([ [ "Armando", "P"],["Dave","S"]])
puts rps_tournament_winner(
 [
    [
      [ ["Armando", "P"], ["Dave", "S"] ],
      [ ["Richard", "R"], ["Michael", "S"] ],
    ],
    [
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
 ])
