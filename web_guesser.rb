require 'sinatra'
require 'sinatra/reloader'

Number = rand(100)
def guesses(guess)
  gus = guess.to_i
  value = Number - gus
  if value.between?(1,5)
    "#{gus} is close, but to low!"
  elsif value.between?(-5,-1)
    "#{gus} is close, but to high!"
  elsif Number < gus
    "#{gus} is way to high!!"
  elsif Number > gus
    "#{gus} is way to low!!"
  else
    "YOU ROCK!"
  end
end


get '/' do
  # throw params.inspect
  guess = params["guess"]
  message = guesses(guess)
  erb :index, :locals => {:number => Number, :message => message}

end
