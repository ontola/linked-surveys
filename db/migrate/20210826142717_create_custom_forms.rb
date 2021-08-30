class CreateCustomForms < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_forms do |t|
      t.string :title

      t.timestamps
    end
  end
end
