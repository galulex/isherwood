class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  
  def name
      object.username
  end
end