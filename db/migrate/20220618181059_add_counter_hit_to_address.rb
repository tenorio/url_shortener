class AddCounterHitToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :counter_hit, :integer, default: 0
  end
end
