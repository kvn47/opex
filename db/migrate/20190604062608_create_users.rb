class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :nickname, null: false, index: {unique: true}
      t.string :email, null: false, index: {unique: true}
      t.date :birth_date
      t.string :location
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
