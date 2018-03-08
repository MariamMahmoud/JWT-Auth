class Status < ActiveRecord::Base
    # Validations
    validates_presence_of :status, :user_id

    # Relations
    belongs_to :user
end