class Itms::OngoingProjectRecipient < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_prijimatel'

  belongs_to :ongoing_project
end
