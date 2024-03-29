
{{ content() }}

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("admin/users/index", "&larr; Go Back") }}
    </li>
    <li class="pull-right">
        {{ link_to("admin/users/create", "Create users", "class": "btn btn-primary") }}
    </li>
</ul>

{% for user in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Username</th>
            <th>Email</th>
            <th>Profile</th>
            <th>Banned?</th>
            <th>Suspended?</th>
            <th>Confirmed?</th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td>{{ user.id }}</td>
            <td>{{ user.username }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.profile.name }}</td>
            <td>{{ user.banned == 'Y' ? 'Yes' : 'No' }}</td>
            <td>{{ user.suspended == 'Y' ? 'Yes' : 'No' }}</td>
            <td>{{ user.active == 'Y' ? 'Yes' : 'No' }}</td>
            <td width="12%">{{ link_to("admin/users/edit/" ~ user.id, '<i class="fa fa-pencil-square-o"></i> Edit', "class": "btn") }}</td>
            <td width="12%">{{ link_to("admin/users/delete/" ~ user.id, '<i class="fa fa-times"></i> Delete', "class": "btn") }}</td>
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="10" align="right">
                <div class="btn-group">
                    {{ link_to("users/search", '<i class="fa fa-backward"></i> First', "class": "btn") }}
                    {{ link_to("admin/users/search?page=" ~ page.before, '<i class=" fa fa-step-backward"></i> Previous', "class": "btn ") }}
                    {{ link_to("admin/users/search?page=" ~ page.next, '<i class="fa fa-step-forward"></i> Next', "class": "btn") }}
                    {{ link_to("admin/users/search?page=" ~ page.last, '<i class="fa fa-fast-forward"></i> Last', "class": "btn") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    No users are recorded
{% endfor %}
