class AddPhotoUrlToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :photo_url, :string
  end
end
