class ChangeOfferingEligibilityCriteriaTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :offering_eligibility_criteria, :eligibility_requirement_id, :eligibility_criteria_id
  end
end
