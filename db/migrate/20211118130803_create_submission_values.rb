class CreateSubmissionValues < ActiveRecord::Migration[6.1]
  def change
    create_table :submission_values do |t|
      t.references :submission, null: false, foreign_key: true
      t.string :predicate, null: false
      t.text :value, null: false
      t.string :value_type, null: false

      t.timestamps
    end
  end
end
