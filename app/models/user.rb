class User < ActiveRecord::Base

    

    has_secure_password 
    mount_uploader :avatar, AvatarUploader

    # Relations
    has_many :statuses
    
    # Validations
    validates :phone_number, phone: true
    validates_uniqueness_of :phone_number, :email
    validates_presence_of :first_name, :last_name, :country_code, :phone_number, :gender, :birth_date, :avatar, :password_digest
    validates_format_of :birth_date, :with => /\d{4}\-\d{2}\-\d{2}/, :message => "Date must be in the following format: YYYY-MM-DD"
    
    # Custome Validations
    # validate :country_code_existance
    validate :phone_number_format
    validate :birth_date_in_the_past

    # Custome Validation methods
    def phone_number_format
        
        unless self.phone_number == Phonelib.parse(self.phone_number).e164
            self.errors.add(:phone_number,"must be in E.164 format i.e. +xxxxxxxxxxx")
        end
    end
    def country_code_existance
        unless IsoCountryCodes.find(self.country_code.try(:downcase)).present?
            self.errors.add(:country_code,"does not exist")
        end
    end
    def birth_date_in_the_past
        unless self.birth_date.try(:to_date).try(:past?)
            self.errors.add(:birth_date,"must be in the past")
        end
    end
end