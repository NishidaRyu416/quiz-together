class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.references :user, index: true
      t.integer :sec

      t.timestamps null: false
    end
  end
end
