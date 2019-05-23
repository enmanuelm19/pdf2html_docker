require 'pdf2html_docker/version'
require 'pdf2html_docker/service'

module Pdf2htmlDocker
  class Error < StandardError; end
  def self.convert(input_file, options = {}, output_file = '')
    Service.new(input_file, output_file, options).run
  rescue ArgumentError => e
    e
  end
end
