class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :session_id, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
