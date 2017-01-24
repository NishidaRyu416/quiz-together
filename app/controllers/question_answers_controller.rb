class QuestionAnswersController < ApplicationController
  before_action :user_data,only:[:new]
  respond_to :json

  def index
    respond_with QuestionAnswer.search(params[:q]).result(distinct: true)
  end

  def new
  end

  def create
    respond_with  QuestionAnswer.create!( question_answer_params)
  end

  def destroy
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
