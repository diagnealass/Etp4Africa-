class User

    attr_accessor :email, :encrypted_password

      @@user_count = 0

      def initialize(email_to_save)

        @email = email_to_save

        @@user_count = @@user_count + 1

      end

      def change_password(new_password)

        @encrypted_password = encrypt(new_password)

      end

      def show_itself

        puts self

      end

      def self.count

        return @@user_count

      end

      private

        def encrypt(string_to_encrypt)

          return "##ENCRYPTED##"

        end

  end