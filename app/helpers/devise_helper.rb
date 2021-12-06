module DeviseHelper
  def devise_error_messages!
   return '' if resource.errors.empty?
 
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
    count: resource.errors.count,
    resource: resource.class.model_name.human.downcase)
 
    html = <<-HTML
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <strong>#{sentence}</strong>#{messages}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    HTML
 
    html.html_safe
  end
 end