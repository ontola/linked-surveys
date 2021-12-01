# frozen_string_literal: true

class ApplicationSerializer
  include LinkedRails::Serializer

  attribute :_destroy, predicate: Vocab.ontola[:_destroy], if: method(:never)
end
