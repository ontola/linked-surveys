class CreateCustomFormFields < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_form_fields do |t|
      t.references :custom_form, null: false, foreign_key: true
      t.integer :form_field_type, null: false
      t.string :title
      t.text :description
      t.text :helper_text
      t.string :default_value
      t.integer :max_count
      t.string :max_count_prop
      t.integer :min_count
      t.string :min_count_prop
      t.integer :max_inclusive
      t.string :max_inclusive_prop
      t.integer :min_inclusive
      t.string :min_inclusive_prop
      t.integer :max_length
      t.string :max_length_prop
      t.integer :min_length
      t.string :min_length_prop
      t.string :pattern
      t.string :sh_in
      t.string :sh_in_prop
      t.string :predicate

      t.timestamps
    end
  end
end
