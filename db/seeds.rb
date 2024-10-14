
Coach.delete_all
Company.delete_all
CoachingProgram.delete_all
Employee.delete_all

company1 = Company.create!(
  name: "Tech Solutions",
  description: "A leading tech company",
  zip: 12345,
  city: "San Francisco",
  state: "CA",
  address: "123 Tech Street",
  country: "USA",
  website: "www.techsolutions.com",
  logo: "logo1.png"
)

company2 = Company.create!(
  name: "Health Corp",
  description: "Healthcare company",
  zip: 67890,
  city: "New York",
  state: "NY",
  address: "456 Health Ave",
  country: "USA",
  website: "www.healthcorp.com",
  logo: "logo2.png"
)

coach1 = Coach.create!(first_name: "John", last_name:"Doe", email: "johndoe@example.com")
coach2 = Coach.create!(first_name: "Jane", last_name: "Smith", email: "janesmith@example.com")

coaching_program1 = CoachingProgram.create!(
  name: "Leadership Training",
  description: "Program for developing leadership skills",
  company: company1
)

coaching_program2 = CoachingProgram.create!(
  name: "Health and Wellness",
  description: "Program focusing on health and wellness",
  company: company2
)

coach1.coaching_programs << coaching_program1
coach2.coaching_programs << coaching_program2

coach1.companies << company1
coach2.companies << company2

Employee.create!(
  first_name: "Alice",
  last_name: "Johnson",
  phone: "555-1234",
  department: "Engineering",
  email: "alice.johnson@techsolutions.com",
  company: company1,
  coaching_program: coaching_program1,
  coach: coach1
)

Employee.create!(
  first_name: "Bob",
  last_name: "Williams",
  phone: "555-5678",
  department: "HR",
  email: "bob.williams@healthcorp.com",
  company: company2,
  coaching_program: coaching_program2,
  coach: coach2
)

Employee.create!(
  first_name: "Charlie",
  last_name: "Brown",
  phone: "555-4321",
  department: "Sales",
  email: "charlie.brown@techsolutions.com",
  company: company1,
  coaching_program: coaching_program1,
  coach: coach1
)

puts "Seed data has been created successfully!"
