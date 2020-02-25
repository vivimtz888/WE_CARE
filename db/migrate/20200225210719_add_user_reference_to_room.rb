class AddUserReferenceToRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :user, index: true
  end
end
