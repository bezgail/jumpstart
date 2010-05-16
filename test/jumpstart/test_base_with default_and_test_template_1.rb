require 'helper'

# SET CONSTANTS FOR TESTING
module JumpStart
  DEFAULT_TEMPLATE_NAME = "test_template_1"
  JUMPSTART_TEMPLATES_PATH = "#{ROOT_PATH}/test/test_jumpstart_templates"
end

class TestJumpstartBase < Test::Unit::TestCase
    
  context "Testing jumpstart projects with a DEFAULT_TEMPLATE_NAME and JUMPSTART_TEMPLATES_PATH specified.\n" do
        
    setup do
      clean_destination_dir
    end
        
    context "Create jumpstart with no arguments but do not start.\n" do
  
      setup do
        @test_project = JumpStart::Base.new([])
      end
  
      should "be able to create a new jumpstart with no arguments" do
        refute_nil(@test_project)
      end
  
    end
  
    context "Create jumpstart with the project name argument passed to it but do not start.\n" do
  
      setup do
        @test_project = JumpStart::Base.new(["test_jumpstart_project"])
        @test_project.install_path = "#{JumpStart::ROOT_PATH}/test/destination_dir"
      end
  
      should "be able to create a new jumpstart with the project name as the first argument" do
        refute_nil(@test_project)
      end
  
      should "have set @project_name variable to 'test_jumpstart_project'" do
        assert_equal("test_jumpstart_project", @test_project.project_name)
      end
      
      should "have set @template_name variable to 'test_template_1'" do
        assert_equal("test_template_1", @test_project.template_name)
      end
      
      should "have set @install_path to 'ROOT_PATH/test/destination_dir'" do
        assert_equal("#{JumpStart::ROOT_PATH}/test/destination_dir", @test_project.install_path)
      end
      
      should "generate a test project in ROOT_PATH/test/destination_dir/test_jumpstart_project with the test_template_1 template" do
        @test_project.start
        assert(Dir.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_append_file_with_extension.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_append_file_without_extension"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_line_file_with_extension.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_line_file_without_extension"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_whole_file_with_extension.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_whole_file_without_extension"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/normal_folder_name/test_append_file_with_extension.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/normal_folder_name/test_append_file_without_extension"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/normal_folder_name/test_line_file_with_extension.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/normal_folder_name/test_line_file_without_extension"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/normal_folder_name/test_whole_file_with_extension.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/normal_folder_name/test_whole_file_without_extension"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_replace_strings/replace_strings_1.rb"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_replace_strings/replace_strings_2.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_append_to_end_of_file_remove_last_line_1.txt"))
        refute(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/_L._test_append_to_end_of_file_remove_last_line_1.txt"))
        assert(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_append_to_end_of_file_remove_last_line_2.txt"))
        refute(File.exists?("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/_l._test_append_to_end_of_file_remove_last_line_2.txt"))
      end
  
      should "remove last lines from files and append template info" do
        @test_project.start
        file_1 =  IO.readlines("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_append_to_end_of_file_remove_last_line_1.txt")
        file_2 =  IO.readlines("#{JumpStart::ROOT_PATH}/test/destination_dir/test_jumpstart_project/test_append_to_end_of_file_remove_last_line_2.txt")
        assert_equal("THIS IS THE LAST LINE\n", file_1[9])
        assert_equal("THIS IS THE LAST LINE\n", file_2[9])
        assert_equal("9\n", file_1[8])
        assert_equal("9\n", file_2[8])
        refute(file_1[10])
        refute(file_2[10])
        clean_destination_dir
      end
  
    end
    
  end
  
end
