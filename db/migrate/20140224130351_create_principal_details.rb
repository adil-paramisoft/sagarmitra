class CreatePrincipalDetails < ActiveRecord::Migration
  def change
    create_table :principal_details do |t|
      t.integer :school_id
      t.string :name
      t.string :detail_status, limit: 1, default: "A"

      t.timestamps
    end
  end
end
