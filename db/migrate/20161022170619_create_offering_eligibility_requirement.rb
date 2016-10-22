class CreateOfferingEligibilityRequirement < ActiveRecord::Migration[5.0]
  def change
    create_table :offering_eligibility_requirements do |t|
      t.references :service_offering, foreign_key: true, index: { name: 'offering_eligibility_offering_index' }
      t.references :eligibility_requirement, foreign_key: true, index: { name: 'offering_eligibility_eligibility_index' }
    end
  end
end
