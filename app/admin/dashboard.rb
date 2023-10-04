# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Recently added songs" do
          ul do
            Song.last(5).map do |song|
              li link_to(song.title, admin_user_path(song))
            end
          end
        end
      end

      column do
        panel "Recently added languages" do
          ul do
            Language.last(5).map do |language|
              li link_to(language.name, admin_user_path(language))
            end
          end
        end
      end

      column do
        panel "Recently added genres" do
          ul do
            Genre.last(5).map do |genre|
              li link_to(genre.name, admin_user_path(genre))
            end
          end
        end
      end
    end

  end
end
