require 'test_helper'

class SamplesControllerTest < ActionController::TestCase

  context "public user" do
    context "view samples" do
      setup { get :index }
      should_render_template :index
    end

    [:edit, :update, :new, :create, :destroy].each do |method|
      context "#{method} sample" do
        setup { get method }
        should_redirect_to('require login') { login_url }
      end
    end
  end

  context "admin user" do
    setup { login_as_admin }

    context "new sample" do
      setup { get :new }
      should_render_template :new
      should_assign_to (:sample)
    end

    context "creates a sample" do
      setup { post :create, :sample => valid_params }
      should_redirect_to('samples') { samples_url }
      should_change('number of samples', :by => 1) { Sample.count }
    end

    context "edit sample" do
      setup do
        @sample = Factory.create(:sample)
        get :edit, :id => @sample.id
      end
      should_render_template :edit
      should_assign_to(:sample) { @sample }
    end

    context "updates sample" do
      setup do
        @sample = Factory.create(:sample)
        put :update, :id => @sample.id, :sample => { :title => 'updated description' }
      end
      should_redirect_to('samples index') { samples_url }
      should 'change attributes' do
        assert_equal 'updated description', @sample.reload.title
      end
    end

    context "destroy sample" do
      setup do
        @sample = Factory.create(:sample)
        delete :destroy, :id => @sample.id
      end
      should_redirect_to('samples') { samples_url }
      should 'delete sample' do
        assert !Sample.exists?(@sample.id)
      end
    end
  end


  private

  def valid_params
    Factory.attributes_for(:sample)
#    { :title => 'short title', :description => 'much longer description',
#      :original_image  => fixture_file_upload('images/sample.jpg', 'image/jpeg', true),
#      :processed_image => fixture_file_upload('images/sample.jpg', 'image/jpeg', true) }
  end
end

