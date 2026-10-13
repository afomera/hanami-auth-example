# frozen_string_literal: true

module Notebook
  module Structs
    class User < Notebook::DB::Struct
      # Keep the password hash out of logs and console output.
      def inspect
        "#<#{self.class.name} id=#{id.inspect} email_address=#{email_address.inspect}>"
      end
      alias_method :to_s, :inspect
    end
  end
end
