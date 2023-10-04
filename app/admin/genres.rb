ActiveAdmin.register Genre do

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name, label: "Genre"
    end
    f.actions
  end
  
end
