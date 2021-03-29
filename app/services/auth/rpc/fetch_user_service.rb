module Auth
  module RPC
    class FetchUserService
      prepend BasicService

      param :token
      param :uuid, default: -> { extract_uuid }

      attr_reader :user_id

      def call
        return nil if @uuid.blank? || session.blank?

        @user_id = session.user_id
      end

      private

      def extract_uuid
        extracted_token['uuid']
      end

      def extracted_token
        JwtEncoder.decode(@token)
      rescue JWT::DecodeError
        {}
      end

      def session
        @session ||= UserSession.find(uuid: @uuid)
      end
    end
  end
end
