class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: { to_table: :users }, index: true
      t.references :following, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
