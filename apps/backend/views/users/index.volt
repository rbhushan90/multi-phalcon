{{ content() }}

<div align="right">
    {{ link_to("users/create", "<i class='fa fa-plus-circle'></i> Create Users", "class": "btn btn-primary") }}
</div>

{{form('admin/users/search')}}
    <div class="center scaffold">

        <h2>Search users</h2>

        <div class="clearfix">
            <label for="id">Id</label>
            {{ form.render("id") }}
        </div>

        <div class="clearfix">
            <label for="username">Uername</label>
            {{ form.render("username") }}
        </div>

        <div class="clearfix">
            <label for="email">E-Mail</label>
            {{ form.render("email") }}
        </div>

        <div class="clearfix">
            <label for="profilesId">Profile</label>
            {{ form.render("profilesId") }}
        </div>

        <div class="clearfix">
            {{ submit_button("Search", "class": "btn btn-primary") }}
        </div>

    </div>

</form>
<!-- <div class="container">
<div class="span12">
<ul class="nav nav-pills nav-stacked">
  <li class="active"><a href="#"><i class="fa fa-home fa-fw"></i> Home</a></li>
  <li><a href="#"><i class="fa fa-book fa-fw"></i> Library</a></li>
  <li><a href="#"><i class="fa fa-pencil fa-fw"></i> Applications</a></li>
  <li><a href="#"><i class="fa fa-cogs fa-fw"></i> Settings</a></li>
</ul>

</div>
</div> -->