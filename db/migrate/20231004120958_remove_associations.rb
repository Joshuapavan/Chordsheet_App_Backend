class RemoveAssociations < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :songs, :users
    remove_reference :songs, :user, index: true
  end
end
