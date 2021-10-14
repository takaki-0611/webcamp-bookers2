# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

 <%= link_to user_path(user.id) do %>
        <%= attachment_image_tag @user, :profile_image, fallback: "no_image_icon.jpg" %>
  <% end %>