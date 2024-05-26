ActiveAdmin.register Horizont do
  permit_params :title, :description, :img

  form do |f|
    f.inputs "Horizont Details" do
      f.input :title
      f.input :img
      f.input :description
    end
    f.actions
  end
end
