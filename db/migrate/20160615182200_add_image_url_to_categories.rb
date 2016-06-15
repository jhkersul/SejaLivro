class AddImageUrlToCategories < ActiveRecord::Migration[5.0]
  def self.up
    change_table :categories do |t|
      t.string   :image_url
    end
  end
end
