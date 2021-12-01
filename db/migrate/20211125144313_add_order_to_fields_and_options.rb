class AddOrderToFieldsAndOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :field_options, :order, :integer, default: 0, null: false
    add_column :custom_form_fields, :order, :integer, default: 0, null: false
  end
end
