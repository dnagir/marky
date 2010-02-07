require 'test_helper'

class JobTypesControllerTest < ActionController::TestCase
  context 'public user' do
    [:index, :new, :create, :edit, :update, :destroy].each do |action|
      context "hitting '#{action}'" do
        setup { get action }
        should_respond_with 401
      end
    end
  end

  context 'admin user' do
    setup { login_as_admin }
    context 'new sample' do
      setup { get :new }
      should_render_template :new
      should_assign_to :job_type
    end

    context 'creates a job type' do
      setup { post :create, :job_type => {:name => 'abc', :description => 'desc', :price => 10.50} }
      should_redirect_to job_types_path
      should_change('number of types', :by => 1) { JobType.count }
    end
  end

end

