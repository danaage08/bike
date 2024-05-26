ActiveAdmin.register Order do
  permit_params :start_date, :end_date, :delivery_address, :return_address, :status, :user_id, :admin_status, :total_price

  index do
    selectable_column
    id_column
    column :start_date
    column :end_date
    column :delivery_address
    column :return_address
    column :status
    column :admin_status
    column :user
    column :total_price

    actions
  end

  filter :start_date
  filter :end_date
  filter :status
  filter :user
  filter :admin_status
  filter :total_price

  form do |f|
    f.inputs "Order Details" do
      f.input :start_date
      f.input :end_date
      f.input :delivery_address
      f.input :return_address
      f.input :status, collection: Order.statuses.keys.map { |key| [I18n.t("activerecord.attributes.order.statuses.#{key}"), key] }
      f.input :admin_status, as: :select, collection: Order.admin_statuses.keys.map { |key| [I18n.t("activerecord.attributes.order.admin_statuses.#{key}"), key] }
      f.input :user
      f.input :total_price
    end
    f.actions
  end

  controller do
    after_update :update_bike_status

    private

    def update_bike_status(order)
      order.bikes.each do |bike|
        if order.completed?
          bike.update(status: :free)
        else
          bike.update(status: :busy)
        end
      end
    end
  end
end
