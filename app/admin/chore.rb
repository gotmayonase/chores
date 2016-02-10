ActiveAdmin.register Chore do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :user_id, :interval

index do
  id_column
  column :name
  column :interval
  column :user
  column :last_completed
  actions
end

form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs do
    f.input :user
    f.input :name
    f.input :interval, as: :select, collection: Chore.intervals.keys
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
end


end
