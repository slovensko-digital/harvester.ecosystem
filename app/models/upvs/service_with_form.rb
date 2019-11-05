class Upvs::ServiceWithForm < ApplicationRecord
  self.table_name = table_name_prefix + 'services_with_forms'
  self.inheritance_column = nil
end
