class CreateProgramStates < ActiveRecord::Migration
  def change
    create_table :program_states do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
