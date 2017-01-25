class WelcomeController < ApplicationController
  def index
    @answers=QuestionAnswer.all
    @users=User.all
  end
end
