class CreateCustomForms < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_forms do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title

      t.timestamps
    end
  end
end
