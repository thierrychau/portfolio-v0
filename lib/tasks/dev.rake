desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"
  
  if Rails.env.development?
    # ProjectTag.destroy_all
    Project.destroy_all
    # Tag.destroy_all
    Category.destroy_all
    User.destroy_all
  end

  User.create(
    email: "thierry.chau@gmail.com",
    password: "password"
  )

  categories = ["web", "photography", "leatherwork"]

  categories.each do |category|
    cat = Category.new
    cat.name = category
    cat.save
    p cat
  end

  projects = [
  {
    :name => "Project 1",
    :description => "This is project 1",
    :category_id => Category.find_by_name("web").id
  },
  {
    :name => "Project 2",
    :description => "This is project 2",
    :category_id => Category.find_by_name("web").id
  },
  # add more projects as needed
  ]

  projects.each do |project_data|
    p = Project.new
    p.name = project_data[:name]
    p.description = project_data[:description]
    p.category_id = project_data[:category_id]
    if p.save
      puts "Project saved successfully."
    else
      puts "Failed to save project. Errors:"
      puts p.errors.full_messages
    end
  end
end
