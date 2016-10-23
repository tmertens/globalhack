class RenameEligibilityRequirementToEligibilityCriteria < ActiveRecord::Migration[5.0]
  def change
    rename_table :eligibility_requirements, :eligibility_criteria
  end
end
