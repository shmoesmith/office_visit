class Patient < ApplicationRecord
    #validations
    validates_presence_of :name, :age, :gender

    #associations
    has_many :appointments, dependent: :destroy
    has_many :doctors, through: :appointments

end
