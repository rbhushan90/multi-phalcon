{{ content() }}

<div align="right">
    {{ link_to("admin/profiles/create", "<i class='icon-plus-sign'></i> Create Profiles", "class": "btn btn-primary") }}
</div>

{{form('admin/profiles/search')}}
    <div class="center scaffold">

        <h2>Search profiles</h2>

        <div class="clearfix">
            <label for="id">Id</label>
            {{ form.render("id") }}
        </div>

        <div class="clearfix">
            <label for="name">Name</label>
            {{ form.render("name") }}
        </div>

        <div class="clearfix">
            {{ submit_button("Search", "class": "btn btn-primary") }}
        </div>

    </div>

</form>