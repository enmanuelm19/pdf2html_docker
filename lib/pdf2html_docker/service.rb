require 'terrapin'
require 'pdf2html_docker/option_builder'

module Pdf2htmlDocker
  DOCKER_COMMAND = 'docker run -ti -v'.freeze
  DOCKER_IMAGE = 'bwits/pdf2htmlex'.freeze
  BASE_COMMAND = 'pdf2htmlEX'.freeze
  DOCKER_VOLUME = ':/pdf'.freeze

  class Service
    attr_reader :line, :command_options, :input_dir, :input_file
    attr_writer :command

    def initialize(input_file, output_file = '', options = {})
      @input_dir, @input_file = process_input_file(input_file)
      args = { pdf: @input_file, html: output_file }
      @command_options = OptionBuilder.new(args, options)
      @line = ::Terrapin::CommandLine.new(command, @command_options.to_s)
    end

    def run
      @line.run(@command_options.to_h)
    rescue Terrapin::CommandNotFoundError, Terrapin::ExitStatusError => e
      e
    end

    def command
      @command ||= "#{DOCKER_COMMAND}  #{@input_dir}#{DOCKER_VOLUME} #{DOCKER_IMAGE} #{BASE_COMMAND}"
    end

    private

      def process_input_file(input_file)
        splitted_dir = input_file.split('/')
        file = splitted_dir.last
        dir = (splitted_dir - [file]).join('/')
        return ['~/', file] if dir.empty?

        [dir, file]
      end
  end
end
