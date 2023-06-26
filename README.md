# Elixir Topic Manager

Elixir Topic Manager is a fullstack Elixir CRUD app that allows users to manage topics. You can create a new topic, edit existing ones, and delete them as needed. Additionally, it supports user authentication via OAuth through GitHub. This application is built using Phoenix, Elixir, Ecto, and PostgreSQL.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Elixir (Latest version)
- PostgreSQL (Latest version)
- Phoenix Framework
- Git

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git
   ```
2. Navigate into the project directory:

Copy code
  ```sh
cd YOUR_REPOSITORY_NAME
  ```
3. Set up your database
  ```sh
mix ecto.setup
  ```
4. Add your GitHub OAuth credentials to the configuration file (usually config.exs or in the config/ directory). Follow GitHub's documentation to obtain your OAuth credentials.

### Running the Application

1. Start the Phoenix Server:
  ```sh
  mix phx.server
 ```
2. Open your web browser and navigate to http://localhost:4000.