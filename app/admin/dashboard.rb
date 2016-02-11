ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Completed Chores in the last 24 Hours" do
          ul do
            ChoreCompletion.joins(:chore, :user).where("chore_completions.created_at > ?", 1.day.ago).order('created_at desc').map do |chore_completion|
              li do
                link_to(chore_completion.user.name, admin_user_path(chore_completion.user)) +
                ' completed ' +
                link_to(chore_completion.chore.name, admin_chore_path(chore_completion.chore)) + ' ' +
                time_ago_in_words(chore_completion.created_at) + ' ago'
              end
            end
          end
        end
      end
      
    end
  end # content
end
