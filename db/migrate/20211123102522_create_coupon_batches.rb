class CreateCouponBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :coupon_batches do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :display_name
      t.integer :coupon_count

      t.timestamps
    end

    create_table :coupons do |t|
      t.references :coupon_batch, null: false, foreign_key: true
      t.string :token
      t.datetime :used_at

      t.timestamps
    end

    add_column :submissions, :coupon, :string
    Survey.update_all(reward: 0)
    change_column :surveys, :reward, :integer, default: 0, null: false
  end
end
