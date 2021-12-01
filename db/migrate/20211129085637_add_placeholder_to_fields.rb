class AddPlaceholderToFields < ActiveRecord::Migration[6.1]
  def change
    add_column :custom_form_fields, :placeholder, :string
  end
end
