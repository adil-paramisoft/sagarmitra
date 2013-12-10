class ChageDataTypeOfPresentationVolntreeMobileNo < ActiveRecord::Migration
  def self.up
     change_column :presentations, :followup_volunteer_mno, :string
    end

    def self.down
     change_column :presentations, :followup_volunteer_mno, :integer
    end
end
