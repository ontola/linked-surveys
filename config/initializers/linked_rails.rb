# frozen_string_literal: true

require_relative '../../lib/vocab'

LinkedRails.host = 'surveys.localdev'
LinkedRails.scheme = :https

LinkedRails::Renderers.register!
