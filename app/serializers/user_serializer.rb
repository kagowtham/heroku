class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname,:lastname,:email,:password,
             :password_confirmation,:types
end
