class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.text :description
      t.references :custom_form, null: false, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :reward

      t.timestamps
    end
  end
end
