class GamesController < ApplicationController
  def new
    random = ('a'..'z').to_a
    session[:letters] = random.sample(10)
  end

  def score
    answer = params[:new]
    @letters = session[:letters]

    word_array = answer.split('')
    if word_array.all? { |letter| @letters.include?(letter) }
      @message = "🎉 Congrats"
      @answer = answer
      @result = "matches the letters!"
    else
      @message = "😔 Sorry"
      @answer = answer
      @result = "can't be built with these letters."
    end
  end
end
