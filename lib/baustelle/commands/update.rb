require 'json'

module Baustelle
  module Commands
    module Update
      extend self

      def call(specification_file, region:, name:)
        config = Baustelle::Config.read(specification_file)
        template = Baustelle::StackTemplate.new(config)

        Aws.config[:region] = region
        Baustelle::CloudFormation::RemoteTemplate.new(name, region: region).
          call(template) do |template_url|
          Baustelle::CloudFormation.update_stack(name, template_url) or exit(1)
        end

        puts "Updated stack #{name} in #{region}"
      end
    end
  end
end
