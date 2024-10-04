# frozen_string_literal: true

RailsAdmin.config do |config|
  config.model 'Employee' do
    visible false
  end

  config.model 'Company' do
    list do
      field :name
      field :description
      field :website
      field :address
      field :city
      field :state
      field :country
      field :zip
    end

    show do
      field :new_employee do
        label ''
        formatted_value do
          company = bindings[:object]
          bindings[:view].link_to('Register New Employee',
                                  Rails.application.routes.url_helpers.new_company_employee_path(company.id),
                                  class: 'btn btn-primary pull-right').html_safe
        end
      end
      field :name
      field :description
      field :website
      field :address
      field :city
      field :state
      field :country
      field :zip
    end
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model 'CoachingProgram' do
    list do
      field :name
      field :description
      field :company
    end
  end

  config.model 'Coach' do
    list do
      field :name
      field :email
    end
  end
end
