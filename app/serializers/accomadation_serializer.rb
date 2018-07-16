class AccomadationSerializer < ActiveModel::Serializer
  attributes :id, :name,:country,:city,:price,
             :spot
end
