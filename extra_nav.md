<% if user_signed_in? %>
            <% if game_in_session? %>
              <li class="nav-item">
     
              <%= link_to "Current Game", current_game, class: "nav-link" %>
              </li>
            <% else %>
              <li class="nav-item">
     
                <%= link_to "Create Game", new_game_path, class: "nav-link" %>
              </li>
            <% end %>
            <li class="nav-item">
              <%= link_to "Profile", current_user, class: "nav-link" %>
            </li>
            <li class="nav-item">
              <%= link_to "Logout", destroy_user_session_path, method: :delete, class: "nav-link" %>
            </li>
          <% else %>
            <li class="nav-item">
              <%= link_to "Login", new_user_session_path, class: "nav-link" %>
            </li>
            <li class="nav-item">
              <%= link_to "Register", new_user_registration_path, class: "nav-link" %>
            </li>