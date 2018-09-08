class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :total
      t.belongs_to :student, foreign_key: true
      t.belongs_to :klass, foreign_key: true

      t.timestamps
    end
  end
end
