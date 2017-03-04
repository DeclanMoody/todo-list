class AiGuessesController < ApplicationController
  def index
    @delete = Number.delete_all
    @delete_low = Lowest.delete_all
    @delete_high = Highest.delete_all
    @makeh = Highest.create number: (21)
    @makel = Lowest.create number: (0)
    @delete_try = Try.delete_all
    @try = Try.create number: (0)
  end

  def show
    @lowN = Lowest.last.number
    @highN = Highest.last.number
    @low = (@lowN + 1)
    @high = (@highN - 1)
    @ai_guess = Number.create number: (rand @low..@high)
    @guess = Number.last.number
    @try_num = Try.last.number
    @try = (@try_num + 1)
    @insert = Try.create number: (@try)
  end

  def low
    @low = Number.last.number
    @insert = Lowest.create number: (@low)
  end

  def high
    @high = Number.last.number
    @insert = Highest.create number: (@high)
  end

  def correct
    @try = Try.last.number
  end
end
