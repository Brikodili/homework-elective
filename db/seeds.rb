# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Role.create([{ name: 'Teacher' }, { name: 'Student' }])

%w[student teacher].each do |role|
  Role.find_or_create_by({ name: role })
end

['Cybersecurity', 'Functional programming', 'OOP Programming'].each do |course_name|
  Course.find_or_create_by({title: course_name, start_date: Date.today, teacher_id: 1,
                            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec lorem nisi. Nulla massa neque, convallis sit amet mattis vel, consectetur vitae nunc. Integer at nunc ac arcu molestie mollis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc ultricies pulvinar ullamcorper. Phasellus ut rutrum ante, id sodales erat. Ut posuere mauris non dui laoreet, consequat ornare tellus sodales. Integer id risus rhoncus, rhoncus felis vitae, ornare nunc.' })
end

