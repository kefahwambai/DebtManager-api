class FeedbackSerializer < ActiveModel::Serializer
  attributes :name, :email, :message
end
