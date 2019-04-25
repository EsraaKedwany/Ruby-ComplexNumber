class ItemSerializer < ActiveModel::Serializer
  # attribute :name, key: :item_name
  # attribute :description, key: :item_description
  attributes :item_name
  def item_name
    object.name.upercase
  end
end
