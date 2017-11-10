module Itms::ProjectGoalCodelist
  def self.included(base)
    base.class_eval do
      scope :where_goal_and_codelist, -> (specific_goal_itms_id, codelist_itms_id, codelist_value_itms_id) {
        joins(:konkretny_ciel).merge(Itms::SpecificGoal.where(itms_id: specific_goal_itms_id))
        .joins(:hodnota_ciselnika).merge(Itms::CodelistValue.where_codelist_and_value(codelist_itms_id, codelist_value_itms_id))
      }

      belongs_to :projekt, class_name: Itms::Project
      belongs_to :konkretny_ciel, class_name: Itms::SpecificGoal
      belongs_to :hodnota_ciselnika, class_name: Itms::CodelistValue
    end
  end
end