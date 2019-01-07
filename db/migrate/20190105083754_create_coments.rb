class CreateComents < ActiveRecord::Migration[5.2]
  def change
    create_table :coments do |t|
      t.string :content
      t.integer :topic_id

      t.timestamps
    end
  end
end
