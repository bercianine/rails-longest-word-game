class GamesController < ApplicationController
  def new
    random = ('a'..'z').to_a
    @letters = random.sample(10)
  end

  def score
    answer = params[:new]

    word_array = answer.split('');
    if word_array.all? { |letter| @letters.include?(letter) }
      @message = "🎉 Congrats"
      @result = "<strong>#{answer}</strong> matches the letters!"
    else
      @message = "😔 Sorry"
      @result = "<strong>#{answer}</strong> can't be built with these letters."
    end
  end
end
