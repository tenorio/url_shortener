class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :url
      t.string :url_shortened

      t.timestamps
    end
  end
end
