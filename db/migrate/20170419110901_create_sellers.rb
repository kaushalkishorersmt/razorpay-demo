class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :description
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
