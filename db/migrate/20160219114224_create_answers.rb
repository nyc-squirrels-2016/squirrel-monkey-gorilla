class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :choice_id, index: true
      t.integer :survey_id, index: true
      t.integer :question_id, index: true
      t.integer :taker_id, index: true

      t.timestamps null: false
    end
  end
end
