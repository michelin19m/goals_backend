module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  private

  def authenticate_request!
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      decoded = ::JWT.decode(header, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })[0]
      @current_user = User.find(decoded['user_id'])
    rescue ActiveRecord::RecordNotFound, ::JWT::DecodeError => e
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end
end
