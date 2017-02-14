class GuessesController < ApplicationController
  def index
    @resetg = Guess.delete_all
    @resetn = Number.delete_all
    @guess = Number.create number: (rand 1..20)
  end

  def new
    @guess = Guess.new
  end

  def create
    @guess = Guess.new(guess_params)
    if @guess.save
      redirect_to guesses_show_path
    else
      render :new
    end
  end

  def show
    @guess = Guess.last.guess
    @number = Number.first.number
  end

  private
  def guess_params
    params.require(:guess).permit(:guess)
  end
end
