class AddPosterImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :poster_image, :string
  end
end
