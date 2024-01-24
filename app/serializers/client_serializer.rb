class ClientSerializer < ActiveModel::Serializer
    
  attributes :id, :name
  has_many :loans
  belongs_to :user
  
end
