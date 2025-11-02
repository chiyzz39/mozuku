# frozen_string_literal: true

namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    options = []
    db_spec = ENV['DATABASE'] || 'primary'
    options.concat(['-s', db_spec])
    options.concat(['--apply', '-f', schema_file_path])
    options << '--allow_pk_change'
    options << '--dry-run' if ENV['DRY_RUN'] || ENV['DRYRUN']
    options << '--verbose' if ENV['VERBOSE']
    options << '--drop-table'
    ridgepole(*options)
  end

  desc 'Export database schema'
  task export: :environment do
    ridgepole '--export', '-o', schema_file_path
  end

  private

  def schema_file_path
    Rails.root.join('db/Schemafile').to_s
  end

  def config_file_path
    Rails.root.join('config/database.yml').to_s
  end

  def ridgepole(*options)
    sh 'bundle', 'exec', 'ridgepole', '-c', config_file_path, '-E', Rails.env, *options

    if !Rails.env.production?
      Rake::Task['db:schema:dump'].invoke
      Rake::Task['db:test:prepare'].invoke
      Rails.root.join('db/schema.rb').delete
    end
  end
end
