class AddCastToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :cast, :description
  end
end
