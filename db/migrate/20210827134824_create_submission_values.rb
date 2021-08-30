class CreateSubmissionValues < ActiveRecord::Migration[6.0]
  def change
    create_table :submission_values do |t|
      t.references :submission, null: false, foreign_key: true
      t.string :predicate, null: false
      t.text :value
      t.integer :value_type

      t.timestamps
    end
  end
end
