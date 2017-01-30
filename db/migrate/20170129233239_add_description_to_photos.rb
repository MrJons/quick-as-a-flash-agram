class AddDescriptionToPhotos < ActiveRecord::Migration[5.0]
  def change
    change_table :photos do |t|
      t.string :description
    end
  end
end
