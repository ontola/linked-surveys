class CreateFieldOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :field_options do |t|
      t.references :custom_form_field, null: false, foreign_key: true
      t.string :label
      t.string :predicate

      t.timestamps
    end

    remove_column :custom_form_fields, :sh_in
  end
end
