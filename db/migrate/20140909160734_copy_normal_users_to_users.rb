class CopyNormalUsersToUsers < ActiveRecord::Migration
  def change
    NormalUser.all.each do |nu|
      unless User.find_by_email(nu.email).present?
        u = User.new nu.attributes.except("id").merge('type' => 'user')
        if u.save validate: false
          say "#{u.email} created"
        else
          say "#{u.email} not created"
          say u.errors.inspect
          abort 'not created'
        end
      else
        say "#{nu.email} skipped as duplicate"
      end
    end
  end
end
