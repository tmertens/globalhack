class CreateMagicPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :magic_phrases do |t|
      t.uuid :client_uuid
      t.string :hashed_phrase

      t.timestamps
    end
    add_index :magic_phrases, :client_uuid
  end
end
