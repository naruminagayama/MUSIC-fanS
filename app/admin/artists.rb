ActiveAdmin.register Artist do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :detail, :image_id, :formation_yeah, :is_active
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :detail, :image_id, :formation_yeah, :is_active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :name, :detail, :image_id, :formation_yeah, :is_active

  form do |f|
    f.inputs do
      f.input :name
      f.input :detail
      f.input :image_id, as: :file
      f.input :formation_yeah
      f.input :is_active
    end
    f.actions
  end
    
  show do |artist|
    attributes_table do
      row :name
      row :detail
      # show画面で画像を表示するためのタグを追加
      row :image_id do
        image_tag(artist.image_id.url)
      end
      row :formation_yeah
      row :is_active
    end
  end    
  
end