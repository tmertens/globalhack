class Contact < ApplicationRecord
  class Create
    include Verbalize

    input :contactable, :contact_type, :value

    def call
      # fail!("#{contact_type} is not a valid type!") unless valid_type?
      Contact.create! do |contact|
        contact.contactable  = contactable
        contact.contact_type = contact_type
        contact.value        = value
      end
    end
  end
end
