class AddUserNameToQuestionAnswers < ActiveRecord::Migration
  def change
    add_column :question_answers, :user_name, :string
  end
end
