class RenameOfferingEligibilityRequirementToOfferingEligibilityCriteria < ActiveRecord::Migration[5.0]
  def change
    rename_table :offering_eligibility_requirements, :offering_eligibility_criteria
  end
end
