class CreateAdvsCategoriesJoin < ActiveRecord::Migration
  def up
    create_table 'advs_categories', :id => false do |t|
    t.column :category_id, :integer
    t.column :adv_id, :integer
  end
  end

  def down
    drop_table 'advs_categories'
  end
end
