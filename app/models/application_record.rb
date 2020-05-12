class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.latest
    order(:updated_at).last
  end
end
