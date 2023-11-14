class GamesController < ApplicationController
  before_action :initialize_score, only: [:new]

  def new
    random = ('a'..'z').to_a
    session[:letters] = random.sample(10)
    @score = session[:score]
  end

  def score
    answer = params[:new]
    @letters = session[:letters]

    word_array = answer.split('')
    if word_array.all? { |letter| @letters.include?(letter) }
      @message = "🎉 Congrats"
      @answer = answer
      @result = "matches the letters!"
      session[:score] += 1
    else
      @message = "😔 Sorry"
      @answer = answer
      @result = "can't be built with these letters."
    end
  end

  private

  def initialize_score
    session[:score] ||= 0
  end
end
