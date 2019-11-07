class Upvs::ServiceWithForm < ApplicationRecord
  self.table_name = Upvs.table_name_prefix + 'services_with_forms'
  self.inheritance_column = nil
end
