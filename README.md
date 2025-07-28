# Facebook Clone Rails Application

This is a small social networking application built with **Ruby on Rails**.  It mimics a handful of core Facebook features: users can register and log in, create posts, like posts, and leave comments.  The project is intended for educational purposes and is designed to be easy to run locally.

## Features

* **User Authentication** – handled by the Devise gem.  Users can sign up, log in, edit their profiles, and log out.
* **User Profiles** – each user has a profile page that lists their posts and basic information.
* **Posts** – users can create, edit, update and delete posts.  Posts are associated with the user who created them.
* **Comments** – users can comment on posts.  Comments belong to both the post and the user who wrote them.
* **Likes** – users can like or unlike posts.  Each like belongs to a user and a post.

## Getting Started

### Prerequisites

* [Ruby 3.2](https://www.ruby-lang.org/en/) or newer
* [Rails 7.1](https://rubyonrails.org/) or newer
* [Node.js](https://nodejs.org/) and Yarn (only if you choose to use Bootstrap via npm)

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/facebook_clone.git
   cd facebook_clone
   ```

2. Install the required gems:

   ```bash
   bundle install
   ```

3. Set up the database and run migrations:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. Seed the database with some sample data (optional).  You can create your own seed file in `db/seeds.rb`.

5. Start the Rails server:

   ```bash
   rails server
   ```

6. Navigate to `http://localhost:3000` in your browser.  Sign up for a new account and start exploring.

## File Structure

The application follows the standard Rails MVC structure.  Models live in `app/models`, controllers in `app/controllers`, and views in `app/views`.  Migrations are located in `db/migrate`.  Routes are defined in `config/routes.rb`.

## Contributing

Pull requests are welcome.  For major changes, please open an issue first to discuss what you would like to change.

## License

This project is open source and available under the [MIT License](LICENSE).