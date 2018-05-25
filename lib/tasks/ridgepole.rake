    namespace :ridgepole do
      desc 'Apply database schema (options: DRYRUN=false, VERBOSE=false)'
      task apply: :environment do
        options = ['--apply']
        options << '--dry-run' if ENV['DRYRUN']
        options << '--verbose' if ENV['VERBOSE']
        ridgepole(*options, "--file #{schema_file}")
      end

      desc 'Export database schema'
      task export: :environment do
        options = ['--export']
        ridgepole(*options, "--split --output #{schema_file}" )
      end

      private

      def schema_file
        Rails.root.join('db', 'schemas', 'Schemafile')
      end

      def config_file
        Rails.root.join('config', 'database.yml')
      end

      def ridgepole(*options)
        command = ['bundle exec ridgepole', "--config #{config_file} --env #{Rails.env}"]
        system [command + options].join(' ')
      end
    end
