class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.text :song
      t.string :key
      t.string :time_signature
      t.string :tempo
      t.string :genre
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
