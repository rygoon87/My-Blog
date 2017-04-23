<a href="#" class="list-group-item list-group-item-action flex-column align-items-start ">
  <div class="d-flex w-100 justify-content-between">
    <h5 class="mb-1">Blog Entry: </h5>
    <small class="text-muted">3 days ago</small>
  </div>
  <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
  <small class="text-muted">Author: <%= @author %></small>
</a>
<a href="#" class="list-group-item list-group-item-action flex-column align-items-start ">
  <div class="d-flex w-100 justify-content-between">
    <h5 class="mb-1">Blog Entry: </h5>
    <small class="text-muted">3 days ago</small>
  </div>
  <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
  <small class="text-muted">Author: <%= @author %></small>
</a>
<a href="#" class="list-group-item list-group-item-action flex-column align-items-start ">
  <div class="d-flex w-100 justify-content-between">
    <h5 class="mb-1">Blog Entry: </h5>
    <small class="text-muted">3 days ago</small>
  </div>
  <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
  <small class="text-muted">Author: <%= @author %></small>
</a>
<a href="#" class="list-group-item list-group-item-action flex-column align-items-start ">
  <div class="d-flex w-100 justify-content-between">
    <h5 class="mb-1">Blog Entry: </h5>
    <small class="text-muted">3 days ago</small>
  </div>
  <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
  <small class="text-muted">Author: <%= @author %></small>
</a>
















  <% @posts.each_slice(3) do |group| %>

      <% group.each do |post| %>

          <a href="<%= post_path(post) %>" style="text-decoration: none;">


          <span class="fa fa-plane grow pull-left" style="color: SkyBlue; font-size: 30px;" aria-hidden="true"><span style="color:black; font-size: 30px; font-weight: bold;"><%= rand(100..999) %></span></span>

              <center><h1><%= post.title %></h1></center>
              <%= truncate( post.body, length: 150) %>
              <hr>
            <p>Arthur: <%= post.user.full_name %></p>
            <p>Post Created On: <%= post.created_at %> </p>

        </a>

      <% end %>

  <% end %>
