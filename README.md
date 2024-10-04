
```markdown
# README

This README documents the steps necessary to get the application up and running.

## Ruby and Rails Versions

- **Ruby version**: 3.0.0
- **Rails version**: 7.1.4

## Getting Started

To run this app, follow these steps:

### 1. Clone the Repository

```bash
git clone "https://github.com/chdivya495/Group-Coaching-Program-Management.git"
```

### 2. Install Gem Dependencies

```bash
bundle install
```

### 3. Migrate the Database

```bash
rails db:migrate
```

### 4. Seed the Database with Initial Data

```bash
rails db:seed
```

### 5. Start the Rails Server

```bash
rails s
```

### 6. Access the Application

Open your web browser and go to:

```
http://localhost:3000/admin or You can visit directly http://localhost:3000 in this you can see the admin panel button.
```

This will take you to the root page of the app, where you can access the Active Admin panel.

## Finding Functionalities

- Click on the (i) icon to view records.
- You will find the **Registered Employee** button, which allows you to fill in employee details.
- After submitting the employee details, you will be redirected to the employee details page, where you can find the **Dashboard** button to access other functionalities.
