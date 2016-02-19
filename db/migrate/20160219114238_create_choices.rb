class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :body, null: false
      t.integer :question_id, index: true

      t.timestamps null: false
    end
  end
end
