# app/admin/reviews.rb
ActiveAdmin.register Review do
  permit_params :review, :user_id, :order_id

  index do
    selectable_column
    id_column
    column :review
    column :user_id
    column :order_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :review
      f.input :user_id
      f.input :order_id
    end
    f.actions
  end
end
