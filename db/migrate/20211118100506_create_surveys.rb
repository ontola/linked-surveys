class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.references :custom_form, foreign_key: true
      t.references :user, foreign_key: true, null: false
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :reward

      t.timestamps
    end
  end
end
