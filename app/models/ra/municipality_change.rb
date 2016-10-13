class Ra::MunicipalityChange < ApplicationRecord
  belongs_to :municipality_code, :class_name => 'Ra::MunicipalityCode'
end
