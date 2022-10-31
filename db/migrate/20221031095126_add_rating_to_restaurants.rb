class AddRatingToRestaurants < ActiveRecord::Migration[7.0]
    def change
      add_column :restaurants, :rating, :decimal, default: 0.0, null: false
    end
end