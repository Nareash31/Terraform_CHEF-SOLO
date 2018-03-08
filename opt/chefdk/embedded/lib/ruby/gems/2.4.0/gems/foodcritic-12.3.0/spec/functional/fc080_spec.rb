require "spec_helper"

describe "FC080" do
  context "with a cookbook with a recipe that includes a user resource using supports" do
    recipe_file <<-EOF
      user 'betty' do
        action :create
        supports({
          manage_home: true,
          non_unique: true
        })
      end
    EOF
    it { is_expected.to violate_rule }
  end

  context "with a cookbook with a recipe that includes a user resource using supports w/o parens" do
    recipe_file <<-EOF
      user 'betty' do
        action :create
        supports manage_home: true
      end
    EOF
    it { is_expected.to violate_rule }
  end

  context "with a cookbook with a recipe that includes a user resource not using supports" do
    recipe_file <<-EOF
      user username do
        shell '/bin/false'
        home  deploy_path
        system true
        action :create
      end
    EOF
    it { is_expected.not_to violate_rule }
  end

  context "with a cookbook with a recipe that includes a resource with supports" do
    recipe_file <<-EOF
      service 'foo' do
        action :start
        supports :restart
    EOF
    it { is_expected.not_to violate_rule }
  end

  context "with a cookbook with a recipe that includes a user resource and other supports uses" do
    recipe_file <<-EOF
      user 'foo' do
        system true
        action :create
      end

      def supports(thing)
        puts thing
      end

      supports('something')

      service 'foo' do
        supports restart: true, status: true
        action [:enable, :start]
      end
    EOF
    it { is_expected.not_to violate_rule }
  end
end
