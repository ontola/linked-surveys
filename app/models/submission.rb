# frozen_string_literal: true

class Submission < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable

  belongs_to :survey, required: true
  alias parent survey
  has_many :submission_values,
           autosave: true,
           dependent: :destroy

  with_collection :submission_values

  validates :coupon, presence: true, if: :require_coupon?
  validate :validate_coupon
  after_create :invalidate_coupon, if: :coupon

  collection_options(
    display: :table
  )
  with_columns default: [
    Vocab.schema.dateCreated,
    Vocab.app[:submissionStatus],
    Vocab.app[:submissionData]
  ]

  enum status: {
    submission_active: 0,
    submission_finished: 1
  }

  def added_delta
    [
      invalidate_resource_delta(parent.submission_collection.action(:create)),
      invalidate_resource_delta(parent.menu(:settings))
    ]
  end

  def body_graph=(graph)
    submission_values.each(&:mark_for_destruction)
    graph&.each_statement do |statement|
      submission_values << SubmissionValue.new(
        submission: self,
        predicate: statement.predicate,
        value: statement.object.to_s,
        value_type: statement.object.is_a?(RDF::URI) ? Vocab.xsd.anyURI : statement.object.datatype,
      )
    end
  end

  def require_coupon?
    parent.has_reward? && new_record?
  end

  def require_coupon
    require_coupon?
  end

  def reward_iri
    LinkedRails.iri(path: 'assets/reward.gif')
  end

  private

  def coupon_batch
    @coupon_batch ||= parent.coupon_batches.joins(:coupons).find_by(coupons: {token: coupon})
  end

  # rubocop:disable Rails/SkipsModelValidations
  def invalidate_coupon
    Coupon.find_by!(
      coupon_batch: coupon_batch,
      used_at: nil,
      token: coupon
    ).update(used_at: Time.current)
  end
  # rubocop:enable Rails/SkipsModelValidations

  def validate_coupon
    return if !require_coupon? || coupon_batch.present?

    errors.add(:coupon, I18n.t('coupon_batches.errors.coupon.invalid'))
  end

  class << self
    private

    def attributes_for_new(opts)
      super.merge(
        session_id: opts[:user_context].id, # @todo
        survey: opts[:parent]
      )
    end
  end
end
