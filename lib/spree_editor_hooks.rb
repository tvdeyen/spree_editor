class SpreeEditorHooks < Spree::ThemeSupport::HookListener
  # Admin configuration
  Deface::Override.new(
    :virtual_path => "admin/configurations/index",
    :insert_after => "[data-hook='admin_configurations_menu']",
    :text => %(
      <tr>
        <td><%= link_to t('rich_editor', :default => 'Richtext Editor'), admin_editor_settings_path %></td>
        <td><%= t('rich_editor_description', :default => 'Richtext Editor Settings') %></td>
      </tr>
    )
  )
  
  Deface::Override.new(
    :virtual_path => "admin/shared/_configuration_menu",
    :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
    :text => %(
      <li<%== ' class="active"' if controller.controller_name == 'editor_settings' %>>
        <%= link_to t("rich_editor", :default => 'Richtext Editor'), admin_editor_settings_path %>
      </li>
    )
  )
  
  Deface::Override.new(
    :virtual_path => "layouts/admin",
    :name => "richtext_editor_javascripts",
    :insert_bottom => "[data-hook='admin_inside_head'], #admin_inside_head[data-hook]",
    :partial => "shared/rich_editor_javascript",
    :disabled => false
  )
  
end
