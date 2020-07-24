ActiveAdmin.register Song do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :genre_id, :name, :detail, :image_id, :sale_year, :price, :is_active, :artist_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre_id, :name, :detail, :image_id, :sale_year, :price, :is_active, :artist_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :genre_id, :name, :detail, :image_id, :sale_year, :is_active, :artist_id

  form do |f|
    f.inputs do
      f.input :genre
      f.input :name
      f.input :detail
      f.input :image_id, as: :file
      f.input :sale_year
      f.input :is_active
      f.input :artist
    end
    f.actions
  end
    
  show do |song|
    attributes_table do
      row :genre_id
      row :name
      row :detail
      # show画面で画像を表示するためのタグを追加
      row :image_id do
        image_tag(song.image_id.url)
      end
      row :sale_year
      row :is_active
      row :artist_id
    end
  end

end