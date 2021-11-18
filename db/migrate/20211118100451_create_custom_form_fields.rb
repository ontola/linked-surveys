class CreateCustomFormFields < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_form_fields do |t|
      t.references :custom_form, null: false, foreign_key: true
      t.integer :form_field_type, null: false
      t.string :title
      t.text :description
      t.text :helper_text
      t.string :default_value
      t.integer :max_count
      t.integer :min_count
      t.integer :max_inclusive
      t.integer :min_inclusive
      t.integer :max_length
      t.integer :min_length
      t.string :pattern
      t.string :sh_in
      t.string :predicate

      t.timestamps
    end
  end
end
