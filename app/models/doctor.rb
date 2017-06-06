class Doctor < ApplicationRecord
    #validations
    validates_presence_of :name, :specialty

    #associations
    has_many :appointments, dependent: :destroy
    has many: patients, through: :appointments
end
