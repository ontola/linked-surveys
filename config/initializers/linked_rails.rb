# frozen_string_literal: true

require_relative '../../lib/vocab'

LinkedRails.host = 'argu.localdev'
LinkedRails.scheme = :https
LinkedRails.app_vocab = Vocab.argu

LinkedRails::Renderers.register!
