class Status < ActiveRecord::Base
    # Validations
    validates_presence_of :status, :user_id

    # Associations

    belongs_to :user
end