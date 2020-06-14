module DecoratorHelper
  def decorate(record, options = {})
    render("decorators/#{record.key}/form.html.erb", options)
  end
end
