include Pageflow::Seeds

# Make sure to change the password if you intend to apply this seed to
# a production system.
default_user_password('!Pass123')

publisher_account = account(name: 'Acme Corporation')
editor_account = account(name: 'General Products')
previewer_account = account(name: 'Oscorp')
member_account = account(name: 'Stagg Enterprises')
account(name: 'Waterloo Road Comprehensive')

account(name: 'Pageflow') do |account|
  politics_entry = sample_entry(account: account, title: 'Story in Politics')
  sports_entry = sample_entry(account: account, title: 'Story in Sports')
  finance_entry = sample_entry(account: account, title: 'Story in Finance')
  entertainment_entry = sample_entry(account: account, title: 'Story in Entertainment')
  sample_entry(account: account, title: 'Story in Science')

  user(email: 'admin@example.com',
       first_name: 'Alice',
       last_name: 'Adminson',
       admin: true) do |admin|
    membership(user: admin, entity: account, role: :member)
  end

  user(email: 'accountmanager@example.com',
       first_name: 'Anne',
       last_name: 'McManager') do |account_manager|
    membership(user: account_manager, entity: account, role: :manager)
    membership(user: account_manager, entity: publisher_account, role: :publisher)
    membership(user: account_manager, entity: editor_account, role: :editor)
    membership(user: account_manager, entity: previewer_account, role: :previewer)
    membership(user: account_manager, entity: member_account, role: :member)
  end

  user(email: 'accountpublisher@example.com',
       first_name: 'Alina',
       last_name: 'Publisha') do |account_publisher|
    membership(user: account_publisher, entity: account, role: :publisher)
    membership(user: account_publisher, entity: publisher_account, role: :editor)
    membership(user: account_publisher, entity: editor_account, role: :previewer)
    membership(user: account_publisher, entity: previewer_account, role: :member)
  end

  user(email: 'accounteditor@example.com',
       first_name: 'Annalena',
       last_name: 'Editorian') do |account_editor|
    membership(user: account_editor, entity: account, role: :editor)
    membership(user: account_editor, entity: publisher_account, role: :previewer)
    membership(user: account_editor, entity: editor_account, role: :member)
  end

  user(email: 'accountpreviewer@example.com',
       first_name: 'Agnieszka',
       last_name: 'Previewski') do |account_previewer|
    membership(user: account_previewer, entity: account, role: :previewer)
    membership(user: account_previewer, entity: publisher_account, role: :member)
  end

  user(email: 'accountmember@example.com',
       first_name: 'Asuna',
       last_name: 'Membergami') do |account_member|
    membership(user: account_member, entity: account, role: :member)
  end

  user(email: 'entrymanager@example.com',
       first_name: 'Evgen',
       last_name: 'Managerov') do |entry_manager|
    membership(user: entry_manager, entity: politics_entry, role: :manager)
    membership(user: entry_manager, entity: sports_entry, role: :publisher)
    membership(user: entry_manager, entity: finance_entry, role: :editor)
    membership(user: entry_manager, entity: entertainment_entry, role: :previewer)
  end

  user(email: 'entrypublisher@example.com',
       first_name: 'Elmar',
       last_name: 'Publishero') do |entry_publisher|
    membership(user: entry_publisher, entity: politics_entry, role: :publisher)
    membership(user: entry_publisher, entity: sports_entry, role: :editor)
    membership(user: entry_publisher, entity: finance_entry, role: :previewer)
  end

  user(email: 'entryeditor@example.com',
       first_name: 'Ed',
       last_name: 'Edison') do |entry_editor|
    membership(user: entry_editor, entity: politics_entry, role: :editor)
    membership(user: entry_editor, entity: sports_entry, role: :previewer)
  end

  user(email: 'entrypreviewer@example.com',
       first_name: 'Émile',
       last_name: 'Previewère') do |entry_previewer|
    membership(user: entry_previewer, entity: politics_entry, role: :previewer)
  end
end
