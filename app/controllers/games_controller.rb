class GamesController < ApplicationController
  def new
    random = ('a'..'z').to_a
    @letters = random.sample(10)
  end

  def score
    answer = params[:new]
    random = ('a'..'z').to_a
    @letters = random.sample(10)

    word_array = answer.split('')
    if word_array.all? { |letter| @letters.include?(letter) }
      @message = "🎉 Congrats"
      @result = "#{answer} matches the letters!"
    else
      @message = "😔 Sorry"
      @result = "#{answer} can't be built with these letters."
    end
  end
end
