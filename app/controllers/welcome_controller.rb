class WelcomeController < ApplicationController
  def index
    if logged_in?
      gon.user_name = current_user.name
    end
    #@val=QuestionAnswer.all
    @users=User.all
  end
end
