ActiveAdmin.register Bike do
  permit_params :title, :bike_type, :img, :description, :price, :status

  form do |f|
    f.inputs "Bike Details" do
      f.input :title
      f.input :bike_type, as: :select, collection: Bike.bike_types.keys.map { |type| [I18n.t("activerecord.attributes.bike.bike_types.#{type}"), type] }
      f.input :img
      f.input :price
      f.input :description
      f.input :status, as: :select, collection: Bike.statuses.keys.map { |status| [I18n.t("activerecord.attributes.bike.statuses.#{status}"), status] }
    end
    f.actions
  end
end
