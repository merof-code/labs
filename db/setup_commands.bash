bundle install gem devise
bundle install gem cancancan
rails g scaffold Department name:string:uniq:index department:references description:string
rails g scaffold Role name:string:uniq:index 
rails g scaffold Permission name:string:uniq:index 
rails g model RolePermission Role:references Permission:references
rails g scaffold User nickname:string{30}:uniq:index pfp:string email:string:index:uniq phone_number:string{10} first_name:string{15} last_name:string{15} middle_name:string{15} role:references department:references start_date:datetime end_date:datetime
rails g scaffold Card user:references:index photo:string issuer_id:string active:boolean lost:string issue_date:datetime end_date:date
rails g scaffold Author photo:string first_name:string{15} last_name:string{15} middle_name:string{15} dob:date death:date
rails g scaffold Publisher photo:string name:string link:string country:string
rails g scaffold BookTitle name:string published_at:date author:references
rails g scaffold BookPublisher cover_pic:string book_title:references Publisher:references date:date
rails g scaffold BookLink BookPublisher:references link:string
rails g scaffold Book BookPublisher:references bought:datetime decommissioned:datetime 'monetary_value:decimal{10,2}' comments:string
rails g scaffold Borrows Book:references user:references approver_id:integer return_inspector_id:integer borrow_date:datetime return_date:datetime returned_at:datetime 'cost:decimal{10,2}' comments:string
rails g scaffold ExtensionReason name:string:index:uniq description:string start_date:datetime end_date:datetime
rails g scaffold BorrowExtension Borrow:references ExtensionReason:references approver_id:integer extended_days:integer new_return_date:date 'cost:decimal{10,2}'