class LocationJoinSerializer < ActiveModel::Serializer
  attributes :id, :country,:city,:spot,:price,:name
end
