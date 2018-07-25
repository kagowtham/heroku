class LocationSerializer < ActiveModel::Serializer
  attributes :id, :country,:city,:spot,:duration,:image_src
end
