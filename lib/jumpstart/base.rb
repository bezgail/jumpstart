module JumpStart
  class Base

    def initialize(input, output, args)
      @input = input
      @output = output
      @project_name = args.shift
      if args[0] != nil
        @template_name = args.shift
      elsif DEFAULT_TEMPLATE_NAME != nil
        @template_name = DEFAULT_TEMPLATE_NAME
      end
      @existing_projects = []
    end
    
    def start
      @output.puts
      @output.puts "******************************************************************************************************************************************"
      @output.puts
      @output.puts "JumpStarting...."
      @output.puts
      @output.puts
      lookup_existing_projects
      check_project_name
      check_template_name
      load_config_options
      check_install_paths
      create_project
      parse_template_dir
      create_new_folders
      create_new_files_from_whole_templates
      populate_files_from_append_templates
      populate_files_from_line_templates
      run_scripts
    end
    
    private
        
    def lookup_existing_projects
      project_dirs = Dir.entries(JUMPSTART_TEMPLATES_PATH) -IGNORE_DIRS
      project_dirs.each do |x|
        if Dir.entries("#{JUMPSTART_TEMPLATES_PATH}/#{x}").include? "jumpstart_config"
          if File.exists?("#{JUMPSTART_TEMPLATES_PATH}/#{x}/jumpstart_config/#{x}.yml")
            @existing_projects << x
          end
        end
      end
    end
    
    def check_project_name
      if @project_name.nil? || @project_name.empty?
        @output.puts
        @output.puts "Enter a name for your project."
        @project_name = @input.gets.chomp
        if @project_name.length < 3
          @output.puts
          @output.puts "The name of your project must be at least 3 characters long."
          check_project_name
        end
      end
    end
    
    def check_template_name
      if @template_name.nil? || @template_name.empty?
        jumpstart_options
      else
        unless @existing_projects.include? @template_name
          @output.puts "A JumpStart template of the name #{@template_name} doesn't exist, would you like to create it?\nyes (y) / no (n)?"
          @output.puts
          input = @input.gets.chomp
          if input == "yes" || input == "y"
            @output.puts "creating JumpStart template #{@template_name}"
            # TODO Create functionality for creating templates if they do not exist
          elsif input == "no" || input == "n"
            exit_jumpstart
          end
        end
      end
    end
    
    def jumpstart_options
      global_options = {'c' => 'config'}
      templates = {}
      @output.puts "******************************************************************************************************************************************"
      @output.puts
      @output.puts "jumpstart options!"
      @output.puts
      @output.puts "What would you like to do?"
      @output.puts "To run an existing jumpstart enter it's number or it's name."
      @output.puts
      count = 0
      @existing_projects.each do |x|
        count += 1
        templates[count.to_s] = x
        @output.puts "#{count}: #{x}"
      end
      @output.puts
      @output.puts "To create a new jumpstart enter a name for it."
      @output.puts
      @output.puts "To view/set jumpstart configuration options type 'config' or 'c'."
      input = @input.gets.chomp
      global_options.each do |x,y|
        if input == 'c' || input == 'config'
          configure_jumpstart
        end
      end
      projects.each do |x,y|
        if x == input
          @template_name = projects.fetch(x)
        elsif y == input
          @template_name = y
        end
      end      
    end
        
    def configure_jumpstart
      # TODO Define configure_jumpstart method
      @output.puts "******************************************************************************************************************************************"
      @output.puts
      @output.puts "jumpstart configuration."
      @output.puts
      
      # This should be removed when method is finished.
      exit_jumpstart
    end
    
    def load_config_options
      @config_file = YAML.load_file("#{JUMPSTART_TEMPLATES_PATH}/#{@template_name}/jumpstart_config/#{@template_name}.yml")
    end
    
    def check_install_paths
      @install_path = @config_file[:install_path]
      @template_path = "#{JUMPSTART_TEMPLATES_PATH}/#{@template_name}"
      [@install_path, @template_path].each do |x|
        begin
          Dir.chdir(x)
        rescue
          @output.puts
          @output.puts "The directory #{x} could not be found, or you do not have the correct permissions to access it."
          exit_jumpstart
        end
      end
      if Dir.exists?("#{@install_path}/#{@project_name}")
        @output.puts
        @output.puts "The directory #{@install_path}/#{@project_name} already exists. As this is the location you have specified for creating your new project jumpstart will now exit to avoid overwriting anything."
        exit_jumpstart
      end
    end
        
    def create_project
      @install_command = @config_file[:install_command]
      @install_command_options = @config_file[:install_command_options]
      Dir.chdir(@install_path)
      @output.puts "Executing command: #{@install_command} #{@project_name} #{@install_command_options}"
      system "#{@install_command} #{@project_name} #{@install_command_options}"
    end
    
    def parse_template_dir
      @dir_list = []
      file_list = []
      @whole_templates = []
      @append_templates = []
      @line_templates = []
      Find.find(@template_path) do |x|
        case
        when File.file?(x) then
          file_list << x.sub!(@template_path, '')
        when File.directory?(x) then
          @dir_list << x.sub!(@template_path, '')
        end
      end
      file_list.each do |file|
        if file =~ /_\._{1}\w*/
          @append_templates << file
        elsif file =~ /_\d\._{1}\w*/
          @line_templates << file
        else
          @whole_templates << file
        end
      end
    end
    
    def create_new_folders
      Dir.chdir(@install_path)
      @dir_list.each do |x|
        unless Dir.exists?("#{@install_path}/#{@project_name}#{x}")
          Dir.mkdir("#{@install_path}/#{@project_name}#{x}")
        end
      end
    end
    
    def create_new_files_from_whole_templates
      @whole_templates.each do |x|
        FileUtils.touch("#{@install_path}/#{@project_name}#{x}")
        file_contents = IO.readlines("#{@template_path}#{x}")
        File.open("#{@install_path}/#{@project_name}#{x}", "w") do |y|
          y.puts file_contents
        end
      end
    end
    
    def populate_files_from_append_templates
      @append_templates.each do |x|
        FileUtils.touch("#{@install_path}/#{@project_name}#{x.sub(/_\._{1}/, '')}")
        FileUtils.append_to_end_of_file("#{@template_path}#{x}", "#{@install_path}/#{@project_name}#{x.sub(/_\._{1}/, '')}")
      end
    end
    
    def populate_files_from_line_templates
      @line_templates.each do |x|
        FileUtils.touch("#{@install_path}/#{@project_name}#{x.sub(/_\d\._{1}/, '')}")
        FileUtils.insert_text_at_line_number("#{@template_path}#{x}", "#{@install_path}/#{@project_name}#{x.sub(/_\d\._{1}/, '')}", get_line_number(x))
      end
    end
    
    def run_scripts
      # TODO Finish scripts method
      scripts = Dir.entries("#{@template_path}/jumpstart_config") - IGNORE_DIRS
    end
    
    def get_line_number(file_name)
      /_(?<number>\d)\._{1}\w*/ =~ file_name
      number.to_i
    end
    
    def exit_jumpstart
      @output.puts
      @output.puts
      @output.puts "Exiting JumpStart..."
      @output.puts "Goodbye!"
      @output.puts
      @output.puts "******************************************************************************************************************************************"
      @output.puts
      exit
    end
    
  end
end