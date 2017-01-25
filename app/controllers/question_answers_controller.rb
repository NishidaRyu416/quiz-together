class QuestionAnswersController < ApplicationController
  before_action :user_data
  respond_to :json

  def index
    @answer=QuestionAnswer.all
  end

  def new
    @answer=QuestionAnswer.new
  end

  def show
  end

  def create
    @answer=QuestionAnswer.new
    @answer.user_name=current_user.name
    if @answer.save
      flash[:notice] = "You answered"
      redirect_to :back
    else
      render 'new'
    end
  end
  def destroy_all
    QuestionAnswer.destroy_all
    redirect_to root_path
  end

  private

  def user_data
  @users=User.all
  end

  def question_answer_params
    params.require(:question_answer).permit(:user_id,:sec,:user_name)
  end
end
