class Addpresentationstartatandendat < ActiveRecord::Migration
  def change
     add_column :presentations, :start_at, :datetime
      add_column :presentations, :end_at, :datetime
  end
end
