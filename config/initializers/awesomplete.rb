[ActionView::Helpers::FormTagHelper, ActionView::Helpers::FormBuilder].each do |scope|
  scope.class_eval do
    define_method :awesomplete_field do |name, options|
      <<-INP.squish.html_safe
        <input class='awesomplete' name='#{name}' id='#{name}' data-list='#{options[:collection]}' data-multiple>
      INP
    end
  end
end
