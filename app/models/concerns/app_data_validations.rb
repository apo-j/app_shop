module AppDataValidations
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    validates :org_id, :nature_name,  presence:{message: ErrorMSG::Model::MSG[:p]}
    validates :nature_name, length: {in:3..100}, presence: {message: ErrorMSG::Model::MSG[:len]}
    validates :nature_name, format: {with: /\A[a-zA-Z0-9]+\z/, message: ErrorMSG::Model::MSG[:reg]}
  end

  module ClassMethods
  end

end