class Ra::MunicipalityChange < ApplicationRecord
  belongs_to :municipality_object,
    :foreign_key => 'municipality_id',
    :class_name => 'Ra::Municipality',
    :required => true
  belongs_to :municipality_code, :class_name => 'Ra::MunicipalityCode'
end
