class AddGoodNumToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :good_num, :integer
  end
end
