class AddSignatureIdOnUserPreferences < ActiveRecord::Migration[5.0]
  def change
    change_table :user_preferences do |t|
      t.bigint   :signature_id
    end

    add_index :user_preferences, :signature_id, unique: true
  end
end
